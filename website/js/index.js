// Global variables
roomPage = 1;
bookingDates = [];

// For creating a template
initTemplate = (id) => {
    const template = document.getElementById(id);
    template.id = "";
    template.parentNode.removeChild(template);
    return template;
}

// Create room template
const imageTemplate = initTemplate("image-template");
const roomTemplate = initTemplate("room");

// Display first page of rooms when loaded
window.onload = () => {
    getRooms(1);
}

// Get rooms
getRooms = (page) => {
    // If no page
    if (typeof page === "undefined") {
        page = 1;
    }

    // Get rooms
    fetch("/api/getrooms?page=" + page)
    .then(response => response.json())
    .then(data => {
        // Check whether successfuly and if there are rooms
        if (data.status == "success") {
            document.getElementById("main-error-alert").style.display = "none";
            if (data.result.length > 0) {
                data.result.forEach(roomInfo => {
                    // Clone room template
                    room = roomTemplate.cloneNode(true);
    
                    // Complete room details
                    roomDetails = room.getElementsByClassName("room-details")[0];
                    roomDetails.getElementsByTagName("h4")[0].innerHTML = roomInfo.name;
                    roomDetails.getElementsByClassName("capacity")[0].innerHTML = roomInfo.capacity + " " + ((roomInfo.capacity == 1) ? 'Person' :'People');
                    roomDetails.getElementsByClassName("address")[0].innerHTML = roomInfo.address;
                    roomDetails.getElementsByTagName("p")[2].getElementsByTagName("span")[0].innerHTML = "$" + roomInfo.price;
                    roomDetails.getElementsByTagName("button")[0].id = "view-info-button-" + roomInfo.id;
                    roomDetails.getElementsByTagName("button")[1].id = "book-button-" + roomInfo.id;
                
                    // Set room description
                    roomDescription = room.getElementsByClassName("room-description-card")[0];
                    roomDescription.id = "room-description-" + roomInfo.id;
                    roomDescription.getElementsByTagName("div")[0].innerHTML = roomInfo.description;
                
                    // Set room images if they exist
                    if (roomInfo.images.length > 0) {
                        imageCount = 1;
                        roomImages = room.getElementsByClassName("image-list")[0];
                        roomInfo.images.forEach(imageUrl => {
                            image = imageTemplate.cloneNode(true);
                            image.getElementsByTagName("img")[0].src = imageUrl;
                            if (imageCount != 1) {
                                image.classList.remove("active");
                            }
                            roomImages.appendChild(image);
                            imageCount++;
                        });
                    }

                    // Update carousel controls
                    carouselControls = room.getElementsByClassName("carousel")[0];
                    carouselControls.id = "carousel-controls-" + roomInfo.id;
                    carouselNext = carouselControls.getElementsByClassName("carousel-control-next")[0];
                    carouselPrev = carouselControls.getElementsByClassName("carousel-control-prev")[0];
                    carouselNext.setAttribute("data-bs-target", "#carousel-controls-" + roomInfo.id);
                    carouselPrev.setAttribute("data-bs-target", "#carousel-controls-" + roomInfo.id);

                    // Add booking dates to global variable
                    bookingDates[roomInfo.id] = roomInfo.bookings;
                
                    // Display room
                    room.style.display = "block";
                    document.getElementById("rooms").appendChild(room);
                });
            }

            // Check if next page
            if (data.hasNextPage == true) {
                document.getElementById("view-more-button").style.display = "block";
            } else {
                document.getElementById("view-more-button").style.display = "none";
            }
        } else {
            document.getElementById("main-error-alert").innerHTML = "There was an error loading the rooms!";
            document.getElementById("main-error-alert").style.display = "block";
        }
    });
}

// View more button
document.getElementById("view-more-button").onclick = () => {
    roomPage++;
    getRooms(roomPage);
}

// Check whether date can be booked
checkDate = (date, roomId) => {
    validDate = true;

    // Check each booking for room
    bookingDates[roomId].forEach(booking => {
        if (new Date(date) >= new Date(booking["start"]).setHours(0, 0, 0) && new Date(date) <= new Date(booking["end"]).setHours(0, 0, 0)) {
            validDate = false;
        }
    });

    return validDate;
}

// Check whether booking range can be booked
checkDateRange = (startDate, endDate, roomId) => {
    userStartDate = new Date(startDate);
    userEndDate = new Date(endDate);

    validSelection = true;

    // Check each booking
    bookingDates[roomId].forEach(booking => {
        if (validSelection) {
            bookingStartDate = new Date(booking["start"]);
            bookingEndDate = new Date(booking["end"]);

            if ((userStartDate <= bookingStartDate && userEndDate >= bookingStartDate) || (userStartDate <= bookingEndDate && userEndDate >= bookingEndDate)) {
                validSelection = false;
            }
        }
    });

    return validSelection;
}

// When book button clicked
bookModal = (clickedId) => {
    // Set room ID
    roomId = clickedId.split("-")[2];
    document.getElementById("booking-room-id").value = roomId;

    fetch("/api/getroom?roomid=" + roomId)
    .then(response => response.json())
    .then(data => {
        // Check whether successfully retrieved room info
        if (data.status == "success") {
            document.getElementById("main-error-alert").style.display = "none";
            document.getElementById("people-input").max = data.result.capacity;

            // Check whether input valid when setting guests
            document.getElementById("people-input").oninput = () => {
                if (document.getElementById("people-input").value <= 0 || document.getElementById("people-input").value > data.result.capacity) {
                    document.getElementById("invalid-capacity-alert").innerHTML = "Please enter a value between 1 and " + data.result.capacity;
                    document.getElementById("invalid-capacity-alert").style.display = "block";
                    document.getElementById("booking-submit-button").disabled = true;
                } else {
                    document.getElementById("invalid-capacity-alert").style.display = "none";

                    if (document.getElementById("invalid-date-alert").style.display == "none") {
                        document.getElementById("booking-submit-button").disabled = false;
                    }
                }
            }
        } else {
            document.getElementById("main-error-alert").innerHTML = "There was an error loading the rooms!";
            document.getElementById("main-error-alert").style.display = "block";
        }
    });

    // Initialise date variables
    var startDate, endDate;

    // Start date picker
    $("#start-date-input").datepicker({
        dateFormat : 'yy-mm-dd',
        // When start date selected
        onSelect: function (date) {
            startDate = $(this).datepicker("getDate");

            // Check whether end date selected
            if (typeof endDate !== 'undefined') {
                // Check whether start date is before end date
                if (new Date(startDate) <= new Date(endDate)) {
                    validSelection = checkDateRange(startDate, endDate, roomId);

                    // Display error message if booked
                    if (!validSelection) {
                        $("#invalid-date-alert").html("Please select an uninterrupted date range");
                        $("#invalid-date-alert").show();
                        $("#booking-submit-button").attr("disabled", true);
                    } else {
                        $("#invalid-date-alert").hide();

                        if ($("#invalid-capacity-alert").is(":hidden")) {
                            $("#booking-submit-button").attr("disabled", false);
                        }
                    }
                } else {
                    $("#invalid-date-alert").html("Please ensure your start date is before your end date");
                    $("#invalid-date-alert").show();
                    $("#booking-submit-button").attr("disabled", true);
                }
            }
        },
        // Before start date calendar shown
        beforeShowDay: function (date) {
            // If date in future
            if (new Date(date) > new Date()) {
                // Check whether date booked
                validDate = checkDate(date, roomId);
                return [validDate];
            } else {
                return [false];
            }
        }
    });
    
    // End date picker
    $("#end-date-input").datepicker({
        dateFormat : 'yy-mm-dd',
        // When end date selected
        onSelect: function (date) {
            endDate = $(this).datepicker("getDate");

            // If start date selected
            if (typeof startDate !== 'undefined') {
                // Check whether start date is before end date
                if (new Date(startDate) <= new Date(endDate)) {
                    // Check whether valid date range
                    validSelection = checkDateRange(startDate, endDate, roomId);

                    if (!validSelection) {
                        $("#invalid-date-alert").html("Please select an uninterrupted date range");
                        $("#invalid-date-alert").show();
                        $("#booking-submit-button").attr("disabled", true);
                    } else {
                        $("#invalid-date-alert").hide();
                        $("#booking-submit-button").attr("disabled", false);
                    }
                } else {
                    $("#invalid-date-alert").html("Please ensure your start date is before your end date");
                    $("#invalid-date-alert").show();
                    $("#booking-submit-button").attr("disabled", true);
                }
            }
        },
        beforeShowDay: function (date) {
            // If date in future     
            if (new Date(date) > new Date()) {
                // Check whether date booked
                validDate = checkDate(date, roomId);
                return [validDate];
            } else {
                return [false];
            }
        }
    });

    // When new booking submitted
    document.getElementById("booking-submit-button").onclick = () => {
        // Get form input
        roomId = document.getElementById("booking-room-id").value;
        email = document.getElementById("email-input").value;
        startDate = document.getElementById("start-date-input").value;
        endDate = document.getElementById("end-date-input").value;
        guestCount = document.getElementById("people-input").value;

        // Submit booking
        fetch("/api/createbooking?roomid=" + roomId + "&email=" + email + "&startdate=" + startDate + "&enddate=" + endDate + "&guestcount=" + guestCount)
        .then(response => response.json())
        .then(data => {
            // If booking successfully placed
            if (data.status == "success") {
                document.getElementById("booking-alert").style.display = "none";
                document.getElementById("booking-success-alert").style.display = "block";
                document.getElementById("booking-number").innerHTML = "#" + data.result.id;
                $('#booking-modal').modal('hide');

                // Update stored booking dates
                newDates = [];
                newDates["start"] = startDate;
                newDates["end"] = endDate;

                bookingDates[roomId].push(newDates);
            } else {
                document.getElementById("booking-alert").style.display = "block";
            }
        });
    }
}

// View info information about room
viewInfo = function(clickedId) {
    // Get room ID and toggle description
    roomId = clickedId.split("-")[3];
    if ($("#" + clickedId).text() == "View Info") {
        $("#room-description-" + roomId).show();
        $("#" + clickedId).text("Hide Info");
    } else {
        $("#room-description-" + roomId).hide();
        $("#" + clickedId).text("View Info");
    }
};
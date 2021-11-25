<?php

require("includes/db.php");
require("includes/apicommon.php");

// Determine offset
$offset = 0;

if (isset($_GET["page"])) {
    if (is_numeric($_GET["page"])) {
        $offset = ($_GET["page"] - 1) * 10;
    } else {
        // Return error
        apiError("Invalid page number");
    }
}

// Prepare statement
$roomsStmt = $conn->prepare("SELECT roomid, name, address, capacity, price, description FROM rooms LIMIT 10 OFFSET ?");

if (!$roomsStmt) {
    apiError("Error retrieving rooms");
}

$roomsStmt->bind_param("i", $offset);

// Execute statement
$roomsStmt->execute();
$roomsStmt->store_result();  
$roomsStmt->bind_result($roomId, $name, $address, $capacity, $price, $description);

// Declare rooms array
$rooms = array();

// Loop through rooms
while ($roomsStmt->fetch()) {
    // Create room array
    $room = array();

    $room["id"] = $roomId;
    $room["name"] = $name;
    $room["address"] = $address;
    $room["capacity"] = $capacity;
    $room["price"] = $price;
    $room["description"] = $description;

    // Get images
    $imageStmt = $conn->prepare("SELECT imageurl FROM images WHERE roomid = ?");
    if (!$imageStmt) {
        apiError("Error retrieving images");
    }
    $imageStmt->bind_param("i", $roomId);

    // Execute statement
    $imageStmt->execute();
    $imageStmt->store_result();  
    $imageStmt->bind_result($imageUrl);

    // Declare images array
    $images = array();

    // Loop through images
    while ($imageStmt->fetch()) {
        $images[] = $imageUrl;
    }

    $imageStmt->close();

    $room["images"] = $images;

    // Get bookings
    $bookingStmt = $conn->prepare("SELECT startdate, enddate FROM bookings WHERE roomid = ? && enddate > now()");

    if (!$bookingStmt) {
        apiError("Error retrieving bookings");
    }

    $bookingStmt->bind_param("i", $roomId);

    // Execute statement
    $bookingStmt->execute();
    $bookingStmt->store_result();  
    $bookingStmt->bind_result($bookingStartDate, $bookingEndDate);

    $bookings = array();

    // Loop through bookings
    while ($bookingStmt->fetch()) {
        $bookingDates = array();
        $bookingDates["start"] = $bookingStartDate;
        $bookingDates["end"] = $bookingEndDate;
        $bookings[] = $bookingDates;
    }

    $bookingStmt->close();

    $room["bookings"] = $bookings;

    $rooms[] = $room;
}

$roomsStmt->close();

// Check whether more rooms
$nextPageOffset  = $offset + 10;
$nextPageStmt = $conn->prepare("SELECT roomid FROM rooms LIMIT 10 OFFSET ?");

if (!$nextPageStmt) {
    apiError("Error checking rooms");
}

$nextPageStmt->bind_param("i", $nextPageOffset);
$nextPageStmt->execute();
$nextPageResults = $nextPageStmt->get_result();
$hasNextPage = false;

if ($nextPageResults->num_rows > 0) {
    $hasNextPage = true;
}

$nextPageStmt->close();

// Create final array
$roomsResult = array();
$roomsResult["status"] = "success";
$roomsResult["result"] = $rooms;
$roomsResult["hasNextPage"] = $hasNextPage;

echo json_encode($roomsResult);

$conn->close();

?>
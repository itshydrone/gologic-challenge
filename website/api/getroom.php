<?php

require("includes/db.php");
require("includes/apicommon.php");

// Check room ID is valid
if (!isset($_GET["roomid"]) || !is_numeric($_GET["roomid"])) {
    // Return error
    apiError("Invalid room ID");
}

$roomId = $_GET["roomid"];

// Check room ID exists and get details
$roomStmt = $conn->prepare("SELECT name, address, capacity, price, description FROM rooms WHERE roomid = ? LIMIT 1");

$room = array();

if (!$roomStmt) {
    apiError("Error checking room");
}

$roomStmt->bind_param("i", $roomId);
$roomStmt->execute();
$nextPageResults = $roomStmt->get_result();

// Check room ID and if valid get details
if ($nextPageResults->num_rows == 0) {
    apiError("Invalid room ID");
} else {
    while ($roomData = $nextPageResults->fetch_assoc()) {
        $room["name"] = $roomData["name"];
        $room["address"] = $roomData["address"];
        $room["capacity"] = $roomData["capacity"];
        $room["price"] = $roomData["price"];
        $room["description"] = $roomData["description"];
    }
}

$roomStmt->close();

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

// Create final array
$roomsResult = array();
$roomsResult["status"] = "success";
$roomsResult["result"] = $room;

echo json_encode($roomsResult);

$conn->close();

?>
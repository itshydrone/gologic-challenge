<?php

require("includes/db.php");
require("includes/apicommon.php");

// If variable missing
if (!isset($_GET["roomid"]) || !isset($_GET["email"]) || !isset($_GET["startdate"]) || !isset($_GET["enddate"]) || !isset($_GET["guestcount"])) {
    apiError("Missing parameters");
}

// Set variables from URL params
$roomId = $_GET["roomid"];
$email = $_GET["email"];
$startDate = $_GET["startdate"];
$endDate = $_GET["enddate"];
$guestCount = $_GET["guestcount"];

// Check room ID is valid
$roomCheckStmt = $conn->prepare("SELECT capacity FROM rooms WHERE roomid = ? LIMIT 1");

if (!$roomCheckStmt) {
    apiError("Error checking room");
}

$roomCheckStmt->bind_param("i", $roomId);
$roomCheckStmt->execute();
$nextPageResults = $roomCheckStmt->get_result();

$roomCapacity = 0;

// Check room ID and if valid get room capacity
if (!is_numeric($roomId) || $nextPageResults->num_rows == 0) {
    apiError("Invalid room ID");
} else {
    while ($roomData = $nextPageResults->fetch_assoc()) {
        $roomCapacity = $roomData['capacity'];
    }
}

$roomCheckStmt->close();

// Validate email
if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
    apiError("Invalid email address");
}

$datePattern = "/\d{4}-\d{2}-\d{2}/";

// Validate start date
if (preg_match($datePattern, $startDate) == 0 && $startDate > date("Y-m-d")) { 
    // Get start date components
    $startDateSplit = explode("-", $startDate);
    $startYear = $startDateSplit[0];
    $startMonth = $startDateSplit[1];
    $startDay = $startDateSplit[2];

    // If invalid start date
    if (!checkdate($startMonth, $startDay, $startYear)) {
        apiError("Invalid start date");
    }
}

// Validate end date
if (preg_match($datePattern, $endDate) == 0 && $endDate > date("Y-m-d")) {
    // Get end date components
    $endDateSplit = explode("-", $endDate);
    $endYear = $endDateSplit[0];
    $endMonth = $endDateSplit[1];
    $endDay = $endDateSplit[2];

    // If invalid end date
    if (!checkdate($endMonth, $endDay, $endYear)) {
        apiError("Invalid end date");
    }
}

// Start date is before end date
if ($startDate > $endDate) {
    apiError("Start date is after end date");
}

// Validate guest count
if ($guestCount <= 0 || $guestCount > $roomCapacity) {
    apiError("Invalid guest count");
}

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

// Loop through bookings
while ($bookingStmt->fetch()) {
    if (($startDate <= $bookingStartDate && $endDate >= $bookingStartDate) || ($startDate <= $bookingEndDate && $endDate >= $bookingEndDate)) {
        apiError("Date range has been booked");
    }
}

$bookingStmt->close();

// Insert booking
$newBookingStmt = $conn->prepare("INSERT INTO bookings (roomid, startdate, enddate, email, guestcount) VALUES (?, ?, ?, ?, ?)");
$newBookingStmt->bind_param("sssss", $roomId, $startDate, $endDate, $email, $guestCount);
$newBookingStmt->execute();
$newBookingStmt->close();

$resultInfo = array();
$resultInfo["id"] = $conn->insert_id;

// Create final array
$bookingResult = array();
$bookingResult["status"] = "success";
$bookingResult["result"] = $resultInfo;

echo json_encode($bookingResult);

$conn->close();

?>
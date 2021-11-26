<?php

require("config.php");

// Create connection
$conn = new mysqli($DB_SERVER, $DB_USERNAME, $DB_PASSWORD, $DB_DATABASE);
// Check connection
if ($conn->connect_error) {
	error_log("Error connection to database: " . $conn->connect_error);
	die("Connection failed: " . $conn->connect_error);
}

?>
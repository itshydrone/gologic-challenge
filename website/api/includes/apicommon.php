<?php

function apiError($errorMessage) {
    // Return error
    $errorResult = array();
    $errorResult["status"] = "error";
    $errorResult["message"] = $errorMessage;

    // Log error
    error_log("API error: " . $errorMessage);
    
    echo json_encode($errorResult);
    exit();
}

?>
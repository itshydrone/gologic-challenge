<?php

function apiError($errorMessage) {
    // Return error
    $errorResult = array();
    $errorResult["status"] = "error";
    $errorResult["message"] = $errorMessage;
    
    echo json_encode($errorResult);
    exit();
}

?>
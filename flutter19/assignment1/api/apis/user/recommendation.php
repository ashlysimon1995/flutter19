<?php
//This function will inject in API class automatically
header("Access-Control-Allow-Origin: *");               //ADDED THESE 2 LINES OF CODE
include_once '../../lib/includes/Connections.class.php';

// Define a class that contains the function
class Recommendation {
    // Define the function within the class
    public function handleRequest() {
        // Check the request method and user ID
        if ($_SERVER['REQUEST_METHOD'] == "GET" && isset($_GET['userId'])) {
            // Handle Get request data
            $userId = $_GET['userId'];
            // Call the function to retrieve user recommendations
            $result = Connections::getUserRecommendations($userId);
            // Prepare the response data
            $data = [
                "success" => true,
                "data" => $result,
            ];
            // Send the response
            echo json_encode($data);
        } else {
            // Send a bad request response
            $data = [
                "success" => false,
                "error" => "bad request",
            ];
            echo json_encode($data);
            http_response_code(400);
        }
    }
}

// Instantiate the class and call the function
$recommendationHandler = new Recommendation();
$recommendationHandler->handleRequest();
?>
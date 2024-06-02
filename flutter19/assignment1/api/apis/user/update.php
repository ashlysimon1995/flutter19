<?php
//This function will inject in API class automatically
header("Access-Control-Allow-Origin: *");               //ADDED THESE 2 LINES OF CODE
include_once '../../lib/includes/User.class.php';

class UpdateUser {
    public function handleRequest() {
        if ($_SERVER['REQUEST_METHOD'] == "POST" and isset($_POST['userId'])) {
            $userId = $_POST['userId'];
            $newSettings = $_POST['newSettings'];
            if (User::updateUserSettings($userId, $newSettings)) {
                $data = [
                    "success" => true,
                    "message" => "Settings updated successfully",
                ];
                echo json_encode($data);
            }   
        
        }else{
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
$updateHandler = new UpdateUser();
$updateHandler->handleRequest();
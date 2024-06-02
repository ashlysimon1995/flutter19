<?php
//This function will inject in API class automatically
header("Access-Control-Allow-Origin: *");               //ADDED THESE 2 LINES OF CODE
include_once '../../lib/includes/Connections.class.php';
class Follow {
    public function handleRequest() {
        if ($_SERVER['REQUEST_METHOD'] == "POST" and isset($_POST['followerId'])) {
            $followerId =  $_POST['followerId'];
            $followingId =  $_POST['followingId'];
            if(Connections::sendFollowRequest($followerId, $followingId)){
                $data = [
                    "success" => true,
                    "message" => "Follow request sent successfully",
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
$followHandler = new Follow();
$followHandler->handleRequest();
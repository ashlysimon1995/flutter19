<?php

header("Access-Control-Allow-Origin: *");               //ADDED THESE 2 LINES OF CODE
include_once '../../lib/includes/Register.class.php';


//CHANGED A LOT OF THE STRUCTURE OF THE ENTIRE CLASS
class profile {
    public function handleRequest() {
        if ($_SERVER['REQUEST_METHOD'] == "POST" && isset($_REQUEST['uid']) && isset($_REQUEST['college'])) {

            $college =  $_REQUEST['college'];
            $userId = intval($_REQUEST['uid']);
            


            
            $register = new Register();
            if ($register->registerProfile($college, $userId)) {
                $data = [
                    "success" => true,
                    "message" => "Profile updated",
                ];
                echo json_encode($data);
                http_response_code(200);
            }
        } else {
            $data = [
                "success" => false,
                "error" => "bad request",
            ];
            echo json_encode($data);
            http_response_code(400);
        }
    }
}

$profile1 = new profile();              //ADDED THESE 2 LINES OF CODE
$profile1->handleRequest();
?>
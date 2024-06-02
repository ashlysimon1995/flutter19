<?php

header("Access-Control-Allow-Origin: *");               //ADDED THESE 2 LINES OF CODE
include_once '../../lib/includes/Register.class.php';


//CHANGED A LOT OF THE STRUCTURE OF THE ENTIRE CLASS
class organization {
    public function handleRequest() {   

        if ($_SERVER['REQUEST_METHOD'] == "POST" && isset($_REQUEST['username']) && isset($_REQUEST['password']) && isset($_REQUEST['mobile'])) {
            $collegeName =  $_REQUEST['college'];
            $mobileNum =  $_REQUEST['mobile'];
            $username =  $_REQUEST['username'];
            $password =  $_REQUEST['password'];
            $city =  $_REQUEST['city'];
            $orgEmail =  $_REQUEST['org_email'];
            $profilePic =  $_REQUEST['profile_pic'];  

            $register = new Register();
            if ($register->registerOrganization($collegeName, $mobileNum, $username, $password, $city, $orgEmail, $profilePic)) {
                $data = [
                    "success" => true,
                    "message" => "Organization registered successfully",
                    "uid"=> $register->getId(),
                    "mobile"=> $mobileNum,
                    "username"=> $username,
                    "college"=> $collegeName
                ];
                echo json_encode($data);
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

$organization1 = new organization();                //ADDED THESE 2 LINES OF CODE
$organization1->handleRequest();

?>
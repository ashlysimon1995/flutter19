<?php

header("Access-Control-Allow-Origin: *");               //ADDED THESE 2 LINES OF CODE
include_once '../../lib/includes/Register.class.php';


//CHANGED A LOT OF THE STRUCTURE OF THE ENTIRE CLASS
class teacher {
    public function handleRequest() {
        if ($_SERVER['REQUEST_METHOD'] == "POST" && isset($_REQUEST['username']) && isset($_REQUEST['password']) && isset($_REQUEST['mobile'])) {
            $name =  $_REQUEST['name'];
            $username =  $_REQUEST['username'];
            $password =  $_REQUEST['password'];
            $mobile =  $_REQUEST['mobile'];
            $college =  $_REQUEST['college'];
            $department =  $_REQUEST['department'];
            $field =  $_REQUEST['field'];
            $qualifications =  $_REQUEST['qualifications'];
            $post =  $_REQUEST['post'];
            $achievements =  $_REQUEST['achievements'];
            $experience =  $_REQUEST['experience'];
            $profilePic =  $_REQUEST['profile_pic'];
            
            $register = new Register();
            if ($register->registerTeacher($name, $username, $password, $mobile, $college, $department, $field, $qualifications, $post, $achievements, $experience, $profilePic)) {
                $data = [
                    "success" => true,
                    "message" => "Teacher registered successfully",
                    "uid"=> $register->getId(),
                    "mobile"=> $mobile,
                    "username"=> $username,
                    "college"=> $college
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

$teacher1 = new teacher();              //ADDED THESE 2 LINES OF CODE
$teacher1->handleRequest();
?>

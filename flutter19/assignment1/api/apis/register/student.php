<?php

header("Access-Control-Allow-Origin: *");               //ADDED THESE 2 LINES OF CODE
include_once '../../lib/includes/Register.class.php';


//CHANGED A LOT OF THE STRUCTURE OF THE ENTIRE CLASS
class student {
    public function handleRequest() {

        if ($_SERVER['REQUEST_METHOD'] == "POST" && isset($_POST['username']) && isset($_POST['password']) && isset($_POST['mobile'])) {
            $name =  $_POST['name'];
            $username =  $_POST['username'];
            $password =  $_POST['password'];
            $mobile =  $_POST['mobile'];
            $college =  $_POST['college'];
            $degree =  $_POST['degree'];
            $year =  $_POST['year'];
            $coreSkills =  $_POST['core_skills'];
            $interests =  $_POST['interests'];
            $hobbies =  $_POST['hobbies'];
            $language =  $_POST['language'];
            $profilePic =  $_POST['profile_pic'];
            $achievements =  $_POST['achievements'];

            $register = new Register();
            if ($register->registerStudent($name,$username,$password, $mobile, $college, $degree, $year, $coreSkills, $interests, $hobbies, $language, $profilePic, $achievements)) {
                $data = [
                    "success" => true,
                    "message" => "Student registered successfully",
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

$student1 = new student();                  //ADDED THESE 2 LINES OF CODE
$student1->handleRequest();

?>
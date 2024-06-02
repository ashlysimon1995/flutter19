<?php

header("Access-Control-Allow-Origin: *");          //ADDED THESE 2 LINES OF CODE
include_once '../../lib/includes/Auth.class.php';


//CHANGED A LOT OF THE STRUCTURE OF THE ENTIRE CLASS
class login {
    public function handleRequest() {
        if ($_SERVER['REQUEST_METHOD'] == "POST" && isset($_REQUEST['username']) && isset($_REQUEST['password'])) {
            $username = $_REQUEST['username'];
            $password = $_REQUEST['password'];
    $auth =new Auth("$username", "$password");
            if ($auth) {
                $data = [
                    "message" => "Login successful",
                    "uid"=> $auth->getId(),
                    "username"=> $auth->getUsername(),
                    "mobile"=> $auth->getMobile(),
                    "college"=> $auth->getCollege(),
                ];
                echo json_encode($data);
            }
        } else {
            $data = [
                "error" => "bad request",
            ];
            echo json_encode($data);
            http_response_code(400);
        }
    }
}

$login1 = new login();                  //ADDED THESE 2 LINES OF CODE
$login1->handleRequest();

?>
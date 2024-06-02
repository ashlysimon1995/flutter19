<?php
include_once $_SERVER["DOCUMENT_ROOT"]."/assignment1" . "/api/lib/load.php";

class Auth
{
private $id;
private $username;
private $mobile;
private $college;
    // Function to authenticate user login
  public function __construct($username, $password) {
    $conn = Database::getConnection(); //  $conn is your database connection
    
    $query = "SELECT * FROM users WHERE username = ? AND password = ?";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("ss", $username, $password);
    $stmt->execute();
    $result = $stmt->get_result();
    
    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        $this->id = $row['id'];
        $this->username = $row['username'];     
        $this->mobile = $row['mobile'];  
        $this->college = $row['college'];  
        return true;
    } else {
        throw new Exception("Invalid username or password");        
    }
  
}  

public function getId()
{
    return $this->id;
}

public function getUsername()
{
    return $this->username;
}

public function getMobile()
{
    return $this->mobile;
}

public function getCollege()
{
    return $this->college;
}

}

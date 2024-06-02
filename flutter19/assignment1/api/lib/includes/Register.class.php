<?php

include_once $_SERVER["DOCUMENT_ROOT"]."/assignment1" . "/api/lib/load.php";

class Register
{
    private $id;

    public  function registerOrganization($college, $mobileNum, $username, $password, $city, $orgEmail, $profilePic)
    {
        $conn = Database::getConnection();

        $conn->begin_transaction();
        try {
            $query = "INSERT INTO users (username, password, college, mobile) VALUES (?, ?, ?, ?)";
            $stmt = $conn->prepare($query);
            $stmt->bind_param("ssss", $username, $password, $college, $mobileNum);
            $stmt->execute();
            $userId = $stmt->insert_id;
            $query = "INSERT INTO organizations (id, college, mobile, city, org_email, profile_pic) VALUES (?, ?, ?, ?, ?, ?)";
            $stmt = $conn->prepare($query);
            $stmt->bind_param("isssss", $userId, $college, $mobileNum, $city, $orgEmail, $profilePic);


            $stmt->execute(); //ADDED THIS LINE OF CODE



            $conn->commit();
            $this->id = $userId;
            return true;
        } catch (Exception $e) {
            $conn->rollback();
            throw new Exception("Failed to register organization: " . $e->getMessage());
        }
    }

    public  function registerTeacher($name, $username, $password, $mobile, $college, $department, $field, $qualifications, $post, $achievements, $experience, $profilePic)
    {
        $conn = Database::getConnection();
        $conn->begin_transaction();
        try {
            $query = "INSERT INTO users (username, password, college, mobile) VALUES (?, ?, ?, ?)";
            $stmt = $conn->prepare($query);
            $stmt->bind_param("ssss", $username, $password, $college, $mobile);
            $stmt->execute();
            $userId = $stmt->insert_id;

            $query = "INSERT INTO teachers (id, name, mobile, college, department, field, qualifications, post, achievements, experience, profile_pic) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            $stmt = $conn->prepare($query);
            $stmt->bind_param("issssssssss", $userId, $name, $mobile, $college, $department, $field, $qualifications, $post, $achievements, $experience, $profilePic);
            $stmt->execute();

            $conn->commit();

            $this->id = $userId;
            return true;
        } catch (Exception $e) {
            $conn->rollback();
            throw new Exception("Failed to register teacher: " . $e->getMessage());
        }
    }

    public  function registerStudent($name, $username, $password, $mobile, $college, $degree, $year, $coreSkills, $interests, $hobbies, $language, $profilePic, $achievements)
    {
        $conn = Database::getConnection();

        $conn->begin_transaction();
        try {
            $query = "INSERT INTO users (username, password, college, mobile) VALUES (?, ?, ?, ?)";
            $stmt = $conn->prepare($query);
            $stmt->bind_param("ssss", $username, $password, $college, $mobile);
            $stmt->execute();
            $userId = $stmt->insert_id;

            $query = "INSERT INTO students (id,name, mobile, college, degree, year, core_skills, interests, hobbies, language, profile_pic, achievements) VALUES (?,?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            $stmt = $conn->prepare($query);
            $stmt->bind_param("isssssssssss", $userId, $name, $mobile, $college, $degree, $year, $coreSkills, $interests, $hobbies, $language, $profilePic, $achievements);
            $stmt->execute();

            $conn->commit();
            $this->id = $userId;
            return true;
        } catch (Exception $e) {
            $conn->rollback();
            throw new Exception("Failed to register student: " . $e->getMessage());
        }
    }

    public function registerProfile($college, $userId)
{
    $conn = Database::getConnection();

    $conn->begin_transaction();
    try {
        $query = "UPDATE users SET college = '$college' WHERE id = $userId";
        $conn->query($query);
        $conn->commit();
        return true;
    } catch (Exception $e) {
        $conn->rollback();
        throw new Exception("Failed to register student: " . $e->getMessage());
    }
}

    public function getId()
    {
        return $this->id;
    }
}

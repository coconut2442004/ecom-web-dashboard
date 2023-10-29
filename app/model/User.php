<?php

class User extends Database
{
    public function login($username, $password)
    {
        // Find user account
        $userStmt = parent::$connection->prepare("SELECT * FROM users WHERE username = ?");
        $userStmt->bind_param("s", $username);
        $result = parent::select($userStmt);

        // Check password 
        if (password_verify($password, $result[0]["password"])) {
            // Set cookies 
            $data = json_encode($result);
            $encrypted_data = encrypt_cookie($data, "secret_key");
            setcookie("access_token", $encrypted_data, time() + 3600, "/");
            return true;
        } else {
            return false;
        }
    }

    public function register($username, $password, $email, $fullname, $role = 0)
    {
        return parent::insert("users", array(
            "username" => $username,
            "password" => password_hash($password, PASSWORD_DEFAULT),
            "email" => $email,
            "fullname" => $fullname,
            "role" => $role
        ));
    }
}

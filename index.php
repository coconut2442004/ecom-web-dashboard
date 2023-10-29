<?php
require_once "config/database.php";
require_once "cookies/util.php";

// Autoload 
spl_autoload_register(function ($class) {
    require_once 'app/model/' . $class . '.php';
});

// Get data from request
$request = '_' . $_SERVER['REQUEST_METHOD'];
foreach ($$request as $key => $value) {
    $$key = $value;
}

$conn = new Database();
$user = new User();

if (isset($_COOKIE["access_token"])) {
    $encrypted_data = $_COOKIE["access_token"];
    $json_data = decrypt_cookie($encrypted_data, "secret_key");
    $user_data = json_decode($json_data, true);

    session_start();
    $_SESSION["user_data"] = $user_data;

    header("Location: ./welcome.php");
} else {
    header("Location: ./dashboard");
}

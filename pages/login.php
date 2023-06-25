<?php
include_once("conn.php");
// Process the login form submission
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $email = $_POST['email'];
    $password = $_POST['password'];

    // Perform basic validation on the submitted data
    if (empty($email) || empty($password)) {
        header("Location: ../index.php?login=empty_param"); // Replace with the desired redirect location
        exit();
    } else {
        $hashed = hash('sha256',$_POST['password']);
        // Fetch user data from the database
        $query = "SELECT * FROM user WHERE email = '$email' AND passwd = '$hashed';";
        $result = mysqli_query($conn, $query);

        if (mysqli_num_rows($result) > 0) {
            session_start();
            $_SESSION['user'] = mysqli_fetch_assoc($result);

            header("Location: ../index.php?login=success"); // Replace with the desired redirect location
            exit();
        } else {
            header("Location: ../index.php?login=no_usr"); // Replace with the desired redirect location
            exit();
        }
    }
}

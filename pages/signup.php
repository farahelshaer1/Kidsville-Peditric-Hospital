<?php
include_once("conn.php");
// Process the signup form submission
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $fname = $_POST['fname'];
    $lname = $_POST['lname'];
    $email = $_POST['email'];
    $role = $_POST['role'];
    $password = $_POST['password'];

    // Perform basic validation on the submitted data
    if (empty($lname) || empty($fname) || empty($email) || empty($password) || empty($role)) {
        header("Location: ../pharmacist.php?signup=empty_param"); // Replace with the desired redirect location
        exit();
    } else {
        // Hash the password for security
        $hashedPassword = hash('sha256',$password);

        // Insert the user data into the database
        $query = "INSERT INTO user (fname,lname, email, passwd,role) VALUES ('$fname','$lname','$email','$hashedPassword','$role');";
        if (mysqli_query($conn, $query)) {
            // Signup successful
            header("Location: ../pharmacist.php?signup=success"); // Replace with the desired redirect location
            exit();
        } else {
            header("Location: ../pharmacist.php?signup=sql_error"); // Replace with the desired redirect location
        exit();
        }
    }
}

// Close the database connection
mysqli_close($conn);
?>

<?php
// Establish database connection
$host = '127.0.0.1'; // Replace with your database host
$username = 'root'; // Replace with your database username
$password = ''; // Replace with your database password
$database = 'clinic_db'; // Replace with your database name
$conn = mysqli_connect($host, $username, $password, $database);

// Check if the connection was successful
if (!$conn) {
    die('Database connection error: ' . mysqli_connect_error());
}

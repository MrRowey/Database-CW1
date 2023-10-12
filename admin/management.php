<?php
$server = "localhost";
$username = "Admin";
$password = "jN0E@K04gRB@1wrI";

// Creating connection
$conn = new mysqli($server, $username, $password);

// Checking connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
echo "Connected successfully";



?>

<!DOCTYPE html>
<html>
<head>
    <title>Database Management</title>
</head>
<body>
    <h1>Database Management</h1>
    <section>
        <h2>Database Connection Status</h2>
        <p id="status"></p>
    </section>
    
</body>
</html>

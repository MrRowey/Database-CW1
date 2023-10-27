<?php
session_start();
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "stepintohistory";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if($conn->connect_error){
    die("Connection failed: " . $conn->connect_error);
}

echo "button not pressed";

if ($_SERVER["REQUEST_METHOD"] == "POST"){
        echo "button pressed";

        if(isset($_POST['Submit']) && empty($_POST['username']) && empty($_POST['password']) && empty($_POST['passwordcheck'])){
            echo "Please fill out all the fields";
        }
        else {
            $username = $_REQUEST['username'];
            $password = $_REQUEST['password'];
            $chkpassword = $_REQUEST['passwordcheck'];

            // Check if the passwords match if not then display error if they do then hash the password
            if($password != $chkpassword){
                echo "Passwords do not match";
            } else {
                $hashpass = md5($password);
            }

            // Create a session with the username
            $_SESSION['username'] = $username;

            // Create the sql command
            $sql = "INSERT INTO account (username, password) VALUES ('$username', '$hashpass')";


            // Running the sql command
            if($conn->query($sql) === TRUE) {
                echo "New recored ha sbeen created";
                header("Location: accountDetials.php");
            } else {
                echo "Erro: " . $sql . "<br>" . $conn->error;
            }
        }
    $conn->close();
}
?>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Account Creation</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
    <style>
        html, body, form{
            background-color: #888;
        }
    </style>

</head>
  <body>
    <div class="container">
        <header class="loginheader">
            <h1> Stepping into History Account creation </h1>
        </header>

        <form class="row g-3" action="accountCreation.php" method="POST">
            <!-- Account -->
            <h2>Account Creation</h2>

            <!-- Username -->
                <label for="usernmae" class="form-label">Username</label>
                <input style="width:50%" type="text" class="form-control" id="username" name="username" require>
            <!-- Password -->
                <label for="password" class="form-label">Password</label>
                <input style="width:50%" type="password" class="form-control" id="password" name="password" require >
            <!-- Confirm Password -->
                <label for="cpassword" class="form-label">Confirm Password</label>
                <input style="width:50%" type="password" class="form-control" id="cpassword" name="passwordcheck" require >

            <div class="col-12">
                <button type="submit" value="Submit" name="Submit" class="btn btn-primary">Create Account</button>
            </div>
        </form>
    </div>
</body>
</html>
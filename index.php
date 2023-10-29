<?php
    // DB Credentials 
    $servername = "localhost";
    $username = "Basic";
    $password = "SLX3B5T-HMV0YhK-";
    $dbname = "stepintohistory";

    // Establishing connection to the database
    $conn = new mysqli($servername, $username, $password, $dbname);

    // Checking if the connection was successful
    if($conn->connect_error){
        die("Connection failed: " . $conn->connect_error);
    }

    // Checking if the user has submitted the form and if thier is any information enterd

    if ($_SERVER["REQUEST_METHOD"] == "POST"){

        if(isset($_POST['Submit']) && empty($_POST['username']) && empty($_POST['password'])){
            echo "Please fill out all the fields";
        }
        else {
            $username = $_REQUEST['username'];
            $password = $_REQUEST['password'];
            
            $hashpass = "SELECT password FROM account where username = '$username'";

            echo $hashpass;


            $passtest = password_verify($password, $hashpass);

            if($passtest == TRUE){
                echo "Password is correct";
            } else {
                echo "Password is incorrect";
            }


        };
    };

    //if (isset($_POST['username'])){
    //    $username = stripcslashes($_REQUEST['username']);
    //    $username = mysqli_real_escape_string($conn, $username);
//
    //    $password = stripcslashes($_REQUEST['password']);
    //    $password = mysqli_real_escape_string($conn, $password);
//
    //    $query = "SELECT * from `account` WHERE username=`$username` and password=`" . md5($password) . "`";
    //    $result = mysqli_query($conn, $query);
    //    $rows = mysqli_num_rows($result);
    //    if($rows == 1){
    //        $_SESSION['username'] = $username;
    //        header("Location: splashscreen.html");
    //    }
    //    else{
    //        echo "<p> Incorret Username or Password </p>";
    //    }
    //}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./style/index.css">
    <title>Document</title>
</head>
<body>
    <div class="container">
        <header class="loginheader">
            <h1>
                Stepping into History
            </h1>
        </header>

        <div class="login">
            <form class="form" action="index.php" method="get">
                <h2 class="formheader"><u>Login</u></h2><br>
                <label class="lable" for="username"> Username</label>
                <input class="usernameinput" type="text" name="text" id="username" require>
                <br>
                <label class="lable" for="password"> Password</label>
                <input class="passwordinput" type="password" name="password" id="password" require>
                <br>
                <input class="loginbutton" type="submit" value="Login">
            </form>
        </div>

        <div class="info">
            <h2>More infomation</h2>
            <p>If you dont have an account either created one or return back to the main site.</p>
            <a href="accountcreation.php"><button class="button">Create Account</button></a>
            <a href=""><button class="button">Learn More</button></a>
        </div>

    </div>
</body>
</html>
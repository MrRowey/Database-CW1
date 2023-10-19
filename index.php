<?php
    // Connecting to the database
    $conn = mysqli_connect("localhost", "basic", "SLX3B5T-HMV0YhK-", "stepintohistory");

    // Checking if the connection was successful
    
    if(mysqli_connect_errno()) {
        echo "Failed to connect to MySQL: " . mysqli_connect_error();
    }
    

    // Checking if the user has submitted the form and if thier is any information enterd
    if (isset($_GET['username'])){
        $username = stripcslashes($_REQUEST['username']);
        $username = mysqli_real_escape_string($conn, $username);

        $password = stripcslashes($_REQUEST['password']);
        $password = mysqli_real_escape_string($conn, $password);

        $query = "SELECT * from `account` WHERE username=`$username` and password=`" . md5($password) . "`";
        $result = mysqli_query($conn, $query);
        $rows = mysqli_num_rows($result);
        if($rows == 1){
            $_SESSION['username'] = $username;
            header("Location: index.php");
        }
        else{
            echo "<p> Incorret Username or Password </p>";
        }
    }
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
            <form class="form" action="">
                <h2 class="formheader">Please Login</h2>
                <input class="emailinput" type="email" name="email" id="email" placeholder="name@example.com">
                <br>
                <input class="passwordinput" type="password" name="password" id="password" placeholder="Password123">
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
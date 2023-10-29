<?php

// Session Variables
session_start();
$username = $_SESSION['username'];

// Db Credentials
$dbservername = "localhost";
$dbusername = "root";
$dbpassword = "";
$dbname = "stepintohistory";

// Create connection
$conn = new mysqli($dbservername, $dbusername, $dbpassword, $dbname);

// Check connection
if($conn->connect_error){
    die("Connection failed: " . $conn->connect_error);
}

// Getting country from db
$countrySQL = "SELECT * FROM `countries`";
$countryresult = mysqli_query($conn, $countrySQL);

$accountSQL = "SELECT account_id FROM `account` WHERE username = '$username'";
$accountResult = mysqli_query($conn, $accountSQL);
while ($row = $accountResult->fetch_assoc()) {
    $accountID = $row['account_id'];
}

if ($_SERVER["REQUEST_METHOD"] == "GET"){
    if(isset($_POST['Submit']) && empty($_POST['fname']) && empty($_POST['sname']) && empty($_POST['addr']) && empty($_POST['city']) && empty($_POST['country']) && empty($_POST['postcode']) && empty($_POST['num']) && empty($_POST['email'])){
        echo "Not all Field are Filled in";
    }
    else {

        // Getting the data from the form
        
        $forname = $_REQUEST['fname'];
        $surname = $_REQUEST['sname'];
        $address1 = $_REQUEST['addr'];
        $address2 = $_REQUEST['addr2'];
        $city = $_REQUEST['city'];
        $country = $_REQUEST['country'];
        $postcode = $_REQUEST['postcode'];
        $number = $_REQUEST['num'];
        $email = $_REQUEST['email'];

        echo "all fields are filled in";

        $sql1 = "INSERT INTO address (addressline1, addressline2, city, country, postcode) VALUES ('$address1', '$address2', '$city', '$country', '$postcode');";
        $sql2 = "INSERT INTO customer (forname, surname, address, contactNumber, email, accountID)  VALUES ('$forname', '$surname', LAST_INSERT_ID(), '$number', '$email', '$accountID')";

        if($conn->query($sql1) === TRUE && $conn->query($sql2) === TRUE) {
            echo "New recored ha sbeen created";
            header("Location: splashscreen.php");
        } else {
            echo "Erro: " . $sql1 . "<br>" . $conn->error;
        }

    }
    session_destroy();
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

        <p>Good Day <?php echo $username ?> We jsut need a few more detials</p>

        <form class="row g-3" action="accountDetials.php" method="get">
            <h2>Personal Infomation</h2>
            
            <!-- Forname -->
            <div class="col-md-5">
                <label for="fname" class="form-label">First Name</label>
                <input type="text" name="fname" id="Forname" class="form-control" required >
            </div>

            <!-- Surname -->
            <div class="col-md-5">
                <label for="sname" class="form-label">Last Name</label>
                <input type="text" class="form-control" id="fname" name="sname" required >
            </div>

            <h2> Address </h2>

            <!-- Address -->
            <div class="col-12">
                <label for="address" class="form-label">Address</label>
                <input type="text" class="form-control" id="address" name="addr" require >
            </div>

            <!-- Address2 -->
            <div class="col-12">
                <label for="address2" class="form-label">Address 2</label>
                <input type="text" class="form-control" id="address2" name="addr2">
            </div>

            <!-- City -->
            <div class="col-md-6">
                <label for="city" class="form-label">City</label>
                <input type="text" class="form-control" id="city" name="city" require  >
            </div>

            <!-- Country -->
            <div class="col-md-4">
                <label for="country" class="form-label">Country</label>
                <select id="country" class="form-select" name="country"  >
                  <option selected disabled>Select Country</option>
                  <?php while($row = mysqli_fetch_array($countryresult)){
                        echo '<option value="'.$row['country_id'].'">'.$row['countryname'].'</option>';
                    }
                    ?>
                </select>
            </div>

            <!-- Postcode -->
            <div class="col-md-2">
                <label for="inputZip" class="form-label">Zip/PostCode</label>
                <input type="text" class="form-control" id="postcode" name="postcode" require >
            </div>

            <!-- Contact -->
            <h2>Contact Infomation</h2>

            <!-- Contact Number -->
            <div class="col-md-6">
                <label for="hnumber" class="form-label">Home Number</label>
                <input type="number" class="form-control" id="hnumber" name="num" require> 
            </div>

            <!-- Email -->
            <div class="col-md-6">
                <label for="email" class="form-label">Email</label>
                <input type="email" class="form-control" id="email" name="email" require >
            </div>

            <div class="col-12">
                <button type="submit" value="Submit" name="Submit" class="btn btn-primary">Create Account</button>
            </div>
        </form>
    </div>
</body>
</html>
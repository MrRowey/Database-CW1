<?php
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

$titleSQL = "SELECT * FROM `title`";
$titleresult = mysqli_query($conn, $titleSQL);

$countrySQL = "SELECT * FROM `countries`";
$countryresult = mysqli_query($conn, $countrySQL);


if ($_SERVER["REQUEST_METHOD"] == "GET"){
        // User Info
        $title = $_REQUEST['titleselect'];

        $fname = $_REQUEST['fname'];

        $sname = $_REQUEST['sname'];

        $address = $_REQUEST['addr'];

        $address2 = $_REQUEST['addr2'];

        $city = $_REQUEST['city'];

        $country = $_REQUEST['country'];

        $postcode = $_REQUEST['postcode'];

        $hnumber = $_REQUEST['h-num'];

        $mnumber = $_REQUEST['m-num'];

        $email = $_REQUEST['email'];


        // Account Info
        $username = $_REQUEST['uname'];

        $password = $_REQUEST['pwrd'];

        $cpassword = $_REQUEST['pwrdck'];


        if($password != $cpassword){
            echo "Passwords do not match";
        } else {
            $hashpass = md5($password);
        }

        //$sqltemp = "INSERT INTO name (forname, surname) VALUES ('$fname', '$sname')";

        $sql = "INSERT INTO customer, name, address, contactdetails, account (title, forname, surname, addressline1, addressline2, city, county, postcode, homephone, mobilephone, email, username, password) VALUES ('$title', name_id, address_id, contactdetails_id, account_id, '$fname', '$sname', '$address', '$address2', '$city', '$country', '$postcode', '$hnumber', '$mnumber', '$email', '$username', '$hashpass')";

        //if(empty($cpassword)){
        //    echo "Please enter all required fields";
        //} else {
        //    echo $cpassword;
        //}

        // Running the sql command
        if($conn->query($sql) === TRUE) {
            echo "New recored ha sbeen created";
        } else {
            echo "Erro: " . $sql . "<br>" . $conn->error;
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

        <form class="row g-3" action="accountcreation.php" method="get">
            <h2>Personal Infomation</h2>
            
            <!-- Title -->
            <div class="col-md-2">
                <label class="form-label" for="titleselect">Title:</label>
                <select class="form-select" id="titleselect" name="titleselect" required>
                    <option disabled selected>Title</option>
                    <?php while($row = mysqli_fetch_array($titleresult)){
                        echo '<option value="'.$row['title_id'].'">'.$row['titlename'].'</option>';
                    }
                    ?>
                </select>
            </div>

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
                <input type="text" class="form-control" id="address" name="addr"  >
            </div>

            <!-- Address2 -->
            <div class="col-12">
                <label for="address2" class="form-label">Address 2</label>
                <input type="text" class="form-control" id="address2" name="addr2">
            </div>

            <!-- City -->
            <div class="col-md-6">
                <label for="city" class="form-label">City</label>
                <input type="text" class="form-control" id="city" name="city"  >
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
                <input type="text" class="form-control" id="postcode" name="postcode"  >
            </div>

            <!-- Contact -->
            <h2>Contact Infomation</h2>

            <!-- Home Number -->
            <div class="col-md-4">
                <label for="hnumber" class="form-label">Home Number</label>
                <input type="number" class="form-control" id="hnumber" name="h-num"> 
            </div>

            <!-- Mobile Number -->
            <div class="col-md-4">
                <label for="mnumber" class="form-label">Mobile Number</label>
                <input type="number" class="form-control" id="mnumber" name="m-num"  >
            </div>

            <!-- Email -->
            <div class="col-md-4">
                <label for="email" class="form-label">Email</label>
                <input type="email" class="form-control" id="email" name="email"  >
            </div>

            <!-- Account -->
            <h2>Account Creation</h2>

            <!-- Username -->
            <div class="col-md-4">
                <label for="usernmae" class="form-label">Username</label>
                <input type="text" class="form-control" id="username" name="uname"  >
            </div>

            <!-- Password -->
            <div class="col-md-4">
                <label for="password" class="form-label">Password</label>
                <input type="password" class="form-control" id="password" name="pwrd"  >
            </div>

            <!-- Confirm Password -->
            <div class="col-md-4">
                <label for="cpassword" class="form-label">Confirm Password</label>
                <input type="password" class="form-control" id="cpassword" name="pwrdck"  >
            </div>

            <div class="col-12">
                <button type="submit" value="Submit" class="btn btn-primary">Create Account</button>
            </div>
        </form>
    </div>
</body>
</html>
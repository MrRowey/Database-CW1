<!DOCTYPE html>
<html>
    <head>
        <title>New User Account Creation</title>
    </head>
    <body>
        <center>
            <?php
                // Database connection
                $conn = mysqli_connect("localhost", "basic", "sKWnTXv5)2]C(7yq", "stepintohistory");

                if($conn === false){
                    die("ERROR: Could not connect. " . mysqli_connect_error());
                }

                // User Info
                $title = $_REQUEST['titleselect'];
                $fname = $_REQUEST['forname'];
                $sname = $_REQUEST['surname'];
                $address = $_REQUEST['address'];
                $address2 = $_REQUEST['address2'];
                $city = $_REQUEST['city'];
                $country = $_REQUEST['country'];
                $postcode = $_REQUEST['inputZip'];
                $hnumber = $_REQUEST['hnumber'];
                $mnumber = $_REQUEST['mnumber'];
                $email = $_REQUEST['email'];
                // Account Info
                $username = $_REQUEST['username'];
                $password = $_REQUEST['password'];
                $cpassword = $_REQUEST['cpassword'];
                // adding data to the Database
                $sql = "INSERT INTO customer, name, address, contactdetails, account ('$tile', name_id, address_id, contact_id, account_id, forname, surname, addressline1, addressline2, city, country_id, postcode, homephone, mobilephone, email, username, password) VALUES ('$title', name_id, address_id, contactdetails_id, account_id, '$fname', '$sname', '$address', '$address2', '$city', '$country', '$postcode', '$hnumber', '$mnumber', '$email', '$username', '$password')";
                // Running the sql command
                if(mysqli_query($conn, $sql)){
                    echo "Records added successfully.";
                } else{
                    echo "ERROR: Could not able to execute $sql. " . mysqli_error($conn);
                }
                mysqli_close($conn);
            ?>
        </center>    
    </body>
</html>
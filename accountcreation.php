<?php
$conn = mysqli_connect("localhost", "basic", "sKWnTXv5)2]C(7yq", "stepintohistory");
if(mysqli_connect_errno()) {
    
    exit('Failed to connect to MySQL: ' . mysqli_connect_error());
};

$titleSQL = "SELECT * FROM `title`";
$titleresult = mysqli_query($conn, $titleSQL);

$countrySQL = "SELECT * FROM `title`";
$countryresult = mysqli_query($conn, $countrySQL);









?>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
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

        <form class="row g-3" action="">
            <h2>Personal Infomation</h2>
                        
            <div class="col-md-2">
                <label for="selectTitle" class="form-label">Title:</label>
                <select class="form-select" id="selectTitle" required>
                    <option disabled selected>Title</option>
                    <?php while($row = mysqli_fetch_array($titleresult)){
                        echo '<option value="'.$row['title_id'].'">'.$row['titlename'].'</option>';
                    }
                    ?>
                </select>
            </div>

            <div class="col-md-5">
                <label for="forname" class="form-label">First Name</label>
                <input type="text" class="form-control" id="forname" required >
            </div>

            <div class="col-md-5">
                <label for="surname" class="form-label">Last Name</label>
                <input type="text" class="form-control" id="surname" required >
            </div>

            <!-- Address -->
            <h2> Address </h2>

            <div class="col-12">
                <label for="address" class="form-label">Address</label>
                <input type="text" class="form-control" id="address" required >
            </div>
            <div class="col-12">
                <label for="address2" class="form-label">Address 2</label>
                <input type="text" class="form-control" id="address2">
            </div>

            <div class="col-md-6">
                <label for="city" class="form-label">City</label>
                <input type="text" class="form-control" id="city" required >
            </div>
            <div class="col-md-4">
                <label for="country" class="form-label">Country</label>
                <select id="country" class="form-select" required >
                  <option selected disabled>Select Country</option>
                  <?php while($row = mysqli_fetch_array($countryresult)){
                        echo '<option value="'.$row['country_id'].'">'.$row['countryname'].'</option>';
                    }
                    ?>
                </select>
            </div>
            <div class="col-md-2">
                <label for="inputZip" class="form-label">Zip/PostCode</label>
                <input type="text" class="form-control" id="inputZip" required >
            </div>

            <!-- Contact -->
            <h2>Contact Infomation</h2>
            <div class="col-md-4">
                <label for="hnumber" class="form-label">Home Number</label>
                <input type="number" class="form-control" id="hnumber">
            </div>

            <div class="col-md-4">
                <label for="mnumber" class="form-label">Mobile Number</label>
                <input type="number" class="form-control" id="mnumber" required >
            </div>

            <div class="col-md-4">
                <label for="email" class="form-label">Email</label>
                <input type="email" class="form-control" id="email" required >
            </div>

            <!-- Account -->
            <h2>Account Creation</h2>
            <div class="col-md-4">
                <label for="usernmae" class="form-label">Username</label>
                <input type="number" class="form-control" id="username" required >
            </div>

            <div class="col-md-4">
                <label for="password" class="form-label">Password</label>
                <input type="number" class="form-control" id="password" required >
            </div>

            <div class="col-md-4">
                <label for="cpassword" class="form-label">Confirm Password</label>
                <input type="email" class="form-control" id="cpassword" required >
            </div>

            <div class="col-12">
                <button type="submit" class="btn btn-primary">Create Account</button>
            </div>
        </form>
    </div>
</body>
</html>
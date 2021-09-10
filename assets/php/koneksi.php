<?php
$servername = "localhost";
$username = "adry2296_localhost";
$password = "manajemeninformatika18";
$dbname = "adry2296_indostat";

// Create connection
$conn = mysqli_connect($servername, $username, $password, $dbname);
// Check connection
if (!$conn) {
  die("Connection failed: " . mysqli_connect_error());
}

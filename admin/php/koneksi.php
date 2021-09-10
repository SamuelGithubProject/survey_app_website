<?php

$servername = "localhost";
$username = "adry2296_localhost";
$password = "manajemeninformatika18";
$database = "adry2296_indostat";

$conn = mysqli_connect($servername, $username, $password, $database);
// mengecek koneksi
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

$pdo = new PDO("mysql:host=$servername;dbname=$database", $username, $password);

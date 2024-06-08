<?php 
$host = "localhost";
$user = "root";
$pass = "";
$db = "aldihermansyah_312310200";
$conn = mysqli_connect($host, $user, $pass, $db);
if ($conn == false){
    echo "Koneksi ke server gagal.";
    die();
} else echo "Koneksi berhasil";
?>
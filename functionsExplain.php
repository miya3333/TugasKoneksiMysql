<?php 
// koneksi ke databases
// localhost, admin, password, databases
// dimasukkan kedalam variabel $conn biar ga ribet
$conn = mysqli_connect("localhost", "root", "", "aldihermansyah_312310200");

function query($query){
    global $conn; // mengambil variabel yang sudah ada diluar function
    $result = mysqli_query($conn, $query); // panggil query 
    $rows = []; // menyiapkan array kosong
    while($row = mysqli_fetch_assoc($result)){ // data diambil menggunakan looping
        $rows[] = $row; // menambahkan elemen baru di akhir array
    }
    return $rows; // mengembalikan nilai $rows
}
?>
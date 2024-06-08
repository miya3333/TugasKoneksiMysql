<?php 
// koneksi ke databases
$conn = mysqli_connect("localhost", "root", "", "aldihermansyah_312310200");

// ambil data dari tabel mahasiswa / query data mahasiswa
$result = mysqli_query($conn, "SELECT * FROM mahasiswa");

// ambil data mahasiswa dari object result
// mysqli_fetch_row() // mengembalikan array numerik
// mysqli_fetch_assoc() // mengembalikan array associative
// mysqli_fetch_array() // mengembalikan keduanya
// mysqli_fetch_object() // mengembalikan  object

// while($mhs = mysqli_fetch_assoc($result)){
//     var_dump($mhs);
// }


?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pertemuan 12 Basis Data </title>
</head>

<body>
    <h1>Daftar Mahasiswa</h1>
    <table border="1" cellpadding="10" cellspacing="0">
        <tr>
            <th>No.</th>
            <!-- <th>Aksi</th> -->
            <th>NIM</th>
            <th>Nama</th>
            <th>Alamat</th>
            <th>Jurusan</th>
            <th>Tanggal Lahir</th>
            <th>IPK</th>
        </tr>

        <?php $i = 1; ?>
        <?php while($row = mysqli_fetch_assoc($result)): ?>
        <tr>
            <td><?= $i; ?></td>
            <!-- <td><a href="">ubah</a> | <a href="">Hapus</a></td> -->
            <!-- <td></td> -->
            <td><?= $row["NIM"]; ?></td>
            <td><?= $row["Nama"]; ?></td>
            <td><?= $row["Alamat"]; ?></td>
            <td><?= $row["Jurusan"]; ?></td>
            <td><?= $row["tgl_lahir"]; ?></td>
            <td><?= $row["IPK"]; ?></td>
        </tr>
        <?php $i++; ?>
        <?php endwhile; ?>
        <table>
</body>

</html>
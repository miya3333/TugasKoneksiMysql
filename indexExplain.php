<?php 
require 'functions.php'; // menghubungkan fungsi dari functions.php
// ambil data dari tabel mahasiswa
// dimasukkan kedalam variabel $mahasiswa biar ga ribet
$mahasiswa = query("SELECT * FROM mahasiswa");

// ambil data dari tabel dosen
// dimasukkan kedalam variabel $dosen biar ga ribet
$dosen = query("SELECT * FROM dosen");

// ambil data dari tabel mata_kuliah
// dimasukkan kedalam variabel $matkul biar ga ribet
$matkul = query("SELECT * FROM mata_kuliah");

// ambil data dari tabel nilai
// dimasukkan kedalam variabel $nilai biar ga ribet
$nilai = query("SELECT * FROM nilai");
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pertemuan 12 Basis Data </title>
    <link rel="stylesheet" href="style.css">
</head>

<body>

    <div class="container">
        <h1>Sistem Akademik</h1>
        <div class="main">
            <div class="mahasiswa">
                <h2>Mahasiswa</h2>
                <table border="1" cellpadding="5" cellspacing="0">
                    <tr>
                        <th>No.</th>
                        <th>NIM</th>
                        <th>Nama</th>
                        <th>Alamat</th>
                        <th>Jurusan</th>
                        <th>Tanggal Lahir</th>
                        <th>IPK</th>
                    </tr>

                    <!-- variabel i bernilai 1 -->
                    <?php $i = 1; ?>
                    <?php foreach($mahasiswa as $row): ?>
                    <tr>
                        <td align="center"><?= $i; ?></td> <!-- mencetak nomor otomatis -->
                        <td align="center"><?= $row["NIM"]; ?></td> <!-- diambil dari filed/row NIM -->
                        <td><?= $row["Nama"]; ?></td> <!-- diambil dari filed/row Nama -->
                        <td><?= $row["Alamat"]; ?></td> <!-- diambil dari filed/row Alamat -->
                        <td><?= $row["Jurusan"]; ?></td> <!-- diambil dari filed/row Jurusan -->
                        <td align="center"><?= $row["tgl_lahir"]; ?></td> <!-- diambil dari filed/row tgl_lahir -->
                        <td align="center"><?= $row["IPK"]; ?></td> <!-- diambil dari filed/row IPK -->
                    </tr>
                    <!-- looping variabel i sampai data terakhir -->
                    <?php $i++; ?>
                    <!-- a -->
                    <?php endforeach; ?>
                </table>
            </div>
            <div class="mkdosen">
                <div class="dosen">
                    <h2>Dosen</h2>
                    <table border="1" cellpadding="5" cellspacing="0">
                        <tr>
                            <th>id</th>
                            <th>Nama</th>
                        </tr>

                        <?php foreach($dosen as $row): ?>
                        <tr>
                            <td align="center"><?= $row["id"]; ?></td> <!-- diambil dari filed/row id -->
                            <td><?= $row["nama"]; ?></td> <!-- diambil dari filed/row nama -->
                        </tr>
                        <?php endforeach; ?>
                    </table>
                </div>
                <div class="mataKuliah">
                    <h2>Mata Kuliah</h2>
                    <table border="1" cellpadding="5" cellspacing="0">
                        <tr>
                            <th>id</th>
                            <th>Mata Kuliah</th>
                            <th>Dosen id</th>
                        </tr>

                        <?php foreach($matkul as $row): ?>
                        <tr>
                            <td align="center"><?= $row["id"]; ?></td> <!-- diambil dari filed/row id -->
                            <td><?= $row["nama_mk"]; ?></td> <!-- diambil dari filed/row nama_mk -->
                            <td align="center"><?= $row["dosen_id"]; ?></td> <!-- diambil dari filed/row dosen_id -->
                        </tr>
                        <?php endforeach; ?>
                    </table>
                </div>
            </div>
            <div class="nilai">
                <h2>Nilai</h2>
                <table border="1" cellpadding="5" cellspacing="0">
                    <tr>
                        <th>id</th>
                        <th>NIM</th>
                        <th>Mata Kuliah id</th>
                        <th>Nilai</th>
                    </tr>

                    <?php foreach($nilai as $row): ?>
                    <tr align="center">
                        <td><?= $row["id"]; ?></td> <!-- diambil dari filed/row id -->
                        <td><?= $row["NIM"]; ?></td> <!-- diambil dari filed/row NIM -->
                        <td><?= $row["mk_id"]; ?></td> <!-- diambil dari filed/row mk_id -->
                        <td><?= $row["nilai"]; ?></td> <!-- diambil dari filed/row nilai -->
                    </tr>
                    <?php endforeach; ?>
                </table>
            </div>
        </div>
    </div>

</body>

</html>
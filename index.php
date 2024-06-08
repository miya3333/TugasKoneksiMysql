<?php 
require 'functions.php';
$mahasiswa = query("SELECT * FROM mahasiswa");
$dosen = query("SELECT * FROM dosen");
$matkul = query("SELECT * FROM mata_kuliah");
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

                    <?php $i = 1; ?>
                    <?php foreach($mahasiswa as $row): ?>
                    <tr>
                        <td align="center"><?= $i; ?></td>
                        <td align="center"><?= $row["NIM"]; ?></td>
                        <td><?= $row["Nama"]; ?></td>
                        <td><?= $row["Alamat"]; ?></td>
                        <td><?= $row["Jurusan"]; ?></td>
                        <td align="center"><?= $row["tgl_lahir"]; ?></td>
                        <td align="center"><?= $row["IPK"]; ?></td>
                    </tr>

                    <?php $i++; ?>
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
                            <td align="center"><?= $row["id"]; ?></td>
                            <td><?= $row["nama"]; ?></td>
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
                            <td align="center"><?= $row["id"]; ?></td>
                            <td><?= $row["nama_mk"]; ?></td>
                            <td align="center"><?= $row["dosen_id"]; ?></td>
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
                        <td><?= $row["id"]; ?></td>
                        <td><?= $row["NIM"]; ?></td>
                        <td><?= $row["mk_id"]; ?></td>
                        <td><?= $row["nilai"]; ?></td>
                        <?php endforeach; ?>
                </table>
            </div>
        </div>
    </div>

</body>

</html>
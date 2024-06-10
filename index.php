<?php 
require 'functions.php';
$bus = query("SELECT * FROM bus");
$detail = query("SELECT * FROM detailPemesanan");
$jadwal = query("SELECT * FROM jadwal");
$pelanggan = query("SELECT * FROM pelanggan");
$pemesanan = query("SELECT * FROM pemesanan");
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Basis Data Pertemuan 12</title>
    <link rel="stylesheet" href="styling.css">
</head>

<body>
    <div class="container">
        <h1>Agen Tiket Bus Nyaman</h1>
        <div class="top">
            <div class="bus">
                <h2>Bus</h2>
                <table border="1" cellpadding="5" cellspacing="0">
                    <tr>
                        <th>id Bus</th>
                        <th>Nomor Plat</th>
                        <th>Kapasitas</th>
                        <th>Merek</th>
                    </tr>
                    <?php $i = 1; ?>
                    <?php foreach($bus as $row): ?>
                    <tr>
                        <td align="center"><?= $row["idBus"]; ?></td>
                        <td><?= $row["NomorPlat"]; ?></td>
                        <td align="center"><?= $row["Kapasitas"]; ?></td>
                        <td><?= $row["Merek"]; ?></td>
                    </tr>
                    <?php $i++; ?>
                    <?php endforeach; ?>
                </table>
            </div>
            <div class="jadwal">
                <h2>Jadwal Bus</h2>
                <table border="1" cellpadding="5" cellspacing="0">
                    <tr>
                        <th>id Jadwal</th>
                        <th>id Bus</th>
                        <th>Tujuan</th>
                        <th>Tanggal Berangkat</th>
                        <th>Waktu Berangkat</th>
                    </tr>
                    <?php foreach($jadwal as $row): ?>
                    <tr>
                        <td align="center"><?= $row["idJadwal"]; ?></td>
                        <td align="center"><?= $row["idBus"]; ?></td>
                        <td><?= $row["Tujuan"]; ?></td>
                        <td align="center"><?= $row["TanggalBerangkat"]; ?></td>
                        <td align="center"><?= $row["WaktuBerangkat"]; ?></td>
                    </tr>
                    <?php endforeach; ?>
                </table>
            </div>
        </div>
        <div class="middle">
            <div class="pelanggan">
                <h2>Pelanggan</h2>
                <table border="1" cellpadding="5" cellspacing="0">
                    <tr>
                        <th>id Pelanggan</th>
                        <th>Nama</th>
                        <th>Alamat</th>
                        <th>Tanggal Lahir</th>
                        <th>Nomor Telepon</th>
                        <th>Status Keanggotaan</th>
                        <th>Tanggal Bergabung</th>
                    </tr>
                    <?php foreach($pelanggan as $row): ?>
                    <tr align="center">
                        <td align="center"><?= $row["idPelanggan"]; ?></td>
                        <td align="left"><?= $row["Nama"]; ?></td>
                        <td align="left"><?= $row["Alamat"]; ?></td>
                        <td align="center"><?= $row["TanggalLahir"]; ?></td>
                        <td align="center"><?= $row["NomorTelepon"]; ?></td>
                        <td align="left"><?= $row["StatusKeanggotaan"]; ?></td>
                        <td align="center"><?= $row["TanggalBergabung"]; ?></td>
                        <?php endforeach; ?>
                </table>
            </div>
        </div>
        <div class="bottom">
            <div class="detail">
                <h2>Detail Pemesanan</h2>
                <table border="1" cellpadding="5" cellspacing="0">
                    <tr>
                        <th>id Pemesanan</th>
                        <th>id Bus</th>
                        <th>Nomor Kursi</th>
                    </tr>
                    <?php foreach($detail as $row): ?>
                    <tr>
                        <td align="center"><?= $row["idPemesanan"]; ?></td>
                        <td align="center"><?= $row["idBus"]; ?></td>
                        <td align="center"><?= $row["NomorKursi"]; ?></td>
                    </tr>
                    <?php endforeach; ?>
                </table>
            </div>
            <div class="pemesanan">
                <h2>Pemesanan</h2>
                <table border="1" cellpadding="5" cellspacing="0">
                    <tr>
                        <th>id Pemesanan</th>
                        <th>id Pelanggan</th>
                        <th>id Jadwal</th>
                        <th>Tanggal Pemesanan</th>
                        <th>Jumlah Tiket</th>
                    </tr>
                    <?php foreach($pemesanan as $row): ?>
                    <tr align="center">
                        <td align="center"><?= $row["idPemesanan"]; ?></td>
                        <td align="center"><?= $row["idPelanggan"]; ?></td>
                        <td align="center"><?= $row["idJadwal"]; ?></td>
                        <td align="center"><?= $row["TanggalPemesanan"]; ?></td>
                        <td align="center"><?= $row["JumlahTiket"]; ?></td>
                        <?php endforeach; ?>
                </table>
            </div>
        </div>
    </div>
</body>

</html>
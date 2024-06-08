<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pertemuan 12 Basis Data</title>
</head>

<body>
    <div class="container">
        <h1>Sistem Akademik</h1>
        <div class="main">
            <?php
                include("index.php");
                $sql = 'SELECT * FROM dosen';
                $result = mysqli_query($conn, $sql);
            ?>
        </div>
        <h3>Tabel Dosen</h3>
        <table>
            <tr>
                <th>NIM</th>
                <th>Nama_Dosen</th>
            </tr>
            <?php if($result); ?>
            <?php while($row = mysqli_fetch_array($result)): ?>
            <tr>
                <td>
                    <?php $row['NIM']; ?>
                </td>
                <td>
                    <?php $row['Nama_Dosen']; ?>
                </td>
            </tr>
            <?php endwhile; ?>
            <tr>
                <td colspan="7">Belum ada data</td>
            </tr>
        </table>
    </div>
</body>

</html>
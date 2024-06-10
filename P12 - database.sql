-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 10, 2024 at 02:23 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `uts_312310200`
--

DELIMITER $$
--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `jumlahTiketPelanggan` (`tiket` INT) RETURNS INT(11)  BEGIN
    DECLARE jumlah INT;
    SELECT SUM(JumlahTiket) INTO jumlah
    FROM pemesanan
    WHERE idPelanggan = tiket;
    RETURN IFNULL(jumlah, 0);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `bus`
--

CREATE TABLE `bus` (
  `idBus` int(100) NOT NULL,
  `NomorPlat` varchar(15) NOT NULL,
  `Kapasitas` int(100) NOT NULL,
  `Merek` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bus`
--

INSERT INTO `bus` (`idBus`, `NomorPlat`, `Kapasitas`, `Merek`) VALUES
(1, 'B 2983 SKL', 50, 'Honda'),
(2, 'B 3920 RKS', 45, 'Yamaha'),
(3, 'B 8439 KIF', 35, 'Mercedes'),
(4, 'B 5831 OMP', 20, 'Tesla');

-- --------------------------------------------------------

--
-- Table structure for table `detailpemesanan`
--

CREATE TABLE `detailpemesanan` (
  `idPemesanan` int(100) NOT NULL,
  `idBus` int(100) NOT NULL,
  `NomorKursi` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `detailpemesanan`
--

INSERT INTO `detailpemesanan` (`idPemesanan`, `idBus`, `NomorKursi`) VALUES
(1, 4, 5),
(2, 4, 6),
(3, 4, 7),
(4, 4, 8),
(5, 4, 9),
(6, 1, 1),
(7, 1, 2),
(8, 1, 3),
(9, 3, 34),
(10, 3, 35),
(11, 1, 12),
(12, 1, 13),
(13, 4, 1),
(14, 2, 6),
(15, 4, 2);

-- --------------------------------------------------------

--
-- Table structure for table `jadwal`
--

CREATE TABLE `jadwal` (
  `idJadwal` int(100) NOT NULL,
  `idBus` int(100) DEFAULT NULL,
  `Tujuan` varchar(50) DEFAULT NULL,
  `TanggalBerangkat` date DEFAULT NULL,
  `WaktuBerangkat` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jadwal`
--

INSERT INTO `jadwal` (`idJadwal`, `idBus`, `Tujuan`, `TanggalBerangkat`, `WaktuBerangkat`) VALUES
(1, 1, 'Cilacap', '2024-06-10', '08:45:00'),
(2, 1, 'Bandung', '2024-06-05', '07:25:00'),
(3, 2, 'Garut', '2024-06-05', '07:40:00'),
(4, 3, 'Cianjur', '2024-06-05', '08:00:00'),
(5, 3, 'Purwakarta', '2024-06-08', '10:15:00'),
(6, 4, 'Tasikmalaya', '2024-06-08', '10:35:00'),
(7, 4, 'Pangandaran', '2024-06-10', '06:05:00');

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `idPelanggan` int(100) NOT NULL,
  `Nama` varchar(50) NOT NULL,
  `Alamat` varchar(50) DEFAULT NULL,
  `TanggalLahir` date DEFAULT NULL,
  `NomorTelepon` varchar(15) DEFAULT NULL,
  `StatusKeanggotaan` varchar(10) DEFAULT NULL,
  `TanggalBergabung` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`idPelanggan`, `Nama`, `Alamat`, `TanggalLahir`, `NomorTelepon`, `StatusKeanggotaan`, `TanggalBergabung`) VALUES
(1, 'Aldi', 'Cikarang Barat', '2003-03-03', '081155551111', 'GOLD', '2021-02-10'),
(2, 'Hermansyah', 'Cikarang Timur', '2003-10-23', '081155552222', 'SILVER', '2022-12-01'),
(3, 'Aryo', 'Cikarang Utara', '2002-12-29', '081155553333', 'SILVER', '2022-10-24'),
(4, 'Putra', 'Cikarang Selatan', '2004-09-17', '081155554444', 'BRONZE', '2023-01-29'),
(5, 'Pangestu', 'Jakarta Timur', '2003-03-25', '081155556666', 'SILVER', '2021-09-03'),
(6, 'Fahrizal', 'Jakarta Barat', '2002-06-14', '081155557777', 'GOLD', '2023-03-09');

-- --------------------------------------------------------

--
-- Table structure for table `pemesanan`
--

CREATE TABLE `pemesanan` (
  `idPemesanan` int(100) NOT NULL,
  `idPelanggan` int(100) DEFAULT NULL,
  `idJadwal` int(100) DEFAULT NULL,
  `TanggalPemesanan` date DEFAULT NULL,
  `JumlahTiket` int(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pemesanan`
--

INSERT INTO `pemesanan` (`idPemesanan`, `idPelanggan`, `idJadwal`, `TanggalPemesanan`, `JumlahTiket`) VALUES
(1, 2, 4, '2024-05-25', 1),
(2, 2, 5, '2024-05-25', 1),
(3, 5, 1, '2024-05-17', 1),
(4, 5, 1, '2024-05-17', 1),
(5, 4, 2, '2024-05-17', 1),
(6, 1, 6, '2024-05-15', 1),
(7, 1, 6, '2024-05-15', 1),
(8, 1, 6, '2024-05-15', 1),
(9, 1, 6, '2024-05-15', 1),
(10, 1, 6, '2024-05-15', 1),
(11, 3, 3, '2024-05-11', 1),
(12, 3, 3, '2024-05-11', 1),
(13, 6, 7, '2024-05-05', 1),
(14, 6, 7, '2024-05-05', 1),
(15, 6, 7, '2024-05-05', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bus`
--
ALTER TABLE `bus`
  ADD PRIMARY KEY (`idBus`);

--
-- Indexes for table `detailpemesanan`
--
ALTER TABLE `detailpemesanan`
  ADD PRIMARY KEY (`idPemesanan`,`idBus`,`NomorKursi`),
  ADD KEY `idBus` (`idBus`);

--
-- Indexes for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD PRIMARY KEY (`idJadwal`),
  ADD KEY `idBus` (`idBus`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`idPelanggan`);

--
-- Indexes for table `pemesanan`
--
ALTER TABLE `pemesanan`
  ADD PRIMARY KEY (`idPemesanan`),
  ADD KEY `idPelanggan` (`idPelanggan`),
  ADD KEY `idJadwal` (`idJadwal`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bus`
--
ALTER TABLE `bus`
  MODIFY `idBus` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `jadwal`
--
ALTER TABLE `jadwal`
  MODIFY `idJadwal` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `idPelanggan` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `pemesanan`
--
ALTER TABLE `pemesanan`
  MODIFY `idPemesanan` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detailpemesanan`
--
ALTER TABLE `detailpemesanan`
  ADD CONSTRAINT `detailpemesanan_ibfk_1` FOREIGN KEY (`idPemesanan`) REFERENCES `pemesanan` (`idPemesanan`),
  ADD CONSTRAINT `detailpemesanan_ibfk_2` FOREIGN KEY (`idBus`) REFERENCES `bus` (`idBus`);

--
-- Constraints for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD CONSTRAINT `jadwal_ibfk_1` FOREIGN KEY (`idBus`) REFERENCES `bus` (`idBus`);

--
-- Constraints for table `pemesanan`
--
ALTER TABLE `pemesanan`
  ADD CONSTRAINT `pemesanan_ibfk_1` FOREIGN KEY (`idPelanggan`) REFERENCES `pelanggan` (`idPelanggan`),
  ADD CONSTRAINT `pemesanan_ibfk_2` FOREIGN KEY (`idJadwal`) REFERENCES `jadwal` (`idJadwal`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

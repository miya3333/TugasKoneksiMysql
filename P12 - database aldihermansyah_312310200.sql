-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 08, 2024 at 12:57 PM
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
-- Database: `aldihermansyah_312310200`
--

-- --------------------------------------------------------

--
-- Table structure for table `dosen`
--

CREATE TABLE `dosen` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dosen`
--

INSERT INTO `dosen` (`id`, `nama`) VALUES
(1, 'Dr. Hanum'),
(2, 'Suparman'),
(3, 'Dr. Bayu');

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `NIM` int(11) NOT NULL,
  `Nama` varchar(30) DEFAULT NULL,
  `Alamat` varchar(20) DEFAULT NULL,
  `Jurusan` varchar(20) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `IPK` float(3,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`NIM`, `Nama`, `Alamat`, `Jurusan`, `tgl_lahir`, `IPK`) VALUES
(312310200, 'Aldi Hermansyah', 'Cikarang Barat', 'Teknik Informatika', '2003-03-09', 4.00),
(312310201, 'Dian Saputri', 'Cikarang Timur', 'Manajemen', '2003-03-10', 3.50),
(312310202, 'Galih', 'Cikarang Utara', 'Manajemen', '2003-03-11', 3.00),
(312310203, 'Kiran Kurnia', 'Bekasi Barat', 'Teknik Informatika', '2003-03-12', 2.50),
(312310204, 'Zandi Atmojo', 'Jakarta Timur', 'Teknik Arsitektur', '2003-03-13', 2.00),
(312310205, 'Putra Pengestu', 'Cikarang Barat', 'Teknik Informatika', '2003-05-24', 3.25),
(312310206, 'Ari Walangsa', 'Cikarang Barat', 'Teknik Informatika', '2003-08-04', 3.65),
(312310207, 'Evi Andini', 'Cikarang Barat', 'Teknik Informatika', '2003-01-02', 3.15),
(312310208, 'Biru Laut', 'Cikarang Barat', 'Teknik Informatika', '2003-09-08', 2.99),
(312310209, 'Bumi Astro', 'Cikarang Selatan', 'Teknik Informatika', '2003-03-09', 3.95);

-- --------------------------------------------------------

--
-- Table structure for table `mata_kuliah`
--

CREATE TABLE `mata_kuliah` (
  `id` int(11) NOT NULL,
  `nama_mk` varchar(100) DEFAULT NULL,
  `dosen_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mata_kuliah`
--

INSERT INTO `mata_kuliah` (`id`, `nama_mk`, `dosen_id`) VALUES
(1, 'Kimia', 1),
(2, 'Fisika', 2),
(3, 'Biologi', 3),
(4, 'Bahasa Inggris', 1),
(5, 'Agama', 2),
(6, 'Bahasa Indonesia', 3);

-- --------------------------------------------------------

--
-- Table structure for table `nilai`
--

CREATE TABLE `nilai` (
  `id` int(11) NOT NULL,
  `NIM` int(11) DEFAULT NULL,
  `mk_id` int(11) DEFAULT NULL,
  `nilai` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nilai`
--

INSERT INTO `nilai` (`id`, `NIM`, `mk_id`, `nilai`) VALUES
(1, 312310200, 1, 85),
(2, 312310200, 2, 75),
(3, 312310200, 3, 95),
(4, 312310201, 3, 55),
(5, 312310202, 2, 75),
(6, 312310203, 1, 85),
(7, 312310204, 2, 85),
(8, 312310205, 3, 85),
(9, 312310206, 1, 85),
(10, 312310207, 3, 95),
(11, 312310208, 2, 75),
(12, 312310209, 1, 75);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`NIM`);

--
-- Indexes for table `mata_kuliah`
--
ALTER TABLE `mata_kuliah`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dosen_foreign` (`dosen_id`);

--
-- Indexes for table `nilai`
--
ALTER TABLE `nilai`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nim_foreign` (`NIM`),
  ADD KEY `mk_foreign` (`mk_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dosen`
--
ALTER TABLE `dosen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `mata_kuliah`
--
ALTER TABLE `mata_kuliah`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `nilai`
--
ALTER TABLE `nilai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `mata_kuliah`
--
ALTER TABLE `mata_kuliah`
  ADD CONSTRAINT `dosen_foreign` FOREIGN KEY (`dosen_id`) REFERENCES `dosen` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `nilai`
--
ALTER TABLE `nilai`
  ADD CONSTRAINT `mk_foreign` FOREIGN KEY (`mk_id`) REFERENCES `mata_kuliah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `nim_foreign` FOREIGN KEY (`NIM`) REFERENCES `mahasiswa` (`NIM`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

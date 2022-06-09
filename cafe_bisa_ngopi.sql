-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 09, 2022 at 04:56 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cafe_bisa_ngopi`
--

CREATE DATABASE IF NOT EXISTS `cafe_bisa_ngopi`;
USE `cafe_bisa_ngopi`;

-- --------------------------------------------------------

--
-- Table structure for table `log_aktivitas`
--

CREATE TABLE `log_aktivitas` (
  `id_log` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `tgl_wkt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `log_aktivitas`
--

INSERT INTO `log_aktivitas` (`id_log`, `id_user`, `tgl_wkt`, `status`) VALUES
(1, 2, '2022-03-24 14:28:21', 'Login'),
(3, 6, '2022-03-26 06:12:37', 'Login'),
(4, 6, '2022-04-01 07:02:08', 'Login'),
(5, 6, '2022-04-01 07:04:33', 'Login'),
(6, 6, '2022-04-03 07:36:36', 'Login'),
(7, 6, '2022-04-09 08:49:23', 'Login');

-- --------------------------------------------------------

--
-- Table structure for table `meja`
--

CREATE TABLE `meja` (
  `nomor_meja` int(11) NOT NULL,
  `kapasitas` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `meja`
--

INSERT INTO `meja` (`nomor_meja`, `kapasitas`) VALUES
(1, 4),
(2, 8),
(3, 12),
(4, 8),
(5, 12),
(6, 4);

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id_menu` int(11) NOT NULL,
  `nama_menu` varchar(35) NOT NULL,
  `harga_menu` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id_menu`, `nama_menu`, `harga_menu`) VALUES
(2, 'Kentang Goreng', 10000),
(3, 'Cilok', 10000),
(5, 'Nasi bakar', 20000),
(7, 'Cap Cay Basah', 17000),
(9, 'Sop Ayam', 9000);

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE `penjualan` (
  `id_penjualan` int(11) NOT NULL,
  `tgl_penjualan` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_user` int(11) NOT NULL,
  `total_harga` int(9) NOT NULL,
  `uang_pembeli` int(9) NOT NULL,
  `kembalian` int(11) NOT NULL,
  `nomor_meja` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `penjualan`
--

INSERT INTO `penjualan` (`id_penjualan`, `tgl_penjualan`, `id_user`, `total_harga`, `uang_pembeli`, `kembalian`, `nomor_meja`) VALUES
(29, '2022-03-05 13:07:24', 6, 60000, 70000, 10000, 0),
(31, '2022-03-05 13:07:34', 6, 74000, 80000, 6000, 0),
(33, '2022-02-27 01:07:05', 6, 37000, 40000, 0, 0),
(34, '2022-02-28 01:32:30', 8, 20000, 50000, 0, 0),
(35, '2022-02-28 01:33:43', 8, 30000, 40000, 0, 0),
(36, '2022-02-28 01:37:43', 8, 20000, 25000, 0, 0),
(37, '2022-03-06 07:35:21', 6, 10000, 20000, 10000, 0),
(38, '2022-03-22 13:29:07', 8, 70000, 10000, 3000, 1),
(39, '2022-03-22 13:29:52', 6, 10000, 20000, 10000, 4),
(40, '2022-03-22 17:42:49', 6, 20000, 50000, 30000, 4),
(41, '2022-03-22 17:45:36', 6, 17000, 20000, 3000, 1),
(42, '2022-03-22 17:50:30', 6, 90000, 100000, 10000, 1),
(43, '2022-04-01 07:05:23', 6, 114000, 120000, 6000, 4),
(44, '2022-04-03 07:36:59', 6, 54000, 60000, 6000, 5),
(45, '2022-04-21 05:14:17', 1, 70000, 80000, 10000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `penjualan_detail`
--

CREATE TABLE `penjualan_detail` (
  `id_detail` int(11) NOT NULL,
  `id_penjualan` int(11) NOT NULL,
  `nama_menu` varchar(35) NOT NULL,
  `jml_menu` int(9) NOT NULL,
  `total_menu` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `penjualan_detail`
--

INSERT INTO `penjualan_detail` (`id_detail`, `id_penjualan`, `nama_menu`, `jml_menu`, `total_menu`) VALUES
(21, 29, 'Kentang Goreng', 2, 20000),
(22, 29, 'Nasi bakar', 2, 40000),
(23, 29, 'Cilok', 6, 60000),
(25, 31, 'Nasi bakar', 2, 40000),
(26, 31, 'Cap Cay Basah', 2, 34000),
(27, 33, 'Cilok', 2, 20000),
(28, 33, 'Cap Cay Basah', 1, 17000),
(29, 34, 'Cilok', 1, 10000),
(30, 34, 'Kentang Goreng', 1, 10000),
(31, 35, 'Kentang Goreng', 1, 10000),
(32, 35, 'Cilok', 2, 20000),
(33, 36, 'Kentang Goreng', 1, 10000),
(34, 36, 'Cilok', 1, 10000),
(35, 37, 'Kentang Goreng', 1, 10000),
(36, 37, 'Cilok', 1, 10000),
(37, 37, 'Cilok', 1, 10000),
(38, 37, 'Kentang Goreng', 1, 10000),
(39, 39, 'Kentang Goreng', 1, 10000),
(40, 40, 'Kentang Goreng', 1, 10000),
(41, 40, 'Cilok', 1, 10000),
(42, 41, 'Cap Cay Basah', 1, 17000),
(43, 42, 'Cilok', 2, 20000),
(44, 42, 'Nasi bakar', 3, 60000),
(45, 42, 'Kentang Goreng', 1, 10000),
(46, 43, 'Nasi bakar', 4, 80000),
(47, 43, 'Cap Cay Basah', 2, 34000),
(48, 44, 'Cilok', 2, 20000),
(49, 44, 'Cap Cay Basah', 2, 34000);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nama_user` varchar(65) NOT NULL,
  `username` varchar(35) NOT NULL,
  `password` varchar(25) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `nama_user`, `username`, `password`, `role_id`) VALUES
(2, 'admin01', 'admin', 'admin', 0),
(3, 'Manajer01', 'manajer', 'manajer', 1),
(6, 'Kasir01', 'kasir', 'kasir', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `log_aktivitas`
--
ALTER TABLE `log_aktivitas`
  ADD PRIMARY KEY (`id_log`);

--
-- Indexes for table `meja`
--
ALTER TABLE `meja`
  ADD PRIMARY KEY (`nomor_meja`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id_menu`);

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`id_penjualan`);

--
-- Indexes for table `penjualan_detail`
--
ALTER TABLE `penjualan_detail`
  ADD PRIMARY KEY (`id_detail`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `log_aktivitas`
--
ALTER TABLE `log_aktivitas`
  MODIFY `id_log` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `id_penjualan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `penjualan_detail`
--
ALTER TABLE `penjualan_detail`
  MODIFY `id_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 16, 2020 at 03:05 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `restoran_eta`
--

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `username` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `no_telp` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `saldo` int(255) NOT NULL,
  `foto` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `menu_id` varchar(255) NOT NULL,
  `nama_menu` varchar(255) NOT NULL,
  `harga` int(255) NOT NULL,
  `rating` int(255) NOT NULL,
  `foto` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`menu_id`, `nama_menu`, `harga`, `rating`, `foto`) VALUES
('A001', 'Ayam Bakar', 21000, 9, 'upload_menu/ayambakar.jpg'),
('A002', 'Nasi Goreng', 21000, 8, 'upload_menu/nasi_goreng.jpg'),
('A003', 'Ikan Asin', 12000, 6, 'upload_menu/ikan asin.jpg'),
('A004', 'Es Teh Manis', 3500, 8, 'upload_menu/minum-es-teh-manis-sembarangan-undang-penyakit-kolera-m7yDDngXvr.jpg'),
('A005', 'Mie Goreng', 12000, 9, 'upload_menu/download (1).jpg');

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

CREATE TABLE `pegawai` (
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `no_telp` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `job` varchar(255) NOT NULL,
  `foto` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `kode_bayar` int(255) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `total_harga` int(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran_member`
--

CREATE TABLE `pembayaran_member` (
  `kd_bayar` int(255) NOT NULL,
  `kd_pemesanan` int(255) NOT NULL,
  `total_harga` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran_tamu`
--

CREATE TABLE `pembayaran_tamu` (
  `kd_bayar` int(255) NOT NULL,
  `kd_pemesanan` int(255) NOT NULL,
  `total_harga` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pemesanan_member`
--

CREATE TABLE `pemesanan_member` (
  `kd_pemesanan` int(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `menu_id` varchar(255) NOT NULL,
  `jumlah` int(255) NOT NULL,
  `sub_harga` int(255) NOT NULL,
  `no_meja` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pemesanan_tamu`
--

CREATE TABLE `pemesanan_tamu` (
  `kd_pemesanan` int(255) NOT NULL,
  `guest_id` int(255) NOT NULL,
  `menu_id` varchar(255) NOT NULL,
  `jumlah` int(255) NOT NULL,
  `sub_harga` int(255) NOT NULL,
  `no_meja` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tamu`
--

CREATE TABLE `tamu` (
  `guest_id` int(255) NOT NULL,
  `guest_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`menu_id`);

--
-- Indexes for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`kode_bayar`);

--
-- Indexes for table `pembayaran_member`
--
ALTER TABLE `pembayaran_member`
  ADD PRIMARY KEY (`kd_bayar`),
  ADD KEY `kd_pemesanan` (`kd_pemesanan`);

--
-- Indexes for table `pembayaran_tamu`
--
ALTER TABLE `pembayaran_tamu`
  ADD PRIMARY KEY (`kd_bayar`),
  ADD KEY `kd_pemesanan` (`kd_pemesanan`);

--
-- Indexes for table `pemesanan_member`
--
ALTER TABLE `pemesanan_member`
  ADD PRIMARY KEY (`kd_pemesanan`),
  ADD KEY `username` (`username`),
  ADD KEY `menu_id` (`menu_id`);

--
-- Indexes for table `pemesanan_tamu`
--
ALTER TABLE `pemesanan_tamu`
  ADD PRIMARY KEY (`kd_pemesanan`),
  ADD KEY `guest_id` (`guest_id`),
  ADD KEY `menu_id` (`menu_id`);

--
-- Indexes for table `tamu`
--
ALTER TABLE `tamu`
  ADD PRIMARY KEY (`guest_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `kode_bayar` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `pembayaran_member`
--
ALTER TABLE `pembayaran_member`
  MODIFY `kd_bayar` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pembayaran_tamu`
--
ALTER TABLE `pembayaran_tamu`
  MODIFY `kd_bayar` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pemesanan_member`
--
ALTER TABLE `pemesanan_member`
  MODIFY `kd_pemesanan` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT for table `pemesanan_tamu`
--
ALTER TABLE `pemesanan_tamu`
  MODIFY `kd_pemesanan` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tamu`
--
ALTER TABLE `tamu`
  MODIFY `guest_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pembayaran_member`
--
ALTER TABLE `pembayaran_member`
  ADD CONSTRAINT `pembayaran_member_ibfk_1` FOREIGN KEY (`kd_pemesanan`) REFERENCES `pemesanan_member` (`kd_pemesanan`);

--
-- Constraints for table `pembayaran_tamu`
--
ALTER TABLE `pembayaran_tamu`
  ADD CONSTRAINT `pembayaran_tamu_ibfk_1` FOREIGN KEY (`kd_pemesanan`) REFERENCES `pemesanan_tamu` (`kd_pemesanan`);

--
-- Constraints for table `pemesanan_member`
--
ALTER TABLE `pemesanan_member`
  ADD CONSTRAINT `pemesanan_member_ibfk_1` FOREIGN KEY (`username`) REFERENCES `member` (`username`),
  ADD CONSTRAINT `pemesanan_member_ibfk_2` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`menu_id`);

--
-- Constraints for table `pemesanan_tamu`
--
ALTER TABLE `pemesanan_tamu`
  ADD CONSTRAINT `pemesanan_tamu_ibfk_1` FOREIGN KEY (`guest_id`) REFERENCES `tamu` (`guest_id`),
  ADD CONSTRAINT `pemesanan_tamu_ibfk_2` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`menu_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

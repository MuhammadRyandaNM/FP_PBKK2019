-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 15, 2019 at 08:05 AM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 7.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rbtcassist`
--

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `isbn` char(13) NOT NULL,
  `judul` varchar(250) NOT NULL,
  `pengarang` varchar(150) NOT NULL,
  `tahun_terbit` varchar(4) NOT NULL,
  `edisi` varchar(2) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`isbn`, `judul`, `pengarang`, `tahun_terbit`, `edisi`, `status`) VALUES
('9780123694461', 'Foundations Of Multidimensional And Metric Data Structures (The Morgan Kaufmann Series In Computer Graphics) 1st Edition', 'Hanan Samet ', '2006', '1', 'Tersedia'),
('9780128014134', 'Cloud Data Centers And Cost Modelling : A Complete Guide To Planning, Designing And Building A Cloud Data Center', 'Wu, Caesar', '2015', '1', 'Tersedia'),
('9781785881985', 'LINUX SHELL SCRIPTING COOKBOOK', 'Flynt, Clif ; Lakshman, Sarath ; Tushar, Shantanu ', '2017', '3', 'Tersedia');

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `nrp` char(14) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(200) NOT NULL,
  `no_hp` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`nrp`, `nama`, `password`, `email`, `no_hp`) VALUES
('05111640000001', 'Safira Vanilia Putri', 'fira', 'fira@gmail.com', '081934888688'),
('05111640000025', 'Sari Wahyuningsih', 'sari', 'sari@sari.com', '081000111222'),
('05111640000031', 'Modista Garsia', '123', 'modis@modis.com', '081330515755'),
('05111640000067', 'Fina Fitri Yunita', 'fina', 'fina@fina.com', '081666777888');

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman`
--

CREATE TABLE `peminjaman` (
  `id_peminjaman` int(11) NOT NULL,
  `nrp` char(14) NOT NULL,
  `isbn` char(13) NOT NULL,
  `judul_buku` varchar(200) NOT NULL,
  `tgl_pinjam` varchar(50) NOT NULL,
  `tgl_kembali` varchar(50) NOT NULL,
  `denda` int(11) NOT NULL,
  `status_peminjaman` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `peminjaman`
--

INSERT INTO `peminjaman` (`id_peminjaman`, `nrp`, `isbn`, `judul_buku`, `tgl_pinjam`, `tgl_kembali`, `denda`, `status_peminjaman`) VALUES
(2, '05111640000031', '9780123694461', 'Foundations Of Multidimensional And Metric Data Structures (The Morgan Kaufmann Series In Computer Graphics) 1st Edition', '2019/05/15', '2019/05/22', 0, 'Selesai'),
(3, '05111640000031', '9780123694461', 'Foundations Of Multidimensional And Metric Data Structures (The Morgan Kaufmann Series In Computer Graphics) 1st Edition', '2019/05/15', '2019/05/22', 0, 'Selesai'),
(4, '05111640000031', '9780128014134', 'Cloud Data Centers And Cost Modelling : A Complete Guide To Planning, Designing And Building A Cloud Data Center', '2019/05/15', '2019/05/22', 0, 'Selesai'),
(5, '05111640000025', '9781785881985', 'LINUX SHELL SCRIPTING COOKBOOK', '2019/05/15', '2019/05/22', 0, 'Ditolak'),
(6, '05111640000031', '9780128014134', 'Cloud Data Centers And Cost Modelling : A Complete Guide To Planning, Designing And Building A Cloud Data Center', '2019/05/15', '2019/05/22', 0, 'Ditolak');

-- --------------------------------------------------------

--
-- Table structure for table `pustakawan`
--

CREATE TABLE `pustakawan` (
  `nip` varchar(20) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(200) NOT NULL,
  `no_hp` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pustakawan`
--

INSERT INTO `pustakawan` (`nip`, `nama`, `password`, `email`, `no_hp`) VALUES
('01', 'test', '123', 'haha', '01923'),
('197401252001122001', 'Eva Mursidah', 'ibueva', 'eva@if.its.ac.id', '081777888999');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`isbn`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`nrp`);

--
-- Indexes for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`id_peminjaman`),
  ADD KEY `nrp_fk` (`nrp`),
  ADD KEY `isbn` (`isbn`);

--
-- Indexes for table `pustakawan`
--
ALTER TABLE `pustakawan`
  ADD PRIMARY KEY (`nip`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `id_peminjaman` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD CONSTRAINT `nrp_fk` FOREIGN KEY (`nrp`) REFERENCES `mahasiswa` (`nrp`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `peminjaman_ibfk_1` FOREIGN KEY (`isbn`) REFERENCES `buku` (`isbn`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

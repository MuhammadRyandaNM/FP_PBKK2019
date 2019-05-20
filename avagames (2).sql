-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 20 Bulan Mei 2019 pada 05.08
-- Versi server: 10.1.30-MariaDB
-- Versi PHP: 7.2.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `avagames`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `ID_Admin` varchar(20) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(200) NOT NULL,
  `no_hp` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`ID_Admin`, `nama`, `password`, `email`, `no_hp`) VALUES
('01', 'test', '123', 'haha', '01923'),
('1', '1', '1', '1', '1'),
('197401252001122001', 'Eva Mursidah', 'ibueva', 'eva@if.its.ac.id', '081777888999');

-- --------------------------------------------------------

--
-- Struktur dari tabel `game`
--

CREATE TABLE `game` (
  `ID_Game` char(13) NOT NULL,
  `judul` varchar(250) NOT NULL,
  `developer` varchar(150) NOT NULL,
  `tahun_terbit` varchar(4) NOT NULL,
  `edisi` varchar(2) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `game`
--

INSERT INTO `game` (`ID_Game`, `judul`, `developer`, `tahun_terbit`, `edisi`, `status`) VALUES
('3', '2 Troll', 'Edi', '1990', '3', 'Dipinjam'),
('9780123694461', 'Dungeon and Dragon Boardgame', 'EA', '2006', '1', 'Dipinjam'),
('9780128014134', 'Anime shogi', 'Square enix', '2015', '1', 'Tersedia'),
('9781785881985', 'Real life minesweeper', 'Bandai', '2017', '3', 'Tersedia');

-- --------------------------------------------------------

--
-- Struktur dari tabel `peminjaman`
--

CREATE TABLE `peminjaman` (
  `id_peminjaman` int(11) NOT NULL,
  `ID_user` char(14) NOT NULL,
  `ID_Game` char(13) NOT NULL,
  `judul_game` varchar(200) NOT NULL,
  `tgl_pinjam` varchar(50) NOT NULL,
  `tgl_kembali` varchar(50) NOT NULL,
  `denda` int(11) NOT NULL,
  `status_peminjaman` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `peminjaman`
--

INSERT INTO `peminjaman` (`id_peminjaman`, `ID_user`, `ID_Game`, `judul_game`, `tgl_pinjam`, `tgl_kembali`, `denda`, `status_peminjaman`) VALUES
(2, '05111640000031', '9780123694461', 'Dungeon and Dragon Boardgame', '2019/05/15', '2019/05/22', 0, 'Selesai'),
(4, '05111640000031', '9780128014134', 'Anime Shogi', '2019/05/15', '2019/05/22', 0, 'Selesai'),
(11, '0131', '9780128014134', 'Anime shogi', '2019-05-19', '2019-05-26', 0, 'Selesai'),
(12, '1', '3', '2 Troll', '2019-05-20', '2019-05-27', 0, 'OK'),
(13, '1', '9780123694461', 'Dungeon and Dragon Boardgame', '2019-05-20', '2019-05-27', 0, 'OK');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `ID_user` char(14) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(200) NOT NULL,
  `no_hp` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`ID_user`, `nama`, `password`, `email`, `no_hp`) VALUES
('0131', 'akus', '123', 'aku@gmail.com', '08888881'),
('05111640000001', 'Safira Vanilia Putri', 'fira', 'fira@gmail.com', '081934888688'),
('05111640000025', 'Sari Wahyuningsih', 'sari', 'sari@sari.com', '081000111222'),
('05111640000031', 'Modista Garsia', '123', 'modis@modis.com', '081330515755'),
('05111640000067', 'Fina Fitri Yunita', 'fina', 'fina@fina.com', '081666777888'),
('1', 'A', '1', '1', '1'),
('31', 'a', '1', 'a@gmail.com', '087818411101');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`ID_Admin`);

--
-- Indeks untuk tabel `game`
--
ALTER TABLE `game`
  ADD PRIMARY KEY (`ID_Game`);

--
-- Indeks untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`id_peminjaman`),
  ADD KEY `nrp_fk` (`ID_user`),
  ADD KEY `isbn` (`ID_Game`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`ID_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `id_peminjaman` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD CONSTRAINT `nrp_fk` FOREIGN KEY (`ID_user`) REFERENCES `user` (`ID_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `peminjaman_ibfk_1` FOREIGN KEY (`ID_Game`) REFERENCES `game` (`ID_Game`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

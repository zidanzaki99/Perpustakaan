-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 06 Nov 2023 pada 03.47
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_perpus`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `buku`
--

CREATE TABLE `buku` (
  `ISBN` varchar(255) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `penulis` varchar(255) NOT NULL,
  `genre` varchar(255) NOT NULL,
  `status` enum('Tersedia','Dipinjam') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `buku`
--

INSERT INTO `buku` (`ISBN`, `judul`, `penulis`, `genre`, `status`) VALUES
('13412341233', 'Spiderman', 'Tomholand', 'Action', 'Dipinjam'),
('13412343', 'wonderwomen', 'tom holand', 'action', 'Tersedia'),
('134123451', 'PHP Dasar', 'WPU', 'TIK', 'Dipinjam'),
('23456789', 'Lan', 'Zida', 'TIK', 'Tersedia'),
('4731286478', 'Naruto', 'Mushikoto', 'Anime', 'Tersedia'),
('978-0062029170', 'To Kill a Mockingbird', 'Harper Lee', 'Mistic', 'Tersedia'),
('978-0316064333', 'Hary', 'J.K. Rowling', 'Action', 'Tersedia');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `id` int(11) NOT NULL,
  `ISBN` varchar(255) NOT NULL,
  `id_anggota` int(11) NOT NULL,
  `date_pinjam` date NOT NULL,
  `date_kembali` date NOT NULL,
  `date_actual` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`id`, `ISBN`, `id_anggota`, `date_pinjam`, `date_kembali`, `date_actual`) VALUES
(1, '978-0062029170', 2, '2023-11-01', '2023-11-05', '2023-11-06'),
(2, '13412343', 2, '2023-11-06', '2023-11-11', '2023-11-06'),
(3, '978-0316064333', 3, '2023-11-06', '2023-11-15', '2023-11-18'),
(4, '134123451', 3, '2023-11-06', '2023-11-10', NULL),
(5, '23456789', 3, '2023-11-06', '2023-11-11', '2023-11-06'),
(6, '4731286478', 3, '2023-11-08', '2023-11-15', '2023-11-14');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `role` enum('Admin','Anggota') NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `jk` enum('L','P') DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `no_tlpn` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `nama`, `role`, `username`, `password`, `jk`, `alamat`, `no_tlpn`) VALUES
(1, 'Zidan', 'Admin', 'zidan', 'zidan', NULL, NULL, NULL),
(2, 'Alfi', 'Anggota', 'alfi', 'alfi', NULL, 'Padang', '081345657778'),
(3, 'abas', 'Anggota', 'abas', 'abas', NULL, 'Puncak', '086756457676');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`ISBN`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ISBN` (`ISBN`),
  ADD KEY `id_anggota` (`id_anggota`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_anggota`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`ISBN`) REFERENCES `buku` (`ISBN`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

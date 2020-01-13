-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 13 Jan 2020 pada 02.08
-- Versi server: 10.1.32-MariaDB
-- Versi PHP: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_tokosepatu`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pelanggan`
--

CREATE TABLE `tb_pelanggan` (
  `id_pelanggan` int(5) NOT NULL,
  `nama_pelanggan` varchar(30) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `jenis_kelamin` varchar(10) NOT NULL,
  `alamat_pelanggan` varchar(20) NOT NULL,
  `nohp_pelanggan` varchar(20) NOT NULL,
  `id_user` int(5) NOT NULL,
  `no_rek_pelanggan` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_pelanggan`
--

INSERT INTO `tb_pelanggan` (`id_pelanggan`, `nama_pelanggan`, `tgl_lahir`, `jenis_kelamin`, `alamat_pelanggan`, `nohp_pelanggan`, `id_user`, `no_rek_pelanggan`) VALUES
(1, 'Vera', '2018-08-15', 'perempuan', 'Jombang', '0123456789', 9, '123'),
(3, 'Indah', '2019-09-09', 'Perempuan', 'Sidoarjo', '7654321', 5, '5577'),
(5, 'Bayu', '2019-08-04', 'Laki', 'Surabaya', '111222', 7, '223');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pembayaran`
--

CREATE TABLE `tb_pembayaran` (
  `id_bayar` int(5) NOT NULL,
  `id_pesan` int(5) NOT NULL,
  `id_penjual` int(5) NOT NULL,
  `no_rek_penjual` varchar(10) NOT NULL,
  `no_rek_pelanggan` varchar(10) NOT NULL,
  `bukti_transfer` varchar(20) NOT NULL,
  `total_bayar` varchar(10) NOT NULL,
  `nohp_pelanggan` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_pembayaran`
--

INSERT INTO `tb_pembayaran` (`id_bayar`, `id_pesan`, `id_penjual`, `no_rek_penjual`, `no_rek_pelanggan`, `bukti_transfer`, `total_bayar`, `nohp_pelanggan`) VALUES
(3, 15, 8, '3456', '223', 'terkirim', '500000', '123456'),
(5, 17, 3, '2233', '5577', 'sudah', '200000', '7654321'),
(71, 789, 2, '321', '1234657', 'sudah', '350000', '086353682');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pemesanan`
--

CREATE TABLE `tb_pemesanan` (
  `id_pesan` int(5) NOT NULL,
  `tgl_pesan` datetime(6) NOT NULL,
  `id_pelanggan` int(5) NOT NULL,
  `id_sepatu` int(5) NOT NULL,
  `jumlah` varchar(10) NOT NULL,
  `sub_total` int(10) NOT NULL,
  `alamat_pelanggan` varchar(20) NOT NULL,
  `nohp_pelanggan` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_pemesanan`
--

INSERT INTO `tb_pemesanan` (`id_pesan`, `tgl_pesan`, `id_pelanggan`, `id_sepatu`, `jumlah`, `sub_total`, `alamat_pelanggan`, `nohp_pelanggan`) VALUES
(15, '2020-01-01 00:00:00.000000', 5, 23, '2', 500000, 'Blitar', '123456'),
(17, '2020-01-23 00:00:00.000000', 3, 27, '1', 200000, 'Sidoarjo', '7654321'),
(789, '2020-01-09 00:00:00.000000', 1, 11, '1', 350000, 'Malang', '646725187');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_penjual`
--

CREATE TABLE `tb_penjual` (
  `id_penjual` int(5) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `jenis_kelamin` varchar(10) NOT NULL,
  `nohp_penjual` varchar(20) NOT NULL,
  `alamat` varchar(20) NOT NULL,
  `no_rek_penjual` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_penjual`
--

INSERT INTO `tb_penjual` (`id_penjual`, `nama`, `jenis_kelamin`, `nohp_penjual`, `alamat`, `no_rek_penjual`) VALUES
(2, 'Septian', 'Perempuan', '1234567890', 'Kediri', '321'),
(3, 'Sonya', 'Perempuan', '5678', 'Kediri', '2233'),
(8, 'Ibnu', 'Laki laki', '08566778899', 'Semarang', '3456');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_registrasi`
--

CREATE TABLE `tb_registrasi` (
  `id_user` int(5) NOT NULL,
  `username` varchar(30) NOT NULL,
  `pass` varchar(8) NOT NULL,
  `email` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_registrasi`
--

INSERT INTO `tb_registrasi` (`id_user`, `username`, `pass`, `email`) VALUES
(5, 'saya user', '1234', 'sayauser@gmail.com'),
(7, 'Indira', 'indira', 'indira@gmail.com'),
(9, 'wiwiksriwilujeng', '123', 'wiwik31@gmail.com');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_sepatu`
--

CREATE TABLE `tb_sepatu` (
  `id_sepatu` int(5) NOT NULL,
  `merk` varchar(20) NOT NULL,
  `jenis_sepatu` varchar(20) NOT NULL,
  `ukuran` varchar(10) NOT NULL,
  `warna` varchar(20) NOT NULL,
  `stok` varchar(10) NOT NULL,
  `harga` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_sepatu`
--

INSERT INTO `tb_sepatu` (`id_sepatu`, `merk`, `jenis_sepatu`, `ukuran`, `warna`, `stok`, `harga`) VALUES
(1, 'Nike', 'Sport', '43', 'Biru', '6', '500000'),
(2, 'Vans', 'Old School', '39', 'Hitam Putih', '3', '300000'),
(11, 'Adidas', 'Sport', '39', 'Hitam', '1', '350000'),
(23, 'Fladeo', 'High heels', '37', 'Cream', '4', '250000'),
(27, 'Pro ATT', 'Sekolah', '39', 'Hitam', '9', '200000');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_pelanggan`
--
ALTER TABLE `tb_pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`),
  ADD UNIQUE KEY `id_user` (`id_user`);

--
-- Indeks untuk tabel `tb_pembayaran`
--
ALTER TABLE `tb_pembayaran`
  ADD PRIMARY KEY (`id_bayar`),
  ADD UNIQUE KEY `id_pesan` (`id_pesan`),
  ADD UNIQUE KEY `id_penjual` (`id_penjual`);

--
-- Indeks untuk tabel `tb_pemesanan`
--
ALTER TABLE `tb_pemesanan`
  ADD PRIMARY KEY (`id_pesan`),
  ADD UNIQUE KEY `id_pelanggan` (`id_pelanggan`),
  ADD UNIQUE KEY `id_sepatu` (`id_sepatu`);

--
-- Indeks untuk tabel `tb_penjual`
--
ALTER TABLE `tb_penjual`
  ADD PRIMARY KEY (`id_penjual`);

--
-- Indeks untuk tabel `tb_registrasi`
--
ALTER TABLE `tb_registrasi`
  ADD PRIMARY KEY (`id_user`);

--
-- Indeks untuk tabel `tb_sepatu`
--
ALTER TABLE `tb_sepatu`
  ADD PRIMARY KEY (`id_sepatu`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tb_pelanggan`
--
ALTER TABLE `tb_pelanggan`
  ADD CONSTRAINT `tb_pelanggan_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `tb_registrasi` (`id_user`);

--
-- Ketidakleluasaan untuk tabel `tb_pembayaran`
--
ALTER TABLE `tb_pembayaran`
  ADD CONSTRAINT `tb_pembayaran_ibfk_1` FOREIGN KEY (`id_pesan`) REFERENCES `tb_pemesanan` (`id_pesan`),
  ADD CONSTRAINT `tb_pembayaran_ibfk_2` FOREIGN KEY (`id_penjual`) REFERENCES `tb_penjual` (`id_penjual`);

--
-- Ketidakleluasaan untuk tabel `tb_pemesanan`
--
ALTER TABLE `tb_pemesanan`
  ADD CONSTRAINT `tb_pemesanan_ibfk_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `tb_pelanggan` (`id_pelanggan`),
  ADD CONSTRAINT `tb_pemesanan_ibfk_2` FOREIGN KEY (`id_sepatu`) REFERENCES `tb_sepatu` (`id_sepatu`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

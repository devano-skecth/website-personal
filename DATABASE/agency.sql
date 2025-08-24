-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 31 Jan 2025 pada 15.16
-- Versi server: 10.1.38-MariaDB
-- Versi PHP: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `agency`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`) VALUES
(1, 'admin', '$2y$10$AIy0X1Ep6alaHDTofiChGeqq7k/d1Kc8vKQf1JZo0mKrzkkj6M626');

-- --------------------------------------------------------

--
-- Struktur dari tabel `bom_produk`
--

CREATE TABLE `bom_produk` (
  `kode_bom` varchar(100) NOT NULL,
  `kode_bk` varchar(100) NOT NULL,
  `kode_produk` varchar(100) NOT NULL,
  `nama_produk` varchar(200) NOT NULL,
  `kebutuhan` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `bom_produk`
--

INSERT INTO `bom_produk` (`kode_bom`, `kode_bk`, `kode_produk`, `nama_produk`, `kebutuhan`) VALUES
('B0001', 'M0002', 'P0001', 'Roti Sobek', '2'),
('B0001', 'M0001', 'P0001', 'Roti Sobek', '4'),
('B0001', 'M0004', 'P0001', 'Roti Sobek', '3'),
('B0002', 'M0001', 'P0002', 'Maryam', '4'),
('B0002', 'M0004', 'P0002', 'Maryam', '3'),
('B0002', 'M0003', 'P0002', 'Maryam', '2'),
('B0003', 'M0002', 'P0003', 'Kue tart coklat', '2'),
('B0003', 'M0003', 'P0003', 'Kue tart coklat', '5'),
('B0003', 'M0005', 'P0003', 'Kue tart coklat', '5'),
('B0004', 'M0006', 'P0004', 'bakso ikan', '13'),
('B0005', 'M0006', 'P0005', 'bakso ikan', '5'),
('B0006', 'M0006', 'P0006', 'bakso ikan', '10'),
('B0007', 'M0007', 'P0007', 'Bakso ayam', '50');

-- --------------------------------------------------------

--
-- Struktur dari tabel `customer`
--

CREATE TABLE `customer` (
  `kode_customer` varchar(100) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `telp` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `customer`
--

INSERT INTO `customer` (`kode_customer`, `nama`, `email`, `username`, `password`, `telp`) VALUES
('C0002', 'Rafi Akbar', 'a.rafy@gmail.com', 'rafi', '$2y$10$/UjGYbisTPJhr8MgmT37qOXo1o/HJn3dhafPoSYbOlSN1E7olHIb.', '0856748564'),
('C0003', 'Nagita Silvana', 'bambang@gmail.com', 'Nagita', '$2y$10$47./qEeA/y3rNx3UkoKmkuxoAtmz4ebHSR0t0Bc.cFEEg7cK34M3C', '087804616097'),
('C0004', 'Nadiya', 'nadiya@gmail.com', 'nadiya', '$2y$10$6wHH.7rF1q3JtzKgAhNFy.4URchgJC8R.POT1osTAWmasDXTTO7ZG', '0898765432');

-- --------------------------------------------------------

--
-- Struktur dari tabel `inventory`
--

CREATE TABLE `inventory` (
  `kode_bk` varchar(100) NOT NULL,
  `nama` varchar(200) NOT NULL,
  `qty` varchar(200) NOT NULL,
  `satuan` varchar(200) NOT NULL,
  `harga` int(11) NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `inventory`
--

INSERT INTO `inventory` (`kode_bk`, `nama`, `qty`, `satuan`, `harga`, `tanggal`) VALUES
('M0001', 'Tepung', '76', 'Kg', 1000, '2020-07-26'),
('M0002', 'Pengembang', '0', 'Kg', 1000, '2020-07-27'),
('M0003', 'Cream', '17', 'Kg', 3000, '2020-07-26'),
('M0004', 'Keju', '82', 'Kg', 4000, '2020-07-26'),
('M0005', 'Coklat', '0', 'Kg', 5000, '2020-07-27'),
('M0006', 'bakso ikan', '49', 'pcs', 8000, '2025-01-31'),
('M0007', 'Bakso ayam', '47', 'pcs', 8000, '2025-01-31');

-- --------------------------------------------------------

--
-- Struktur dari tabel `keranjang`
--

CREATE TABLE `keranjang` (
  `id_keranjang` int(11) NOT NULL,
  `kode_customer` varchar(100) NOT NULL,
  `kode_produk` varchar(100) NOT NULL,
  `nama_produk` varchar(100) NOT NULL,
  `qty` int(11) NOT NULL,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `keranjang`
--

INSERT INTO `keranjang` (`id_keranjang`, `kode_customer`, `kode_produk`, `nama_produk`, `qty`, `harga`) VALUES
(16, 'C0003', 'P0002', 'Maryam', 5, 15000),
(17, 'C0003', 'P0003', 'Kue tart coklat', 2, 100000),
(0, 'C0005', 'P0007', 'Bakso ayam', 1, 8000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pesanan`
--

CREATE TABLE `pesanan` (
  `id_order` int(11) NOT NULL,
  `invoice` varchar(200) NOT NULL,
  `kode_customer` varchar(200) NOT NULL,
  `kode_produk` varchar(200) NOT NULL,
  `nama_produk` varchar(200) NOT NULL,
  `qty` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `nama_bank` varchar(30) NOT NULL,
  `status` varchar(200) NOT NULL,
  `tanggal` date NOT NULL,
  `provinsi` varchar(200) NOT NULL,
  `kota` varchar(200) NOT NULL,
  `alamat` varchar(200) NOT NULL,
  `kode_pos` varchar(200) NOT NULL,
  `terima` varchar(200) NOT NULL,
  `tolak` varchar(200) NOT NULL,
  `cek` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pesanan`
--

INSERT INTO `pesanan` (`id_order`, `invoice`, `kode_customer`, `kode_produk`, `nama_produk`, `qty`, `harga`, `nama_bank`, `status`, `tanggal`, `provinsi`, `kota`, `alamat`, `kode_pos`, `terima`, `tolak`, `cek`) VALUES
(0, 'INV0001', 'C0005', 'P0006', 'bakso ikan', 1, 8000, 'Mandiri', '0', '2025-01-31', 'Indonesia', 'Jambi tanjung jabung barat tebing tinggi', 'KPR BLOK B IV NO. 16', '36556', '1', '0', 0),
(0, 'INV0002', 'C0005', 'P0007', 'Bakso ayam', 1, 8000, 'Mandiri', '0', '2025-01-31', 'Indonesia', 'Jambi tanjung jabung barat tebing tinggi', 'KPR BLOK B IV NO. 16', '36556', '1', '0', 0),
(0, 'INV0003', 'C0005', 'P0007', 'Bakso ayam', 3, 8000, 'Mandiri', '0', '2025-01-31', 'Indonesia', 'Jambi tanjung jabung barat tebing tinggi', 'KPR BLOK B IV NO. 16', '36556', '1', '0', 0),
(0, 'INV0004', 'C0005', 'P0007', 'Bakso ayam', 3, 8000, 'Mandiri', '0', '2025-01-31', 'Indonesia', 'Jambi tanjung jabung barat tebing tinggi', 'KPR BLOK B IV NO. 16', '36556', '1', '0', 0),
(0, 'INV0005', 'C0005', 'P0007', 'Bakso ayam', 5, 8000, 'Nagari', '0', '2025-01-31', 'Indonesia', 'Jambi tanjung jabung barat tebing tinggi', 'KPR BLOK B IV NO. 16', '36556', '1', '0', 0),
(0, 'INV0006', 'C0005', 'P0007', 'Bakso ayam', 10, 8000, 'Mandiri', '0', '2025-01-31', 'Indonesia', 'Jambi tanjung jabung barat tebing tinggi', 'KPR BLOK B IV NO. 16', '36556', '1', '0', 0),
(0, 'INV0007', 'C0005', 'P0007', 'Bakso ayam', 10, 8000, 'Nagari', '0', '2025-01-31', 'Indonesia', 'Jambi tanjung jabung barat tebing tinggi', 'KPR BLOK B IV NO. 16', '36556', '1', '0', 0),
(0, 'INV0008', 'C0005', 'P0007', 'Bakso ayam', 3, 8000, 'Mandiri', '0', '2025-01-31', 'Indonesia', 'Jambi tanjung jabung barat tebing tinggi', 'KPR BLOK B IV NO. 16', '36556', '1', '0', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `kode_produk` varchar(100) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `image` text NOT NULL,
  `deskripsi` text NOT NULL,
  `harga` int(11) NOT NULL,
  `kebutuhan` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`kode_produk`, `nama`, `image`, `deskripsi`, `harga`, `kebutuhan`) VALUES
('P0001', 'Roti Sobek', '5f1d915d27dc3.jpg', '																								Roti Enak Sobek Sobek aww\r\n																					', 10000, ''),
('P0002', 'Maryam', '5f1d9154715a4.jpg', '				Roti araym\r\n						', 15000, ''),
('P0003', 'Kue tart coklat', '5f1d924614831.jpg', 'Kuetar dengan varian rasa coklat enak dan lumer rasanya\r\n			', 100000, ''),
('P0004', 'bakso ikan', '679ccea9a0219.jpg', 'dfdrgd', 8000, ''),
('P0005', 'bakso ikan', '679ccff39d5d7.jpg', '\r\n			vggg', 8000, ''),
('P0006', 'bakso ikan', '679cd0c21e91d.jpg', '\r\n			sws', 8000, '10'),
('P0007', 'Bakso ayam', '679cd1f0f4226.jpg', '\r\n			sdsds', 8000, '50');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

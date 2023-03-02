-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 01, 2023 at 10:33 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_transaksi`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `idcart` int(11) NOT NULL,
  `invoice` varchar(100) NOT NULL,
  `kode_produk` varchar(100) NOT NULL,
  `nama_produk` varchar(100) NOT NULL,
  `harga` int(11) NOT NULL,
  `harga_modal` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `subtotal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `inv`
--

CREATE TABLE `inv` (
  `invid` int(11) NOT NULL,
  `invoice` varchar(100) NOT NULL,
  `tgl_inv` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `pembayaran` int(11) NOT NULL,
  `kembalian` int(11) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `inv`
--

INSERT INTO `inv` (`invid`, `invoice`, `tgl_inv`, `pembayaran`, `kembalian`, `status`) VALUES
(0, 'AD28223193601', '2023-02-28 12:36:49', 30000, 0, 'selesai'),
(0, 'AD1323163194', '2023-03-01 09:31:19', 90000, 0, 'selesai');

-- --------------------------------------------------------

--
-- Table structure for table `laporan`
--

CREATE TABLE `laporan` (
  `idlaporan` int(11) NOT NULL,
  `invoice` varchar(100) NOT NULL,
  `kode_produk` varchar(100) NOT NULL,
  `nama_produk` varchar(100) NOT NULL,
  `gambar_produk` varchar(100) NOT NULL,
  `harga` int(11) NOT NULL,
  `harga_modal` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `subtotal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `laporan`
--

INSERT INTO `laporan` (`idlaporan`, `invoice`, `kode_produk`, `nama_produk`, `gambar_produk`, `harga`, `harga_modal`, `qty`, `subtotal`) VALUES
(0, 'AD28223193601', 'produk01', 'nasi goreng', '', 15000, 3000, 2, 30000),
(0, 'AD1323163194', 'produk13', 'Kopi kenangan', '', 15000, 2000, 6, 90000);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `userid` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `toko` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `telepon` varchar(15) NOT NULL,
  `logo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`userid`, `username`, `password`, `toko`, `alamat`, `telepon`, `logo`) VALUES
(1, 'eben', '$2y$10$iCsRopXtlyYc5Qvk.bQF8eCCUXAhwExf7Nma4T4TPJg47SAR6/usu', 'Aplikasi transaksi sederhana', 'cibitung', '089635808393', 'restaurant.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `idproduk` int(11) NOT NULL,
  `kode_produk` varchar(100) NOT NULL,
  `nama_produk` varchar(255) NOT NULL,
  `gambar_produk` varchar(255) NOT NULL,
  `harga_modal` int(11) NOT NULL,
  `harga_jual` int(11) NOT NULL,
  `tgl_input` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`idproduk`, `kode_produk`, `nama_produk`, `gambar_produk`, `harga_modal`, `harga_jual`, `tgl_input`) VALUES
(1, 'produk01', 'nasi goreng', 'nasigoreng.jpeg', 3000, 15000, '2023-02-19 09:10:54'),
(2, 'produk02', 'ayam goreng', 'ayamgoreng.jpg', 5000, 20000, '2023-02-19 09:20:03'),
(3, 'produk03', 'sate', 'sate.jpeg', 5000, 16000, '2023-02-19 09:20:52'),
(4, 'produk04', 'ayam geprek', 'ayamgeprek.jpeg', 4000, 12000, '2023-02-19 09:22:08'),
(5, 'produk05', 'spageti', 'spageti.jpg', 3000, 15000, '2023-02-19 09:23:31'),
(6, 'produk06', 'jus alpukat', 'jusalpukat.jpg', 2000, 10000, '2023-02-19 11:09:15'),
(7, 'produk07', 'jus strawberry', 'justrawberry.jpg', 2000, 10000, '2023-02-19 05:09:15'),
(8, 'produk08', 'ayam gulai', 'ayamgulai.jpg', 6000, 23000, '2023-02-19 06:11:15'),
(9, 'produk09', 'capucino', 'capucino.jpg', 500, 8000, '2023-02-19 07:19:15'),
(10, 'produk10', 'rendang', 'rendang.jpg', 8000, 30000, '2023-02-19 08:19:25'),
(11, 'produk11', 'jus mangga', 'jusmangga.jpg', 2000, 10000, '2023-02-19 09:29:15'),
(12, 'produk12', 'soto', 'soto.jpg', 4000, 15000, '2023-02-19 10:29:30'),
(69, 'produk13', 'Kopi kenangan', '-kopken.jpg', 2000, 15000, '2023-03-01 09:30:41');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`idproduk`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `idproduk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 21, 2024 at 05:14 AM
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
-- Database: `aplikasi_siaa`
--

-- --------------------------------------------------------

--
-- Table structure for table `tabel_akun`
--

CREATE TABLE `tabel_akun` (
  `akun_id` int(50) NOT NULL,
  `nama_akun` varchar(100) NOT NULL,
  `jenis_akun` varchar(50) NOT NULL,
  `tipe_saldo` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tabel_akun`
--

INSERT INTO `tabel_akun` (`akun_id`, `nama_akun`, `jenis_akun`, `tipe_saldo`) VALUES
(1, 'pelanggan', 'karyawan', 'debit'),
(4, 'abrar', 'admin', 'debit');

-- --------------------------------------------------------

--
-- Table structure for table `tabel_barang`
--

CREATE TABLE `tabel_barang` (
  `barang_id` int(50) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `harga_beli` int(100) NOT NULL,
  `harga_jual` int(100) NOT NULL,
  `stok` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tabel_barang`
--

INSERT INTO `tabel_barang` (`barang_id`, `nama_barang`, `harga_beli`, `harga_jual`, `stok`) VALUES
(2, 'Reebok', 2000000, 3000000, 50),
(3, 'Nike', 1000000, 2000000, 60),
(4, 'Adidas', 500000, 1000000, 40);

-- --------------------------------------------------------

--
-- Table structure for table `tabel_jurnalumum`
--

CREATE TABLE `tabel_jurnalumum` (
  `jurnal_id` int(100) NOT NULL,
  `akun_id` int(100) NOT NULL,
  `pembayaran_id` int(100) DEFAULT NULL,
  `pembelian_id` int(100) DEFAULT NULL,
  `penjualan_id` int(100) DEFAULT NULL,
  `tanggal_jurnal` date NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  `debit_total` int(100) NOT NULL,
  `kredit_total` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tabel_jurnalumum`
--

INSERT INTO `tabel_jurnalumum` (`jurnal_id`, `akun_id`, `pembayaran_id`, `pembelian_id`, `penjualan_id`, `tanggal_jurnal`, `keterangan`, `debit_total`, `kredit_total`) VALUES
(1, 3, NULL, 2, NULL, '2024-06-10', '242', 0, 45345),
(4, 4, NULL, 5, NULL, '2024-06-21', '', 0, 1500000);

-- --------------------------------------------------------

--
-- Table structure for table `tabel_pelanggan`
--

CREATE TABLE `tabel_pelanggan` (
  `pelanggan_id` int(50) NOT NULL,
  `nama_pelanggan` varchar(100) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `telepon` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tabel_pelanggan`
--

INSERT INTO `tabel_pelanggan` (`pelanggan_id`, `nama_pelanggan`, `alamat`, `telepon`, `email`) VALUES
(2, 'Erick Syahputra', 'kuala', '085830187112', 'ericksyahputra@gmail.com'),
(3, 'M Abrar Abdillah', 'stabat', '082275101910', 'abrar@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `tabel_pembayaran`
--

CREATE TABLE `tabel_pembayaran` (
  `pembayaran_id` int(100) NOT NULL,
  `invoice_pembayaran` char(10) NOT NULL,
  `total_pembayaran` int(100) NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  `tanggal_pembayaran` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tabel_pembelian`
--

CREATE TABLE `tabel_pembelian` (
  `pembelian_id` int(50) NOT NULL,
  `tanggal_pembelian` date NOT NULL,
  `invoice_pembelian` varchar(50) NOT NULL,
  `supplier_id` int(50) NOT NULL,
  `total_pembelian` int(100) NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  `jumlah_pembelian` int(100) NOT NULL,
  `harga_pembelian` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tabel_pengguna`
--

CREATE TABLE `tabel_pengguna` (
  `user_id` int(3) NOT NULL,
  `username` varchar(10) NOT NULL,
  `password` varchar(100) NOT NULL,
  `nama_lengkap` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `jabatan` varchar(30) NOT NULL,
  `hak_akses` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tabel_pengguna`
--

INSERT INTO `tabel_pengguna` (`user_id`, `username`, `password`, `nama_lengkap`, `email`, `jabatan`, `hak_akses`) VALUES
(2, 'Keyalyaa', '$2y$10$8C1385gG4AJPTNqqbbN1eu2zbXf13ZDzgF6OKR8SBeDuZIT30JoOC', 'Kesya', 'keyalyaa298@gmail.com', 'administrator', 'admin'),
(3, 'admin', '$2y$10$o9qtawOMoMZGrl4dOaLF4euNCSgyrKSmBfdYbhJEe0arJCYKb0fKi', 'administrator', 'admin@gmail.com', 'admin', 'admin'),
(5, 'admin', '$2y$10$5s0umKgPex7xlxiyvPBAmOTCICl0s7gT/08tHGAfXaxjhd9wbAaL6', 'Administrator web', 'admin@gmail.com', 'Administator', 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `tabel_penjualan`
--

CREATE TABLE `tabel_penjualan` (
  `penjualan_id` int(50) NOT NULL,
  `tanggal_penjualan` date NOT NULL,
  `invoice_penjualan` varchar(50) NOT NULL,
  `pelanggan_id` int(50) NOT NULL,
  `total_penjualan` int(100) NOT NULL,
  `harga_penjualan` int(11) NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  `id_barang` int(50) NOT NULL,
  `jumlah_penjualan` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tabel_penjualan`
--

INSERT INTO `tabel_penjualan` (`penjualan_id`, `tanggal_penjualan`, `invoice_penjualan`, `pelanggan_id`, `total_penjualan`, `harga_penjualan`, `keterangan`, `id_barang`, `jumlah_penjualan`) VALUES
(2, '2024-06-21', '232', 1, 5336, 232, '232', 1, 23),
(3, '2024-06-21', '4564', 1, 20830096, 4564, '4564', 1, 4564),
(6, '2024-06-21', 'BL001', 2, 1200000, 600000, '', 4, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tabel_suplier`
--

CREATE TABLE `tabel_suplier` (
  `suplier_id` int(50) NOT NULL,
  `nama_suplier` varchar(100) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `telp` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tabel_suplier`
--

INSERT INTO `tabel_suplier` (`suplier_id`, `nama_suplier`, `alamat`, `telp`, `email`) VALUES
(6, 'PT Reebok', 'Medan', '081234567890', 'ptrebook@gmail.com'),
(7, 'PT Nike', 'Medan', '0813427392619', 'ptNike@gmail.com'),
(8, 'PT Adidas', 'Binjai', '082276892625', 'ptadidas@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `tabel_transaksi`
--

CREATE TABLE `tabel_transaksi` (
  `transaksi_id` int(50) NOT NULL,
  `tanggal_transaksi` date NOT NULL,
  `akun_id` int(50) NOT NULL,
  `jenis_transaksi` varchar(50) NOT NULL,
  `jumlah_total` int(50) NOT NULL,
  `keterangan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tabel_akun`
--
ALTER TABLE `tabel_akun`
  ADD PRIMARY KEY (`akun_id`);

--
-- Indexes for table `tabel_barang`
--
ALTER TABLE `tabel_barang`
  ADD PRIMARY KEY (`barang_id`);

--
-- Indexes for table `tabel_jurnalumum`
--
ALTER TABLE `tabel_jurnalumum`
  ADD PRIMARY KEY (`jurnal_id`),
  ADD KEY `transaksi_id` (`akun_id`),
  ADD KEY `pembayaran_id` (`pembayaran_id`),
  ADD KEY `pembelian_id` (`pembelian_id`),
  ADD KEY `penjualan_id` (`penjualan_id`);

--
-- Indexes for table `tabel_pelanggan`
--
ALTER TABLE `tabel_pelanggan`
  ADD PRIMARY KEY (`pelanggan_id`);

--
-- Indexes for table `tabel_pembayaran`
--
ALTER TABLE `tabel_pembayaran`
  ADD PRIMARY KEY (`pembayaran_id`);

--
-- Indexes for table `tabel_pembelian`
--
ALTER TABLE `tabel_pembelian`
  ADD PRIMARY KEY (`pembelian_id`),
  ADD KEY `supplier_id` (`supplier_id`);

--
-- Indexes for table `tabel_pengguna`
--
ALTER TABLE `tabel_pengguna`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `tabel_penjualan`
--
ALTER TABLE `tabel_penjualan`
  ADD PRIMARY KEY (`penjualan_id`),
  ADD KEY `akun_id` (`invoice_penjualan`),
  ADD KEY `pelanggan_id` (`pelanggan_id`),
  ADD KEY `invoice_penjualan` (`invoice_penjualan`);

--
-- Indexes for table `tabel_suplier`
--
ALTER TABLE `tabel_suplier`
  ADD PRIMARY KEY (`suplier_id`);

--
-- Indexes for table `tabel_transaksi`
--
ALTER TABLE `tabel_transaksi`
  ADD PRIMARY KEY (`transaksi_id`),
  ADD KEY `akun_id` (`akun_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tabel_akun`
--
ALTER TABLE `tabel_akun`
  MODIFY `akun_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tabel_barang`
--
ALTER TABLE `tabel_barang`
  MODIFY `barang_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tabel_jurnalumum`
--
ALTER TABLE `tabel_jurnalumum`
  MODIFY `jurnal_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tabel_pelanggan`
--
ALTER TABLE `tabel_pelanggan`
  MODIFY `pelanggan_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tabel_pembayaran`
--
ALTER TABLE `tabel_pembayaran`
  MODIFY `pembayaran_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tabel_pembelian`
--
ALTER TABLE `tabel_pembelian`
  MODIFY `pembelian_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tabel_pengguna`
--
ALTER TABLE `tabel_pengguna`
  MODIFY `user_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tabel_penjualan`
--
ALTER TABLE `tabel_penjualan`
  MODIFY `penjualan_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tabel_suplier`
--
ALTER TABLE `tabel_suplier`
  MODIFY `suplier_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tabel_transaksi`
--
ALTER TABLE `tabel_transaksi`
  MODIFY `transaksi_id` int(50) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

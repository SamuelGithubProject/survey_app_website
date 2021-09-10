-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 10, 2021 at 09:29 PM
-- Server version: 10.3.31-MariaDB-cll-lve
-- PHP Version: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `adry2296_kuisioner`
--

-- --------------------------------------------------------

--
-- Table structure for table `table_admin`
--

CREATE TABLE `table_admin` (
  `id_admin` int(11) NOT NULL,
  `nama_pengguna` varchar(64) NOT NULL,
  `katasandi_pengguna` varchar(64) NOT NULL,
  `identitas_pengguna` char(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `table_admin`
--

INSERT INTO `table_admin` (`id_admin`, `nama_pengguna`, `katasandi_pengguna`, `identitas_pengguna`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `table_biodata`
--

CREATE TABLE `table_biodata` (
  `id_biodata` int(11) NOT NULL,
  `nomor_kartukeluarga` varchar(64) NOT NULL,
  `nomor_ktp` varchar(64) NOT NULL,
  `nama_lengkap` char(200) NOT NULL,
  `jenis_kelamin` char(200) NOT NULL,
  `tempat_lahir` char(200) NOT NULL,
  `tanggal_lahir` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `table_biodata`
--

INSERT INTO `table_biodata` (`id_biodata`, `nomor_kartukeluarga`, `nomor_ktp`, `nama_lengkap`, `jenis_kelamin`, `tempat_lahir`, `tanggal_lahir`) VALUES
(1, '1271072011060017', '1271071909980005', 'SAMUEL ADRIEL ROMAITO MANURUNG', 'Laki - Laki', 'MEDAN', '1998-09-19');

-- --------------------------------------------------------

--
-- Table structure for table `table_dataindividu`
--

CREATE TABLE `table_dataindividu` (
  `nomor_ktp` varchar(64) NOT NULL,
  `agama` char(200) NOT NULL,
  `pendidikan` char(200) NOT NULL,
  `jenis_pekerjaan` char(200) NOT NULL,
  `status_perkawinan` char(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `table_dataindividu`
--

INSERT INTO `table_dataindividu` (`nomor_ktp`, `agama`, `pendidikan`, `jenis_pekerjaan`, `status_perkawinan`) VALUES
('1271071909980005', 'Protestan', 'D3', 'Mahasiswa', 'BELUM KAWIN');

-- --------------------------------------------------------

--
-- Table structure for table `table_kuisioner`
--

CREATE TABLE `table_kuisioner` (
  `id_result` int(11) NOT NULL,
  `tanggal_waktu_pengisian` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `nomor_kk` varchar(64) NOT NULL,
  `nomor_ktp` varchar(64) NOT NULL,
  `result` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`result`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `table_kuisioner`
--

INSERT INTO `table_kuisioner` (`id_result`, `tanggal_waktu_pengisian`, `nomor_kk`, `nomor_ktp`, `result`) VALUES
(1, '2021-08-26 09:25:09', '1271072011060017', '1271071909980005', '{\n   \"A1\": {\n      \"Memakai masker\": \"Sangat Tidak Patuh\",\n      \"Menggunakan hand sanitizer / disinfektan\": \"Sangat Tidak Patuh\",\n      \"Mencuci tangan selama 20 detik dengan sabun\": \"Sangat Tidak Patuh\",\n      \"Menghindari berjabat tangan\": \"Sangat Tidak Patuh\",\n      \"Menghindari kerumunan\": \"Sangat Tidak Patuh\",\n      \"Menjaga jarak (minimal 1 m) dari orang lain ketika di luar rumah\": \"Sangat Tidak Patuh\"\n   },\n   \"B2\": {\n      \"Memakai masker\": \"Sangat Tidak Efektif\",\n      \"Menggunakan hand sanitizer / disinfektan\": \"Sangat Tidak Efektif\",\n      \"Mencuci tangan selama 20 detik dengan sabun\": \"Sangat Tidak Efektif\",\n      \"Menghindari berjabat tangan\": \"Sangat Tidak Efektif\",\n      \"Menghindari kerumunan\": \"Sangat Tidak Efektif\",\n      \"Menjaga jarak (minimal 1 m) dari orang lain ketika di luar rumah\": \"Sangat Tidak Efektif\"\n   },\n   \"C1\": [\n      \"Harga masker, face-shield (pelindung wajah), hand sanitizer atau APD lain cenderung mahal\",\n      \"Pekerjaan menjadi sulit jika harus menerapkan protokol kesehatan\"\n   ],\n   \"C2\": \"Tidak ada respon (tidak melakukan apa-apa)\",\n   \"C3\": \"Lebih sedikit\",\n   \"D1\": {\n      \"Tempat bekerja (Kantor, Pabrik, lainnya)\": \"Wajib jaga jarak\",\n      \"Mall/Plaza/Pusat perbelanjaan\": \"Wajib jaga jarak\",\n      \"Tempat Ibadah\": \"Wajib jaga jarak\",\n      \"Pasar Tradisional & Pedagang K5\": \"Wajib jaga jarak\",\n      \"Menghindari berjabat tangan\": \"Wajib jaga jarak\",\n      \"Tempat Pelayanan Publik (Samsat, Bank, Kantor Pemerintahan dsb\": \"Wajib jaga jarak\"\n   },\n   \"E1\": \"Tidak\",\n   \"E5\": \"Tidak Mungkin\",\n   \"F1\": [\n      \"Radio\",\n      \"Media Sosial(FB, IG, Twitter, Youtube, Tik - Tok)\"\n   ],\n   \"F2\": [\n      \"Media Sosial(FB, IG, Twitter, Youtube, Tik - Tok)\",\n      \"Radio\"\n   ],\n   \"G1\": \"Laki - Laki\",\n   \"G2\": \"23\",\n   \"G3\": \"DI/DII/DIII\",\n   \"G4\": \"Belum menikah\",\n   \"G5\": \"12\",\n   \"H1\": \"Tidak Bekerja\",\n   \"H4\": \"Tetap\",\n   \"H5\": [\n      \"Uang Tunai(Bantuan Sosial Tunai)\"\n   ],\n   \"I1\": \"Sumatera Utara\",\n   \"I2\": \"Medan\",\n   \"I3\": \"Ya, Saya bersedia\",\n   \"I4\": \"Ya\"\n}');

-- --------------------------------------------------------

--
-- Table structure for table `table_status`
--

CREATE TABLE `table_status` (
  `nomor_ktp` varchar(64) NOT NULL,
  `status_hubungan` char(200) NOT NULL,
  `kewarganegaraan` char(200) NOT NULL,
  `nama_ayah` char(200) NOT NULL,
  `nama_ibu` char(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `table_status`
--

INSERT INTO `table_status` (`nomor_ktp`, `status_hubungan`, `kewarganegaraan`, `nama_ayah`, `nama_ibu`) VALUES
('1271071909980005', 'ANAK', 'INDONESIA', 'ROBERT MANURUNG', 'KARTIKA RYANI BR HUTAPEA');

-- --------------------------------------------------------

--
-- Table structure for table `table_user`
--

CREATE TABLE `table_user` (
  `id_user` int(11) NOT NULL,
  `user_name` varchar(64) NOT NULL,
  `password_user` varchar(64) NOT NULL,
  `nomor_kartukeluarga` varchar(64) NOT NULL,
  `nomor_ktp` varchar(64) NOT NULL,
  `no_hp` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `table_user`
--

INSERT INTO `table_user` (`id_user`, `user_name`, `password_user`, `nomor_kartukeluarga`, `nomor_ktp`, `no_hp`) VALUES
(1, 'samueladriel9802', '7834f72e31c1dd39635378fc776855a8', '1271072011060017', '1271071909980005', '08116098980');

-- --------------------------------------------------------

--
-- Table structure for table `table_wilayah`
--

CREATE TABLE `table_wilayah` (
  `nomor_kartukeluarga` varchar(64) NOT NULL,
  `nama_kepalakeluarga` char(200) NOT NULL,
  `alamat` char(200) NOT NULL,
  `nomorrt` varchar(2) NOT NULL,
  `nomorrw` varchar(2) NOT NULL,
  `nama_desakelurahan` char(200) NOT NULL,
  `nama_kecamatan` char(200) NOT NULL,
  `nama_kabupatenkota` char(200) NOT NULL,
  `kode_pos` int(6) NOT NULL,
  `nama_provinsi` char(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `table_wilayah`
--

INSERT INTO `table_wilayah` (`nomor_kartukeluarga`, `nama_kepalakeluarga`, `alamat`, `nomorrt`, `nomorrw`, `nama_desakelurahan`, `nama_kecamatan`, `nama_kabupatenkota`, `kode_pos`, `nama_provinsi`) VALUES
('1271072011060017', 'ROBERT MANURUNG', 'JL. IRIGASI NO. 151 MEDAN', '00', '00', 'Kemenangan Tani', 'Medan Tuntungan', 'Kota Medan', 20136, 'Sumatera Utara');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `table_admin`
--
ALTER TABLE `table_admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `table_biodata`
--
ALTER TABLE `table_biodata`
  ADD PRIMARY KEY (`id_biodata`);

--
-- Indexes for table `table_dataindividu`
--
ALTER TABLE `table_dataindividu`
  ADD PRIMARY KEY (`nomor_ktp`);

--
-- Indexes for table `table_kuisioner`
--
ALTER TABLE `table_kuisioner`
  ADD PRIMARY KEY (`id_result`);

--
-- Indexes for table `table_status`
--
ALTER TABLE `table_status`
  ADD PRIMARY KEY (`nomor_ktp`);

--
-- Indexes for table `table_user`
--
ALTER TABLE `table_user`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `nomor_ktp` (`nomor_ktp`);

--
-- Indexes for table `table_wilayah`
--
ALTER TABLE `table_wilayah`
  ADD PRIMARY KEY (`nomor_kartukeluarga`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `table_admin`
--
ALTER TABLE `table_admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `table_biodata`
--
ALTER TABLE `table_biodata`
  MODIFY `id_biodata` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `table_kuisioner`
--
ALTER TABLE `table_kuisioner`
  MODIFY `id_result` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `table_user`
--
ALTER TABLE `table_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

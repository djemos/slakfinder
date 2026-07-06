-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 23, 2024 at 12:33 AM
-- Server version: 10.11.7-MariaDB
-- PHP Version: 8.3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `slakdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `spf_filelist`
--

CREATE TABLE `spf_filelist` (
  `id` int(11) NOT NULL,
  `repository` int(11) NOT NULL,
  `package` int(11) NOT NULL,
  `fullpath` varchar(511) NOT NULL,
  `filename` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `spf_guestbook`
--

CREATE TABLE `spf_guestbook` (
  `id` int(11) NOT NULL,
  `itime` int(10) DEFAULT NULL,
  `nick` varchar(20) DEFAULT NULL,
  `ip` varchar(15) DEFAULT NULL,
  `message` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
-- --------------------------------------------------------

--
-- Table structure for table `spf_history`
--

CREATE TABLE `spf_history` (
  `id` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  `ip` varchar(15) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `desc` varchar(50) DEFAULT NULL,
  `file` varchar(50) DEFAULT NULL,
  `repo` varchar(5) DEFAULT NULL,
  `query` varchar(255) DEFAULT NULL,
  `results` int(5) DEFAULT NULL,
  `cache` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `spf_mixed`
--

CREATE TABLE `spf_mixed` (
  `field` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `spf_mixed`
--

INSERT INTO `spf_mixed` (`field`, `value`) VALUES
('count_visits', '1'),
('count_searches', '1'),
('count_srctxt', '1'),
('count_srcxml', '1');

-- --------------------------------------------------------

--
-- Table structure for table `spf_packages`
--

CREATE TABLE `spf_packages` (
  `id` int(11) NOT NULL,
  `repository` int(11) NOT NULL,
  `filename` varchar(256) NOT NULL,
  `name` varchar(128) NOT NULL,
  `version` varchar(64) NOT NULL,
  `arch` varchar(16) NOT NULL,
  `build` varchar(32) NOT NULL,
  `compression` varchar(4) NOT NULL,
  `location` varchar(128) NOT NULL,
  `comprsize` varchar(16) NOT NULL,
  `uncomprsize` varchar(16) NOT NULL,
  `required` text DEFAULT NULL,
  `conflicts` text DEFAULT NULL,
  `suggests` text DEFAULT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `spf_repository`
--

CREATE TABLE `spf_repository` (
  `id` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  `rank` int(11) DEFAULT 99,
  `manifest` varchar(30) DEFAULT NULL,
  `packages` varchar(30) DEFAULT NULL,
  `version` varchar(16) DEFAULT NULL,
  `arch` varchar(10) DEFAULT NULL,
  `class` varchar(10) DEFAULT NULL,
  `mtime` varchar(40) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `npkgs` int(11) DEFAULT 0,
  `nfiles` int(11) DEFAULT 0,
  `deps` int(11) DEFAULT 0,
  `description` varchar(255) DEFAULT NULL,
  `brief` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
-- --------------------------------------------------------

--
-- Table structure for table `spf_searches`
--

CREATE TABLE `spf_searches` (
  `dt` datetime DEFAULT NULL,
  `sname` varchar(50) DEFAULT NULL,
  `sdesc` varchar(50) DEFAULT NULL,
  `sfile` varchar(50) DEFAULT NULL,
  `ip` varchar(15) DEFAULT NULL,
  `srepo` int(11) DEFAULT NULL,
  `results` int(11) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `spf_filelist`
--
ALTER TABLE `spf_filelist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `filename` (`filename`),
  ADD KEY `repository` (`repository`),
  ADD KEY `package` (`package`);

--
-- Indexes for table `spf_guestbook`
--
ALTER TABLE `spf_guestbook`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `spf_history`
--
ALTER TABLE `spf_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `spf_mixed`
--
ALTER TABLE `spf_mixed`
  ADD PRIMARY KEY (`field`);

--
-- Indexes for table `spf_packages`
--
ALTER TABLE `spf_packages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `repository` (`repository`);

--
-- Indexes for table `spf_repository`
--
ALTER TABLE `spf_repository`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `spf_filelist`
--
ALTER TABLE `spf_filelist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `spf_guestbook`
--
ALTER TABLE `spf_guestbook`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `spf_history`
--
ALTER TABLE `spf_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `spf_packages`
--
ALTER TABLE `spf_packages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

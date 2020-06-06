-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 05, 2020 at 02:38 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blog`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `sno` int(11) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone_num` varchar(50) NOT NULL,
  `msgs` text NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`sno`, `name`, `email`, `phone_num`, `msgs`, `date`) VALUES
(1, 'sumit sarkar', 'sumitsarkar338@gmail.com', '76979797778', 'sumit is happy', '2020-01-20 20:58:51'),
(2, 'sumit sarkarddddwdwdw', 'sumit@5657', '8787879789787', 'dfdsgsd', '0000-00-00 00:00:00'),
(3, 'sumit sarkard', 'sumit@5657', '8787879789787', 'dad', '0000-00-00 00:00:00'),
(8, 'Sumit sarar', 'sumit@fhfjjgdgd', '7897876', 'zvdvdsv', '2020-01-21 21:11:14'),
(10, 'SUSOVAN SARKAR', 'susovan.skr@gmail.com', '08116542296', '44646', '2020-01-21 21:20:58'),
(11, 'Sumit sarar', 'sumit@fhfg', '789787gg', 'efegf', '2020-01-21 21:33:41'),
(12, 'Sumit sarar', 'sumit@fhfjjdd', '7897876dd', 'dsdsds', '2020-01-21 21:35:32'),
(13, 'SUMIT SARKAR', 'sumitsarkar338@gmail.com', '07407227346', 'bjb', '2020-01-26 18:33:22');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

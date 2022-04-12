-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 12, 2022 at 12:11 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `orientation_db_schema`
--

-- --------------------------------------------------------

--
-- Table structure for table `orientation`
--

CREATE TABLE `orientation` (
  `id` int(8) NOT NULL,
  `student_id` int(4) NOT NULL,
  `field` varchar(25) NOT NULL,
  `value` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orientation`
--

INSERT INTO `orientation` (`id`, `student_id`, `field`, `value`) VALUES
(1800, 1, 'Initialize', 'true'),
(1806, 1, 'StartOrientation', 'true'),
(1807, 1, 'Campus', 'Soshanguve South'),
(1808, 1, 'Faculty', 'Faculty of Information and Communication Technology');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `orientation`
--
ALTER TABLE `orientation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_orie_stud` (`student_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orientation`
--
ALTER TABLE `orientation`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1809;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orientation`
--
ALTER TABLE `orientation`
  ADD CONSTRAINT `FK_orie_stud` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

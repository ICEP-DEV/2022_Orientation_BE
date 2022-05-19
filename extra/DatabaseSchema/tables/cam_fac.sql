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
-- Table structure for table `cam_fac`
--

CREATE TABLE `cam_fac` (
  `id` int(8) NOT NULL,
  `fac_id` int(4) NOT NULL,
  `cam_id` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cam_fac`
--

INSERT INTO `cam_fac` (`id`, `fac_id`, `cam_id`) VALUES
(1, 3, 8),
(2, 4, 8),
(3, 1, 4),
(4, 1, 5),
(5, 1, 6),
(6, 2, 3),
(7, 7, 1),
(8, 4, 6),
(9, 4, 3),
(10, 3, 3),
(11, 3, 9),
(12, 3, 5),
(13, 5, 5),
(14, 6, 7),
(15, 6, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cam_fac`
--
ALTER TABLE `cam_fac`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_camFac_cam` (`cam_id`),
  ADD KEY `FK_cam_Fac_fac` (`fac_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cam_fac`
--
ALTER TABLE `cam_fac`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cam_fac`
--
ALTER TABLE `cam_fac`
  ADD CONSTRAINT `FK_camFac_cam` FOREIGN KEY (`cam_id`) REFERENCES `campus` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_cam_Fac_fac` FOREIGN KEY (`fac_id`) REFERENCES `faculty` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

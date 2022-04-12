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
-- Table structure for table `fac_vid`
--

CREATE TABLE `fac_vid` (
  `id` int(8) NOT NULL,
  `fac_id` int(4) NOT NULL,
  `vid_id` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fac_vid`
--

INSERT INTO `fac_vid` (`id`, `fac_id`, `vid_id`) VALUES
(12, 1, 16),
(13, 1, 17),
(14, 1, 18),
(15, 1, 19),
(16, 1, 20),
(17, 1, 21),
(18, 1, 22),
(19, 1, 23),
(20, 2, 24),
(21, 2, 25),
(22, 2, 26),
(23, 2, 27),
(24, 2, 28),
(25, 2, 29),
(26, 2, 30),
(27, 2, 31),
(28, 2, 32),
(29, 2, 33),
(30, 2, 17),
(31, 2, 18),
(32, 2, 19),
(33, 2, 20),
(34, 2, 21),
(35, 2, 22),
(36, 2, 23),
(37, 3, 34),
(38, 3, 35),
(39, 3, 36),
(40, 3, 37),
(41, 3, 38),
(42, 3, 39),
(43, 3, 40),
(44, 3, 41),
(45, 3, 42),
(46, 3, 43),
(47, 3, 44),
(48, 3, 45),
(49, 3, 46),
(50, 3, 17),
(51, 3, 18),
(52, 3, 19),
(53, 3, 20),
(54, 3, 21),
(55, 3, 22),
(56, 3, 23),
(57, 4, 47),
(58, 4, 48),
(59, 4, 49),
(60, 4, 50),
(61, 4, 51),
(62, 4, 52),
(63, 4, 53),
(64, 4, 54),
(65, 4, 55),
(66, 4, 17),
(67, 4, 18),
(68, 4, 19),
(69, 4, 20),
(70, 4, 21),
(71, 4, 22),
(72, 4, 23),
(73, 4, 56),
(74, 4, 57),
(75, 5, 58),
(76, 5, 59),
(77, 5, 60),
(78, 5, 61),
(79, 5, 62),
(80, 5, 63),
(81, 5, 64),
(82, 5, 65),
(83, 5, 66),
(84, 5, 67),
(85, 5, 68),
(86, 5, 69),
(87, 5, 70),
(88, 5, 17),
(89, 5, 18),
(90, 5, 19),
(91, 5, 20),
(92, 5, 21),
(93, 5, 22),
(94, 5, 23),
(95, 6, 71),
(96, 6, 72),
(97, 6, 73),
(98, 6, 74),
(99, 6, 75),
(100, 6, 76),
(101, 6, 77),
(102, 6, 78),
(103, 6, 79),
(104, 6, 80),
(105, 6, 81),
(106, 6, 82),
(107, 6, 83),
(108, 6, 84),
(109, 6, 85),
(110, 6, 86),
(111, 6, 17),
(112, 6, 18),
(113, 6, 19),
(114, 6, 20),
(115, 6, 21),
(116, 6, 22),
(117, 6, 23),
(118, 7, 87),
(119, 7, 88),
(120, 7, 89),
(121, 7, 90),
(122, 7, 91),
(123, 7, 92),
(124, 7, 93),
(125, 7, 17),
(126, 7, 18),
(127, 7, 19),
(128, 7, 20),
(129, 7, 21),
(130, 7, 22),
(131, 7, 23);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `fac_vid`
--
ALTER TABLE `fac_vid`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_facVid_fac` (`fac_id`),
  ADD KEY `FK_facVid_vid` (`vid_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `fac_vid`
--
ALTER TABLE `fac_vid`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `fac_vid`
--
ALTER TABLE `fac_vid`
  ADD CONSTRAINT `FK_facVid_fac` FOREIGN KEY (`fac_id`) REFERENCES `faculty` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_facVid_vid` FOREIGN KEY (`vid_id`) REFERENCES `videos` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

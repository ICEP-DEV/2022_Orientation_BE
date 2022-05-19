-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 12, 2022 at 12:10 PM
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
-- Table structure for table `ans_que`
--

CREATE TABLE `ans_que` (
  `id` int(11) NOT NULL,
  `ans_id` int(11) NOT NULL,
  `que_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ans_que`
--

INSERT INTO `ans_que` (`id`, `ans_id`, `que_id`) VALUES
(5, 30, 1),
(6, 28, 1),
(7, 30, 2),
(8, 28, 2),
(9, 32, 3),
(10, 31, 3),
(11, 32, 4),
(12, 31, 4),
(13, 33, 5),
(14, 34, 6),
(15, 35, 7),
(16, 31, 8),
(17, 32, 8),
(18, 28, 9),
(19, 30, 9),
(20, 36, 10),
(21, 31, 11),
(22, 32, 11),
(23, 28, 12),
(24, 30, 12),
(25, 28, 13),
(26, 30, 13),
(27, 28, 14),
(28, 30, 14),
(29, 28, 15),
(30, 30, 15),
(31, 31, 16),
(32, 32, 16),
(33, 37, 17),
(34, 38, 17),
(35, 39, 17),
(36, 40, 17),
(37, 41, 18),
(38, 42, 18),
(39, 43, 18),
(40, 44, 19),
(41, 45, 19),
(42, 46, 19),
(43, 47, 20),
(44, 48, 20),
(45, 49, 20),
(46, 50, 21),
(47, 51, 21),
(48, 52, 21),
(49, 40, 21),
(50, 54, 22),
(51, 55, 22),
(52, 56, 22),
(53, 57, 23),
(54, 58, 23),
(55, 59, 23),
(56, 28, 24),
(57, 30, 24),
(58, 28, 25),
(59, 30, 25),
(60, 28, 26),
(61, 30, 26),
(62, 60, 27),
(63, 61, 27),
(64, 62, 27),
(65, 63, 27),
(66, 28, 28),
(67, 30, 28),
(68, 64, 29),
(69, 67, 29),
(70, 65, 29),
(71, 66, 29),
(72, 28, 30),
(73, 30, 30),
(74, 68, 31),
(75, 28, 32),
(76, 30, 32),
(77, 31, 33),
(78, 32, 33),
(79, 28, 34),
(80, 30, 34),
(81, 69, 35),
(82, 70, 35);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ans_que`
--
ALTER TABLE `ans_que`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_ansque_ans` (`ans_id`),
  ADD KEY `FK_ansque_que` (`que_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ans_que`
--
ALTER TABLE `ans_que`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ans_que`
--
ALTER TABLE `ans_que`
  ADD CONSTRAINT `FK_ansque_ans` FOREIGN KEY (`ans_id`) REFERENCES `surveyanswer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_ansque_que` FOREIGN KEY (`que_id`) REFERENCES `surveyquestion` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

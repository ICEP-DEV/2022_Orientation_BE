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
-- Table structure for table `surveyanswer`
--

CREATE TABLE `surveyanswer` (
  `id` int(4) NOT NULL,
  `answer` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `surveyanswer`
--

INSERT INTO `surveyanswer` (`id`, `answer`) VALUES
(60, 'A) 3'),
(64, 'A) Accommodation Residence Life & Catering'),
(69, 'A) Diploma in internal audit'),
(47, 'A) Exist to facilitate access to quality information'),
(54, 'A) Fine and studio arts'),
(57, 'A) Interior design'),
(44, 'A) Learning interaction and collaboration'),
(50, 'A) Prof Nalini Moodley-Diar'),
(37, 'A) Student Development & support'),
(41, 'A) Wear mask, sanitize , make sure you can clean'),
(61, 'B) 6'),
(67, 'B) Accommodation Residential LIFE & Catering'),
(70, 'B) Advance diploma in internal Audit'),
(55, 'B) Design studies'),
(48, 'B) Exist to offer high level information'),
(38, 'B) Health and wellness'),
(45, 'B) Learning Management system'),
(58, 'B) Performing arts'),
(51, 'B) Prof Naline Moodley-Diar'),
(42, 'B) Wear mask, sanitize, make sure your hands are always clean'),
(35, 'Building 30- Pretoria campus'),
(62, 'C) 8'),
(65, 'C) Accommodate Residence Life & catering'),
(46, 'C) Learning and tutoring'),
(56, 'C) Performing arts'),
(52, 'C) Prof Naline Modley-Diaz'),
(39, 'C) Student ombudsman'),
(49, 'C) To get access to high quality information'),
(59, 'C) Visual communication'),
(43, 'C) Wear mask, make sure your hands clean all the time.'),
(63, 'D) 5'),
(66, 'D) Accommodation Residence life & Cater'),
(40, 'D) None of the above'),
(30, 'False'),
(36, 'Marketing, supply chain management and sport Management'),
(32, 'No'),
(33, 'Student Development and Support'),
(68, 'Student Governance Leadership Development'),
(28, 'True'),
(34, 'Tshwane University of Technology'),
(31, 'Yes');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `surveyanswer`
--
ALTER TABLE `surveyanswer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `answer` (`answer`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `surveyanswer`
--
ALTER TABLE `surveyanswer`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 30, 2022 at 03:34 PM
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
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(4) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `email`, `password`) VALUES
(1, 'cbshezi5@gmail.com', 'U2FsdGVkX18WGQKaKNYn9zh56+7oq2QaVFNFxNnFl+s=');

-- --------------------------------------------------------

--
-- Table structure for table `campus`
--

CREATE TABLE `campus` (
  `id` int(4) NOT NULL,
  `campus_name` varchar(68) NOT NULL,
  `noOfFaculties` int(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `campus`
--

INSERT INTO `campus` (`id`, `campus_name`, `noOfFaculties`) VALUES
(1, 'Arts', 0),
(2, 'Arcadia ', 0),
(3, 'eMalahleni', 0),
(4, 'Ga-Rankuwa', 0),
(5, 'Mbombela', 0),
(6, 'Polokwane', 0),
(7, 'Pretoria', 0),
(8, 'Soshanguve South', 0),
(9, 'Soshanguve North', 0);

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE `faculty` (
  `id` int(4) NOT NULL,
  `faculty_name` varchar(128) NOT NULL,
  `camp_id` int(4) NOT NULL,
  `noOfVideos` int(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`id`, `faculty_name`, `camp_id`, `noOfVideos`) VALUES
(1, 'Faculty of Economics and Finance', 4, 0),
(2, 'Faculty of Economics and Finance', 5, 0),
(3, 'Faculty of Economics and Finance', 6, 0),
(4, 'Faculty of Engineering and the Built Environment', 3, 0),
(5, 'Faculty of Humanities', 8, 0),
(6, 'Faculty of Information and Communication Technology', 8, 0);

-- --------------------------------------------------------

--
-- Table structure for table `orientation`
--

CREATE TABLE `orientation` (
  `id` int(8) NOT NULL,
  `user_id` int(4) NOT NULL,
  `field` varchar(25) NOT NULL,
  `value` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orientation`
--

INSERT INTO `orientation` (`id`, `user_id`, `field`, `value`) VALUES
(4, 2, 'Campus', 'Arts'),
(5, 2, 'Campus', 'Arts');

-- --------------------------------------------------------

--
-- Table structure for table `stats`
--

CREATE TABLE `stats` (
  `countUsers` int(11) NOT NULL,
  `viewNumVisitors` int(11) NOT NULL,
  `uploadVideo` int(11) NOT NULL,
  `videoCounts` int(11) NOT NULL,
  `videoClicks` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stats`
--

INSERT INTO `stats` (`countUsers`, `viewNumVisitors`, `uploadVideo`, `videoCounts`, `videoClicks`) VALUES
(1, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `id` int(4) NOT NULL,
  `studNum` int(9) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(60) NOT NULL,
  `isVerified` tinyint(1) NOT NULL,
  `orientation_progress` int(2) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`id`, `studNum`, `firstname`, `lastname`, `email`, `password`, `isVerified`, `orientation_progress`) VALUES
(21, 0, 'NULL', 'NULL', '218503624@tut4life.ac.za', 'U2FsdGVkX1/3bL5XVscbPcGP+ihJsh6CEZhR1ApnpVI=', 1, 1),
(24, 0, 'NULL', 'NULL', 'cbshezi5@gmail.com', 'U2FsdGVkX1/8aYtdf9KM6R+LQ8ng5oaM8w3NmTc9vvk=', 1, 0);

--
-- Triggers `student`
--
DELIMITER $$
CREATE TRIGGER `deleteUser` AFTER DELETE ON `student` FOR EACH ROW UPDATE stats
SET countUsers = (SELECT COUNT(id-1) FROM student)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `updateStats` AFTER INSERT ON `student` FOR EACH ROW UPDATE stats
SET countUsers = (SELECT COUNT(id+1) FROM student)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `survey`
--

CREATE TABLE `survey` (
  `id` int(8) NOT NULL,
  `user_id` int(4) NOT NULL,
  `question` int(2) NOT NULL,
  `answer` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `survey`
--

INSERT INTO `survey` (`id`, `user_id`, `question`, `answer`) VALUES
(200, 2, 1, 'apple'),
(201, 2, 2, 'orange'),
(202, 2, 3, 'bananna'),
(203, 2, 4, 'strawberry'),
(204, 2, 5, 'blueberry'),
(205, 2, 1, 'apple'),
(206, 2, 2, 'orange'),
(207, 2, 3, 'bananna'),
(208, 2, 4, 'strawberry'),
(209, 2, 5, 'blueberry'),
(210, 2, 1, 'apple'),
(211, 2, 2, 'orange'),
(212, 2, 3, 'bananna'),
(213, 2, 4, 'strawberry'),
(214, 2, 5, 'blueberry'),
(215, 2, 1, 'apple'),
(216, 2, 2, 'orange'),
(217, 2, 3, 'bananna'),
(218, 2, 4, 'strawberry'),
(219, 2, 5, 'blueberry'),
(220, 2, 1, 'apple'),
(221, 2, 2, 'orange'),
(222, 2, 3, 'bananna'),
(223, 2, 4, 'strawberry'),
(224, 2, 5, 'blueberry');

-- --------------------------------------------------------

--
-- Table structure for table `tracking`
--

CREATE TABLE `tracking` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `activity` varchar(25) NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tracking`
--

INSERT INTO `tracking` (`id`, `user_id`, `activity`, `datetime`) VALUES
(3, 21, 'registered', '2022-03-15 08:57:16');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`email`);

--
-- Indexes for table `campus`
--
ALTER TABLE `campus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faculty`
--
ALTER TABLE `faculty`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_faculty_campus` (`camp_id`);

--
-- Indexes for table `orientation`
--
ALTER TABLE `orientation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `survey`
--
ALTER TABLE `survey`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tracking`
--
ALTER TABLE `tracking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_track_student` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `campus`
--
ALTER TABLE `campus`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `faculty`
--
ALTER TABLE `faculty`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `orientation`
--
ALTER TABLE `orientation`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `survey`
--
ALTER TABLE `survey`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=225;

--
-- AUTO_INCREMENT for table `tracking`
--
ALTER TABLE `tracking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `faculty`
--
ALTER TABLE `faculty`
  ADD CONSTRAINT `FK_faculty_campus` FOREIGN KEY (`camp_id`) REFERENCES `campus` (`id`) ON DELETE NO ACTION;

--
-- Constraints for table `tracking`
--
ALTER TABLE `tracking`
  ADD CONSTRAINT `FK_track_student` FOREIGN KEY (`user_id`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

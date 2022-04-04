-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 31, 2022 at 01:50 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.3.33

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

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE `faculty` (
  `id` int(4) NOT NULL,
  `faculty_name` varchar(128) NOT NULL,
  `noOfVideos` int(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`id`, `faculty_name`, `noOfVideos`) VALUES
(1, 'Faculty of Economics and Finance', 0),
(2, 'Faculty of Engineering and the Built Environment', 0),
(3, 'Faculty of Humanities', 0),
(4, 'Faculty of Information and Communication Technology', 0),
(5, 'Faculty of Management Sciences', 0),
(6, 'Faculty of Science', 0),
(7, 'Faculty of Arts and Design', 0);

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
(1, 3, 3),
(2, 3, 4),
(3, 3, 1),
(4, 3, 5),
(5, 3, 6),
(6, 3, 7),
(7, 3, 8),
(8, 3, 9),
(9, 3, 10),
(10, 3, 11),
(11, 3, 2);

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

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

CREATE TABLE `videos` (
  `id` int(4) NOT NULL,
  `tittle` varchar(45) DEFAULT NULL,
  `category` varchar(30) NOT NULL,
  `path` varchar(512) NOT NULL,
  `type` varchar(15) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `noOfViews` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `videos`
--

INSERT INTO `videos` (`id`, `tittle`, `category`, `path`, `type`, `createdAt`, `noOfViews`) VALUES
(1, 'Induction & Orientation', 'Office of Dean', 'https://dh2dlbjd2qx17.cloudfront.net/videos/New+Videos/HUMANITIES+OVERVIEW+2022.mp4', 'video', '2022-03-30 18:36:37', 0),
(2, 'Executive Dean', 'Office of Dean', 'https://dh2dlbjd2qx17.cloudfront.net/videos/New+Videos/Prof+Maserumule-+dean+video.mp4', 'video', '2022-03-30 18:38:26', 0),
(3, NULL, 'Office of Dean', 'https://dh2dlbjd2qx17.cloudfront.net/videos/New+Videos/booklets/Humanities+First+year+2022.pdf', 'document', '2022-03-30 18:39:27', 0),
(4, 'Applied Langauges', 'Departments', 'https://dh2dlbjd2qx17.cloudfront.net/videos/faculties/Humanities/Dr+Gary+Collins.mp4', 'video', '2022-03-30 18:41:50', 0),
(5, 'Student Development & Support', 'Campus and Support', 'https://dh2dlbjd2qx17.cloudfront.net/videos/campus-support/SDS+Orientation.mp4', 'video', '2022-03-30 18:43:01', 0),
(6, 'Health & Wellness', 'Campus and Support', 'https://dh2dlbjd2qx17.cloudfront.net/videos/general/Health+%26+Wellness%2C+an+Introduction.mp4', 'video', '2022-03-30 18:45:18', 0),
(7, 'MyTUTor, What is a Study Guide?', 'Campus and Support', 'https://dh2dlbjd2qx17.cloudfront.net/videos/general/What+is+a+study+guide.mp4', 'video', '2022-03-30 18:45:51', 0),
(8, 'Student Ombudsman', 'Campus and Support', 'https://dh2dlbjd2qx17.cloudfront.net/videos/campus-support/OMBUDSMAN+INTERVIEW.mp4', 'video', '2022-03-30 18:46:33', 0),
(9, 'Higher Health', 'Campus and Support', 'https://dh2dlbjd2qx17.cloudfront.net/videos/general/Welcome+Class+of+2021-+your+health+is+in+your+hands.mp4', 'video', '2022-03-30 18:47:09', 0),
(10, 'SGLD', 'Campus and Support', 'https://dh2dlbjd2qx17.cloudfront.net/videos/campus-support/Student+Governance+%26+Leadership+Development.mp4', 'video', '2022-03-30 18:47:47', 0),
(11, 'Extracurricular Development', 'Campus and Support', 'https://dh2dlbjd2qx17.cloudfront.net/videos/New+Videos/Jack+Sibanyoni.mp4', 'video', '2022-03-30 18:48:31', 0);

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
-- Indexes for table `cam_fac`
--
ALTER TABLE `cam_fac`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_camFac_cam` (`cam_id`),
  ADD KEY `FK_cam_Fac_fac` (`fac_id`);

--
-- Indexes for table `faculty`
--
ALTER TABLE `faculty`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fac_vid`
--
ALTER TABLE `fac_vid`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_facVid_fac` (`fac_id`),
  ADD KEY `FK_facVid_vid` (`vid_id`);

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
-- Indexes for table `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `cam_fac`
--
ALTER TABLE `cam_fac`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `faculty`
--
ALTER TABLE `faculty`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `fac_vid`
--
ALTER TABLE `fac_vid`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

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
-- AUTO_INCREMENT for table `videos`
--
ALTER TABLE `videos`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cam_fac`
--
ALTER TABLE `cam_fac`
  ADD CONSTRAINT `FK_camFac_cam` FOREIGN KEY (`cam_id`) REFERENCES `campus` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_cam_Fac_fac` FOREIGN KEY (`fac_id`) REFERENCES `faculty` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `fac_vid`
--
ALTER TABLE `fac_vid`
  ADD CONSTRAINT `FK_facVid_fac` FOREIGN KEY (`fac_id`) REFERENCES `faculty` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_facVid_vid` FOREIGN KEY (`vid_id`) REFERENCES `videos` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tracking`
--
ALTER TABLE `tracking`
  ADD CONSTRAINT `FK_track_student` FOREIGN KEY (`user_id`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 13, 2022 at 10:23 AM
-- Server version: 10.1.33-MariaDB
-- PHP Version: 7.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
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
(1, 'cbshezi5@gmail.com', 'U2FsdGVkX18WGQKaKNYn9zh56+7oq2QaVFNFxNnFl+s='),
(2, 'cheyezamlondo9@gmail.com', 'U2FsdGVkX19s0QGMc3gWoWts01tqATbdvMaLsRgxDlE='),
(3, 'siyamtanda.quma@gmail.com', 'U2FsdGVkX1/37zEE5z92g84eaC/nk78QmjwEhSeXydE=');

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
(1, 8, 2),
(2, 9, 2),
(3, 10, 2),
(4, 11, 2),
(5, 12, 2),
(6, 1, 4),
(7, 2, 4),
(8, 3, 4),
(9, 4, 4),
(10, 5, 4),
(11, 1, 1),
(12, 2, 1),
(13, 3, 1),
(14, 4, 1),
(15, 7, 1),
(16, 17, 3),
(17, 13, 3),
(18, 15, 3),
(19, 16, 3),
(20, 14, 3),
(21, 21, 5),
(22, 22, 5),
(23, 20, 5),
(24, 18, 5),
(25, 19, 5),
(26, 24, 6),
(27, 26, 6),
(28, 25, 6),
(29, 27, 6);

-- --------------------------------------------------------

--
-- Table structure for table `blog`
--

CREATE TABLE `blog` (
  `id` int(100) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `created_on` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `path` text NOT NULL,
  `link` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blog`
--

INSERT INTO `blog` (`id`, `title`, `description`, `author`, `created_on`, `path`, `link`) VALUES
(1, 'new blog', 'this is where the admin is going to post all blog content', 'Teckner', '2022-04-07 12:55:39.550830', 'image_1649328939496.jpg', ''),
(2, 'new blog', 'this is where the admin is going to post all blog content', 'Teckner', '2022-04-07 12:57:36.043838', 'video_1649329055915.mp4', ''),
(3, 'winx', 'fairy tales', 'Teckner', '2022-04-13 10:13:38.825831', 'image_1649837618356.jpg', 'https://dh2dlbjd2qx17.cloudfront.net/img/tres.png'),
(4, 'winx', 'fairy tales', 'Teckner', '2022-04-13 10:16:46.760474', 'video_1649837806673.mp4', 'https://dh2dlbjd2qx17.cloudfront.net/img/tres.png'),
(5, 'winx', 'fairy tales', 'Teckner', '2022-04-13 10:20:07.545343', 'image_1649838007535.jpg', 'http://localhost:3007/uploadImage');

-- --------------------------------------------------------

--
-- Table structure for table `campus`
--

CREATE TABLE `campus` (
  `id` int(4) NOT NULL,
  `campus_name` varchar(68) NOT NULL,
  `noOfFaculties` int(4) NOT NULL DEFAULT '0'
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
  `noOfVideos` int(4) NOT NULL DEFAULT '0'
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
  `student_id` int(4) NOT NULL,
  `field` varchar(25) NOT NULL,
  `value` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `que_fac`
--

CREATE TABLE `que_fac` (
  `id` int(8) NOT NULL,
  `fac_id` int(4) NOT NULL,
  `que_id` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `que_fac`
--

INSERT INTO `que_fac` (`id`, `fac_id`, `que_id`) VALUES
(1, 3, 1),
(2, 3, 2),
(3, 3, 3),
(4, 3, 4),
(5, 3, 5),
(6, 3, 6);

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
(3, 0, 0, 0, 0);

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
  `orientation_progress` int(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`id`, `studNum`, `firstname`, `lastname`, `email`, `password`, `isVerified`, `orientation_progress`) VALUES
(0, 215685122, 'Cheyeza', 'Mlondo', 'cheyezamlondo55@gmail.com', 'U2FsdGVkX1/pbbXpO6N0eI8UngPRV4yjwLTHRYcdAKg=', 1, 0),
(1, 0, 'Tumelo', 'Raditlhalo', '218503624@tut4life.ac.za', 'U2FsdGVkX1/3bL5XVscbPcGP+ihJsh6CEZhR1ApnpVI=', 1, 1),
(2, 0, 'Cebolenkosi', 'Shezi', 'cbshezi5@gmail.com', 'U2FsdGVkX1/8aYtdf9KM6R+LQ8ng5oaM8w3NmTc9vvk=', 1, 0);

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
  `student_id` int(4) NOT NULL,
  `question_id` int(4) NOT NULL,
  `answer` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `survey`
--

INSERT INTO `survey` (`id`, `student_id`, `question_id`, `answer`) VALUES
(225, 2, 1, 'Danny'),
(226, 2, 4, '97-07-28');

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
(8, '1'),
(9, '2'),
(10, '3'),
(11, '4'),
(12, '5'),
(2, 'black'),
(3, 'blue'),
(17, 'boxer'),
(24, 'Cebo'),
(26, 'Chiyeza'),
(25, 'Dikeledi'),
(18, 'Gina'),
(5, 'green'),
(7, 'grey'),
(22, 'KB'),
(21, 'KG'),
(20, 'Phaidi'),
(13, 'pick n pay'),
(1, 'pink'),
(15, 'shoprite'),
(23, 'Siya'),
(16, 'spar'),
(19, 'Thato'),
(27, 'Tumi'),
(6, 'white'),
(14, 'woolies'),
(4, 'yellow');

-- --------------------------------------------------------

--
-- Table structure for table `surveyquestion`
--

CREATE TABLE `surveyquestion` (
  `id` int(4) NOT NULL,
  `question` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `surveyquestion`
--

INSERT INTO `surveyquestion` (`id`, `question`) VALUES
(1, 'Whats your t-shirt color?'),
(2, 'How many hat do you own?'),
(3, 'Where do you shop?'),
(4, 'What favorite color?'),
(5, 'Who is your instructor?'),
(6, 'Who is your scrum master?');

-- --------------------------------------------------------

--
-- Table structure for table `tracking`
--

CREATE TABLE `tracking` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `activity` varchar(25) NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `noOfViews` int(11) NOT NULL DEFAULT '0'
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
-- Indexes for table `ans_que`
--
ALTER TABLE `ans_que`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_ansque_ans` (`ans_id`),
  ADD KEY `FK_ansque_que` (`que_id`);

--
-- Indexes for table `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`id`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_orie_stud` (`student_id`);

--
-- Indexes for table `que_fac`
--
ALTER TABLE `que_fac`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_quefac_fac` (`fac_id`),
  ADD KEY `fk_quefac_que` (`que_id`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_stud_surv` (`student_id`),
  ADD KEY `FK_que_answer` (`question_id`);

--
-- Indexes for table `surveyquestion`
--
ALTER TABLE `surveyquestion`
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
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `blog`
--
ALTER TABLE `blog`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

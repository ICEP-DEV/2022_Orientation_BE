-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 12, 2022 at 11:57 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

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
(6, 3, 6),
(7, 5, 7),
(8, 5, 8),
(9, 5, 9),
(10, 5, 10),
(11, 5, 11),
(12, 5, 12),
(13, 2, 13),
(14, 2, 14),
(15, 2, 15),
(16, 2, 16),
(17, 2, 17),
(18, 7, 18),
(19, 7, 20),
(20, 7, 19),
(21, 7, 21),
(22, 7, 22),
(23, 7, 23),
(24, 4, 25),
(25, 4, 27),
(26, 4, 26),
(27, 4, 28),
(28, 4, 29),
(29, 4, 30),
(30, 1, 31),
(31, 1, 32),
(32, 1, 33),
(33, 1, 34),
(34, 1, 35);

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
(1, 'Journalisms forms as one of the pillars of any successful democratic Society. '),
(2, 'In 1st year will be introduced to the field of integrated communication. '),
(3, 'Department Educational Foundation offers foundation subject. '),
(4, 'Department of Business Education offers programs from 5 disciplines that are offer education programs. Is Consumer one of it? '),
(5, 'What does SDS stand for? '),
(6, 'What does TUT stand for? '),
(7, 'Which building can one find tourism management department? '),
(8, 'Diploma in Food Operating Management is a program offered in the Hospitality management department? '),
(9, 'A class Rep is needed to represent student and communicate with lecturer when there are issues. '),
(10, 'What does Mss stand for? '),
(11, 'Does TUT provide professional and confidential service?'),
(12, 'Study guide give you an overview on how the module is structured. '),
(13, 'Architecture and industrial Design department offers one and only one qualification'),
(14, 'Classes are NOT scheduled daily according to the timetable, you come as you please?'),
(15, 'Is 80% attendance Mandatory in class? '),
(16, 'Is Campus clinic is available at Pretoria Campus? '),
(17, 'Which video from the campus & support Request you to submit confidential information?'),
(18, 'What advice did Prof stanely mention about Covid rules, choose the correct set of rules below?'),
(19, 'What does MyTutor offer?'),
(20, 'Why do libraries exist?'),
(21, 'What is the correct name of the Executive dean of faculty of arts...'),
(22, 'Which department & unit focuses on fashion design & technology, jewelry design, manufacturing program...'),
(23, 'Which department and unit focuses on these following modules computer aided design, graphic technique, system integration and color coordination.'),
(24, 'True or False, a study guide gives an overview of information Expected from your Module?'),
(25, 'True or false, is Dr Etiene Van Wyk the executive dean of ICT?'),
(26, 'Can a computer drive a car, true or false?'),
(27, 'How many programs does an informatics department have?'),
(28, 'TRUE OR FALSE, a blended learning model is a model where a part of learning is performed remotely while another will be performed in class room settting.'),
(29, 'What does ARLC stand for?'),
(30, 'True or False, a student needs to access Campus clinic with a student card & application form?'),
(31, 'What does SGLD stand for? '),
(32, 'It is Safe to NOT wear a mask everywhere you go. '),
(33, 'The Faculty of Economics and Finance is found only at Garankuwa Campus.'),
(34, 'You don’t need to understand accounting to study Economics and Finance? '),
(35, 'What qualification is offered in department of Internal audit? Pick one. ');

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
(12, 'Prof Ben Van Wyk', 'Deputy Vice Chancellor', 'https://dh2dlbjd2qx17.cloudfront.net/videos/New+Videos/Prof+Ben+van+Wyk.mp4', 'video', '2022-04-08 13:36:33', 0),
(13, 'Brightspace', 'Learning Management System', 'https://dh2dlbjd2qx17.cloudfront.net/videos/general/Introduction+To+Brightspace.mp4', 'video', '2022-04-08 13:39:45', 0),
(14, 'Library', 'Library and Information Servic', 'https://dh2dlbjd2qx17.cloudfront.net/videos/general/Library+%26+Information+Services%2C+an+introduction.mp4', 'video', '2022-04-08 13:42:48', 0),
(15, 'Vaccination', 'Health and Wellness', 'https://dh2dlbjd2qx17.cloudfront.net/videos/iNew+Videos/Vaccination+_Vid.mp4', 'video', '2022-04-08 13:44:52', 0),
(16, 'Induction & Orientation', 'Office of the Dean', 'https://dh2dlbjd2qx17.cloudfront.net/videos/faculties/Economics+and+Finance/Faculty+of+Economics+and+Finance+TUT+Orientation+2021_2.mp4', 'video', '2022-04-08 13:53:23', 0),
(17, 'Student Development & Support', 'Campus and Support', 'https://dh2dlbjd2qx17.cloudfront.net/videos/campus-support/SDS+Orientation.mp4', 'video', '2022-04-08 13:56:44', 0),
(18, 'Health & Wellness', 'Campus and Support', 'https://dh2dlbjd2qx17.cloudfront.net/videos/general/Health+%26+Wellness%2C+an+Introduction.mp4', 'video', '2022-04-08 13:57:42', 0),
(19, 'MyTUTor, What is a Study Guide?', 'Campus and Support', 'https://dh2dlbjd2qx17.cloudfront.net/videos/general/What+is+a+study+guide.mp4', 'video', '2022-04-08 13:59:29', 0),
(20, 'Student Ombudsman', 'Campus and Support', 'https://dh2dlbjd2qx17.cloudfront.net/videos/campus-support/OMBUDSMAN+INTERVIEW.mp4', 'video', '2022-04-11 09:02:48', 0),
(21, 'Higher Health', 'Campus and Support', 'https://dh2dlbjd2qx17.cloudfront.net/videos/general/Welcome+Class+of+2021-+your+health+is+in+your+hands.mp4', 'video', '2022-04-11 09:04:20', 0),
(22, 'SGLD', 'Campus and Support', 'https://dh2dlbjd2qx17.cloudfront.net/videos/campus-support/Student+Governance+%26+Leadership+Development.mp4', 'video', '2022-04-11 09:05:29', 0),
(23, 'Extracurricular Development', 'Campus and Support', 'https://dh2dlbjd2qx17.cloudfront.net/videos/New+Videos/Jack+Sibanyoni.mp4', 'video', '2022-04-11 09:06:16', 0),
(24, 'Executive Dean', 'Office of the Dean', 'https://dh2dlbjd2qx17.cloudfront.net/videos/faculties/Engineering+and+the+Built+Environment/Dr+Grace+Kanakana+Katumba.mp4', 'video', '2022-04-11 09:16:35', 0),
(25, NULL, 'Office of the Dean', 'https://dh2dlbjd2qx17.cloudfront.net/videos/New+Videos/booklets/FEBE_2022+first+year+guide.pdf', 'document', '2022-04-11 09:18:06', 0),
(26, 'Architecture and Industrial Design', 'Departments and Units', 'https://dh2dlbjd2qx17.cloudfront.net/videos/faculties/Engineering+and+the+Built+Environment/Mr+Mostert+van+Schoor.mp4', 'video', '2022-04-11 09:20:22', 0),
(27, 'Building Sciences', 'Departments and Units', 'https://dh2dlbjd2qx17.cloudfront.net/videos/faculties/Engineering+and+the+Built+Environment/Mr+Nazeem+Ansary.mp4', 'video', '2022-04-11 09:21:22', 0),
(28, 'Chemical, Metallurgical and Materials Enginee', 'Departments and Units', 'https://dh2dlbjd2qx17.cloudfront.net/videos/faculties/Engineering+and+the+Built+Environment/Dr+Mxolisi+Brendon+Shongwe.mp4', 'video', '2022-04-11 09:22:06', 0),
(29, 'Civil Engineering', 'Departments and Units', 'https://dh2dlbjd2qx17.cloudfront.net/videos/faculties/Engineering+and+the+Built+Environment/Prof+Jacques+Snyman.mp4', 'video', '2022-04-11 09:24:15', 0),
(30, 'Electrical Engineering', 'Departments and Units', 'https://dh2dlbjd2qx17.cloudfront.net/videos/faculties/Engineering+and+the+Built+Environment/Prof+Thomas+Olwal.mp4', 'video', '2022-04-11 09:26:40', 0),
(31, 'Geomatics', 'Departments and Units', 'https://dh2dlbjd2qx17.cloudfront.net/videos/faculties/Engineering+and+the+Built+Environment/Mr+Kovilen+Reddy.mp4', 'video', '2022-04-11 09:27:23', 0),
(32, 'Mechanical and Mechatronics Engineering', 'Departments and Units', 'https://dh2dlbjd2qx17.cloudfront.net/videos/faculties/Engineering+and+the+Built+Environment/Dr+Louis+Beneke+-+(HEAD+OF+DEPARTMENT+MECHANICAL+%26+MECHATRONICS+ENGINEERING%2CMAIN+CAMPUS).mp4', 'video', '2022-04-11 09:28:07', 0),
(33, 'Industrial Engineering', 'Departments and Units', 'https://dh2dlbjd2qx17.cloudfront.net/videos/New+Videos/Dr+Tharaleko+Mokgokong.mp4', 'video', '2022-04-11 09:28:58', 0),
(34, 'Executive Dean', 'Office of the Dean', 'https://dh2dlbjd2qx17.cloudfront.net/videos/New+Videos/Prof+Maserumule-+dean+video.mp4', 'video', '2022-04-11 12:14:51', 0),
(35, 'Induction & Orientation', 'Office of the Dean', 'https://dh2dlbjd2qx17.cloudfront.net/videos/New+Videos/HUMANITIES+OVERVIEW+2022.mp4', 'video', '2022-04-11 12:16:04', 0),
(36, NULL, 'Office of the Dean', 'https://dh2dlbjd2qx17.cloudfront.net/videos/New+Videos/booklets/Humanities+First+year+2022.pdf', 'document', '2022-04-11 12:16:39', 0),
(37, 'Applied Languages', 'Departments', 'https://dh2dlbjd2qx17.cloudfront.net/videos/faculties/Humanities/Dr+Gary+Collins.mp4', 'video', '2022-04-11 12:18:40', 0),
(38, 'Law', 'Departments', 'https://dh2dlbjd2qx17.cloudfront.net/videos/faculties/Humanities/Prof+Dane+Ally.mp4', 'video', '2022-04-11 12:20:13', 0),
(39, 'Public Management', 'Departments', 'https://dh2dlbjd2qx17.cloudfront.net/videos/faculties/Humanities/Dr+Mogotsi+Maleka.mp4', 'video', '2022-04-11 12:20:57', 0),
(40, 'Safety & Secutiy Management', 'Departments', 'https://dh2dlbjd2qx17.cloudfront.net/videos/faculties/Humanities/Prof+Jacob+Mofokeng.mp4', 'video', '2022-04-11 12:21:32', 0),
(41, 'Educational Foundation', 'Departments', 'https://dh2dlbjd2qx17.cloudfront.net/videos/New+Videos/Prof+Thelma+de+Jager.mp4', 'video', '2022-04-11 12:24:53', 0),
(42, 'Journalism', 'Departments', 'https://dh2dlbjd2qx17.cloudfront.net/videos/faculties/Humanities/Dr+Lizette+Odendaal-(HEAD+OF+DEPARMENT+JOURNALISM%2CNORTH+CAMPUS).mp4', 'video', '2022-04-11 12:25:45', 0),
(43, 'Maths, Science & Business  Education', 'Departments', 'https://dh2dlbjd2qx17.cloudfront.net/videos/faculties/Humanities/Dr+Thomas+Sedumedi+-+(HEAD+OF+DEPARMENT+MATHEMATICS%2CSCIENCE+AND+BUSINESS+EDUCATION%2CNORTH+CAMPUS+).mp4', 'video', '2022-04-11 12:26:29', 0),
(44, 'Primary Education', 'Departments', 'https://dh2dlbjd2qx17.cloudfront.net/videos/faculties/Humanities/Prof+Lydia+Mphahlele+-+(HEAD+OF+DEPARMENT+PRIMARY+EDUCATION%2CNORTH+CAMPUS).mp4', 'video', '2022-04-11 12:27:05', 0),
(45, 'Technology & Vocational Education', 'Departments', 'https://dh2dlbjd2qx17.cloudfront.net/videos/faculties/Humanities/Dr+Ndlelehle+Skosana.mp4', 'video', '2022-04-11 12:27:36', 0),
(46, 'Integrated Communication', 'Departments', 'https://dh2dlbjd2qx17.cloudfront.net/videos/New+Videos/Nilton+Bernardo.mp4', 'video', '2022-04-11 12:28:10', 0),
(47, 'Executive Dean', 'Office of the Dean', 'https://dh2dlbjd2qx17.cloudfront.net/videos/faculties/ict/Welcome+21+Dean+ICT.mp4', 'video', '2022-04-11 12:54:32', 0),
(48, 'Induction & Orientation', 'Office of the Dean', 'https://dh2dlbjd2qx17.cloudfront.net/videos/New+Videos/TUT+ICT+ORIENTATION+MASTER+22.mp4', 'video', '2022-04-11 12:55:19', 0),
(49, NULL, 'Office of the Dean', 'https://dh2dlbjd2qx17.cloudfront.net/videos/New+Videos/booklets/First+Year+Booklet_2022_2.pdf', 'document', '2022-04-11 12:55:57', 0),
(50, 'First Year & Foundation', 'Departments and Units', 'https://dh2dlbjd2qx17.cloudfront.net/videos/faculties/ict/Mr+Mashitishi+Phurutsi.mp4', 'video', '2022-04-11 12:56:52', 0),
(51, 'Computer Science', 'Departments and Units', 'https://dh2dlbjd2qx17.cloudfront.net/videos/faculties/ict/Computer+Scrience_ProfJoey_Final5.mp4', 'video', '2022-04-11 12:57:39', 0),
(52, 'Computer Systems Engineering', 'Departments and Units', 'https://dh2dlbjd2qx17.cloudfront.net/videos/faculties/ict/Prof+Pius+Owolawi.mp4', 'video', '2022-04-11 12:58:16', 0),
(53, 'Informatics', 'Departments and Units', 'https://dh2dlbjd2qx17.cloudfront.net/videos/faculties/ict/Miss+Refilwe+Mogase.mp4', 'video', '2022-04-11 12:58:49', 0),
(54, 'Information Technology', 'Departments and Units', 'https://dh2dlbjd2qx17.cloudfront.net/videos/faculties/ict/Dr+Topside+Mathonsi.mp4', 'video', '2022-04-11 12:59:22', 0),
(55, 'Section Head: Computer Science', 'Departments and Units', 'https://dh2dlbjd2qx17.cloudfront.net/videos/faculties/ict/Mr+Vuyusile+Memani.mp4', 'video', '2022-04-11 12:59:56', 0),
(56, 'Registration', 'Campus and Support', 'https://dh2dlbjd2qx17.cloudfront.net/videos/campus-support/Registration_1(1).mp4', 'video', '2022-04-11 13:10:03', 0),
(57, 'Residences', 'Campus and Support', 'https://dh2dlbjd2qx17.cloudfront.net/videos/campus-support/Residences.mp4', 'video', '2022-04-11 13:10:37', 0),
(58, 'Executive Dean', 'Office of the Dean', 'https://dh2dlbjd2qx17.cloudfront.net/videos/New+Videos/Dr+Edgar+Nesamvuni.mp4', 'video', '2022-04-11 13:15:22', 0),
(59, 'Induction & Orientation', 'Office of the Dean', 'https://dh2dlbjd2qx17.cloudfront.net/videos/faculties/Management+Sciences/TUT+2021+Orientation+Pretoria-West+campus_2.mp4', 'video', '2022-04-11 13:15:58', 0),
(60, NULL, 'Office of the Dean', 'https://dh2dlbjd2qx17.cloudfront.net/videos/New+Videos/booklets/Management+Sciences+First+year+orienation+booklet_2022.pdf', 'document', '2022-04-11 13:16:23', 0),
(61, 'Tourism Management', 'Departments and Units', 'https://dh2dlbjd2qx17.cloudfront.net/videos/New+Videos/Prof+Ndivhuwo+Tshipala.mp4', 'video', '2022-04-11 13:17:12', 0),
(62, 'Hospitality Management', 'Departments and Units', 'https://dh2dlbjd2qx17.cloudfront.net/videos/New+Videos/Dr+Malome+Shai.mp4', 'video', '2022-04-11 13:17:36', 0),
(63, 'Management and Entrepreneurship ', 'Departments and Units', 'https://dh2dlbjd2qx17.cloudfront.net/videos/New+Videos/Dr+Patrick+Ebewo.mp4', 'video', '2022-04-11 13:18:26', 0),
(64, 'Business and Information and Management Servi', 'Departments and Units', 'https://dh2dlbjd2qx17.cloudfront.net/videos/faculties/Management+Sciences/Dr+Estelle+Bruhns-(HEAD+OF+DEPARMENT+BUSINESS+%26+INFORMATION+MANAGEMENT+SERVICES).mp4', 'video', '2022-04-11 13:18:59', 0),
(65, 'Operations Management', 'Departments and Units', 'https://dh2dlbjd2qx17.cloudfront.net/videos/New+Videos/Dr+Thomas+Munyai.mp4', 'video', '2022-04-11 13:19:48', 0),
(66, 'People Management and Development', 'Departments and Units', 'https://dh2dlbjd2qx17.cloudfront.net/videos/New+Videos/Dr+Leigh+Anne+Paul+Dachapalli.mp4', 'video', '2022-04-11 13:20:36', 0),
(67, 'Marketing, Supply Chain Management and Sport ', 'Departments and Units', 'https://dh2dlbjd2qx17.cloudfront.net/videos/New+Videos/Dr+Elizma+Wannenburg.mp4', 'video', '2022-04-11 13:21:00', 0),
(68, 'Adventure Tourism', 'Departments and Units', 'https://dh2dlbjd2qx17.cloudfront.net/videos/New+Videos/Diploma+in+Adventure+Tourism+Management.mp4', 'video', '2022-04-11 13:24:37', 0),
(69, 'Ecotourism', 'Departments and Units', 'https://dh2dlbjd2qx17.cloudfront.net/videos/New+Videos/Diploma+in+Ecotourism+Management.mp4', 'video', '2022-04-11 13:25:29', 0),
(70, 'Academic Excellence', 'Campus and Support', 'https://dh2dlbjd2qx17.cloudfront.net/videos/faculties/Management+Sciences/campus-support/Academic+Excellence+Office.mp4', 'video', '2022-04-11 13:25:48', 0),
(71, 'Executive Dean', 'Office of the Dean', 'https://dh2dlbjd2qx17.cloudfront.net/videos/faculties/Science+/Prof+Prince+Ngobeni+Dean+Science.mp4', 'video', '2022-04-11 13:34:12', 0),
(72, NULL, 'Office of the Dean', 'https://dh2dlbjd2qx17.cloudfront.net/img/video-cover.jpg', 'document', '2022-04-11 13:34:37', 0),
(73, 'Biomedical Sciences', 'Departments and Units', 'https://dh2dlbjd2qx17.cloudfront.net/videos/New+Videos/Dr+Carin+Boshoff+22.mp4', 'video', '2022-04-11 13:36:27', 0),
(74, 'Biotechnology and Food Technology', 'Departments and Units', 'https://dh2dlbjd2qx17.cloudfront.net/videos/faculties/Science+/Dr+Mathoto+Thaoge+-(HEAD+OF+DEPARMENT+BIOTECHNOLOGY+%26+FOOD+TECHNOLOGY%2CARCADIA).mp4', 'video', '2022-04-11 13:37:01', 0),
(75, 'Chemistry', 'Departments and Units', 'https://dh2dlbjd2qx17.cloudfront.net/videos/faculties/Science+/Dr+Jacqueline+Tembu+-+(+ACTING+HEAD+OF+DEPARMENT+CHEMISTRY%2CARCADIA).mp4', 'video', '2022-04-11 13:37:42', 0),
(76, 'Environmental, Water and Earth Sciences', 'Departments and Units', 'https://dh2dlbjd2qx17.cloudfront.net/videos/faculties/Science+/Dr+Lizzy+Monyatsi-(HEAD+OF+DEPARMENT+ENVIRONMENT+%2CWATER+%26+EARTH+SCIENCES).mp4', 'video', '2022-04-11 13:38:12', 0),
(77, 'Pharmaceutical Sciences', 'Departments and Units', 'https://dh2dlbjd2qx17.cloudfront.net/videos/faculties/Science+/Dr+Baatile+Komane-(HEAD+OF+DEPARMENT+PHARMACEUTICAL+SCIENCES).mp4', 'video', '2022-04-11 13:38:42', 0),
(78, 'Fire Technology', 'Departments and Units', 'https://dh2dlbjd2qx17.cloudfront.net/videos/faculties/Science+/Prof+Joseph+Asante+Fire+Technology.mp4', 'video', '2022-04-11 13:39:07', 0),
(79, 'Physics', 'Departments and Units', 'https://dh2dlbjd2qx17.cloudfront.net/videos/faculties/Science+/Prof+Joseph+Asante(DEPARTMENT+OF++Physics+MAIN+CAMPUS).mp4', 'video', '2022-04-11 13:39:59', 0),
(80, 'Animal Sciences', 'Departments and Units', 'https://dh2dlbjd2qx17.cloudfront.net/videos/faculties/Science+/Prof+Khathu+Nephawe-(HEAD+OF+DEPARMENT+ANIMAL+SCIENCE%2CARCADIA+CAMPUS).mp4', 'video', '2022-04-11 13:40:57', 0),
(81, 'Crop Sciences', 'Departments and Units', 'https://dh2dlbjd2qx17.cloudfront.net/videos/New+Videos/y2mate.com+-+Prof+Puffy+Soundy_480p.mp4', 'video', '2022-04-11 13:41:27', 0),
(82, 'Environmental Health', 'Departments and Units', 'https://dh2dlbjd2qx17.cloudfront.net/videos/faculties/Science+/Dr+Thabiso+Morodi+-(HEAD+OF+DEPARMENT+ENVIRONMENT+HEALTH%2CARCADIA).mp4', 'video', '2022-04-11 13:41:52', 0),
(83, 'Sport, Rehabilitation and Dental Sciences', 'Departments and Units', 'https://dh2dlbjd2qx17.cloudfront.net/videos/faculties/Science+/Prof+Yvonne+Paul-HEAD+OF+DEPARMENT+SPORT%2CREHABILATION+AND+SCIENCE(MAIN+CAMPUS).mp4', 'video', '2022-04-11 13:42:31', 0),
(84, 'Horticulture', 'Departments and Units', 'https://dh2dlbjd2qx17.cloudfront.net/videos/faculties/Science+/XiaoYing_Video_1614679296269.mp4', 'video', '2022-04-11 13:42:56', 0),
(85, 'Adelaide Tambo School  of Nursing', 'Departments and Units', 'https://dh2dlbjd2qx17.cloudfront.net/videos/faculties/Science+/Dr+Yolanda+Havenga.mp4', 'video', '2022-04-11 13:43:29', 0),
(86, 'Nature Conservation', 'Departments and Units', 'https://dh2dlbjd2qx17.cloudfront.net/videos/faculties/Science+/Prof+Brian+Reilly.mp4', 'video', '2022-04-11 13:44:56', 0),
(87, 'Executive Dean', 'Office of the Dean', 'https://dh2dlbjd2qx17.cloudfront.net/videos/New+Videos/TUT+DEans+Welcome+2022+V2+(1).mp4', 'video', '2022-04-12 07:49:52', 0),
(88, NULL, 'Office of the Dean', 'https://dh2dlbjd2qx17.cloudfront.net/videos/New+Videos/booklets/1st+year+Arts+2022+FINAL.pdf', 'document', '2022-04-12 07:50:22', 0),
(89, 'Design Studies', 'Departments and Units', 'https://dh2dlbjd2qx17.cloudfront.net/videos/New+Videos/Design+Studies+v2.mp4', 'video', '2022-04-12 07:52:10', 0),
(90, 'Fine and Studio Arts', 'Departments and Units', 'https://dh2dlbjd2qx17.cloudfront.net/videos/New+Videos/Fine+and+Studio+Art.mp4', 'video', '2022-04-12 07:52:46', 0),
(91, 'Interior Design', 'Departments and Units', 'https://dh2dlbjd2qx17.cloudfront.net/videos/New+Videos/y2mate.com+-+Interior+Design+v2_360p.mp4', 'video', '2022-04-12 07:53:11', 0),
(92, 'Performing Arts', 'Departments and Units', 'https://dh2dlbjd2qx17.cloudfront.net/videos/New+Videos/Performing+Arts.mp4', 'video', '2022-04-12 07:53:37', 0),
(93, 'Visual Communication', 'Departments and Units', 'https://dh2dlbjd2qx17.cloudfront.net/videos/New+Videos/Visual+Communication.mp4', 'video', '2022-04-12 07:54:02', 0);

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
-- Indexes for table `surveyanswer`
--
ALTER TABLE `surveyanswer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `answer` (`answer`);

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
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ans_que`
--
ALTER TABLE `ans_que`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

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
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132;

--
-- AUTO_INCREMENT for table `orientation`
--
ALTER TABLE `orientation`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `que_fac`
--
ALTER TABLE `que_fac`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `survey`
--
ALTER TABLE `survey`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=227;

--
-- AUTO_INCREMENT for table `surveyanswer`
--
ALTER TABLE `surveyanswer`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `surveyquestion`
--
ALTER TABLE `surveyquestion`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `tracking`
--
ALTER TABLE `tracking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `videos`
--
ALTER TABLE `videos`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ans_que`
--
ALTER TABLE `ans_que`
  ADD CONSTRAINT `FK_ansque_ans` FOREIGN KEY (`ans_id`) REFERENCES `surveyanswer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_ansque_que` FOREIGN KEY (`que_id`) REFERENCES `surveyquestion` (`id`);

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
-- Constraints for table `orientation`
--
ALTER TABLE `orientation`
  ADD CONSTRAINT `FK_orie_stud` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `que_fac`
--
ALTER TABLE `que_fac`
  ADD CONSTRAINT `fk_quefac_fac` FOREIGN KEY (`fac_id`) REFERENCES `faculty` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_quefac_que` FOREIGN KEY (`que_id`) REFERENCES `surveyquestion` (`id`);

--
-- Constraints for table `survey`
--
ALTER TABLE `survey`
  ADD CONSTRAINT `FK_que_answer` FOREIGN KEY (`question_id`) REFERENCES `surveyquestion` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_stud_surv` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tracking`
--
ALTER TABLE `tracking`
  ADD CONSTRAINT `FK_track_admn` FOREIGN KEY (`user_id`) REFERENCES `admin` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_track_student` FOREIGN KEY (`user_id`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

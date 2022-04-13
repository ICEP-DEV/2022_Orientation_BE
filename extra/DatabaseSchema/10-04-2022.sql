-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 11, 2022 at 12:54 AM
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
-- Table structure for table `blog`
--

CREATE TABLE `blog` (
  `id` int(100) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `created_on` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `path` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blog`
--

INSERT INTO `blog` (`id`, `title`, `description`, `author`, `created_on`, `path`) VALUES
(1, 'new blog', 'this is where the admin is going to post all blog content', 'Teckner', '2022-04-07 12:55:39.550830', 'image_1649328939496.jpg'),
(2, 'new blog', 'this is where the admin is going to post all blog content', 'Teckner', '2022-04-07 12:57:36.043838', 'video_1649329055915.mp4'),
(5, 'Tittle Test', 'Desc Test', 'Shezi', '2022-04-07 22:24:37.406038', 'image_1649363077393.png'),
(6, 'Tittle Test', 'Desc Test', 'Shezi', '2022-04-07 22:28:56.862914', 'image_1649363336856.png'),
(7, 'Tittle Test', 'Desc Test', 'Shezi', '2022-04-07 22:29:25.666806', 'image_1649363365634.png'),
(8, 'Tittle Test', 'Desc Test', 'Shezi', '2022-04-07 22:29:53.772469', 'image_1649363393768.png');

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
  `student_id` int(4) NOT NULL,
  `field` varchar(25) NOT NULL,
  `value` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orientation`
--

INSERT INTO `orientation` (`id`, `student_id`, `field`, `value`) VALUES
(86, 1, 'Initialize', 'true'),
(89, 1, 'StartOrientation', 'true');

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
  `videoClicks` int(11) NOT NULL,
  `survey` int(11) NOT NULL,
  `loggedin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stats`
--

INSERT INTO `stats` (`countUsers`, `viewNumVisitors`, `uploadVideo`, `videoCounts`, `videoClicks`, `survey`, `loggedin`) VALUES
(2, 0, 0, 0, 0, 5, 1);

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
(1, 217070554, 'Cebolenkosi', 'Shezi', 'cbshezi5@gmail.com', 'U2FsdGVkX1/pza39yVKOktMVlWCTOrybIWagMDOK4Xc=', 1, 1),
(2, 217070552, 'Daniel', 'Dlaba', '217070554@tut4life.ac.za', 'U2FsdGVkX1+nENRx7Ax6RqEE0sXL9Q72x5Ane9aLHm4=', 1, 0);

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
  `answer` varchar(100) NOT NULL
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

--
-- Dumping data for table `tracking`
--

INSERT INTO `tracking` (`id`, `user_id`, `activity`, `datetime`) VALUES
(1, 1, 'On Step One', '2022-04-10 22:14:40'),
(2, 1, 'On Step One', '2022-04-10 22:39:08'),
(3, 1, 'On Step One', '2022-04-10 22:39:12'),
(4, 1, 'On Step One', '2022-04-10 22:39:15'),
(5, 1, 'Campus clicked', '2022-04-10 22:39:18'),
(6, 1, 'On Step Two', '2022-04-10 22:39:19'),
(7, 1, 'On Step One', '2022-04-10 22:39:22'),
(8, 1, 'Campus clicked', '2022-04-10 22:39:22'),
(9, 1, 'On Step Two', '2022-04-10 22:39:23'),
(10, 1, 'On Step Two', '2022-04-10 22:39:27'),
(11, 1, 'On Step One', '2022-04-10 22:39:30'),
(12, 1, 'Campus clicked', '2022-04-10 22:39:31'),
(13, 1, 'On Step Two', '2022-04-10 22:39:31'),
(14, 1, 'Campus clicked', '2022-04-10 22:39:34'),
(15, 1, 'On Step One', '2022-04-10 22:39:38'),
(16, 1, 'Campus clicked', '2022-04-10 22:39:38'),
(17, 1, 'On Step Two', '2022-04-10 22:39:38'),
(18, 1, 'Campus clicked', '2022-04-10 22:39:41'),
(19, 1, 'On Step Two', '2022-04-10 22:39:42'),
(20, 1, 'On Step One', '2022-04-10 22:39:45'),
(21, 1, 'Campus clicked', '2022-04-10 22:39:46'),
(22, 1, 'On Step Two', '2022-04-10 22:39:46'),
(23, 1, 'Campus clicked', '2022-04-10 22:39:49'),
(24, 1, 'On Step Two', '2022-04-10 22:39:50'),
(25, 1, 'On Step One', '2022-04-10 22:39:53'),
(26, 1, 'Campus clicked', '2022-04-10 22:39:53'),
(27, 1, 'On Step Two', '2022-04-10 22:39:54'),
(28, 1, 'On Step Two', '2022-04-10 22:39:57'),
(29, 1, 'On Step One', '2022-04-10 22:40:01'),
(30, 1, 'Campus clicked', '2022-04-10 22:40:01'),
(31, 1, 'On Step Two', '2022-04-10 22:40:01'),
(32, 1, 'Faculty clicked', '2022-04-10 22:40:03'),
(33, 1, 'On Step Three', '2022-04-10 22:40:05'),
(34, 1, 'On Step One', '2022-04-10 22:40:08'),
(35, 1, 'Campus clicked', '2022-04-10 22:40:08'),
(36, 1, 'On Step Two', '2022-04-10 22:40:08'),
(37, 1, 'Faculty clicked', '2022-04-10 22:40:08'),
(38, 1, 'On Step Three', '2022-04-10 22:40:08'),
(39, 1, 'On Step One', '2022-04-10 22:40:23'),
(40, 1, 'Campus clicked', '2022-04-10 22:40:23'),
(41, 1, 'On Step Two', '2022-04-10 22:40:23'),
(42, 1, 'Faculty clicked', '2022-04-10 22:40:24'),
(43, 1, 'On Step Three', '2022-04-10 22:40:24'),
(44, 1, 'Campus clicked', '2022-04-10 22:40:35'),
(45, 1, 'On Step Two', '2022-04-10 22:40:37'),
(46, 1, 'On Step One', '2022-04-10 22:40:40'),
(47, 1, 'Campus clicked', '2022-04-10 22:40:40'),
(48, 1, 'On Step Two', '2022-04-10 22:40:40'),
(49, 1, 'Campus clicked', '2022-04-10 22:40:48'),
(50, 1, 'On Step Two', '2022-04-10 22:40:49'),
(51, 1, 'On Step One', '2022-04-10 22:40:52'),
(52, 1, 'Campus clicked', '2022-04-10 22:40:52'),
(53, 1, 'On Step Two', '2022-04-10 22:40:52'),
(54, 1, 'Faculty clicked', '2022-04-10 22:40:52'),
(55, 1, 'On Step Three', '2022-04-10 22:40:53'),
(56, 1, 'Campus clicked', '2022-04-10 22:41:10'),
(57, 1, 'On Step Two', '2022-04-10 22:41:11'),
(58, 1, 'Faculty clicked', '2022-04-10 22:41:16'),
(59, 1, 'On Step Three', '2022-04-10 22:41:18'),
(60, 1, 'On Step One', '2022-04-10 22:41:21'),
(61, 1, 'Campus clicked', '2022-04-10 22:41:22'),
(62, 1, 'On Step Two', '2022-04-10 22:41:22'),
(63, 1, 'Faculty clicked', '2022-04-10 22:41:22'),
(64, 1, 'On Step Three', '2022-04-10 22:41:22'),
(65, 1, 'On Step One', '2022-04-10 22:41:26'),
(66, 1, 'Campus clicked', '2022-04-10 22:41:26'),
(67, 1, 'On Step Two', '2022-04-10 22:41:27'),
(68, 1, 'Faculty clicked', '2022-04-10 22:41:27'),
(69, 1, 'On Step Three', '2022-04-10 22:41:27'),
(70, 1, 'Campus clicked', '2022-04-10 22:41:36'),
(71, 1, 'On Step One', '2022-04-10 22:41:41'),
(72, 1, 'Campus clicked', '2022-04-10 22:41:41'),
(73, 1, 'On Step Two', '2022-04-10 22:41:41'),
(74, 1, 'Faculty clicked', '2022-04-10 22:41:41'),
(75, 1, 'On Step Three', '2022-04-10 22:41:42'),
(76, 1, 'Campus clicked', '2022-04-10 22:41:48'),
(77, 1, 'On Step Two', '2022-04-10 22:41:51'),
(78, 1, 'On Step One', '2022-04-10 22:41:55'),
(79, 1, 'Campus clicked', '2022-04-10 22:41:55'),
(80, 1, 'On Step Two', '2022-04-10 22:41:55'),
(81, 1, 'Faculty clicked', '2022-04-10 22:41:58'),
(82, 1, 'On Step Three', '2022-04-10 22:42:00'),
(83, 1, 'On Step One', '2022-04-10 22:42:03'),
(84, 1, 'Campus clicked', '2022-04-10 22:42:03'),
(85, 1, 'On Step Two', '2022-04-10 22:42:03'),
(86, 1, 'Faculty clicked', '2022-04-10 22:42:03'),
(87, 1, 'On Step Three', '2022-04-10 22:42:03'),
(88, 1, 'On Step Four', '2022-04-10 22:42:07'),
(89, 1, 'On Step One', '2022-04-10 22:42:11'),
(90, 1, 'Campus clicked', '2022-04-10 22:42:11'),
(91, 1, 'On Step Two', '2022-04-10 22:42:11'),
(92, 1, 'Faculty clicked', '2022-04-10 22:42:11'),
(93, 1, 'On Step Three', '2022-04-10 22:42:12'),
(94, 1, 'Video played', '2022-04-10 22:42:12'),
(95, 1, 'Video played', '2022-04-10 22:42:12'),
(96, 1, 'On Step Four', '2022-04-10 22:42:12'),
(97, 1, 'On Step One', '2022-04-10 22:44:48'),
(98, 1, 'Campus clicked', '2022-04-10 22:44:48'),
(99, 1, 'On Step Two', '2022-04-10 22:44:48'),
(100, 1, 'Faculty clicked', '2022-04-10 22:44:49'),
(101, 1, 'On Step Three', '2022-04-10 22:44:49'),
(102, 1, 'Video played', '2022-04-10 22:44:49'),
(103, 1, 'Video played', '2022-04-10 22:44:49'),
(104, 1, 'On Step Four', '2022-04-10 22:44:49'),
(105, 1, 'On Step Five', '2022-04-10 22:45:23'),
(106, 1, 'On Step One', '2022-04-10 22:45:28'),
(107, 1, 'Campus clicked', '2022-04-10 22:45:28'),
(108, 1, 'On Step Two', '2022-04-10 22:45:29'),
(109, 1, 'Faculty clicked', '2022-04-10 22:45:29'),
(110, 1, 'On Step Three', '2022-04-10 22:45:29'),
(111, 1, 'Video played', '2022-04-10 22:45:29'),
(112, 1, 'Video played', '2022-04-10 22:45:29'),
(113, 1, 'On Step Four', '2022-04-10 22:45:29'),
(114, 1, 'On Step Five', '2022-04-10 22:45:30'),
(115, 1, 'Restared the Orientation', '2022-04-10 22:45:44'),
(116, 1, 'On Step One', '2022-04-10 22:45:49'),
(117, 1, 'Campus clicked', '2022-04-10 22:45:49'),
(118, 1, 'On Step Two', '2022-04-10 22:45:50'),
(119, 1, 'Faculty clicked', '2022-04-10 22:45:50'),
(120, 1, 'On Step Three', '2022-04-10 22:45:50'),
(121, 1, 'Video played', '2022-04-10 22:45:50'),
(122, 1, 'On Step Four', '2022-04-10 22:45:50'),
(123, 1, 'Video played', '2022-04-10 22:45:50'),
(124, 1, 'On Step Five', '2022-04-10 22:45:51'),
(125, 1, 'On Step One', '2022-04-10 22:46:51'),
(126, 1, 'Campus clicked', '2022-04-10 22:46:52'),
(127, 1, 'On Step Two', '2022-04-10 22:46:52'),
(128, 1, 'Faculty clicked', '2022-04-10 22:46:52'),
(129, 1, 'On Step Three', '2022-04-10 22:46:53'),
(130, 1, 'Video played', '2022-04-10 22:46:53'),
(131, 1, 'Video played', '2022-04-10 22:46:53'),
(132, 1, 'On Step Four', '2022-04-10 22:46:53'),
(133, 1, 'On Step Five', '2022-04-10 22:46:54'),
(134, 1, 'On Step One', '2022-04-10 22:47:15'),
(135, 1, 'Campus clicked', '2022-04-10 22:47:16'),
(136, 1, 'On Step Two', '2022-04-10 22:47:17'),
(137, 1, 'Faculty clicked', '2022-04-10 22:47:18'),
(138, 1, 'On Step Three', '2022-04-10 22:47:19'),
(139, 1, 'On Step Four', '2022-04-10 22:47:22'),
(140, 1, 'On Step Five', '2022-04-10 22:47:35'),
(141, 1, 'Restared the Orientation', '2022-04-10 22:47:39'),
(142, 1, 'On Step One', '2022-04-10 22:49:18'),
(143, 1, 'On Step One', '2022-04-10 22:49:22'),
(144, 1, 'On Step One', '2022-04-10 22:49:25');

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
-- AUTO_INCREMENT for table `blog`
--
ALTER TABLE `blog`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

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
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=152;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;

--
-- AUTO_INCREMENT for table `videos`
--
ALTER TABLE `videos`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

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
  ADD CONSTRAINT `FK_track_student` FOREIGN KEY (`user_id`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 12, 2022 at 12:12 PM
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

--
-- Indexes for dumped tables
--

--
-- Indexes for table `surveyquestion`
--
ALTER TABLE `surveyquestion`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `surveyquestion`
--
ALTER TABLE `surveyquestion`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

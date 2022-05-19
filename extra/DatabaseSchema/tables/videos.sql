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
(12, 'Prof Ben Van Wyk', 'Deputy Vice Chancellor', 'https://dh2dlbjd2qx17.cloudfront.net/videos/New+Videos/Prof+Ben+van+Wyk.mp4', 'video', '2022-04-08 11:36:33', 0),
(13, 'Brightspace', 'Learning Management System', 'https://dh2dlbjd2qx17.cloudfront.net/videos/general/Introduction+To+Brightspace.mp4', 'video', '2022-04-08 11:39:45', 0),
(14, 'Library', 'Library and Information Servic', 'https://dh2dlbjd2qx17.cloudfront.net/videos/general/Library+%26+Information+Services%2C+an+introduction.mp4', 'video', '2022-04-08 11:42:48', 0),
(15, 'Vaccination', 'Health and Wellness', 'https://dh2dlbjd2qx17.cloudfront.net/videos/iNew+Videos/Vaccination+_Vid.mp4', 'video', '2022-04-08 11:44:52', 0),
(16, 'Induction & Orientation', 'Office of the Dean', 'https://dh2dlbjd2qx17.cloudfront.net/videos/faculties/Economics+and+Finance/Faculty+of+Economics+and+Finance+TUT+Orientation+2021_2.mp4', 'video', '2022-04-08 11:53:23', 0),
(17, 'Student Development & Support', 'Campus and Support', 'https://dh2dlbjd2qx17.cloudfront.net/videos/campus-support/SDS+Orientation.mp4', 'video', '2022-04-08 11:56:44', 0),
(18, 'Health & Wellness', 'Campus and Support', 'https://dh2dlbjd2qx17.cloudfront.net/videos/general/Health+%26+Wellness%2C+an+Introduction.mp4', 'video', '2022-04-08 11:57:42', 0),
(19, 'MyTUTor, What is a Study Guide?', 'Campus and Support', 'https://dh2dlbjd2qx17.cloudfront.net/videos/general/What+is+a+study+guide.mp4', 'video', '2022-04-08 11:59:29', 0),
(20, 'Student Ombudsman', 'Campus and Support', 'https://dh2dlbjd2qx17.cloudfront.net/videos/campus-support/OMBUDSMAN+INTERVIEW.mp4', 'video', '2022-04-11 07:02:48', 0),
(21, 'Higher Health', 'Campus and Support', 'https://dh2dlbjd2qx17.cloudfront.net/videos/general/Welcome+Class+of+2021-+your+health+is+in+your+hands.mp4', 'video', '2022-04-11 07:04:20', 0),
(22, 'SGLD', 'Campus and Support', 'https://dh2dlbjd2qx17.cloudfront.net/videos/campus-support/Student+Governance+%26+Leadership+Development.mp4', 'video', '2022-04-11 07:05:29', 0),
(23, 'Extracurricular Development', 'Campus and Support', 'https://dh2dlbjd2qx17.cloudfront.net/videos/New+Videos/Jack+Sibanyoni.mp4', 'video', '2022-04-11 07:06:16', 0),
(24, 'Executive Dean', 'Office of the Dean', 'https://dh2dlbjd2qx17.cloudfront.net/videos/faculties/Engineering+and+the+Built+Environment/Dr+Grace+Kanakana+Katumba.mp4', 'video', '2022-04-11 07:16:35', 0),
(25, NULL, 'Office of the Dean', 'https://dh2dlbjd2qx17.cloudfront.net/videos/New+Videos/booklets/FEBE_2022+first+year+guide.pdf', 'document', '2022-04-11 07:18:06', 0),
(26, 'Architecture and Industrial Design', 'Departments and Units', 'https://dh2dlbjd2qx17.cloudfront.net/videos/faculties/Engineering+and+the+Built+Environment/Mr+Mostert+van+Schoor.mp4', 'video', '2022-04-11 07:20:22', 0),
(27, 'Building Sciences', 'Departments and Units', 'https://dh2dlbjd2qx17.cloudfront.net/videos/faculties/Engineering+and+the+Built+Environment/Mr+Nazeem+Ansary.mp4', 'video', '2022-04-11 07:21:22', 0),
(28, 'Chemical, Metallurgical and Materials Enginee', 'Departments and Units', 'https://dh2dlbjd2qx17.cloudfront.net/videos/faculties/Engineering+and+the+Built+Environment/Dr+Mxolisi+Brendon+Shongwe.mp4', 'video', '2022-04-11 07:22:06', 0),
(29, 'Civil Engineering', 'Departments and Units', 'https://dh2dlbjd2qx17.cloudfront.net/videos/faculties/Engineering+and+the+Built+Environment/Prof+Jacques+Snyman.mp4', 'video', '2022-04-11 07:24:15', 0),
(30, 'Electrical Engineering', 'Departments and Units', 'https://dh2dlbjd2qx17.cloudfront.net/videos/faculties/Engineering+and+the+Built+Environment/Prof+Thomas+Olwal.mp4', 'video', '2022-04-11 07:26:40', 0),
(31, 'Geomatics', 'Departments and Units', 'https://dh2dlbjd2qx17.cloudfront.net/videos/faculties/Engineering+and+the+Built+Environment/Mr+Kovilen+Reddy.mp4', 'video', '2022-04-11 07:27:23', 0),
(32, 'Mechanical and Mechatronics Engineering', 'Departments and Units', 'https://dh2dlbjd2qx17.cloudfront.net/videos/faculties/Engineering+and+the+Built+Environment/Dr+Louis+Beneke+-+(HEAD+OF+DEPARTMENT+MECHANICAL+%26+MECHATRONICS+ENGINEERING%2CMAIN+CAMPUS).mp4', 'video', '2022-04-11 07:28:07', 0),
(33, 'Industrial Engineering', 'Departments and Units', 'https://dh2dlbjd2qx17.cloudfront.net/videos/New+Videos/Dr+Tharaleko+Mokgokong.mp4', 'video', '2022-04-11 07:28:58', 0),
(34, 'Executive Dean', 'Office of the Dean', 'https://dh2dlbjd2qx17.cloudfront.net/videos/New+Videos/Prof+Maserumule-+dean+video.mp4', 'video', '2022-04-11 10:14:51', 0),
(35, 'Induction & Orientation', 'Office of the Dean', 'https://dh2dlbjd2qx17.cloudfront.net/videos/New+Videos/HUMANITIES+OVERVIEW+2022.mp4', 'video', '2022-04-11 10:16:04', 0),
(36, NULL, 'Office of the Dean', 'https://dh2dlbjd2qx17.cloudfront.net/videos/New+Videos/booklets/Humanities+First+year+2022.pdf', 'document', '2022-04-11 10:16:39', 0),
(37, 'Applied Languages', 'Departments', 'https://dh2dlbjd2qx17.cloudfront.net/videos/faculties/Humanities/Dr+Gary+Collins.mp4', 'video', '2022-04-11 10:18:40', 0),
(38, 'Law', 'Departments', 'https://dh2dlbjd2qx17.cloudfront.net/videos/faculties/Humanities/Prof+Dane+Ally.mp4', 'video', '2022-04-11 10:20:13', 0),
(39, 'Public Management', 'Departments', 'https://dh2dlbjd2qx17.cloudfront.net/videos/faculties/Humanities/Dr+Mogotsi+Maleka.mp4', 'video', '2022-04-11 10:20:57', 0),
(40, 'Safety & Secutiy Management', 'Departments', 'https://dh2dlbjd2qx17.cloudfront.net/videos/faculties/Humanities/Prof+Jacob+Mofokeng.mp4', 'video', '2022-04-11 10:21:32', 0),
(41, 'Educational Foundation', 'Departments', 'https://dh2dlbjd2qx17.cloudfront.net/videos/New+Videos/Prof+Thelma+de+Jager.mp4', 'video', '2022-04-11 10:24:53', 0),
(42, 'Journalism', 'Departments', 'https://dh2dlbjd2qx17.cloudfront.net/videos/faculties/Humanities/Dr+Lizette+Odendaal-(HEAD+OF+DEPARMENT+JOURNALISM%2CNORTH+CAMPUS).mp4', 'video', '2022-04-11 10:25:45', 0),
(43, 'Maths, Science & Business  Education', 'Departments', 'https://dh2dlbjd2qx17.cloudfront.net/videos/faculties/Humanities/Dr+Thomas+Sedumedi+-+(HEAD+OF+DEPARMENT+MATHEMATICS%2CSCIENCE+AND+BUSINESS+EDUCATION%2CNORTH+CAMPUS+).mp4', 'video', '2022-04-11 10:26:29', 0),
(44, 'Primary Education', 'Departments', 'https://dh2dlbjd2qx17.cloudfront.net/videos/faculties/Humanities/Prof+Lydia+Mphahlele+-+(HEAD+OF+DEPARMENT+PRIMARY+EDUCATION%2CNORTH+CAMPUS).mp4', 'video', '2022-04-11 10:27:05', 0),
(45, 'Technology & Vocational Education', 'Departments', 'https://dh2dlbjd2qx17.cloudfront.net/videos/faculties/Humanities/Dr+Ndlelehle+Skosana.mp4', 'video', '2022-04-11 10:27:36', 0),
(46, 'Integrated Communication', 'Departments', 'https://dh2dlbjd2qx17.cloudfront.net/videos/New+Videos/Nilton+Bernardo.mp4', 'video', '2022-04-11 10:28:10', 0),
(47, 'Executive Dean', 'Office of the Dean', 'https://dh2dlbjd2qx17.cloudfront.net/videos/faculties/ict/Welcome+21+Dean+ICT.mp4', 'video', '2022-04-11 10:54:32', 0),
(48, 'Induction & Orientation', 'Office of the Dean', 'https://dh2dlbjd2qx17.cloudfront.net/videos/New+Videos/TUT+ICT+ORIENTATION+MASTER+22.mp4', 'video', '2022-04-11 10:55:19', 0),
(49, NULL, 'Office of the Dean', 'https://dh2dlbjd2qx17.cloudfront.net/videos/New+Videos/booklets/First+Year+Booklet_2022_2.pdf', 'document', '2022-04-11 10:55:57', 0),
(50, 'First Year & Foundation', 'Departments and Units', 'https://dh2dlbjd2qx17.cloudfront.net/videos/faculties/ict/Mr+Mashitishi+Phurutsi.mp4', 'video', '2022-04-11 10:56:52', 0),
(51, 'Computer Science', 'Departments and Units', 'https://dh2dlbjd2qx17.cloudfront.net/videos/faculties/ict/Computer+Scrience_ProfJoey_Final5.mp4', 'video', '2022-04-11 10:57:39', 0),
(52, 'Computer Systems Engineering', 'Departments and Units', 'https://dh2dlbjd2qx17.cloudfront.net/videos/faculties/ict/Prof+Pius+Owolawi.mp4', 'video', '2022-04-11 10:58:16', 0),
(53, 'Informatics', 'Departments and Units', 'https://dh2dlbjd2qx17.cloudfront.net/videos/faculties/ict/Miss+Refilwe+Mogase.mp4', 'video', '2022-04-11 10:58:49', 0),
(54, 'Information Technology', 'Departments and Units', 'https://dh2dlbjd2qx17.cloudfront.net/videos/faculties/ict/Dr+Topside+Mathonsi.mp4', 'video', '2022-04-11 10:59:22', 0),
(55, 'Section Head: Computer Science', 'Departments and Units', 'https://dh2dlbjd2qx17.cloudfront.net/videos/faculties/ict/Mr+Vuyusile+Memani.mp4', 'video', '2022-04-11 10:59:56', 0),
(56, 'Registration', 'Campus and Support', 'https://dh2dlbjd2qx17.cloudfront.net/videos/campus-support/Registration_1(1).mp4', 'video', '2022-04-11 11:10:03', 0),
(57, 'Residences', 'Campus and Support', 'https://dh2dlbjd2qx17.cloudfront.net/videos/campus-support/Residences.mp4', 'video', '2022-04-11 11:10:37', 0),
(58, 'Executive Dean', 'Office of the Dean', 'https://dh2dlbjd2qx17.cloudfront.net/videos/New+Videos/Dr+Edgar+Nesamvuni.mp4', 'video', '2022-04-11 11:15:22', 0),
(59, 'Induction & Orientation', 'Office of the Dean', 'https://dh2dlbjd2qx17.cloudfront.net/videos/faculties/Management+Sciences/TUT+2021+Orientation+Pretoria-West+campus_2.mp4', 'video', '2022-04-11 11:15:58', 0),
(60, NULL, 'Office of the Dean', 'https://dh2dlbjd2qx17.cloudfront.net/videos/New+Videos/booklets/Management+Sciences+First+year+orienation+booklet_2022.pdf', 'document', '2022-04-11 11:16:23', 0),
(61, 'Tourism Management', 'Departments and Units', 'https://dh2dlbjd2qx17.cloudfront.net/videos/New+Videos/Prof+Ndivhuwo+Tshipala.mp4', 'video', '2022-04-11 11:17:12', 0),
(62, 'Hospitality Management', 'Departments and Units', 'https://dh2dlbjd2qx17.cloudfront.net/videos/New+Videos/Dr+Malome+Shai.mp4', 'video', '2022-04-11 11:17:36', 0),
(63, 'Management and Entrepreneurship ', 'Departments and Units', 'https://dh2dlbjd2qx17.cloudfront.net/videos/New+Videos/Dr+Patrick+Ebewo.mp4', 'video', '2022-04-11 11:18:26', 0),
(64, 'Business and Information and Management Servi', 'Departments and Units', 'https://dh2dlbjd2qx17.cloudfront.net/videos/faculties/Management+Sciences/Dr+Estelle+Bruhns-(HEAD+OF+DEPARMENT+BUSINESS+%26+INFORMATION+MANAGEMENT+SERVICES).mp4', 'video', '2022-04-11 11:18:59', 0),
(65, 'Operations Management', 'Departments and Units', 'https://dh2dlbjd2qx17.cloudfront.net/videos/New+Videos/Dr+Thomas+Munyai.mp4', 'video', '2022-04-11 11:19:48', 0),
(66, 'People Management and Development', 'Departments and Units', 'https://dh2dlbjd2qx17.cloudfront.net/videos/New+Videos/Dr+Leigh+Anne+Paul+Dachapalli.mp4', 'video', '2022-04-11 11:20:36', 0),
(67, 'Marketing, Supply Chain Management and Sport ', 'Departments and Units', 'https://dh2dlbjd2qx17.cloudfront.net/videos/New+Videos/Dr+Elizma+Wannenburg.mp4', 'video', '2022-04-11 11:21:00', 0),
(68, 'Adventure Tourism', 'Departments and Units', 'https://dh2dlbjd2qx17.cloudfront.net/videos/New+Videos/Diploma+in+Adventure+Tourism+Management.mp4', 'video', '2022-04-11 11:24:37', 0),
(69, 'Ecotourism', 'Departments and Units', 'https://dh2dlbjd2qx17.cloudfront.net/videos/New+Videos/Diploma+in+Ecotourism+Management.mp4', 'video', '2022-04-11 11:25:29', 0),
(70, 'Academic Excellence', 'Campus and Support', 'https://dh2dlbjd2qx17.cloudfront.net/videos/faculties/Management+Sciences/campus-support/Academic+Excellence+Office.mp4', 'video', '2022-04-11 11:25:48', 0),
(71, 'Executive Dean', 'Office of the Dean', 'https://dh2dlbjd2qx17.cloudfront.net/videos/faculties/Science+/Prof+Prince+Ngobeni+Dean+Science.mp4', 'video', '2022-04-11 11:34:12', 0),
(72, NULL, 'Office of the Dean', 'https://dh2dlbjd2qx17.cloudfront.net/img/video-cover.jpg', 'document', '2022-04-11 11:34:37', 0),
(73, 'Biomedical Sciences', 'Departments and Units', 'https://dh2dlbjd2qx17.cloudfront.net/videos/New+Videos/Dr+Carin+Boshoff+22.mp4', 'video', '2022-04-11 11:36:27', 0),
(74, 'Biotechnology and Food Technology', 'Departments and Units', 'https://dh2dlbjd2qx17.cloudfront.net/videos/faculties/Science+/Dr+Mathoto+Thaoge+-(HEAD+OF+DEPARMENT+BIOTECHNOLOGY+%26+FOOD+TECHNOLOGY%2CARCADIA).mp4', 'video', '2022-04-11 11:37:01', 0),
(75, 'Chemistry', 'Departments and Units', 'https://dh2dlbjd2qx17.cloudfront.net/videos/faculties/Science+/Dr+Jacqueline+Tembu+-+(+ACTING+HEAD+OF+DEPARMENT+CHEMISTRY%2CARCADIA).mp4', 'video', '2022-04-11 11:37:42', 0),
(76, 'Environmental, Water and Earth Sciences', 'Departments and Units', 'https://dh2dlbjd2qx17.cloudfront.net/videos/faculties/Science+/Dr+Lizzy+Monyatsi-(HEAD+OF+DEPARMENT+ENVIRONMENT+%2CWATER+%26+EARTH+SCIENCES).mp4', 'video', '2022-04-11 11:38:12', 0),
(77, 'Pharmaceutical Sciences', 'Departments and Units', 'https://dh2dlbjd2qx17.cloudfront.net/videos/faculties/Science+/Dr+Baatile+Komane-(HEAD+OF+DEPARMENT+PHARMACEUTICAL+SCIENCES).mp4', 'video', '2022-04-11 11:38:42', 0),
(78, 'Fire Technology', 'Departments and Units', 'https://dh2dlbjd2qx17.cloudfront.net/videos/faculties/Science+/Prof+Joseph+Asante+Fire+Technology.mp4', 'video', '2022-04-11 11:39:07', 0),
(79, 'Physics', 'Departments and Units', 'https://dh2dlbjd2qx17.cloudfront.net/videos/faculties/Science+/Prof+Joseph+Asante(DEPARTMENT+OF++Physics+MAIN+CAMPUS).mp4', 'video', '2022-04-11 11:39:59', 0),
(80, 'Animal Sciences', 'Departments and Units', 'https://dh2dlbjd2qx17.cloudfront.net/videos/faculties/Science+/Prof+Khathu+Nephawe-(HEAD+OF+DEPARMENT+ANIMAL+SCIENCE%2CARCADIA+CAMPUS).mp4', 'video', '2022-04-11 11:40:57', 0),
(81, 'Crop Sciences', 'Departments and Units', 'https://dh2dlbjd2qx17.cloudfront.net/videos/New+Videos/y2mate.com+-+Prof+Puffy+Soundy_480p.mp4', 'video', '2022-04-11 11:41:27', 0),
(82, 'Environmental Health', 'Departments and Units', 'https://dh2dlbjd2qx17.cloudfront.net/videos/faculties/Science+/Dr+Thabiso+Morodi+-(HEAD+OF+DEPARMENT+ENVIRONMENT+HEALTH%2CARCADIA).mp4', 'video', '2022-04-11 11:41:52', 0),
(83, 'Sport, Rehabilitation and Dental Sciences', 'Departments and Units', 'https://dh2dlbjd2qx17.cloudfront.net/videos/faculties/Science+/Prof+Yvonne+Paul-HEAD+OF+DEPARMENT+SPORT%2CREHABILATION+AND+SCIENCE(MAIN+CAMPUS).mp4', 'video', '2022-04-11 11:42:31', 0),
(84, 'Horticulture', 'Departments and Units', 'https://dh2dlbjd2qx17.cloudfront.net/videos/faculties/Science+/XiaoYing_Video_1614679296269.mp4', 'video', '2022-04-11 11:42:56', 0),
(85, 'Adelaide Tambo School  of Nursing', 'Departments and Units', 'https://dh2dlbjd2qx17.cloudfront.net/videos/faculties/Science+/Dr+Yolanda+Havenga.mp4', 'video', '2022-04-11 11:43:29', 0),
(86, 'Nature Conservation', 'Departments and Units', 'https://dh2dlbjd2qx17.cloudfront.net/videos/faculties/Science+/Prof+Brian+Reilly.mp4', 'video', '2022-04-11 11:44:56', 0),
(87, 'Executive Dean', 'Office of the Dean', 'https://dh2dlbjd2qx17.cloudfront.net/videos/New+Videos/TUT+DEans+Welcome+2022+V2+(1).mp4', 'video', '2022-04-12 05:49:52', 0),
(88, NULL, 'Office of the Dean', 'https://dh2dlbjd2qx17.cloudfront.net/videos/New+Videos/booklets/1st+year+Arts+2022+FINAL.pdf', 'document', '2022-04-12 05:50:22', 0),
(89, 'Design Studies', 'Departments and Units', 'https://dh2dlbjd2qx17.cloudfront.net/videos/New+Videos/Design+Studies+v2.mp4', 'video', '2022-04-12 05:52:10', 0),
(90, 'Fine and Studio Arts', 'Departments and Units', 'https://dh2dlbjd2qx17.cloudfront.net/videos/New+Videos/Fine+and+Studio+Art.mp4', 'video', '2022-04-12 05:52:46', 0),
(91, 'Interior Design', 'Departments and Units', 'https://dh2dlbjd2qx17.cloudfront.net/videos/New+Videos/y2mate.com+-+Interior+Design+v2_360p.mp4', 'video', '2022-04-12 05:53:11', 0),
(92, 'Performing Arts', 'Departments and Units', 'https://dh2dlbjd2qx17.cloudfront.net/videos/New+Videos/Performing+Arts.mp4', 'video', '2022-04-12 05:53:37', 0),
(93, 'Visual Communication', 'Departments and Units', 'https://dh2dlbjd2qx17.cloudfront.net/videos/New+Videos/Visual+Communication.mp4', 'video', '2022-04-12 05:54:02', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `videos`
--
ALTER TABLE `videos`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

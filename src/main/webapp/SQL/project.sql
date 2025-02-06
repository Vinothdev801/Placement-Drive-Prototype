-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 06, 2025 at 10:54 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `sno` int(11) NOT NULL,
  `aname` text NOT NULL,
  `ausername` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`sno`, `aname`, `ausername`, `password`) VALUES
(1, 'Admin1', 'Admin', 'Admin@1234');

-- --------------------------------------------------------

--
-- Table structure for table `appliedcompany`
--

CREATE TABLE `appliedcompany` (
  `id` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  `regno` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appliedcompany`
--

INSERT INTO `appliedcompany` (`id`, `cid`, `regno`) VALUES
(1, 1, 'RA2332241010424'),
(2, 5, 'RA2332241010390'),
(5, 6, 'RA2332241010390'),
(6, 1, 'RA2332241010390');

-- --------------------------------------------------------

--
-- Table structure for table `recruitments`
--

CREATE TABLE `recruitments` (
  `cid` int(25) NOT NULL,
  `company_name` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `role` text NOT NULL,
  `eligibility` text NOT NULL,
  `skill` text NOT NULL,
  `batch` varchar(50) NOT NULL,
  `package` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `recruitments`
--

INSERT INTO `recruitments` (`cid`, `company_name`, `email`, `role`, `eligibility`, `skill`, `batch`, `package`) VALUES
(1, 'TCS', 'xyzcompaney@yahoo.com', 'Java developer', 'minimum 60% required from 10th, 12th and ug.\r\ncourse: MCA, M.sc CS and IT, B.tech.', 'java,spring,servlets.', '2025 passed out', '9.4 LPA'),
(2, 'Accenture', 'accenturedev@acc.ocm', 'ASE', '60 % in all ', 'java', '2025', '7'),
(3, 'Infosys', 'infosysjobplace@info.dev.com', 'software developer', '60% required', 'java or python or c++', '2025', '9.5LPA'),
(4, 'Micron', 'Micronrecruit@gmail.com', 'Software Engineer ', '70% required', 'Java, c,c++, problem-solving,etc.', '2025', '14 LPA'),
(5, 'TCS', 'tcs@gmail.com', 'Game dev', '60 % required', 'C++', '2025', '23 LPA'),
(6, 'Wipro', 'wipro@gmail.com', 'Associate Software', '65% Required in 10th,12th,UG', 'C,C++,Java', '2025Batch', '7.8LPA');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `regno` varchar(16) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(20) NOT NULL,
  `X` float NOT NULL,
  `Xll` float NOT NULL,
  `ugcgpa` float NOT NULL,
  `pgcgpa` float NOT NULL,
  `skills` text NOT NULL,
  `arrear` text NOT NULL,
  `course` varchar(30) NOT NULL,
  `gender` text NOT NULL,
  `dob` varchar(10) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `resume` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`regno`, `name`, `email`, `password`, `X`, `Xll`, `ugcgpa`, `pgcgpa`, `skills`, `arrear`, `course`, `gender`, `dob`, `photo`, `resume`) VALUES
('407', 'santhosh', 'santhos1789@gmail.com', '1234', 80, 80, 7.8, 7.8, 'java, c++,c', 'NO ARREAR', 'MCA', 'MALE', '2002-12-10', 'http://sang.photo', 'http://sangresume'),
('RA2332241010390', 'Vinoth A', 'testmail@gmail.com', '1234', 83.6, 65, 7.985, 8.78, 'java    ', 'NO ARREAR', 'MCA', 'MALE', '2003-09-16', 'http://avphoto', 'http://avresume'),
('RA2332241010424', 'Karthik Raja L', 'karthikraja0903@gmail.com', 'Karthik', 82, 65, 80, 8.43, 'Python    ', 'NO ARREAR', 'MCA', 'MALE', '2003-03-16', 'https://karthik/', 'https://karthikresume/');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD UNIQUE KEY `UNIQUE` (`sno`);

--
-- Indexes for table `appliedcompany`
--
ALTER TABLE `appliedcompany`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `recruitments`
--
ALTER TABLE `recruitments`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`regno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `appliedcompany`
--
ALTER TABLE `appliedcompany`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `recruitments`
--
ALTER TABLE `recruitments`
  MODIFY `cid` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

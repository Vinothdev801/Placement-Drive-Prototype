-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 06, 2025 at 11:00 AM
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

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`sno`, `aname`, `ausername`, `password`) VALUES
(1, 'Admin1', 'Admin', 'Admin@1234');

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

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`regno`, `name`, `email`, `password`, `X`, `Xll`, `ugcgpa`, `pgcgpa`, `skills`, `arrear`, `course`, `gender`, `dob`, `photo`, `resume`) VALUES
('407', 'santhosh', 'santhos1789@gmail.com', '1234', 80, 80, 7.8, 7.8, 'java, c++,c', 'NO ARREAR', 'MCA', 'MALE', '2002-12-10', 'http://sang.photo', 'http://sangresume');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

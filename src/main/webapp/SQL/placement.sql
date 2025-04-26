
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

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
('407', 'santhosh', 'santhos1789@gmail.com', '1234', 80, 80, 7.8, 7.8, 'java, c++,c', 'NO ARREAR', 'MCA', 'MALE', '2002-12-10', 'http://sang.photo', 'http://sangresume');

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



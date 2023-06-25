-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 25, 2023 at 11:23 AM
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
-- Database: `clinic_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `id` int(11) UNSIGNED NOT NULL,
  `patient_id` int(14) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `doctor` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `quan` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `info`
--

CREATE TABLE `info` (
  `id` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `material` varchar(20) NOT NULL,
  `description` text NOT NULL,
  `packaging` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `info`
--

INSERT INTO `info` (`id`, `pid`, `material`, `description`, `packaging`) VALUES
(1, 1, 'OTC022401', 'Pain Management: Acetaminophen PM Extra-Strength Caplets, 500 mg, 100/Bottle', '1 BT'),
(2, 1, 'OTC022401', '	Pain Management: Acetaminophen PM Extra-Strength Caplets, 500 mg, 100/Bottle', '144/CS'),
(3, 1, 'OTC022401', 'Pain Management: Acetaminophen PM Extra-Strength Caplets, 500 mg, 100/Bottle', '1 EA'),
(4, 2, 'OTC022401:Pain Manag', '', ''),
(5, 3, 'OTC02240', 'Pain Management: Omega-3 PM Extra-Strength Caplets, 500 mg', '100/Bottle/'),
(6, 1, 'OTC022401', ' Pain Management: Paracetamol PM Extra-Strength Caplets, 250 mg', ' 10/tablets'),
(7, 2, 'OTC052301', ' Vitamin: Omega-3 Extra-Strength Caplets, 500 mg, 100/Bottle', '1 EA'),
(8, 3, 'OTC022401', ' Pain Management: Acetaminophen PM Extra-Strength Caplets, 500 mg, 100/Bottle', '144/CS'),
(9, 4, 'OTC022331', 'Pain Management: Acetaminophen PM Extra-Strength Caplets, 457mg, 100/Bottle', ' 144/CS'),
(10, 5, 'OTC044401', ' Pain Management: Acetaminophen PM Extra-Strength Caplets, 500 mg, 20/Tablets', ' 1 BT'),
(11, 6, 'OTC022423', ' Pain Management: Paracetamol PM Extra-Strength Caplets, 24/Caplets', '144/CS'),
(12, 9, 'OTC022401', 'b', 'c');

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `id` int(14) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `dob` date NOT NULL,
  `address` varchar(200) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `past_medical_history` text DEFAULT NULL,
  `current_medical_issues` text DEFAULT NULL,
  `family_medical_history` text DEFAULT NULL,
  `lab_test_results` text DEFAULT NULL,
  `imaging_test_results` text DEFAULT NULL,
  `current_medications` text DEFAULT NULL,
  `past_medications` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `prescription`
--

CREATE TABLE `prescription` (
  `id` int(11) UNSIGNED NOT NULL,
  `patient_name` varchar(50) NOT NULL,
  `medication_name` varchar(50) NOT NULL,
  `dosage` varchar(20) NOT NULL,
  `frequency` varchar(20) NOT NULL,
  `instructions` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `pid` int(11) NOT NULL,
  `pname` text NOT NULL,
  `quan` int(11) NOT NULL,
  `price` float NOT NULL,
  `exp_date` date NOT NULL,
  `prod_img` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`pid`, `pname`, `quan`, `price`, `exp_date`, `prod_img`) VALUES
(1, 'Panadol Extra', 100, 15, '2024-04-12', '1687550314.jpg'),
(2, 'Omega', 100, 20, '2025-07-18', '1687550402.jpg'),
(3, 'Ibuprofen Tablets', 70, 10, '2028-08-08', '1687553486.jpg'),
(4, 'Augmentin', 80, 13, '2026-11-03', '1687553804.jpg'),
(5, 'Lactodel', 100, 12, '2027-12-12', '1687553956.jpg'),
(6, 'Panadol Cold & Flu', 100, 14, '2025-03-04', '1687554091.jpg'),
(7, 'Baby Johnsson Shampoo', 50, 16, '2026-06-06', '1687554251.jpg'),
(8, 'Baby Johnson Powder', 70, 14, '2028-05-05', '1687554391.jpg'),
(9, 'Pampers', 100, 15, '2028-08-08', '1687554491.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `purchase`
--

CREATE TABLE `purchase` (
  `order_id` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `quan` int(11) NOT NULL,
  `tot_price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `purchase`
--

INSERT INTO `purchase` (`order_id`, `pid`, `uid`, `quan`, `tot_price`) VALUES
(1, 2, 2, 2, 40),
(2, 2, 2, 2, 40);

-- --------------------------------------------------------

--
-- Table structure for table `specs`
--

CREATE TABLE `specs` (
  `pid` int(11) NOT NULL,
  `hpis` text NOT NULL,
  `healthcare` text NOT NULL,
  `latex` text NOT NULL,
  `route` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `specs`
--

INSERT INTO `specs` (`pid`, `hpis`, `healthcare`, `latex`, `route`) VALUES
(1, '999_200_40_0', 'Yes', 'Yes', 'Topical'),
(2, '888_200_40_0', 'No', 'Yes', 'Oral'),
(3, '777_200_40_0', 'Yes', 'Yes', 'Oral'),
(1, '999_200_40_0', 'Yes', 'Yes', 'Oral'),
(2, '888_200_40_0', 'Yes', 'Yes', 'Oral'),
(3, '666_200_40_0', 'Yes', 'Yes', 'Oral'),
(4, '584_200_40_0', 'Yes', 'Yes', 'Oral'),
(5, '626_230_40_0', 'Yes', 'Yes', 'Oral'),
(6, '', 'Yes', 'Yes', 'Oral'),
(9, '556_200_40_0', 'No', 'Yes', 'None');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `fname` varchar(20) NOT NULL,
  `lname` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `passwd` varchar(255) NOT NULL,
  `role` varchar(10) NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `fname`, `lname`, `email`, `passwd`, `role`) VALUES
(1, 'khaled', 'ay7aga', 'k@a.c', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 'user'),
(2, 'farah', 'ay7aga', 'f@a.c', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 'admin'),
(3, 'yasmin', 'abdelfattah', 'y@abdelfattah.com', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', 'admin'),
(4, 'toqa', 'hatem', 't@hotmail.com', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 'user'),
(5, 'k', 'd', 'kd@a.c', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', 'doctor');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_id` (`patient_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cid`),
  ADD KEY `uid` (`uid`),
  ADD KEY `pid` (`pid`);

--
-- Indexes for table `info`
--
ALTER TABLE `info`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pid` (`pid`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `prescription`
--
ALTER TABLE `prescription`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`pid`);

--
-- Indexes for table `purchase`
--
ALTER TABLE `purchase`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `pid` (`pid`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `specs`
--
ALTER TABLE `specs`
  ADD KEY `pid` (`pid`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `info`
--
ALTER TABLE `info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `prescription`
--
ALTER TABLE `prescription`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `purchase`
--
ALTER TABLE `purchase`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`id`);

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`);

--
-- Constraints for table `info`
--
ALTER TABLE `info`
  ADD CONSTRAINT `info_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`);

--
-- Constraints for table `purchase`
--
ALTER TABLE `purchase`
  ADD CONSTRAINT `purchase_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`),
  ADD CONSTRAINT `purchase_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `user` (`id`);

--
-- Constraints for table `specs`
--
ALTER TABLE `specs`
  ADD CONSTRAINT `specs_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

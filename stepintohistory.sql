-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 19, 2023 at 08:31 PM
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
-- Database: `stepintohistory`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `account_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `administrator` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `address_id` int(11) NOT NULL,
  `addressline1` varchar(50) NOT NULL,
  `addressline2` varchar(50) DEFAULT NULL,
  `city` varchar(50) NOT NULL,
  `country` int(10) NOT NULL,
  `postcode` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `author`
--

CREATE TABLE `author` (
  `author_id` int(11) NOT NULL,
  `name` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `book_id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `author` int(11) NOT NULL,
  `genre` int(11) NOT NULL,
  `description` varchar(50) NOT NULL,
  `year` year(4) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contactdetails`
--

CREATE TABLE `contactdetails` (
  `ContactDetails_ID` int(11) NOT NULL,
  `HomePhone` int(20) DEFAULT NULL,
  `MobilePhone` int(20) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `country_id` int(11) NOT NULL,
  `countryname` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`country_id`, `countryname`) VALUES
(1, 'England'),
(2, 'Scotland'),
(3, 'Wales'),
(4, 'Northern Ireland');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_ID` int(11) NOT NULL,
  `Title` int(1) NOT NULL,
  `Name` int(11) NOT NULL,
  `Address` int(11) NOT NULL,
  `Contact` int(11) NOT NULL,
  `Account_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dnatesting`
--

CREATE TABLE `dnatesting` (
  `dnatesting_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `serviceaccess` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `document`
--

CREATE TABLE `document` (
  `document_id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `author` int(11) NOT NULL,
  `description` varchar(50) NOT NULL,
  `year` year(4) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `familytree`
--

CREATE TABLE `familytree` (
  `familytree_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `serviceaccess` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `genre`
--

CREATE TABLE `genre` (
  `genre_id` int(11) NOT NULL,
  `genre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `guidedtour`
--

CREATE TABLE `guidedtour` (
  `tour_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `duration` time NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `capacity` int(11) NOT NULL,
  `location` int(11) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobrole`
--

CREATE TABLE `jobrole` (
  `job_ID` int(11) NOT NULL,
  `jobtitle` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `library`
--

CREATE TABLE `library` (
  `library_id` int(11) NOT NULL,
  `book` int(11) NOT NULL,
  `document` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `name`
--

CREATE TABLE `name` (
  `name_id` int(11) NOT NULL,
  `forname` varchar(50) DEFAULT NULL,
  `surname` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `order_id` int(11) NOT NULL,
  `product` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `privatelecture`
--

CREATE TABLE `privatelecture` (
  `lecture_id` int(11) NOT NULL,
  `topic` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `bookingfee` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `producename` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscription`
--

CREATE TABLE `subscription` (
  `subscription_id` int(11) NOT NULL,
  `issusedate` date NOT NULL,
  `deliverytype` int(11) NOT NULL,
  `cost` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `title`
--

CREATE TABLE `title` (
  `title_id` int(11) NOT NULL,
  `titlename` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `title`
--

INSERT INTO `title` (`title_id`, `titlename`) VALUES
(1, 'Mr'),
(2, 'Ms'),
(3, 'Miss'),
(4, 'Mrs');

-- --------------------------------------------------------

--
-- Table structure for table `workshopandcourse`
--

CREATE TABLE `workshopandcourse` (
  `workshopandcourse_id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `duration` time NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `capacity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`account_id`);

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`address_id`);

--
-- Indexes for table `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`author_id`);

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`book_id`);

--
-- Indexes for table `contactdetails`
--
ALTER TABLE `contactdetails`
  ADD PRIMARY KEY (`ContactDetails_ID`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`country_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_ID`),
  ADD UNIQUE KEY `Name` (`Name`,`Address`,`Contact`,`Account_ID`),
  ADD KEY `Account_ID` (`Account_ID`),
  ADD KEY `Address` (`Address`),
  ADD KEY `Contact` (`Contact`),
  ADD KEY `Title` (`Title`);

--
-- Indexes for table `dnatesting`
--
ALTER TABLE `dnatesting`
  ADD PRIMARY KEY (`dnatesting_id`);

--
-- Indexes for table `document`
--
ALTER TABLE `document`
  ADD PRIMARY KEY (`document_id`);

--
-- Indexes for table `familytree`
--
ALTER TABLE `familytree`
  ADD PRIMARY KEY (`familytree_id`);

--
-- Indexes for table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`genre_id`);

--
-- Indexes for table `guidedtour`
--
ALTER TABLE `guidedtour`
  ADD PRIMARY KEY (`tour_id`);

--
-- Indexes for table `jobrole`
--
ALTER TABLE `jobrole`
  ADD PRIMARY KEY (`job_ID`);

--
-- Indexes for table `library`
--
ALTER TABLE `library`
  ADD PRIMARY KEY (`library_id`);

--
-- Indexes for table `name`
--
ALTER TABLE `name`
  ADD PRIMARY KEY (`name_id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `privatelecture`
--
ALTER TABLE `privatelecture`
  ADD PRIMARY KEY (`lecture_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `subscription`
--
ALTER TABLE `subscription`
  ADD PRIMARY KEY (`subscription_id`);

--
-- Indexes for table `title`
--
ALTER TABLE `title`
  ADD PRIMARY KEY (`title_id`);

--
-- Indexes for table `workshopandcourse`
--
ALTER TABLE `workshopandcourse`
  ADD PRIMARY KEY (`workshopandcourse_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `account_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `author`
--
ALTER TABLE `author`
  MODIFY `author_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `book`
--
ALTER TABLE `book`
  MODIFY `book_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contactdetails`
--
ALTER TABLE `contactdetails`
  MODIFY `ContactDetails_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `country_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dnatesting`
--
ALTER TABLE `dnatesting`
  MODIFY `dnatesting_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `document`
--
ALTER TABLE `document`
  MODIFY `document_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `familytree`
--
ALTER TABLE `familytree`
  MODIFY `familytree_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `genre`
--
ALTER TABLE `genre`
  MODIFY `genre_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `guidedtour`
--
ALTER TABLE `guidedtour`
  MODIFY `tour_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobrole`
--
ALTER TABLE `jobrole`
  MODIFY `job_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `library`
--
ALTER TABLE `library`
  MODIFY `library_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `name`
--
ALTER TABLE `name`
  MODIFY `name_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `privatelecture`
--
ALTER TABLE `privatelecture`
  MODIFY `lecture_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscription`
--
ALTER TABLE `subscription`
  MODIFY `subscription_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `title`
--
ALTER TABLE `title`
  MODIFY `title_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `workshopandcourse`
--
ALTER TABLE `workshopandcourse`
  MODIFY `workshopandcourse_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`Account_ID`) REFERENCES `account` (`account_id`),
  ADD CONSTRAINT `customer_ibfk_2` FOREIGN KEY (`Address`) REFERENCES `address` (`address_id`),
  ADD CONSTRAINT `customer_ibfk_3` FOREIGN KEY (`Contact`) REFERENCES `contactdetails` (`ContactDetails_ID`),
  ADD CONSTRAINT `customer_ibfk_4` FOREIGN KEY (`Name`) REFERENCES `name` (`name_id`),
  ADD CONSTRAINT `customer_ibfk_5` FOREIGN KEY (`Title`) REFERENCES `title` (`title_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

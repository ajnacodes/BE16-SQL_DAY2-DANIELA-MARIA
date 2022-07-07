-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 06, 2022 at 11:40 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `library_database`
--
CREATE DATABASE IF NOT EXISTS `library_database` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `library_database`;

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `id` int(11) NOT NULL,
  `title` varchar(40) DEFAULT NULL,
  `author` varchar(40) DEFAULT NULL,
  `publisher` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`id`, `title`, `author`, `publisher`) VALUES
(1, 'Harry Potter', 'J.K.Rowling', 'Eskimo'),
(2, 'Witcher', 'A. Sapkovskiy', 'Rosman'),
(3, 'Night Watch', 'S. Lukianenko', 'Eskimo');

-- --------------------------------------------------------

--
-- Table structure for table `library`
--

CREATE TABLE `library` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `address` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `library`
--

INSERT INTO `library` (`id`, `name`, `address`) VALUES
(1, 'library', 'in austria'),
(2, 'another library', 'also in austria'),
(3, 'smt', 'vienna');

-- --------------------------------------------------------

--
-- Table structure for table `many_books`
--

CREATE TABLE `many_books` (
  `id` int(11) NOT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `fk_rent` int(11) DEFAULT NULL,
  `fk_book` int(11) DEFAULT NULL,
  `fk_library` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `many_books`
--

INSERT INTO `many_books` (`id`, `fk_user`, `fk_rent`, `fk_book`, `fk_library`) VALUES
(1, 1, 2, 3, 1),
(2, 2, 2, 2, 3),
(3, 3, 3, 1, 1),
(4, 1, 2, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `rent`
--

CREATE TABLE `rent` (
  `id` int(11) NOT NULL,
  `rent_start` date DEFAULT NULL,
  `rent_end` date DEFAULT NULL,
  `price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rent`
--

INSERT INTO `rent` (`id`, `rent_start`, `rent_end`, `price`) VALUES
(1, '2022-06-30', '2022-07-20', 10),
(2, '2022-06-20', '2022-07-10', 20),
(3, '2022-07-03', '2022-07-15', 10);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `fname` varchar(20) NOT NULL,
  `lname` varchar(40) NOT NULL,
  `address` varchar(200) NOT NULL,
  `date_of_birth` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `fname`, `lname`, `address`, `date_of_birth`) VALUES
(1, 'Maria', 'Z', 'somewhere in vienna', '1996-11-28'),
(2, 'Stefan', 'K', 'also in vienna', '1983-06-30'),
(3, 'Dominik', 'H', 'still in vienna', '1993-05-20');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `library`
--
ALTER TABLE `library`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `many_books`
--
ALTER TABLE `many_books`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user` (`fk_user`),
  ADD KEY `fk_rent` (`fk_rent`),
  ADD KEY `fk_book` (`fk_book`),
  ADD KEY `fk_library` (`fk_library`);

--
-- Indexes for table `rent`
--
ALTER TABLE `rent`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `book`
--
ALTER TABLE `book`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `library`
--
ALTER TABLE `library`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `many_books`
--
ALTER TABLE `many_books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `rent`
--
ALTER TABLE `rent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `many_books`
--
ALTER TABLE `many_books`
  ADD CONSTRAINT `many_books_ibfk_1` FOREIGN KEY (`fk_user`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `many_books_ibfk_2` FOREIGN KEY (`fk_rent`) REFERENCES `rent` (`id`),
  ADD CONSTRAINT `many_books_ibfk_3` FOREIGN KEY (`fk_book`) REFERENCES `book` (`id`),
  ADD CONSTRAINT `many_books_ibfk_4` FOREIGN KEY (`fk_library`) REFERENCES `library` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

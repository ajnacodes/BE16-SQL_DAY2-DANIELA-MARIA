-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 06, 2022 at 03:25 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `transport_company`
--

-- --------------------------------------------------------

--
-- Table structure for table `busses`
--

CREATE TABLE `busses` (
  `busroute_id` int(11) NOT NULL,
  `plate_nr` int(11) DEFAULT NULL,
  `bus_model` varchar(30) DEFAULT NULL,
  `seat_capacity` int(11) DEFAULT NULL,
  `driver_name` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `busses`
--

INSERT INTO `busses` (`busroute_id`, `plate_nr`, `bus_model`, `seat_capacity`, `driver_name`) VALUES
(1, 12345678, '28Tr Solaris', 50, 1),
(2, 87654321, '32Tr SOR', 70, 2);

-- --------------------------------------------------------

--
-- Table structure for table `bus_stations`
--

CREATE TABLE `bus_stations` (
  `station_id` int(11) NOT NULL,
  `city_name` varchar(20) DEFAULT NULL,
  `station_address` varchar(30) DEFAULT NULL,
  `phone_nr` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bus_stations`
--

INSERT INTO `bus_stations` (`station_id`, `city_name`, `station_address`, `phone_nr`) VALUES
(1, 'City1', 'Address1', 1234555),
(2, 'City2', 'Address2', 1235655),
(3, 'City3', 'Address3', 1934555),
(4, 'City4', 'Address4', 11234555);

-- --------------------------------------------------------

--
-- Table structure for table `drivers`
--

CREATE TABLE `drivers` (
  `driver_id` int(11) NOT NULL,
  `first_name` char(20) DEFAULT NULL,
  `last_name` char(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `drivers`
--

INSERT INTO `drivers` (`driver_id`, `first_name`, `last_name`) VALUES
(1, 'Salim', 'Casey'),
(2, 'Coby', 'Floyd');

-- --------------------------------------------------------

--
-- Table structure for table `routes`
--

CREATE TABLE `routes` (
  `route_id` int(11) NOT NULL,
  `route_km` int(11) DEFAULT NULL,
  `route_source` int(11) DEFAULT NULL,
  `route_destination` int(11) DEFAULT NULL,
  `bus_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `routes`
--

INSERT INTO `routes` (`route_id`, `route_km`, `route_source`, `route_destination`, `bus_id`) VALUES
(1, 500, 1, 2, 1),
(2, 800, 1, 3, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `busses`
--
ALTER TABLE `busses`
  ADD PRIMARY KEY (`busroute_id`),
  ADD KEY `driver_name` (`driver_name`);

--
-- Indexes for table `bus_stations`
--
ALTER TABLE `bus_stations`
  ADD PRIMARY KEY (`station_id`);

--
-- Indexes for table `drivers`
--
ALTER TABLE `drivers`
  ADD PRIMARY KEY (`driver_id`);

--
-- Indexes for table `routes`
--
ALTER TABLE `routes`
  ADD PRIMARY KEY (`route_id`),
  ADD KEY `route_source` (`route_source`),
  ADD KEY `route_destination` (`route_destination`),
  ADD KEY `bus_id` (`bus_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `busses`
--
ALTER TABLE `busses`
  MODIFY `busroute_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `bus_stations`
--
ALTER TABLE `bus_stations`
  MODIFY `station_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `drivers`
--
ALTER TABLE `drivers`
  MODIFY `driver_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `routes`
--
ALTER TABLE `routes`
  MODIFY `route_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `busses`
--
ALTER TABLE `busses`
  ADD CONSTRAINT `busses_ibfk_1` FOREIGN KEY (`driver_name`) REFERENCES `drivers` (`driver_id`);

--
-- Constraints for table `routes`
--
ALTER TABLE `routes`
  ADD CONSTRAINT `routes_ibfk_1` FOREIGN KEY (`route_source`) REFERENCES `bus_stations` (`station_id`),
  ADD CONSTRAINT `routes_ibfk_2` FOREIGN KEY (`route_destination`) REFERENCES `bus_stations` (`station_id`),
  ADD CONSTRAINT `routes_ibfk_3` FOREIGN KEY (`bus_id`) REFERENCES `busses` (`busroute_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

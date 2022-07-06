-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 06, 2022 at 01:35 PM
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
CREATE DATABASE IF NOT EXISTS `transport_company` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `transport_company`;

-- --------------------------------------------------------

--
-- Table structure for table `bus`
--

CREATE TABLE `bus` (
  `bus_id` int(11) NOT NULL,
  `plate_number` varchar(30) NOT NULL,
  `model_bus` varchar(30) NOT NULL,
  `capacity_passengers` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bus`
--

INSERT INTO `bus` (`bus_id`, `plate_number`, `model_bus`, `capacity_passengers`) VALUES
(1, 'FK-850-AJ', 'Mercedes', 35),
(2, 'DO-840-IK', 'BMW', 43),
(3, 'W-85680A', 'Audi', 40),
(4, 'B-333-LM', 'Opel', 29),
(5, 'BZ-860-WM', 'VW', 65);

-- --------------------------------------------------------

--
-- Table structure for table `bus_route_line`
--

CREATE TABLE `bus_route_line` (
  `bus_route_line_id` int(11) NOT NULL,
  `fk_bus_id` int(11) NOT NULL,
  `fk_route_line_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bus_route_line`
--

INSERT INTO `bus_route_line` (`bus_route_line_id`, `fk_bus_id`, `fk_route_line_id`) VALUES
(1, 3, 4),
(2, 2, 5),
(3, 5, 5),
(4, 3, 4);

-- --------------------------------------------------------

--
-- Table structure for table `bus_station`
--

CREATE TABLE `bus_station` (
  `bus_station_id` int(11) NOT NULL,
  `order_number` int(4) NOT NULL,
  `name_station` varchar(50) NOT NULL,
  `telefon_number` int(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bus_station`
--

INSERT INTO `bus_station` (`bus_station_id`, `order_number`, `name_station`, `telefon_number`) VALUES
(1, 25, 'Stephansplatz', 1855551),
(2, 22, 'Neubaugasse', 1684455),
(3, 18, 'Enkplatz', 1755551);

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `city_id` int(11) NOT NULL,
  `city_name` varchar(50) NOT NULL,
  `city_adress` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`city_id`, `city_name`, `city_adress`) VALUES
(1, 'Vienna', 'Rotenturmgasse'),
(2, 'Vienna', 'Simmeringer Hauptstrasse'),
(3, 'Vienna', 'Daumegasse');

-- --------------------------------------------------------

--
-- Table structure for table `driver`
--

CREATE TABLE `driver` (
  `driver_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `birth_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `driver`
--

INSERT INTO `driver` (`driver_id`, `first_name`, `last_name`, `birth_date`) VALUES
(1, 'Branko', 'Bijelic', '1965-04-06'),
(2, 'Alex', 'Muller', '1985-08-30'),
(3, 'Yakup', 'Schreiner', '2002-08-08'),
(4, 'Domaj', 'Sabti', '1990-02-24'),
(5, 'Stefan', 'Friedrich', '1985-06-08'),
(26, 'Claire', 'Emtage', '1967-09-17'),
(27, 'Conn', 'Hacksby', '1959-11-29'),
(28, 'Mead', 'Pinchin', '1971-01-22'),
(29, 'Dick', 'Fowell', '1963-02-07'),
(30, 'Berte', 'Drife', '1979-07-27'),
(31, 'Major', 'Batman', '1978-08-07'),
(32, 'Immanuel', 'Chidler', '1954-07-06'),
(33, 'Theodore', 'Brito', '1954-02-15'),
(34, 'Kerrie', 'Bignold', '1978-09-12'),
(35, 'Oates', 'Wareham', '1973-12-10');

-- --------------------------------------------------------

--
-- Table structure for table `driver_bus`
--

CREATE TABLE `driver_bus` (
  `driver_bus_id` int(11) NOT NULL,
  `fk_driver_id` int(11) NOT NULL,
  `fk_bus_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `driver_bus`
--

INSERT INTO `driver_bus` (`driver_bus_id`, `fk_driver_id`, `fk_bus_id`) VALUES
(1, 1, 1),
(2, 3, 4),
(3, 5, 2),
(9, 2, 5);

-- --------------------------------------------------------

--
-- Table structure for table `routes_station_city`
--

CREATE TABLE `routes_station_city` (
  `routes_station_city_id` int(11) NOT NULL,
  `fk_bus_station_id` int(11) NOT NULL,
  `fk_city_id` int(11) NOT NULL,
  `fk_routes_station_city_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `routes_station_city`
--

INSERT INTO `routes_station_city` (`routes_station_city_id`, `fk_bus_station_id`, `fk_city_id`, `fk_routes_station_city_id`) VALUES
(1, 1, 1, 4),
(2, 1, 1, 4),
(3, 2, 3, 1),
(4, 2, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `route_line`
--

CREATE TABLE `route_line` (
  `route_line_id` int(11) NOT NULL,
  `route_code` int(11) NOT NULL,
  `distance_km` int(11) NOT NULL,
  `source_company` varchar(50) DEFAULT NULL,
  `destination` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `route_line`
--

INSERT INTO `route_line` (`route_line_id`, `route_code`, `distance_km`, `source_company`, `destination`) VALUES
(1, 3, 20, 'Wienerlinien', 'Simmering'),
(2, 4, 18, 'Wienerlinien', 'Hütteldorf'),
(3, 11, 8, 'Nachbarreisen', 'Vorgartenstrasse'),
(4, 6, 19, 'Ottoreisen', 'Landstrasse'),
(5, 110, 4, 'Hellireisen', 'Westbahnhof');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bus`
--
ALTER TABLE `bus`
  ADD PRIMARY KEY (`bus_id`);

--
-- Indexes for table `bus_route_line`
--
ALTER TABLE `bus_route_line`
  ADD PRIMARY KEY (`bus_route_line_id`),
  ADD KEY `fk_route_line_id` (`fk_route_line_id`),
  ADD KEY `fk_bus_id` (`fk_bus_id`);

--
-- Indexes for table `bus_station`
--
ALTER TABLE `bus_station`
  ADD PRIMARY KEY (`bus_station_id`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`city_id`);

--
-- Indexes for table `driver`
--
ALTER TABLE `driver`
  ADD PRIMARY KEY (`driver_id`);

--
-- Indexes for table `driver_bus`
--
ALTER TABLE `driver_bus`
  ADD PRIMARY KEY (`driver_bus_id`),
  ADD UNIQUE KEY `fk_driver_id` (`fk_driver_id`),
  ADD UNIQUE KEY `fk_bus_id` (`fk_bus_id`);

--
-- Indexes for table `routes_station_city`
--
ALTER TABLE `routes_station_city`
  ADD PRIMARY KEY (`routes_station_city_id`),
  ADD KEY `fk_bus_station_id` (`fk_bus_station_id`),
  ADD KEY `fk_city_id` (`fk_city_id`),
  ADD KEY `fk_routes_station_city_id` (`fk_routes_station_city_id`);

--
-- Indexes for table `route_line`
--
ALTER TABLE `route_line`
  ADD PRIMARY KEY (`route_line_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bus`
--
ALTER TABLE `bus`
  MODIFY `bus_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `bus_route_line`
--
ALTER TABLE `bus_route_line`
  MODIFY `bus_route_line_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `bus_station`
--
ALTER TABLE `bus_station`
  MODIFY `bus_station_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `city_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `driver`
--
ALTER TABLE `driver`
  MODIFY `driver_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `driver_bus`
--
ALTER TABLE `driver_bus`
  MODIFY `driver_bus_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `routes_station_city`
--
ALTER TABLE `routes_station_city`
  MODIFY `routes_station_city_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `route_line`
--
ALTER TABLE `route_line`
  MODIFY `route_line_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bus_route_line`
--
ALTER TABLE `bus_route_line`
  ADD CONSTRAINT `bus_route_line_ibfk_1` FOREIGN KEY (`fk_route_line_id`) REFERENCES `route_line` (`route_line_id`),
  ADD CONSTRAINT `bus_route_line_ibfk_2` FOREIGN KEY (`fk_bus_id`) REFERENCES `bus` (`bus_id`);

--
-- Constraints for table `driver_bus`
--
ALTER TABLE `driver_bus`
  ADD CONSTRAINT `driver_bus_ibfk_1` FOREIGN KEY (`fk_driver_id`) REFERENCES `driver` (`driver_id`),
  ADD CONSTRAINT `driver_bus_ibfk_2` FOREIGN KEY (`fk_bus_id`) REFERENCES `bus` (`bus_id`);

--
-- Constraints for table `routes_station_city`
--
ALTER TABLE `routes_station_city`
  ADD CONSTRAINT `routes_station_city_ibfk_1` FOREIGN KEY (`fk_bus_station_id`) REFERENCES `bus_station` (`bus_station_id`),
  ADD CONSTRAINT `routes_station_city_ibfk_2` FOREIGN KEY (`fk_city_id`) REFERENCES `city` (`city_id`),
  ADD CONSTRAINT `routes_station_city_ibfk_3` FOREIGN KEY (`fk_routes_station_city_id`) REFERENCES `route_line` (`route_line_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


-- ALTER TABLE `tableName`
--   MODIFY `column name for the PRIMARY KEY` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;


Query Selector 


SELECT driver.first_name, driver.last_name, bus.plate_number, bus.model_bus, route_line.route_code, route_line.distance_km, bus_station.order_number, bus_station.name_station

FROM driver
JOIN driver_bus ON driver.driver_id = driver_bus.driver_bus_id
JOIN bus ON driver_bus.fk_bus_id = bus.bus_id
JOIN bus_route_line ON bus.bus_id = bus_route_line.bus_route_line_id
JOIN route_line ON bus_route_line.fk_bus_id = route_line.route_line_id
JOIN routes_station_city ON route_line.route_line_id = routes_station_city.fk_city_id
JOIN bus_station ON routes_station_city.routes_station_city_id = bus_station.bus_station_id
-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 23, 2024 at 06:36 AM
-- Server version: 8.0.39
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sistema_votacion`
--

-- --------------------------------------------------------

--
-- Table structure for table `candidates`
--

CREATE TABLE `candidates` (
  `CandidateId` int NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Party` varchar(255) DEFAULT NULL,
  `Province` varchar(255) DEFAULT NULL,
  `CreatedAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `UpdatedAt` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `candidates`
--

INSERT INTO `candidates` (`CandidateId`, `Name`, `Party`, `Province`, `CreatedAt`, `UpdatedAt`) VALUES
(1, 'Yasiel Gomez', 'Patria', 'Panamá', '2024-11-23 01:21:08', '2024-11-23 01:21:08'),
(2, 'Francisco Herrera', 'Democrático', 'Chiriquí', '2024-11-23 01:21:08', '2024-11-23 01:21:08'),
(3, 'Ivan Wu', 'Comunista', 'Colón', '2024-11-23 01:21:08', '2024-11-23 01:21:08');

-- --------------------------------------------------------

--
-- Table structure for table `provinces`
--

CREATE TABLE `provinces` (
  `ProvinceId` int NOT NULL,
  `Name` varchar(255) NOT NULL,
  `CreatedAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `UpdatedAt` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `provinces`
--

INSERT INTO `provinces` (`ProvinceId`, `Name`, `CreatedAt`, `UpdatedAt`) VALUES
(1, 'Bocas del Toro', '2024-11-23 01:15:59', '2024-11-23 01:15:59'),
(2, 'Coclé', '2024-11-23 01:15:59', '2024-11-23 01:15:59'),
(3, 'Colón', '2024-11-23 01:15:59', '2024-11-23 01:15:59'),
(4, 'Chiriquí', '2024-11-23 01:15:59', '2024-11-23 01:15:59'),
(5, 'Darién', '2024-11-23 01:15:59', '2024-11-23 01:15:59'),
(6, 'Herrera', '2024-11-23 01:15:59', '2024-11-23 01:15:59'),
(7, 'Los Santos', '2024-11-23 01:15:59', '2024-11-23 01:15:59'),
(8, 'Panamá', '2024-11-23 01:15:59', '2024-11-23 01:15:59'),
(9, 'Panamá Oeste', '2024-11-23 01:15:59', '2024-11-23 01:15:59'),
(10, 'Veraguas', '2024-11-23 01:15:59', '2024-11-23 01:15:59');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `UserId` int NOT NULL,
  `Username` varchar(255) NOT NULL,
  `PasswordHash` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `IsVerified` tinyint(1) DEFAULT '0',
  `CreatedAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `UpdatedAt` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserId`, `Username`, `PasswordHash`, `Email`, `IsVerified`, `CreatedAt`, `UpdatedAt`) VALUES
(1, 'admin', '240be518fabd2724ddb6f04eeb1da5967448d7e831c08c8fa822809f74c720a9', 'admin@example.com', 1, '2024-11-23 01:22:28', '2024-11-23 01:22:28');

-- --------------------------------------------------------

--
-- Table structure for table `votes`
--

CREATE TABLE `votes` (
  `VoteId` int NOT NULL,
  `UserId` int DEFAULT NULL,
  `CandidateId` int DEFAULT NULL,
  `Province` varchar(255) DEFAULT NULL,
  `VoteDate` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `candidates`
--
ALTER TABLE `candidates`
  ADD PRIMARY KEY (`CandidateId`);

--
-- Indexes for table `provinces`
--
ALTER TABLE `provinces`
  ADD PRIMARY KEY (`ProvinceId`),
  ADD UNIQUE KEY `Name` (`Name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserId`),
  ADD UNIQUE KEY `Username` (`Username`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indexes for table `votes`
--
ALTER TABLE `votes`
  ADD PRIMARY KEY (`VoteId`),
  ADD KEY `UserId` (`UserId`),
  ADD KEY `CandidateId` (`CandidateId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `candidates`
--
ALTER TABLE `candidates`
  MODIFY `CandidateId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `provinces`
--
ALTER TABLE `provinces`
  MODIFY `ProvinceId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `UserId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `votes`
--
ALTER TABLE `votes`
  MODIFY `VoteId` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `votes`
--
ALTER TABLE `votes`
  ADD CONSTRAINT `votes_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `users` (`UserId`),
  ADD CONSTRAINT `votes_ibfk_2` FOREIGN KEY (`CandidateId`) REFERENCES `candidates` (`CandidateId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

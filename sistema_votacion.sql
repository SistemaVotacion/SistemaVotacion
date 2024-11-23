-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 23, 2024 at 06:36 AM
-- Server version: 8.0.39
-- PHP Version: 8.1.10
Use master
go

create database RegistroDeVoto
go

use RegistroDeVoto
go

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: sistema_votacion
--

-- --------------------------------------------------------

--
-- Table structure for table candidates
--

CREATE TABLE candidates (
  CandidateId int NOT NULL,
  Name varchar(255) NOT NULL,
  Party varchar(255) DEFAULT NULL,
  Province varchar(255) DEFAULT NULL,
) 
go

--
-- Dumping data for table candidates
--

INSERT INTO candidates (CandidateId, Name, Party, Province) VALUES
(1, 'Yasiel Gomez', 'Patria', 'Panamá'),
(2, 'Francisco Herrera', 'Democrático', 'Chiriquí'),
(3, 'Ivan Wu', 'Comunista', 'Colón');

--
-- Table structure for table provinces
--

CREATE TABLE provinces (
  ProvinceId int NOT NULL,
  Name varchar(255) NOT NULL
  )

--
-- Dumping data for table provinces
--

INSERT INTO provinces (ProvinceId, Name) VALUES
(1, 'Bocas del Toro'),
(2, 'Coclé'),
(3, 'Colón'),
(4, 'Chiriquí'),
(5, 'Darién'),
(6, 'Herrera'),
(7, 'Los Santos'),
(8, 'Panamá'),
(9, 'Veraguas')
go

CREATE TABLE votes (
  VoteId int NOT NULL,
  CandidateId int DEFAULT NULL,
  Province varchar(255) DEFAULT NULL,
  VoteDate datetime DEFAULT CURRENT_TIMESTAMP
) 

ALTER TABLE candidates
  ADD PRIMARY KEY (CandidateId);
-- Indexes for table provinces
--
ALTER TABLE provinces
  ADD PRIMARY KEY (ProvinceId)
--
-- Indexes for table users
--
ALTER TABLE votes
  ADD PRIMARY KEY (VoteId)

ALTER TABLE votes
  ADD CONSTRAINT votes_ibfk_2 FOREIGN KEY (CandidateId) REFERENCES candidates (CandidateId);

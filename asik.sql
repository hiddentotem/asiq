-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 14, 2020 at 10:42 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `asik`
--

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `menu_id` int(11) NOT NULL,
  `menu_nama` varchar(128) DEFAULT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `email_input` varchar(128) DEFAULT NULL,
  `email_update` varchar(128) DEFAULT NULL,
  `menu_status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`menu_id`, `menu_nama`, `dateCreated`, `dateModified`, `email_input`, `email_update`, `menu_status`) VALUES
(1, 'user', '2020-08-10 13:48:48', '2020-08-10 13:48:48', 'bonuslupis@gmail.com', 'bonuslupis@gmail.com', 1),
(2, 'admin', '2020-08-10 13:52:47', '2020-08-10 13:52:47', 'bonuslupis@gmail.com', 'bonuslupis@gmail.com', 1),
(3, 'teams', '2020-08-10 14:12:29', NULL, 'bonuslupis@gmail.com', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `menu_akses`
--

CREATE TABLE `menu_akses` (
  `akses_id` int(11) NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `menu_id` int(11) DEFAULT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `email_input` varchar(128) DEFAULT NULL,
  `email_update` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menu_akses`
--

INSERT INTO `menu_akses` (`akses_id`, `role_id`, `menu_id`, `dateCreated`, `dateModified`, `email_input`, `email_update`) VALUES
(1, 2, 1, '2020-08-07 00:00:00', NULL, NULL, NULL),
(2, 1, 2, '2020-08-10 00:00:00', NULL, NULL, NULL),
(13, 1, 1, '2020-08-11 15:03:18', NULL, 'bonuslupis@gmail.com', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `role_id` int(11) NOT NULL,
  `role_nama` varchar(128) DEFAULT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `email_input` varchar(128) DEFAULT NULL,
  `email_update` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`role_id`, `role_nama`, `dateCreated`, `dateModified`, `email_input`, `email_update`) VALUES
(1, 'Admin', '2020-08-11 12:15:39', '2020-08-11 12:15:39', 'bonuslupis@gmail.com', 'bonuslupis@gmail.com'),
(2, 'User', '2020-08-11 13:44:56', NULL, 'bonuslupis@gmail.com', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `submenu`
--

CREATE TABLE `submenu` (
  `submenu_id` int(11) NOT NULL,
  `menu_id` int(11) DEFAULT NULL,
  `submenu_nama` varchar(128) DEFAULT NULL,
  `submenu_url` varchar(128) DEFAULT NULL,
  `submenu_icon` varchar(128) DEFAULT NULL,
  `submenu_status` int(11) DEFAULT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `email_input` varchar(128) DEFAULT NULL,
  `email_update` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `submenu`
--

INSERT INTO `submenu` (`submenu_id`, `menu_id`, `submenu_nama`, `submenu_url`, `submenu_icon`, `submenu_status`, `dateCreated`, `dateModified`, `email_input`, `email_update`) VALUES
(1, 1, 'Profile', 'user', 'fas fa-fw fa-user-alt', 1, '2020-08-10 14:51:48', '2020-08-10 14:51:48', 'bonuslupis@gmail.com', 'bonuslupis@gmail.com'),
(2, 2, 'Menu Management', 'admin/menu', 'fas fa-fw fa-folder-open', 1, '2020-08-10 14:52:14', '2020-08-10 14:52:14', 'bonuslupis@gmail.com', 'bonuslupis@gmail.com'),
(3, 2, 'Dashboard', 'admin', 'fas fa-fw fa-tachometer-alt', 1, '2020-08-10 15:05:55', '2020-08-10 15:05:55', 'bonuslupis@gmail.com', 'bonuslupis@gmail.com'),
(4, 2, 'Role', 'admin/role', 'fas fa-fw fa-user-lock', 1, '2020-08-11 09:51:10', '2020-08-11 09:51:10', 'bonuslupis@gmail.com', 'bonuslupis@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `token`
--

CREATE TABLE `token` (
  `token_id` int(11) NOT NULL,
  `user_email` varchar(128) DEFAULT NULL,
  `token` varchar(128) DEFAULT NULL,
  `dateCreated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_nama` varchar(128) DEFAULT NULL,
  `user_email` varchar(128) DEFAULT NULL,
  `user_image` varchar(128) DEFAULT NULL,
  `user_password` varchar(255) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  `owner_status` int(11) DEFAULT NULL,
  `user_status` int(1) DEFAULT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_nama`, `user_email`, `user_image`, `user_password`, `role_id`, `team_id`, `owner_status`, `user_status`, `dateCreated`, `dateModified`) VALUES
(1, 'Admin koboy', 'bonuslupis@gmail.com', 'Desert1.jpg', '$2y$10$uIBLCD3tlPHKdD4tAazkmuqkVCW31MN4PzSdeDGM/Qn.SUrSBv7Pq', 1, 0, 1, 1, '2020-08-05 09:43:14', '2020-08-14 10:56:50');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`menu_id`);

--
-- Indexes for table `menu_akses`
--
ALTER TABLE `menu_akses`
  ADD PRIMARY KEY (`akses_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `submenu`
--
ALTER TABLE `submenu`
  ADD PRIMARY KEY (`submenu_id`);

--
-- Indexes for table `token`
--
ALTER TABLE `token`
  ADD PRIMARY KEY (`token_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `menu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `menu_akses`
--
ALTER TABLE `menu_akses`
  MODIFY `akses_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `submenu`
--
ALTER TABLE `submenu`
  MODIFY `submenu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `token`
--
ALTER TABLE `token`
  MODIFY `token_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 24, 2018 at 05:21 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chat`
--

-- --------------------------------------------------------

--
-- Table structure for table `chat_message`
--

CREATE TABLE `chat_message` (
  `chat_message_id` int(11) NOT NULL,
  `to_user_id` int(11) NOT NULL,
  `from_user_id` int(11) NOT NULL,
  `chat_message` text NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chat_message`
--

INSERT INTO `chat_message` (`chat_message_id`, `to_user_id`, `from_user_id`, `chat_message`, `timestamp`, `status`) VALUES
(1, 1, 3, 'cdsvdsvd', '2018-12-15 10:52:08', 0),
(2, 3, 1, 'nckdnckds', '2018-12-15 10:52:44', 0),
(3, 1, 3, 'csacsc', '2018-12-15 10:53:35', 0),
(4, 3, 1, '', '2018-12-15 10:53:54', 0),
(5, 3, 1, '', '2018-12-15 10:53:56', 0),
(6, 3, 1, '', '2018-12-15 10:53:57', 0),
(7, 3, 1, '', '2018-12-15 10:53:57', 0),
(8, 3, 1, '', '2018-12-15 10:53:57', 0),
(9, 3, 1, '', '2018-12-15 10:53:57', 0),
(10, 3, 1, '', '2018-12-15 10:53:57', 0),
(11, 3, 1, '', '2018-12-15 10:53:58', 0),
(12, 3, 1, '', '2018-12-15 10:53:59', 0),
(13, 1, 3, 'xc', '2018-12-15 10:54:09', 0),
(14, 3, 1, 'ds', '2018-12-15 10:54:20', 0),
(15, 1, 3, 'fdf', '2018-12-24 15:54:35', 0),
(16, 1, 3, 'fsdfsdf', '2018-12-24 15:54:37', 0),
(17, 1, 3, 'fdsfsdfs', '2018-12-24 15:54:40', 0),
(18, 1, 3, 'fdsfsdfs', '2018-12-24 15:54:43', 0),
(19, 3, 1, 'gdfgdg', '2018-12-24 15:59:23', 1),
(20, 3, 1, 'gdfgdfg', '2018-12-24 15:59:25', 1),
(21, 3, 1, 'gfdgdf', '2018-12-24 15:59:28', 1);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `user_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `login_details`
--

CREATE TABLE `login_details` (
  `login_details_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `last_activity` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_type` enum('no','yes') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login_details`
--

INSERT INTO `login_details` (`login_details_id`, `user_id`, `last_activity`, `is_type`) VALUES
(1, 1, '2018-12-15 06:46:24', 'no'),
(2, 1, '2018-12-15 06:56:41', 'no'),
(3, 2, '2018-12-15 08:01:44', 'no'),
(4, 1, '2018-12-15 07:28:31', 'no'),
(5, 3, '2018-12-15 10:42:44', 'no'),
(6, 3, '2018-12-15 10:50:43', 'no'),
(7, 1, '2018-12-15 10:54:43', 'no'),
(8, 3, '2018-12-15 10:51:03', 'no'),
(9, 3, '2018-12-15 10:51:26', 'no'),
(10, 3, '2018-12-24 15:00:12', 'no'),
(11, 3, '2018-12-24 15:31:01', 'no'),
(12, 3, '2018-12-24 16:21:00', 'no'),
(13, 1, '2018-12-24 16:21:00', 'no');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chat_message`
--
ALTER TABLE `chat_message`
  ADD PRIMARY KEY (`chat_message_id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `login_details`
--
ALTER TABLE `login_details`
  ADD PRIMARY KEY (`login_details_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chat_message`
--
ALTER TABLE `chat_message`
  MODIFY `chat_message_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `login_details`
--
ALTER TABLE `login_details`
  MODIFY `login_details_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

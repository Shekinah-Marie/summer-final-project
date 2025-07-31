-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 31, 2025 at 08:25 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `starkeyhf`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_logs`
--

CREATE TABLE `activity_logs` (
  `LogID` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  `ActionType` enum('Login','Logout','UpdateProfile','SearchPatient','UpdatePassword','UpdateAvatar','VerifyOTP','ResetPassword') NOT NULL,
  `Description` text NOT NULL,
  `Status` enum('Success','Failed') DEFAULT 'Success',
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `activity_logs`
--

INSERT INTO `activity_logs` (`LogID`, `UserID`, `ActionType`, `Description`, `Status`, `CreatedAt`) VALUES
(1, 1, 'Login', 'User \"Marie\" logged in successfully', 'Success', '2025-07-15 16:43:40'),
(2, 1, 'Login', 'User \"Marie\" logged in successfully', 'Success', '2025-07-15 16:47:24'),
(3, 1, 'Login', 'User \"Marie\" logged in successfully', 'Success', '2025-07-15 17:30:49'),
(4, 1, 'Login', 'User \"Marie\" logged in successfully', 'Success', '2025-07-15 17:36:09'),
(5, 1, 'Login', 'User \"Marie\" logged in successfully', 'Success', '2025-07-15 17:47:05'),
(6, 1, 'SearchPatient', 'User searched for \"1\" by SHF Patient ID', 'Success', '2025-07-15 17:59:46'),
(7, 1, 'UpdateProfile', 'User updated their profile', 'Success', '2025-07-15 18:34:32'),
(8, 1, 'Logout', 'User logged out', 'Success', '2025-07-15 18:40:18'),
(9, NULL, 'Login', 'Failed login attempt for \"Marie\" — Incorrect password', 'Failed', '2025-07-16 00:14:04'),
(10, NULL, 'Login', 'Failed login attempt for \"Marie\" — Incorrect password', 'Failed', '2025-07-16 00:14:05'),
(11, NULL, 'Login', 'Failed login attempt for \"Marie\" — Incorrect password', 'Failed', '2025-07-16 00:14:06'),
(12, NULL, 'Login', 'Blocked login for \"Marie\" — Account locked for 29 seconds', 'Failed', '2025-07-16 00:14:07'),
(13, 1, 'Login', 'User \"Marie\" logged in successfully', 'Success', '2025-07-16 00:14:43'),
(14, 1, 'UpdatePassword', 'Exception during password change: FormatException: Unexpected character (at character 1)\n<br />\n^', 'Failed', '2025-07-16 00:18:43'),
(15, 1, 'UpdatePassword', 'Exception during password change: FormatException: Unexpected character (at character 1)\n<br />\n^', 'Failed', '2025-07-16 00:18:48'),
(16, 1, 'UpdatePassword', 'Attempted password change with incorrect old password', 'Failed', '2025-07-16 00:25:32'),
(17, 1, 'UpdatePassword', 'Exception during password change: FormatException: Unexpected character (at character 1)\n<br />\n^', 'Failed', '2025-07-16 00:25:40'),
(18, 1, 'Login', 'User \"Marie\" logged in successfully', 'Success', '2025-07-16 00:37:17'),
(19, 1, 'UpdatePassword', 'Attempted password change with incorrect old password', 'Failed', '2025-07-16 00:37:37'),
(20, 1, 'UpdatePassword', 'Password changed successfully', 'Success', '2025-07-16 00:37:41'),
(21, 1, 'Logout', 'User logged out', 'Success', '2025-07-16 00:37:45'),
(22, NULL, 'Login', 'Failed login attempt for \"Marie\" — Incorrect password', 'Failed', '2025-07-16 00:37:54'),
(23, NULL, 'Login', 'Failed login attempt for \"Marie\" — Incorrect password', 'Failed', '2025-07-16 00:37:57'),
(24, 1, 'Login', 'User \"Marie\" logged in successfully', 'Success', '2025-07-16 00:38:02'),
(25, 1, 'Login', 'User \"Marie\" logged in successfully', 'Success', '2025-07-16 00:46:55'),
(26, 1, 'UpdateProfile', 'User updated their profile', 'Success', '2025-07-16 00:47:05'),
(27, 1, 'UpdatePassword', 'Attempted password change with incorrect old password', 'Failed', '2025-07-16 00:47:30'),
(28, 1, 'UpdatePassword', 'Password changed successfully', 'Success', '2025-07-16 00:47:34'),
(29, 1, 'Logout', 'User logged out', 'Success', '2025-07-16 00:47:37'),
(30, 1, 'Login', 'User \"Marie\" logged in successfully', 'Success', '2025-07-16 00:47:43'),
(31, 1, 'Login', 'User \"Marie\" logged in successfully', 'Success', '2025-07-16 01:34:50'),
(32, 1, 'UpdateProfile', 'User updated their profile', 'Success', '2025-07-16 01:35:11'),
(33, 1, 'Logout', 'User logged out', 'Success', '2025-07-16 01:35:37'),
(34, 1, 'Login', 'User \"Marie\" logged in successfully', 'Success', '2025-07-16 02:36:32'),
(35, 1, '', 'No patients found for \"gvg\" by SHF Patient ID', 'Success', '2025-07-16 02:37:44'),
(36, 1, 'UpdateProfile', 'User updated their profile', 'Success', '2025-07-16 02:40:24'),
(37, 1, 'Login', 'User \"Marie\" logged in successfully', 'Success', '2025-07-16 02:50:23'),
(38, 1, 'Logout', 'User logged out', 'Success', '2025-07-16 02:51:11'),
(39, 1, 'Login', 'User \"Marie\" logged in successfully', 'Success', '2025-07-16 02:52:26'),
(40, 1, 'Logout', 'User logged out', 'Success', '2025-07-16 02:59:09'),
(41, 1, 'Login', 'User \"Marie\" logged in successfully', 'Success', '2025-07-16 03:17:06'),
(42, 1, 'Logout', 'User logged out', 'Success', '2025-07-16 03:17:10'),
(43, 1, 'Login', 'User \"Marie\" logged in successfully', 'Success', '2025-07-16 12:13:50'),
(44, 1, 'UpdateAvatar', 'User updated their avatar', 'Success', '2025-07-16 12:18:39'),
(45, 1, 'Login', 'User \"Marie\" logged in successfully', 'Success', '2025-07-16 13:23:08'),
(46, 1, 'Login', 'User \"Marie\" logged in successfully', 'Success', '2025-07-16 14:36:12'),
(47, 1, 'Login', 'User \"Marie\" logged in successfully', 'Success', '2025-07-17 01:08:46'),
(48, 1, 'Login', 'User \"Marie\" logged in successfully', 'Success', '2025-07-17 04:35:51'),
(49, 1, 'Login', 'User \"Marie\" logged in successfully', 'Success', '2025-07-17 04:56:31'),
(50, 1, 'Login', 'User \"Marie\" logged in successfully', 'Success', '2025-07-17 05:42:47'),
(51, 1, 'Login', 'User \"Marie\" logged in successfully', 'Success', '2025-07-17 05:52:59'),
(52, 1, 'Login', 'User \"Marie\" logged in successfully', 'Success', '2025-07-17 11:42:26'),
(53, 1, 'Login', 'User \"Marie\" logged in successfully', 'Success', '2025-07-17 12:32:23'),
(54, 1, 'Login', 'User \"Marie\" logged in successfully', 'Success', '2025-07-18 03:18:19'),
(55, 1, 'Login', 'User \"Marie\" logged in successfully', 'Success', '2025-07-18 03:58:27'),
(56, 1, 'Logout', 'User logged out', 'Success', '2025-07-18 07:58:12'),
(57, 1, 'Login', 'User \"Marie\" logged in successfully', 'Success', '2025-07-18 07:58:20'),
(58, 1, 'Login', 'User \"Marie\" logged in successfully', 'Success', '2025-07-18 08:13:00'),
(59, 1, 'Logout', 'User logged out', 'Success', '2025-07-18 08:23:16'),
(60, 1, 'Login', 'User \"Marie\" logged in successfully', 'Success', '2025-07-18 08:23:24'),
(61, 1, 'Logout', 'User logged out', 'Success', '2025-07-18 08:34:32'),
(62, 1, 'Login', 'User \"Marie\" logged in successfully', 'Success', '2025-07-18 08:34:40'),
(63, 1, 'Logout', 'User logged out', 'Success', '2025-07-18 08:58:21'),
(64, 1, 'Login', 'User \"Marie\" logged in successfully', 'Success', '2025-07-18 08:58:31'),
(65, 1, 'Login', 'User \"Marie\" logged in successfully', 'Success', '2025-07-18 09:06:52'),
(66, 1, 'Logout', 'User logged out', 'Success', '2025-07-18 09:14:51'),
(67, 1, 'Login', 'User \"Marie\" logged in successfully', 'Success', '2025-07-18 09:15:00'),
(68, 1, 'Login', 'User \"Marie\" logged in successfully', 'Success', '2025-07-18 09:16:07'),
(69, 1, 'Login', 'User \"marie\" logged in successfully', 'Success', '2025-07-23 03:57:59'),
(70, 1, 'Logout', 'User logged out', 'Success', '2025-07-23 03:58:03'),
(71, 1, 'Login', 'User \"Marie\" logged in successfully', 'Success', '2025-07-23 03:58:22'),
(72, 1, 'Logout', 'User logged out', 'Success', '2025-07-23 05:37:18'),
(73, 1, 'Login', 'User \"Marie\" logged in successfully', 'Success', '2025-07-23 07:02:06'),
(74, 1, 'Logout', 'User logged out', 'Success', '2025-07-23 07:02:22'),
(75, NULL, 'Login', 'Failed login attempt for \"marie\" — Incorrect password', 'Failed', '2025-07-23 07:20:46'),
(76, 1, 'Login', 'User \"marie\" logged in successfully', 'Success', '2025-07-23 07:20:56'),
(77, 1, 'Login', 'User \"marie\" logged in successfully', 'Success', '2025-07-23 08:08:23'),
(78, NULL, 'Login', 'Failed login attempt for \"Marie\" — Incorrect password', 'Failed', '2025-07-23 10:12:49'),
(79, 1, 'Login', 'User \"Marie\" logged in successfully', 'Success', '2025-07-23 10:12:54'),
(80, 1, 'Logout', 'User logged out', 'Success', '2025-07-23 10:24:28'),
(81, 1, 'Login', 'User \"Marie\" logged in successfully', 'Success', '2025-07-23 10:24:36'),
(82, 1, 'Login', 'User \"marie\" logged in successfully', 'Success', '2025-07-23 10:27:09'),
(83, 1, 'Logout', 'User logged out', 'Success', '2025-07-23 10:43:14'),
(84, 1, 'Login', 'User \"marie\" logged in successfully', 'Success', '2025-07-23 10:43:22'),
(85, 1, 'Logout', 'User logged out', 'Success', '2025-07-23 10:45:03'),
(86, 1, 'Login', 'User \"marie\" logged in successfully', 'Success', '2025-07-23 10:45:13'),
(87, 1, 'Logout', 'User logged out', 'Success', '2025-07-23 10:46:12'),
(88, 1, 'Login', 'User \"marie\" logged in successfully', 'Success', '2025-07-23 10:47:24'),
(89, 1, 'Logout', 'User logged out', 'Success', '2025-07-23 12:05:04'),
(90, 1, 'Login', 'User \"marie\" logged in successfully', 'Success', '2025-07-23 12:06:39'),
(91, 1, 'Logout', 'User logged out', 'Success', '2025-07-23 12:32:06'),
(92, 1, 'Login', 'User \"marie\" logged in successfully', 'Success', '2025-07-23 12:32:47'),
(93, 1, 'Login', 'User \"marie\" logged in successfully', 'Success', '2025-07-23 14:32:58'),
(94, 1, 'Logout', 'User logged out', 'Success', '2025-07-23 14:59:34'),
(95, 1, 'Login', 'User \"Marie\" logged in successfully', 'Success', '2025-07-23 14:59:56'),
(96, 1, 'Login', 'User \"marie\" logged in successfully', 'Success', '2025-07-23 15:01:11'),
(97, 1, 'Login', 'User \"marie\" logged in successfully', 'Success', '2025-07-23 16:25:18'),
(98, 1, 'Login', 'User \"marie\" logged in successfully', 'Success', '2025-07-23 18:12:32'),
(99, NULL, 'Login', 'Failed login attempt for \"marie\" — Incorrect password', 'Failed', '2025-07-24 10:56:12'),
(100, 1, 'Login', 'User \"marie\" logged in successfully', 'Success', '2025-07-24 10:56:18'),
(101, 1, 'UpdatePassword', 'Attempted password change with incorrect old password', 'Failed', '2025-07-24 11:03:08'),
(102, 1, 'UpdatePassword', 'Password changed successfully', 'Success', '2025-07-24 11:03:08'),
(103, 1, 'Logout', 'User logged out', 'Success', '2025-07-24 11:03:30'),
(104, 1, 'Login', 'User \"marie\" logged in successfully', 'Success', '2025-07-24 11:03:38'),
(105, 1, 'Login', 'User \"marie\" logged in successfully', 'Success', '2025-07-24 11:08:39'),
(106, 1, 'Login', 'User \"marie\" logged in successfully', 'Success', '2025-07-24 14:42:26'),
(107, 1, 'Login', 'User \"marie\" logged in successfully', 'Success', '2025-07-24 14:53:16'),
(108, 1, 'Logout', 'User logged out', 'Success', '2025-07-24 14:54:15'),
(109, 1, 'Login', 'User \"marie\" logged in successfully', 'Success', '2025-07-25 03:33:59'),
(110, 1, 'Logout', 'User logged out', 'Success', '2025-07-25 03:34:18'),
(111, 1, 'Login', 'User \"marie\" logged in successfully', 'Success', '2025-07-25 04:37:42'),
(112, 1, 'Logout', 'User logged out', 'Success', '2025-07-25 04:37:46'),
(113, 1, 'Login', 'User \"marie\" logged in successfully', 'Success', '2025-07-25 04:52:12'),
(114, 1, 'Logout', 'User logged out', 'Success', '2025-07-25 04:52:16'),
(115, 1, 'Login', 'User \"marie\" logged in successfully', 'Success', '2025-07-25 04:52:26'),
(116, 1, 'Logout', 'User logged out', 'Success', '2025-07-25 04:59:57'),
(117, NULL, '', 'User \'marie\' reset their password via OTP', 'Success', '2025-07-25 05:00:26'),
(118, 1, 'Login', 'User \"marie\" logged in successfully', 'Success', '2025-07-25 05:00:35'),
(119, 1, 'Logout', 'User logged out', 'Success', '2025-07-25 05:02:06'),
(120, 1, 'Login', 'User \"marie\" logged in successfully', 'Success', '2025-07-25 05:06:11'),
(121, 1, 'Logout', 'User logged out', 'Success', '2025-07-25 05:11:09'),
(122, 1, 'Login', 'User \"marie\" logged in successfully', 'Success', '2025-07-25 05:11:17'),
(123, 1, 'Logout', 'User logged out', 'Success', '2025-07-25 05:11:38'),
(124, NULL, 'UpdatePassword', 'User \'marie\' reset their password via OTP', 'Success', '2025-07-25 05:13:32'),
(125, 1, 'Login', 'User \"marie\" logged in successfully', 'Success', '2025-07-25 05:13:40'),
(126, NULL, 'UpdatePassword', 'User \'marie\' reset their password via OTP', 'Success', '2025-07-25 05:16:44'),
(127, 1, 'Login', 'User \"marie\" logged in successfully', 'Success', '2025-07-25 05:16:56'),
(128, NULL, 'VerifyOTP', 'OTP verified successfully for user \'marie\'', 'Success', '2025-07-25 05:20:29'),
(129, NULL, 'VerifyOTP', 'Failed OTP verification attempt for user \'marie\'', 'Failed', '2025-07-25 05:21:04'),
(130, NULL, 'VerifyOTP', 'OTP verified successfully for user \'marie\'', 'Success', '2025-07-25 05:21:09'),
(131, 1, 'Login', 'User \"marie\" logged in successfully', 'Success', '2025-07-25 05:21:22'),
(132, 1, 'Logout', 'User logged out', 'Success', '2025-07-25 05:21:47'),
(133, NULL, 'Login', 'Failed login attempt for \"marie\" — Incorrect password', 'Failed', '2025-07-25 05:44:20'),
(134, NULL, 'Login', 'Failed login attempt for \"marie\" — Incorrect password', 'Failed', '2025-07-25 05:44:22'),
(135, NULL, 'Login', 'Failed login attempt for \"marie\" — Incorrect password', 'Failed', '2025-07-25 05:44:23'),
(136, NULL, 'Login', 'Blocked login for \"marie\" — Account locked for 30 seconds', 'Failed', '2025-07-25 05:44:23'),
(137, NULL, 'Login', 'Blocked login for \"marie\" — Account locked for 9 seconds', 'Failed', '2025-07-25 05:44:44'),
(138, 1, 'Login', 'User \"marie\" logged in successfully', 'Success', '2025-07-25 05:45:10'),
(139, 1, 'UpdateAvatar', 'User updated their avatar', 'Success', '2025-07-25 05:47:00'),
(140, 1, 'Logout', 'User logged out', 'Success', '2025-07-25 05:52:27'),
(141, 2, 'Login', 'User \"angelo\" logged in successfully', 'Success', '2025-07-25 05:52:52'),
(142, 2, 'UpdateAvatar', 'User updated their avatar', 'Success', '2025-07-25 05:53:17'),
(143, 2, 'Logout', 'User logged out', 'Success', '2025-07-25 05:53:23'),
(144, 1, 'Login', 'User \"marie\" logged in successfully', 'Success', '2025-07-25 05:53:32'),
(145, 1, 'Logout', 'User logged out', 'Success', '2025-07-25 06:08:54'),
(146, 2, 'Login', 'User \"angelo\" logged in successfully', 'Success', '2025-07-25 06:09:02'),
(147, 2, 'Logout', 'User logged out', 'Success', '2025-07-25 06:10:14'),
(148, 1, 'Login', 'User \"marie\" logged in successfully', 'Success', '2025-07-25 06:10:29'),
(149, 1, 'Logout', 'User logged out', 'Success', '2025-07-25 06:14:16'),
(150, 2, 'Login', 'User \"Angelo\" logged in successfully', 'Success', '2025-07-25 06:14:27'),
(151, 2, 'Logout', 'User logged out', 'Success', '2025-07-25 06:14:59'),
(152, 1, 'Login', 'User \"marie\" logged in successfully', 'Success', '2025-07-25 06:15:10'),
(153, 1, 'Logout', 'User logged out', 'Success', '2025-07-25 06:20:46'),
(154, 2, 'Login', 'User \"Angelo\" logged in successfully', 'Success', '2025-07-25 06:20:57'),
(155, 1, 'Login', 'User \"marie\" logged in successfully', 'Success', '2025-07-25 06:37:28'),
(156, NULL, 'Login', 'Failed login attempt for \"marie\" — Incorrect password', 'Failed', '2025-07-25 06:47:54'),
(157, 1, 'Login', 'User \"marie\" logged in successfully', 'Success', '2025-07-25 06:48:01'),
(158, 1, 'Login', 'User \"marie\" logged in successfully', 'Success', '2025-07-25 06:56:34'),
(159, 1, 'Login', 'User \"marie\" logged in successfully', 'Success', '2025-07-25 07:05:55'),
(160, 1, 'Login', 'User \"marie\" logged in successfully', 'Success', '2025-07-25 07:13:41'),
(161, 1, 'Login', 'User \"marie\" logged in successfully', 'Success', '2025-07-25 07:19:06'),
(162, 1, 'Login', 'User \"marie\" logged in successfully', 'Success', '2025-07-25 08:27:10'),
(163, 1, 'UpdateAvatar', 'User updated their avatar', 'Success', '2025-07-25 08:51:37'),
(164, 1, 'Login', 'User \"marie\" logged in successfully', 'Success', '2025-07-25 09:50:15'),
(165, 1, '', 'No patients found for \"tff\" by SHF Patient ID', 'Success', '2025-07-25 09:51:14'),
(166, 1, '', 'No patients found for \"#3_\" by SHF Patient ID', 'Success', '2025-07-25 09:51:35'),
(167, 2, 'Login', 'User \"angelo\" logged in successfully', 'Success', '2025-07-25 10:41:02'),
(168, 2, '', 'No patients found for \"uhhh\" by Surname', 'Success', '2025-07-25 10:41:33'),
(169, 2, 'Logout', 'User logged out', 'Success', '2025-07-25 10:41:46'),
(170, NULL, 'Login', 'Failed login attempt for \"marie\" — Incorrect password', 'Failed', '2025-07-25 10:41:59'),
(171, 1, 'Login', 'User \"marie\" logged in successfully', 'Success', '2025-07-25 10:42:07'),
(172, 1, 'Login', 'User \"marie\" logged in successfully', 'Success', '2025-07-25 10:42:37'),
(173, 2, 'Login', 'User \"angelo\" logged in successfully', 'Success', '2025-07-25 11:00:57'),
(174, 2, '', 'No patients found for \"ukjjj\" by SHF Patient ID', 'Success', '2025-07-25 11:01:19'),
(175, 2, 'Logout', 'User logged out', 'Success', '2025-07-25 11:01:29'),
(176, 1, 'Login', 'User \"marie\" logged in successfully', 'Success', '2025-07-25 11:01:43'),
(177, 1, 'Login', 'User \"Marie\" logged in successfully', 'Success', '2025-07-25 11:05:36'),
(178, 1, 'Logout', 'User logged out', 'Success', '2025-07-25 11:06:18'),
(179, 2, 'Login', 'User \"angelo\" logged in successfully', 'Success', '2025-07-25 11:06:28'),
(180, 2, 'Logout', 'User logged out', 'Success', '2025-07-25 11:06:37'),
(181, 1, 'Login', 'User \"marie\" logged in successfully', 'Success', '2025-07-25 11:11:24'),
(182, 1, 'Login', 'User \"marie\" logged in successfully', 'Success', '2025-07-25 11:13:59'),
(183, 1, 'Login', 'User \"marie\" logged in successfully', 'Success', '2025-07-25 11:16:01'),
(184, 1, 'Logout', 'User logged out', 'Success', '2025-07-25 11:16:54'),
(185, 2, 'Login', 'User \"Angelo\" logged in successfully', 'Success', '2025-07-25 11:17:02'),
(186, 2, 'Login', 'User \"angelo\" logged in successfully', 'Success', '2025-07-25 11:18:20'),
(187, 2, 'SearchPatient', 'No patients found for \"osmsks\" by Surname', 'Success', '2025-07-25 11:18:28'),
(188, 2, 'Logout', 'User logged out', 'Success', '2025-07-25 11:22:55'),
(189, 2, 'Login', 'User \"angelo\" logged in successfully', 'Success', '2025-07-25 11:24:08'),
(190, 2, 'Logout', 'User logged out', 'Success', '2025-07-25 11:24:12'),
(191, 1, 'Login', 'User \"marie\" logged in successfully', 'Success', '2025-07-25 11:24:20'),
(192, 1, 'Logout', 'User logged out', 'Success', '2025-07-25 11:39:04'),
(193, 2, 'Login', 'User \"angelo\" logged in successfully', 'Success', '2025-07-25 11:39:48'),
(194, 2, 'UpdateProfile', 'User updated their profile', 'Success', '2025-07-25 11:40:55'),
(195, 2, 'Login', 'User \"Angelo\" logged in successfully', 'Success', '2025-07-25 12:03:33'),
(196, 2, 'Login', 'User \"angelo\" logged in successfully', 'Success', '2025-07-25 12:11:16'),
(197, 2, 'Logout', 'User logged out', 'Success', '2025-07-25 12:19:01'),
(198, 2, 'Login', 'User \"angelo\" logged in successfully', 'Success', '2025-07-25 12:19:09'),
(199, 2, 'Logout', 'User logged out', 'Success', '2025-07-25 12:19:19'),
(200, 1, 'Login', 'User \"marie\" logged in successfully', 'Success', '2025-07-25 12:19:29'),
(201, 1, 'Logout', 'User logged out', 'Success', '2025-07-25 12:19:35'),
(202, 2, 'Login', 'User \"angelo\" logged in successfully', 'Success', '2025-07-25 12:19:42'),
(203, 2, 'Logout', 'User logged out', 'Success', '2025-07-25 12:22:11'),
(204, 1, 'Login', 'User \"marie\" logged in successfully', 'Success', '2025-07-25 12:22:26'),
(205, 1, 'Logout', 'User logged out', 'Success', '2025-07-25 12:22:32'),
(206, 2, 'Login', 'User \"angelo\" logged in successfully', 'Success', '2025-07-25 12:22:44'),
(207, 2, 'Logout', 'User logged out', 'Success', '2025-07-25 12:26:40'),
(208, 2, 'Login', 'User \"angelo\" logged in successfully', 'Success', '2025-07-25 12:26:53'),
(209, 2, 'Logout', 'User logged out', 'Success', '2025-07-25 12:27:50'),
(210, 2, 'Login', 'User \"angelo\" logged in successfully', 'Success', '2025-07-25 12:30:41'),
(211, 2, 'Login', 'User \"angelo\" logged in successfully', 'Success', '2025-07-25 12:39:24'),
(212, 2, 'Logout', 'User logged out', 'Success', '2025-07-25 12:43:38'),
(213, NULL, 'Login', 'Failed login attempt for \"marie\" — Incorrect password', 'Failed', '2025-07-25 12:43:48'),
(214, 1, 'Login', 'User \"marie\" logged in successfully', 'Success', '2025-07-25 12:43:53'),
(215, 1, 'Logout', 'User logged out', 'Success', '2025-07-25 12:44:03'),
(216, 1, 'Login', 'User \"marie\" logged in successfully', 'Success', '2025-07-25 12:45:31'),
(217, 1, 'Logout', 'User logged out', 'Success', '2025-07-25 12:45:37'),
(218, 2, 'Login', 'User \"angelo\" logged in successfully', 'Success', '2025-07-25 12:45:46'),
(219, NULL, 'Login', 'Failed login attempt for \"angelo\" — Incorrect password', 'Failed', '2025-07-25 12:48:34'),
(220, 2, 'Login', 'User \"angelo\" logged in successfully', 'Success', '2025-07-25 12:48:40'),
(221, 2, 'SearchPatient', 'No patients found for \"maranan\" by Surname', 'Success', '2025-07-25 12:49:05'),
(222, 2, 'SearchPatient', 'No patients found for \"ali\" by City/Village', 'Success', '2025-07-25 12:49:16'),
(223, 2, 'SearchPatient', 'No patients found for \"laoag\" by City/Village', 'Success', '2025-07-25 12:49:21'),
(224, 2, 'Logout', 'User logged out', 'Success', '2025-07-25 13:16:37'),
(225, 1, 'Login', 'User \"marie\" logged in successfully', 'Success', '2025-07-25 13:16:48'),
(226, 1, 'Login', 'User \"marie\" logged in successfully', 'Success', '2025-07-25 13:18:05'),
(227, 1, 'Login', 'User \"marie\" logged in successfully', 'Success', '2025-07-25 13:40:51'),
(228, 1, 'Logout', 'User logged out', 'Success', '2025-07-25 13:48:56'),
(229, 1, 'Login', 'User \"marie\" logged in successfully', 'Success', '2025-07-25 13:49:08'),
(230, 1, 'UpdatePassword', 'Attempted password change with incorrect old password', 'Failed', '2025-07-25 13:49:32'),
(231, 1, 'UpdatePassword', 'Password changed successfully', 'Success', '2025-07-25 13:49:46'),
(232, 1, 'UpdatePassword', 'Password changed successfully', 'Success', '2025-07-25 13:50:14'),
(233, 1, 'Logout', 'User logged out', 'Success', '2025-07-25 13:50:18'),
(234, 1, 'Login', 'User \"marie\" logged in successfully', 'Success', '2025-07-25 13:50:31'),
(235, 1, 'Login', 'User \"Marie\" logged in successfully', 'Success', '2025-07-25 13:52:12'),
(236, 1, 'UpdatePassword', 'Attempted password change with incorrect old password', 'Failed', '2025-07-25 13:52:54'),
(237, 1, 'UpdatePassword', 'Attempted password change with incorrect old password', 'Failed', '2025-07-25 13:53:09'),
(238, 1, 'UpdatePassword', 'Password changed successfully', 'Success', '2025-07-25 13:53:14'),
(239, 1, 'Logout', 'User logged out', 'Success', '2025-07-25 13:53:16'),
(240, NULL, 'Login', 'Failed login attempt for \"marie\" — Incorrect password', 'Failed', '2025-07-25 13:53:27'),
(241, 1, 'Login', 'User \"marie\" logged in successfully', 'Success', '2025-07-25 13:53:37'),
(242, NULL, 'Login', 'Failed login attempt for \"marie\" — Incorrect password', 'Failed', '2025-07-25 14:11:03'),
(243, 1, 'Login', 'User \"marie\" logged in successfully', 'Success', '2025-07-25 14:11:12'),
(244, NULL, 'Login', 'Failed login attempt for \"marie\" — Incorrect password', 'Failed', '2025-07-25 14:16:23'),
(245, 1, 'Login', 'User \"marie\" logged in successfully', 'Success', '2025-07-25 14:16:31'),
(246, 1, 'Login', 'User \"marie\" logged in successfully', 'Success', '2025-07-25 14:24:09'),
(247, 2, 'Login', 'User \"Angelo\" logged in successfully', 'Success', '2025-07-25 15:13:29'),
(248, 2, 'Logout', 'User logged out', 'Success', '2025-07-25 15:13:41'),
(249, 1, 'Login', 'User \"marie\" logged in successfully', 'Success', '2025-07-25 15:13:52'),
(250, 1, 'Logout', 'User logged out', 'Success', '2025-07-25 15:14:24'),
(251, 2, 'Login', 'User \"angelo\" logged in successfully', 'Success', '2025-07-25 15:14:31'),
(252, 2, 'Logout', 'User logged out', 'Success', '2025-07-25 15:14:42'),
(253, 1, 'Login', 'User \"marie\" logged in successfully', 'Success', '2025-07-26 05:12:51'),
(254, 1, 'Login', 'User \"marie\" logged in successfully', 'Success', '2025-07-26 05:22:00'),
(255, 1, 'Login', 'User \"marie\" logged in successfully', 'Success', '2025-07-29 03:36:49'),
(256, 1, 'Login', 'User \"marie\" logged in successfully', 'Success', '2025-07-29 03:38:52'),
(257, 1, 'Logout', 'User logged out', 'Success', '2025-07-29 04:24:38'),
(258, 1, 'Login', 'OTP sent after login for \"marie\"', 'Success', '2025-07-29 04:26:46'),
(259, 1, 'Login', 'OTP sent after login for \"marie\"', 'Success', '2025-07-29 08:15:10'),
(260, 1, '', 'OTP login verification successful for \"marie\"', 'Success', '2025-07-29 08:15:27'),
(261, 1, 'Logout', 'User logged out', 'Success', '2025-07-29 08:15:56'),
(262, 1, 'Login', 'OTP sent after login for \"marie\"', 'Success', '2025-07-29 08:16:08'),
(263, 1, 'Login', 'User \"marie\" logged in successfully', 'Success', '2025-07-29 08:35:33'),
(264, 1, 'Logout', 'User logged out', 'Success', '2025-07-29 08:35:41'),
(265, 1, 'Login', 'User \"marie\" logged in successfully', 'Success', '2025-07-29 08:42:02'),
(266, 1, 'VerifyOTP', 'Login OTP verified for \"marie\"', 'Success', '2025-07-29 08:42:29'),
(267, 1, 'Logout', 'User logged out', 'Success', '2025-07-29 08:42:43'),
(268, 1, 'Login', 'User \"marie\" logged in successfully', 'Success', '2025-07-29 08:42:53'),
(269, NULL, 'VerifyOTP', 'Failed login OTP attempt for \"marie\"', 'Failed', '2025-07-29 08:43:03'),
(270, 1, 'Login', 'User \"marie\" logged in successfully', 'Success', '2025-07-29 08:43:45'),
(271, 1, 'Login', 'User \"marie\" logged in successfully', 'Success', '2025-07-29 08:44:03'),
(272, 1, 'Login', 'User \"marie\" logged in successfully', 'Success', '2025-07-29 08:45:43'),
(273, 1, 'Login', 'User \"marie\" logged in successfully', 'Success', '2025-07-29 08:48:44'),
(274, 1, 'Login', 'User \"marie\" logged in successfully', 'Success', '2025-07-29 08:53:47'),
(275, 1, 'VerifyOTP', 'Login OTP verified for \"marie\"', 'Success', '2025-07-29 08:54:05'),
(276, 1, 'Logout', 'User logged out', 'Success', '2025-07-29 08:54:20'),
(277, 1, 'Login', 'User \"marie\" logged in successfully', 'Success', '2025-07-29 08:54:31'),
(278, 1, 'Login', 'User \"marie\" logged in successfully', 'Success', '2025-07-29 09:05:11'),
(279, 1, 'Login', 'User \"marie\" logged in successfully', 'Success', '2025-07-29 09:08:47'),
(280, 1, 'Login', 'User \"marie\" logged in successfully', 'Success', '2025-07-29 09:13:54'),
(281, 1, 'Login', 'User \"marie\" logged in successfully', 'Success', '2025-07-29 09:23:44'),
(282, NULL, 'VerifyOTP', 'Failed OTP attempt 1 for \"marie\"', 'Failed', '2025-07-29 09:23:55'),
(283, NULL, 'VerifyOTP', 'Failed OTP attempt 2 for \"marie\"', 'Failed', '2025-07-29 09:23:57'),
(284, NULL, 'VerifyOTP', 'Failed OTP attempt 3 for \"marie\"', 'Failed', '2025-07-29 09:23:59'),
(285, 1, 'VerifyOTP', 'Login OTP verified for \"marie\"', 'Success', '2025-07-29 09:24:43'),
(286, 1, 'Logout', 'User logged out', 'Success', '2025-07-29 09:25:04'),
(287, 1, 'Login', 'User \"marie\" logged in successfully', 'Success', '2025-07-29 09:25:12'),
(288, 1, 'VerifyOTP', 'Login OTP verified for \"marie\"', 'Success', '2025-07-29 09:25:22'),
(289, 1, 'VerifyOTP', 'Login OTP verified for \"marie\"', 'Success', '2025-07-29 09:30:16'),
(290, 1, 'Login', 'User \"marie\" successfully logged in after OTP verification', 'Success', '2025-07-29 09:30:16'),
(291, 1, 'VerifyOTP', 'Login OTP verified for \"marie\"', 'Success', '2025-07-29 09:41:36'),
(292, 1, 'Login', 'User \"marie\" successfully logged in after OTP verification', 'Success', '2025-07-29 09:41:36'),
(293, 1, 'Logout', 'User logged out', 'Success', '2025-07-29 09:53:25'),
(294, 1, 'VerifyOTP', 'Login OTP verified for \"Marie\"', 'Success', '2025-07-29 09:54:26'),
(295, 1, 'Login', 'User \"Marie\" successfully logged in after OTP verification', 'Success', '2025-07-29 09:54:26'),
(296, NULL, 'VerifyOTP', 'OTP verified successfully for user \'Angelo\'', 'Success', '2025-07-29 10:22:04'),
(297, NULL, 'UpdatePassword', 'User \'Angelo\' reset their password via OTP', 'Success', '2025-07-29 10:22:33'),
(298, NULL, 'Login', 'Failed login attempt for \"Angelo\" — Incorrect password', 'Failed', '2025-07-29 10:23:04'),
(299, 2, 'VerifyOTP', 'Login OTP verified for \"angelo\"', 'Success', '2025-07-29 11:11:47'),
(300, 2, 'Login', 'User \"angelo\" successfully logged in after OTP verification', 'Success', '2025-07-29 11:11:47'),
(301, 2, 'Logout', 'User logged out', 'Success', '2025-07-29 11:18:37'),
(302, 2, 'VerifyOTP', 'Login OTP verified for \"angelo\"', 'Success', '2025-07-29 11:19:46'),
(303, 2, 'Login', 'User \"angelo\" successfully logged in after OTP verification', 'Success', '2025-07-29 11:19:46'),
(304, 2, 'Logout', 'User logged out', 'Success', '2025-07-29 11:23:53'),
(305, NULL, 'VerifyOTP', 'OTP verified successfully for user \'marie\'', 'Success', '2025-07-29 11:24:20'),
(306, NULL, 'UpdatePassword', 'User \'marie\' reset their password via OTP', 'Success', '2025-07-29 11:24:38'),
(307, 1, 'VerifyOTP', 'Login OTP verified for \"marie\"', 'Success', '2025-07-29 11:25:24'),
(308, 1, 'Login', 'User \"marie\" successfully logged in after OTP verification', 'Success', '2025-07-29 11:25:35'),
(309, 2, 'VerifyOTP', 'Login OTP verified for \"Angelo\"', 'Success', '2025-07-29 12:00:31'),
(310, 2, 'Login', 'User \"Angelo\" successfully logged in after OTP verification', 'Success', '2025-07-29 12:00:31'),
(311, 2, 'VerifyOTP', 'Login OTP verified for \"Angelo\"', 'Success', '2025-07-29 12:31:59'),
(312, 2, 'Login', 'User \"Angelo\" successfully logged in after OTP verification', 'Success', '2025-07-29 12:32:00'),
(313, 2, 'Logout', 'User logged out', 'Success', '2025-07-29 13:30:00'),
(314, NULL, 'VerifyOTP', 'OTP verified successfully for user \'angelo\'', 'Success', '2025-07-29 13:33:07'),
(315, 1, 'VerifyOTP', 'Login OTP verified for \"marie\"', 'Success', '2025-07-29 14:38:15'),
(316, 1, 'Login', 'User \"marie\" successfully logged in after OTP verification', 'Success', '2025-07-29 14:38:15'),
(317, 1, 'VerifyOTP', 'Login OTP verified for \"marie\"', 'Success', '2025-07-29 14:43:33'),
(318, 1, 'Login', 'User \"marie\" successfully logged in after OTP verification', 'Success', '2025-07-29 14:43:33'),
(319, 1, 'SearchPatient', 'No patients found for \"huh\" by SHF Patient ID', 'Success', '2025-07-29 14:49:26'),
(320, 2, 'VerifyOTP', 'Login OTP verified for \"angelo\"', 'Success', '2025-07-29 21:27:49'),
(321, 2, 'Login', 'User \"angelo\" successfully logged in after OTP verification', 'Success', '2025-07-29 21:27:49'),
(322, 2, 'Logout', 'User logged out', 'Success', '2025-07-29 22:06:29'),
(323, NULL, 'Login', 'Failed login attempt for \"marie\" — Incorrect password', 'Failed', '2025-07-29 22:07:16'),
(324, NULL, 'Login', 'Failed login attempt for \"marie\" — Incorrect password', 'Failed', '2025-07-29 22:07:24'),
(325, 2, 'VerifyOTP', 'Login OTP verified for \"Angelo\"', 'Success', '2025-07-29 22:12:36'),
(326, 2, 'Login', 'User \"Angelo\" successfully logged in after OTP verification', 'Success', '2025-07-29 22:12:36'),
(327, 2, 'SearchPatient', 'User searched for \"10\" by SHF Patient ID', 'Success', '2025-07-29 22:18:41'),
(328, 2, 'VerifyOTP', 'Login OTP verified for \"Angelo\"', 'Success', '2025-07-29 22:25:06'),
(329, 2, 'Login', 'User \"Angelo\" successfully logged in after OTP verification', 'Success', '2025-07-29 22:25:06'),
(330, 2, 'VerifyOTP', 'Login OTP verified for \"Angelo\"', 'Success', '2025-07-29 23:27:30'),
(331, 2, 'Login', 'User \"Angelo\" successfully logged in after OTP verification', 'Success', '2025-07-29 23:27:30'),
(332, NULL, 'Login', 'Failed login attempt for \"Angelo\" — Incorrect password', 'Failed', '2025-07-29 23:29:02'),
(333, 2, 'VerifyOTP', 'Login OTP verified for \"Angelo\"', 'Success', '2025-07-29 23:30:14'),
(334, 2, 'Login', 'User \"Angelo\" successfully logged in after OTP verification', 'Success', '2025-07-29 23:30:14'),
(335, 2, 'SearchPatient', 'No patients found for \"fhgfgj\" by Surname', 'Success', '2025-07-29 23:30:36'),
(336, 2, 'Logout', 'User logged out', 'Success', '2025-07-29 23:31:12'),
(337, 2, 'VerifyOTP', 'Login OTP verified for \"Angelo\"', 'Success', '2025-07-30 06:35:15'),
(338, 2, 'Login', 'User \"Angelo\" successfully logged in after OTP verification', 'Success', '2025-07-30 06:35:15'),
(339, 2, 'VerifyOTP', 'Login OTP verified for \"Angelo\"', 'Success', '2025-07-30 06:42:09'),
(340, 2, 'Login', 'User \"Angelo\" successfully logged in after OTP verification', 'Success', '2025-07-30 06:42:10'),
(341, 2, 'VerifyOTP', 'Login OTP verified for \"Angelo\"', 'Success', '2025-07-30 08:13:46'),
(342, 2, 'Login', 'User \"Angelo\" successfully logged in after OTP verification', 'Success', '2025-07-30 08:13:46'),
(343, 2, 'Logout', 'User logged out', 'Success', '2025-07-30 08:33:30'),
(344, 1, 'VerifyOTP', 'Login OTP verified for \"marie\"', 'Success', '2025-07-30 08:36:27'),
(345, 1, 'Login', 'User \"marie\" successfully logged in after OTP verification', 'Success', '2025-07-30 08:36:27'),
(346, 1, 'SearchPatient', 'No patients found for \"dvv\" by SHF Patient ID', 'Success', '2025-07-30 08:37:58'),
(347, 1, 'Logout', 'User logged out', 'Success', '2025-07-30 08:41:58'),
(348, 2, 'VerifyOTP', 'Login OTP verified for \"Angelo\"', 'Success', '2025-07-30 08:42:54'),
(349, 2, 'Login', 'User \"Angelo\" successfully logged in after OTP verification', 'Success', '2025-07-30 08:42:54'),
(350, 2, 'Logout', 'User logged out', 'Success', '2025-07-30 08:43:13'),
(351, 2, 'VerifyOTP', 'Login OTP verified for \"Angelo\"', 'Success', '2025-07-30 08:43:48'),
(352, 2, 'Login', 'User \"Angelo\" successfully logged in after OTP verification', 'Success', '2025-07-30 08:43:48');

-- --------------------------------------------------------

--
-- Table structure for table `aftercare_evaluation`
--

CREATE TABLE `aftercare_evaluation` (
  `id` int(11) NOT NULL,
  `visit_id` int(11) DEFAULT NULL,
  `left_aid_issues` set('Dead','Internal Feedback','Power Change Needed','Lost/Stolen','No Problem') DEFAULT NULL,
  `right_aid_issues` set('Dead','Internal Feedback','Power Change Needed','Lost/Stolen','No Problem') DEFAULT NULL,
  `left_earmold_issues` set('Too Tight','Too Loose','Cracked/Damaged','Lost/Stolen','No Problem') DEFAULT NULL,
  `right_earmold_issues` set('Too Tight','Too Loose','Cracked/Damaged','Lost/Stolen','No Problem') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `aftercare_evaluation`
--

INSERT INTO `aftercare_evaluation` (`id`, `visit_id`, `left_aid_issues`, `right_aid_issues`, `left_earmold_issues`, `right_earmold_issues`) VALUES
(1, 1, 'No Problem', 'No Problem', 'No Problem', 'No Problem'),
(2, 2, 'Dead', 'Internal Feedback', 'Cracked/Damaged', 'Too Loose'),
(3, 3, 'Power Change Needed', 'Lost/Stolen', 'Lost/Stolen', 'Cracked/Damaged'),
(4, 4, 'No Problem', 'Dead', 'No Problem', 'Too Loose'),
(5, 5, 'Lost/Stolen', 'Power Change Needed', 'Too Tight', 'Cracked/Damaged'),
(6, 6, 'No Problem', 'No Problem', 'No Problem', 'No Problem'),
(7, 7, 'Dead', 'Dead', 'Cracked/Damaged', 'Cracked/Damaged'),
(8, 8, 'No Problem', 'No Problem', 'No Problem', 'No Problem');

-- --------------------------------------------------------

--
-- Table structure for table `aftercare_services`
--

CREATE TABLE `aftercare_services` (
  `id` int(11) NOT NULL,
  `visit_id` int(11) DEFAULT NULL,
  `left_aid_services` set('Tested','Sent for Repair','Refit','Not Benefiting') DEFAULT NULL,
  `right_aid_services` set('Tested','Sent for Repair','Refit','Not Benefiting') DEFAULT NULL,
  `left_earmold_services` set('Retubed','Modified','Stock Refit','Custom Refit','New Ear Impression') DEFAULT NULL,
  `updated_batteries` enum('13','675') DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `right_earmold_services` set('Retubed','Modified','Stock Refit','Custom Refit','New Ear Impression') DEFAULT NULL,
  `gen_services` set('counseling','batteries','refer to aftercare','refer to next') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `aftercare_services`
--

INSERT INTO `aftercare_services` (`id`, `visit_id`, `left_aid_services`, `right_aid_services`, `left_earmold_services`, `updated_batteries`, `notes`, `right_earmold_services`, `gen_services`) VALUES
(1, 1, 'Tested', 'Tested', 'Retubed', '13', 'All functioning', 'Retubed', 'batteries'),
(2, 2, 'Sent for Repair,Refit', 'Sent for Repair', 'Modified', '675', 'Adjusted', NULL, NULL),
(3, 3, 'Not Benefiting', 'Refit', 'Stock Refit', '13', 'Needs follow-up', 'Modified', 'counseling'),
(4, 4, 'Tested', 'Tested', 'Custom Refit', '13', 'No issues', NULL, NULL),
(5, 5, 'Refit', 'Refit', 'New Ear Impression', '675', 'Resupplied', NULL, NULL),
(6, 6, 'Tested', 'Tested', 'Modified', '13', 'All clear', NULL, NULL),
(7, 7, 'Sent for Repair', 'Sent for Repair', 'Custom Refit', '13', 'Severe damage', NULL, NULL),
(8, 8, 'Tested', 'Tested', 'Retubed', '13', 'Routine Phase 3 aftercare', NULL, 'refer to next');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `CityID` int(11) NOT NULL,
  `CityName` varchar(100) NOT NULL,
  `CountryID` int(11) DEFAULT NULL,
  `CoordinatorID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`CityID`, `CityName`, `CountryID`, `CoordinatorID`) VALUES
(1, 'Abra', 138, 1),
(2, 'Agusan del Norte', 138, 1),
(3, 'Agusan del Sur', 138, 1),
(4, 'Aklan', 138, NULL),
(5, 'Albay', 138, NULL),
(6, 'Antique', 138, NULL),
(7, 'Apayao', 138, NULL),
(8, 'Aurora', 138, NULL),
(9, 'Basilan', 138, NULL),
(10, 'Bataan', 138, NULL),
(11, 'Batanes', 138, NULL),
(12, 'Batangas', 138, NULL),
(13, 'Benguet', 138, NULL),
(14, 'Biliran', 138, NULL),
(15, 'Bohol', 138, NULL),
(16, 'Bukidnon', 138, NULL),
(17, 'Bulacan', 138, NULL),
(18, 'Cagayan', 138, NULL),
(19, 'Camarines Norte', 138, NULL),
(20, 'Camarines Sur', 138, NULL),
(21, 'Camiguin', 138, NULL),
(22, 'Capiz', 138, NULL),
(23, 'Catanduanes', 138, NULL),
(24, 'Cavite', 138, NULL),
(25, 'Cebu', 138, NULL),
(26, 'Cotabato', 138, NULL),
(27, 'Davao de Oro', 138, NULL),
(28, 'Davao del Norte', 138, NULL),
(29, 'Davao del Sur', 138, NULL),
(30, 'Davao Occidental', 138, NULL),
(31, 'Davao Oriental', 138, NULL),
(32, 'Dinagat Islands', 138, NULL),
(33, 'Eastern Samar', 138, NULL),
(34, 'Guimaras', 138, NULL),
(35, 'Ifugao', 138, NULL),
(36, 'Ilocos Norte', 138, NULL),
(37, 'Ilocos Sur', 138, NULL),
(38, 'Iloilo', 138, NULL),
(39, 'Isabela', 138, NULL),
(40, 'Kalinga', 138, NULL),
(41, 'La Union', 138, NULL),
(42, 'Laguna', 138, NULL),
(43, 'Lanao del Norte', 138, NULL),
(44, 'Lanao del Sur', 138, NULL),
(45, 'Leyte', 138, NULL),
(46, 'Maguindanao del Norte', 138, NULL),
(47, 'Maguindanao del Sur', 138, NULL),
(48, 'Marinduque', 138, NULL),
(49, 'Masbate', 138, NULL),
(50, 'Misamis Occidental', 138, NULL),
(51, 'Misamis Oriental', 138, NULL),
(52, 'Mountain Province', 138, NULL),
(53, 'Negros Occidental', 138, NULL),
(54, 'Negros Oriental', 138, NULL),
(55, 'Northern Samar', 138, NULL),
(56, 'Nueva Ecija', 138, NULL),
(57, 'Nueva Vizcaya', 138, NULL),
(58, 'Occidental Mindoro', 138, NULL),
(59, 'Oriental Mindoro', 138, NULL),
(60, 'Palawan', 138, NULL),
(61, 'Pampanga', 138, NULL),
(62, 'Pangasinan', 138, NULL),
(63, 'Quezon', 138, NULL),
(64, 'Quirino', 138, NULL),
(65, 'Rizal', 138, NULL),
(66, 'Romblon', 138, NULL),
(67, 'Samar', 138, NULL),
(68, 'Sarangani', 138, NULL),
(69, 'Siquijor', 138, NULL),
(70, 'Sorsogon', 138, NULL),
(71, 'South Cotabato', 138, NULL),
(72, 'Southern Leyte', 138, NULL),
(73, 'Sultan Kudarat', 138, NULL),
(74, 'Sulu', 138, NULL),
(75, 'Surigao del Norte', 138, NULL),
(76, 'Surigao del Sur', 138, NULL),
(77, 'Tarlac', 138, NULL),
(78, 'Tawi-Tawi', 138, NULL),
(79, 'Zambales', 138, NULL),
(80, 'Zamboanga del Norte', 138, NULL),
(81, 'Zamboanga del Sur', 138, NULL),
(82, 'Zamboanga Sibugay', 138, NULL),
(83, 'Dasmariñas', 138, NULL),
(84, 'Valenzuela', 138, NULL),
(85, 'Bacoor', 138, NULL),
(86, 'General Santos', 138, NULL),
(87, 'Las Piñas', 138, NULL),
(88, 'Makati', 138, NULL),
(89, 'San Jose del Monte', 138, NULL),
(90, 'Bacolod', 138, NULL),
(91, 'Muntinlupa', 138, NULL),
(92, 'Calamba', 138, NULL),
(93, 'Iloilo City', 138, NULL),
(94, 'Pasay', 138, NULL),
(95, 'Angeles', 138, NULL),
(96, 'Lapu-Lapu', 138, NULL),
(97, 'Imus', 138, NULL),
(98, 'Mandaluyong', 138, NULL),
(99, 'Marikina', 138, NULL),
(100, 'Butuan', 138, NULL),
(101, 'Navotas', 138, NULL),
(102, 'Tarlac City', 138, NULL),
(103, 'Baguio', 138, NULL),
(104, 'Batangas City', 138, NULL),
(105, 'Lucena', 138, NULL),
(106, 'San Pablo', 138, NULL),
(107, 'Tuguegarao', 138, NULL),
(108, 'Legazpi', 138, NULL),
(109, 'Naga', 138, NULL),
(110, 'Olongapo', 138, NULL),
(111, 'Alaminos', 138, NULL),
(112, 'Bayawan', 138, NULL),
(113, 'Baybay', 138, NULL),
(114, 'Bayugan', 138, NULL),
(115, 'Bogo', 138, NULL),
(116, 'Borongan', 138, NULL),
(117, 'Cabadbaran', 138, NULL),
(118, 'Cabanatuan', 138, NULL),
(119, 'Cadiz', 138, NULL),
(120, 'Calapan', 138, NULL),
(121, 'Calbayog', 138, NULL),
(122, 'Candon', 138, NULL),
(123, 'Canlaon', 138, NULL),
(124, 'Carcar', 138, NULL),
(125, 'Catbalogan', 138, NULL),
(126, 'Cavite City', 138, NULL),
(127, 'Cotabato City', 138, NULL),
(128, 'Dagupan', 138, NULL),
(129, 'Danao', 138, NULL),
(130, 'Dapitan', 138, NULL),
(131, 'Digos', 138, NULL),
(132, 'Dipolog', 138, NULL),
(133, 'Dumaguete', 138, NULL),
(134, 'El Salvador', 138, NULL),
(135, 'Escalante', 138, NULL),
(136, 'Gapan', 138, NULL),
(137, 'General Trias', 138, NULL),
(138, 'Gingoog', 138, NULL),
(139, 'Guihulngan', 138, NULL),
(140, 'Himamaylan', 138, NULL),
(141, 'Ilagan', 138, NULL),
(142, 'Iligan', 138, NULL),
(143, 'Iriga', 138, NULL),
(144, 'Isabela City', 138, NULL),
(145, 'Kabankalan', 138, NULL),
(146, 'Kidapawan', 138, NULL),
(147, 'Koronadal', 138, NULL),
(148, 'La Carlota', 138, NULL),
(149, 'Lamitan', 138, NULL),
(150, 'Laoag', 138, NULL),
(151, 'Ligao', 138, NULL),
(152, 'Lipa', 138, NULL),
(153, 'Maasin', 138, NULL),
(154, 'Mabalacat', 138, NULL),
(155, 'Malabon', 138, NULL),
(156, 'Malaybalay', 138, NULL),
(157, 'Malolos', 138, NULL),
(158, 'Mandaue', 138, NULL),
(159, 'Marawi', 138, NULL),
(160, 'Masbate City', 138, NULL),
(161, 'Mati', 138, NULL),
(162, 'Meycauayan', 138, NULL),
(163, 'Muntinlupa', 138, NULL),
(164, 'Naga', 138, NULL),
(165, 'Ormoc', 138, NULL),
(166, 'Oroquieta', 138, NULL),
(167, 'Ozamiz', 138, NULL),
(168, 'Pagadian', 138, NULL),
(169, 'Palayan', 138, NULL),
(170, 'Panabo', 138, NULL),
(171, 'Passi', 138, NULL),
(172, 'Puerto Princesa', 138, NULL),
(173, 'Roxas', 138, NULL),
(174, 'Sagay', 138, NULL),
(175, 'Samal', 138, NULL),
(176, 'San Carlos (Neg. Occ.)', 138, NULL),
(177, 'San Carlos (Pangasinan)', 138, NULL),
(178, 'San Fernando (La Union)', 138, NULL),
(179, 'San Fernando (Pampanga)', 138, NULL),
(180, 'San Fernando (Cebu)', 138, NULL),
(181, 'San Jose (Occ. Mindoro)', 138, NULL),
(182, 'San Juan', 138, NULL),
(183, 'San Pedro', 138, NULL),
(184, 'Santa Rosa', 138, NULL),
(185, 'Santiago', 138, NULL),
(186, 'Silay', 138, NULL),
(187, 'Sipalay', 138, NULL),
(188, 'Sorsogon City', 138, NULL),
(189, 'Surigao City', 138, NULL),
(190, 'Tabaco', 138, NULL),
(191, 'Tabuk', 138, NULL),
(192, 'Tacloban', 138, NULL),
(193, 'Tacurong', 138, NULL),
(194, 'Tagaytay', 138, NULL),
(195, 'Tagbilaran', 138, NULL),
(196, 'Tagum', 138, NULL),
(197, 'Talisay (Cebu)', 138, NULL),
(198, 'Talisay (Neg. Occ.)', 138, NULL),
(199, 'Tanauan', 138, NULL),
(200, 'Tandag', 138, NULL),
(201, 'Tangub', 138, NULL),
(202, 'Tanjay', 138, NULL),
(203, 'Tayabas', 138, NULL),
(204, 'Toledo', 138, NULL),
(205, 'Trece Martires', 138, NULL),
(206, 'Tuguegarao', 138, NULL),
(207, 'Urdaneta', 138, NULL),
(208, 'Valencia', 138, NULL),
(209, 'Vigan', 138, NULL),
(210, 'Victorias', 138, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `counseling`
--

CREATE TABLE `counseling` (
  `id` int(11) NOT NULL,
  `visit_id` int(11) DEFAULT NULL,
  `completed` enum('Yes','No') DEFAULT NULL,
  `is_student_ambassador` enum('Yes','No') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `counseling`
--

INSERT INTO `counseling` (`id`, `visit_id`, `completed`, `is_student_ambassador`) VALUES
(1, 1, 'Yes', 'No'),
(2, 2, 'Yes', 'Yes'),
(3, 3, NULL, NULL),
(4, 4, NULL, NULL),
(5, 5, NULL, NULL),
(6, 6, NULL, NULL),
(7, 7, NULL, NULL),
(8, 8, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(11) NOT NULL,
  `CountryName` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `CountryName`) VALUES
(1, 'Afghanistan'),
(2, 'Albania'),
(3, 'Algeria'),
(4, 'Andorra'),
(5, 'Angola'),
(6, 'Antigua and Barbuda'),
(7, 'Argentina'),
(8, 'Armenia'),
(9, 'Australia'),
(10, 'Austria'),
(11, 'Azerbaijan'),
(12, 'Bahamas'),
(13, 'Bahrain'),
(14, 'Bangladesh'),
(15, 'Barbados'),
(16, 'Belarus'),
(17, 'Belgium'),
(18, 'Belize'),
(19, 'Benin'),
(20, 'Bhutan'),
(21, 'Bolivia'),
(22, 'Bosnia and Herzegovina'),
(23, 'Botswana'),
(24, 'Brazil'),
(25, 'Brunei'),
(26, 'Bulgaria'),
(27, 'Burkina Faso'),
(28, 'Burundi'),
(29, 'Cabo Verde'),
(30, 'Cambodia'),
(31, 'Cameroon'),
(32, 'Canada'),
(33, 'Central African Republic'),
(34, 'Chad'),
(35, 'Chile'),
(36, 'China'),
(37, 'Colombia'),
(38, 'Comoros'),
(39, 'Congo'),
(40, 'Costa Rica'),
(41, 'Côte d\'Ivoire'),
(42, 'Croatia'),
(43, 'Cuba'),
(44, 'Cyprus'),
(45, 'Czech Republic (Czechia)'),
(46, 'Denmark'),
(47, 'Djibouti'),
(48, 'Dominica'),
(49, 'Dominican Republic'),
(50, 'DR Congo'),
(51, 'Ecuador'),
(52, 'Egypt'),
(53, 'El Salvador'),
(54, 'Equatorial Guinea'),
(55, 'Eritrea'),
(56, 'Estonia'),
(57, 'Eswatini'),
(58, 'Ethiopia'),
(59, 'Fiji'),
(60, 'Finland'),
(61, 'France'),
(62, 'Gabon'),
(63, 'Gambia'),
(64, 'Georgia'),
(65, 'Germany'),
(66, 'Ghana'),
(67, 'Greece'),
(68, 'Grenada'),
(69, 'Guatemala'),
(70, 'Guinea'),
(71, 'Guinea-Bissau'),
(72, 'Guyana'),
(73, 'Haiti'),
(74, 'Holy See'),
(75, 'Honduras'),
(76, 'Hungary'),
(77, 'Iceland'),
(78, 'India'),
(79, 'Indonesia'),
(80, 'Iran'),
(81, 'Iraq'),
(82, 'Ireland'),
(83, 'Israel'),
(84, 'Italy'),
(85, 'Jamaica'),
(86, 'Japan'),
(87, 'Jordan'),
(88, 'Kazakhstan'),
(89, 'Kenya'),
(90, 'Kiribati'),
(91, 'Kuwait'),
(92, 'Kyrgyzstan'),
(93, 'Laos'),
(94, 'Latvia'),
(95, 'Lebanon'),
(96, 'Lesotho'),
(97, 'Liberia'),
(98, 'Libya'),
(99, 'Liechtenstein'),
(100, 'Lithuania'),
(101, 'Luxembourg'),
(102, 'Madagascar'),
(103, 'Malawi'),
(104, 'Malaysia'),
(105, 'Maldives'),
(106, 'Mali'),
(107, 'Malta'),
(108, 'Marshall Islands'),
(109, 'Mauritania'),
(110, 'Mauritius'),
(111, 'Mexico'),
(112, 'Micronesia'),
(113, 'Moldova'),
(114, 'Monaco'),
(115, 'Mongolia'),
(116, 'Montenegro'),
(117, 'Morocco'),
(118, 'Mozambique'),
(119, 'Myanmar'),
(120, 'Namibia'),
(121, 'Nauru'),
(122, 'Nepal'),
(123, 'Netherlands'),
(124, 'New Zealand'),
(125, 'Nicaragua'),
(126, 'Niger'),
(127, 'Nigeria'),
(128, 'North Korea'),
(129, 'North Macedonia'),
(130, 'Norway'),
(131, 'Oman'),
(132, 'Pakistan'),
(133, 'Palau'),
(134, 'Panama'),
(135, 'Papua New Guinea'),
(136, 'Paraguay'),
(137, 'Peru'),
(138, 'Philippines'),
(139, 'Poland'),
(140, 'Portugal'),
(141, 'Qatar'),
(142, 'Romania'),
(143, 'Russia'),
(144, 'Rwanda'),
(145, 'Saint Kitts & Nevis'),
(146, 'Saint Lucia'),
(147, 'Samoa'),
(148, 'San Marino'),
(149, 'Sao Tome & Principe'),
(150, 'Saudi Arabia'),
(151, 'Senegal'),
(152, 'Serbia'),
(153, 'Seychelles'),
(154, 'Sierra Leone'),
(155, 'Singapore'),
(156, 'Slovakia'),
(157, 'Slovenia'),
(158, 'Solomon Islands'),
(159, 'Somalia'),
(160, 'South Africa'),
(161, 'South Korea'),
(162, 'South Sudan'),
(163, 'Spain'),
(164, 'Sri Lanka'),
(165, 'State of Palestine'),
(166, 'St. Vincent & Grenadines'),
(167, 'Sudan'),
(168, 'Suriname'),
(169, 'Sweden'),
(170, 'Switzerland'),
(171, 'Syria'),
(172, 'Tajikistan'),
(173, 'Tanzania'),
(174, 'Thailand'),
(175, 'Timor-Leste'),
(176, 'Togo'),
(177, 'Tonga'),
(178, 'Trinidad and Tobago'),
(179, 'Tunisia'),
(180, 'Turkey'),
(181, 'Turkmenistan'),
(182, 'Tuvalu'),
(183, 'Uganda'),
(184, 'Ukraine'),
(185, 'United Arab Emirates'),
(186, 'United Kingdom'),
(187, 'United States'),
(188, 'Uruguay'),
(189, 'Uzbekistan'),
(190, 'Vanuatu'),
(191, 'Venezuela'),
(192, 'Vietnam'),
(193, 'Yemen'),
(194, 'Zambia'),
(195, 'Zimbabwe');

-- --------------------------------------------------------

--
-- Table structure for table `ear_screening`
--

CREATE TABLE `ear_screening` (
  `id` int(11) NOT NULL,
  `visit_id` int(11) DEFAULT NULL,
  `is_clear` enum('No','Yes') NOT NULL,
  `impressions_collected` set('Left','Right') DEFAULT NULL,
  `comments` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ear_screening`
--

INSERT INTO `ear_screening` (`id`, `visit_id`, `is_clear`, `impressions_collected`, `comments`) VALUES
(1, 1, 'No', 'Left', 'None'),
(2, 2, 'Yes', NULL, NULL),
(3, 3, 'Yes', NULL, NULL),
(4, 4, 'No', NULL, NULL),
(5, 5, '', NULL, NULL),
(6, 6, 'No', NULL, NULL),
(7, 7, 'No', NULL, NULL),
(8, 8, 'No', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `final_quality_control`
--

CREATE TABLE `final_quality_control` (
  `id` int(11) NOT NULL,
  `visit_id` int(11) DEFAULT NULL,
  `batteries_provided` int(11) DEFAULT NULL,
  `hearing_satisfaction` tinyint(4) DEFAULT NULL,
  `asks_to_repeat` tinyint(1) DEFAULT NULL,
  `patient_signed` tinyint(1) DEFAULT NULL,
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `final_quality_control`
--

INSERT INTO `final_quality_control` (`id`, `visit_id`, `batteries_provided`, `hearing_satisfaction`, `asks_to_repeat`, `patient_signed`, `notes`) VALUES
(1, 1, 4, 8, 0, 1, 'Patient satisfied'),
(2, 2, 2, 6, 1, 1, 'Needs recheck'),
(3, 3, 5, 3, 1, 0, 'Serious hearing issue'),
(4, 4, 3, 9, 0, 1, 'No issues noted'),
(5, 5, 6, 5, 1, 1, 'Advised follow-up'),
(6, 6, 4, 9, 0, 1, 'No problems'),
(7, 7, 3, 4, 1, 1, 'Counseling pending'),
(8, 8, 4, 10, 0, 1, 'Excellent hearing aid performance');

-- --------------------------------------------------------

--
-- Table structure for table `fitting_quality_control`
--

CREATE TABLE `fitting_quality_control` (
  `id` int(11) NOT NULL,
  `visit_id` int(11) DEFAULT NULL,
  `is_clear_for_counseling` enum('Yes','No') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fitting_quality_control`
--

INSERT INTO `fitting_quality_control` (`id`, `visit_id`, `is_clear_for_counseling`) VALUES
(1, 1, 'Yes'),
(2, 2, 'Yes'),
(3, 3, 'Yes'),
(4, 4, 'No'),
(5, 5, NULL),
(6, 6, NULL),
(7, 7, NULL),
(8, 8, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `general_hearing_questions`
--

CREATE TABLE `general_hearing_questions` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `has_hearing_loss` enum('No','Undecided','Yes') NOT NULL,
  `uses_sign_language` enum('No','A little','Yes') NOT NULL,
  `uses_speech` enum('No','A little','Yes') NOT NULL,
  `hearing_loss_cause` set('Medication','Meningitis','Aging','Ear Infection','HIV','Tuberculosis','Malaria','Trauma','Birth','Other','Unknown') DEFAULT NULL,
  `has_ringing` enum('No','Undecided','Yes') NOT NULL,
  `has_pain` enum('No','A little','Yes') NOT NULL,
  `hearing_satisfaction` enum('Unsatisfied','Undecided','Satisfied') NOT NULL,
  `asks_to_repeat` enum('No','Sometimes','Yes') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `general_hearing_questions`
--

INSERT INTO `general_hearing_questions` (`id`, `patient_id`, `has_hearing_loss`, `uses_sign_language`, `uses_speech`, `hearing_loss_cause`, `has_ringing`, `has_pain`, `hearing_satisfaction`, `asks_to_repeat`, `created_at`, `updated_at`) VALUES
(1, 1, 'No', '', 'No', 'Aging,Other', 'No', '', '', 'No', '2025-07-15 17:04:21', '2025-07-15 17:04:21'),
(2, 2, '', '', 'No', 'Unknown', '', '', '', '', '2025-07-15 17:04:21', '2025-07-15 17:04:21'),
(3, 3, 'No', 'No', '', 'Medication,Birth', 'No', 'No', '', 'No', '2025-07-15 17:04:21', '2025-07-15 17:04:21'),
(4, 4, '', '', 'No', 'Ear Infection', '', '', '', '', '2025-07-15 17:04:21', '2025-07-15 17:04:21'),
(5, 5, 'No', '', 'No', 'Trauma', 'No', 'No', '', 'No', '2025-07-15 17:04:21', '2025-07-15 17:04:21');

-- --------------------------------------------------------

--
-- Table structure for table `hearing_aid_fitting`
--

CREATE TABLE `hearing_aid_fitting` (
  `id` int(11) NOT NULL,
  `visit_id` int(11) DEFAULT NULL,
  `left_power_level` varchar(50) DEFAULT NULL,
  `left_volume` varchar(50) DEFAULT NULL,
  `left_model` varchar(50) DEFAULT NULL,
  `left_battery` enum('13','675') DEFAULT NULL,
  `left_earmold` varchar(50) DEFAULT NULL,
  `right_power_level` varchar(50) DEFAULT NULL,
  `right_volume` varchar(50) DEFAULT NULL,
  `right_model` varchar(50) DEFAULT NULL,
  `right_battery` enum('13','675') DEFAULT NULL,
  `right_earmold` varchar(50) DEFAULT NULL,
  `num_hearing_aids` enum('0','1','2') DEFAULT NULL,
  `special_device` enum('Bone Conductor (675)','Body Aid (AA)') DEFAULT NULL,
  `left_hearing_type` set('Normal Hearing','Distortion','Implant','Recruitment','No Response','Other') DEFAULT NULL,
  `right_hearing_type` set('Normal Hearing','Distortion','Implant','Recruitment','No Response','Other') DEFAULT NULL,
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hearing_aid_fitting`
--

INSERT INTO `hearing_aid_fitting` (`id`, `visit_id`, `left_power_level`, `left_volume`, `left_model`, `left_battery`, `left_earmold`, `right_power_level`, `right_volume`, `right_model`, `right_battery`, `right_earmold`, `num_hearing_aids`, `special_device`, `left_hearing_type`, `right_hearing_type`, `notes`) VALUES
(1, 2, 'High', 'Medium', 'Model A', '13', NULL, 'High', 'High', 'Model A', '13', NULL, '1', 'Bone Conductor (675)', 'Normal Hearing', 'No Response', 'Fitted successfully'),
(2, 2, 'Medium', 'Low', 'Model B', '675', NULL, 'Medium', 'Medium', 'Model B', '675', NULL, NULL, 'Body Aid (AA)', NULL, NULL, 'Minor adjustment'),
(3, 3, 'Low', 'High', 'Model C', '13', NULL, 'Low', 'Low', 'Model C', '13', NULL, '0', NULL, NULL, NULL, 'Severe loss'),
(4, 4, 'Medium', 'Medium', 'Model D', '675', NULL, 'High', 'High', 'Model D', '13', NULL, NULL, NULL, NULL, NULL, 'Good fit'),
(5, 5, 'High', 'Low', 'Model E', '13', NULL, 'High', 'Medium', 'Model E', '675', NULL, '1', NULL, NULL, NULL, 'Challenging fit'),
(6, 6, 'Medium', 'Medium', 'Model F', '13', NULL, 'Medium', 'Medium', 'Model F', '13', NULL, '2', NULL, NULL, NULL, 'Well adjusted'),
(7, 7, 'High', 'High', 'Model G', '675', NULL, 'High', 'High', 'Model G', '675', NULL, NULL, NULL, NULL, NULL, 'Final fit'),
(8, 8, 'Medium', 'Medium', 'Model H', '13', NULL, 'Medium', 'Medium', 'Model H', '13', NULL, NULL, NULL, NULL, NULL, 'Adjustment check-up');

-- --------------------------------------------------------

--
-- Table structure for table `hearing_screening`
--

CREATE TABLE `hearing_screening` (
  `id` int(11) NOT NULL,
  `visit_id` int(11) DEFAULT NULL,
  `method` enum('Audiogram','WFA® Voice Test') DEFAULT NULL,
  `left_result` enum('Pass','Fail') DEFAULT NULL,
  `right_result` enum('Pass','Fail') DEFAULT NULL,
  `hearing_satisfaction` enum('Unsatisfied','Undecided','Satisfied') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hearing_screening`
--

INSERT INTO `hearing_screening` (`id`, `visit_id`, `method`, `left_result`, `right_result`, `hearing_satisfaction`) VALUES
(1, 1, 'Audiogram', 'Pass', 'Pass', 'Satisfied'),
(2, 2, 'WFA® Voice Test', 'Fail', 'Pass', 'Unsatisfied'),
(3, 3, 'Audiogram', 'Pass', 'Fail', 'Undecided'),
(4, 4, 'WFA® Voice Test', 'Fail', 'Fail', 'Unsatisfied'),
(5, 5, 'Audiogram', 'Pass', 'Pass', 'Satisfied'),
(6, 6, 'WFA® Voice Test', 'Pass', 'Fail', 'Undecided'),
(7, 7, 'Audiogram', 'Fail', 'Fail', 'Unsatisfied'),
(8, 8, 'WFA® Voice Test', 'Pass', 'Pass', 'Satisfied');

-- --------------------------------------------------------

--
-- Table structure for table `otoscopy`
--

CREATE TABLE `otoscopy` (
  `id` int(11) NOT NULL,
  `visit_id` int(11) DEFAULT NULL,
  `wax` set('Left','Right') DEFAULT NULL,
  `infection` set('Left','Right') DEFAULT NULL,
  `perforation` set('Left','Right') DEFAULT NULL,
  `tinnitus` set('Left','Right') DEFAULT NULL,
  `atresia` set('Left','Right') DEFAULT NULL,
  `implant` set('Left','Right') DEFAULT NULL,
  `other` set('Left','Right') DEFAULT NULL,
  `med_recommendation` set('Left','Right') DEFAULT NULL,
  `medication_given` set('Antibiotic','Analgesic','Antiseptic','Antifungal') DEFAULT NULL,
  `ears_clear_for_assessment_left` enum('No','Yes') NOT NULL,
  `ears_clear_for_assessment_right` enum('No','Yes') NOT NULL,
  `comments` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `otoscopy`
--

INSERT INTO `otoscopy` (`id`, `visit_id`, `wax`, `infection`, `perforation`, `tinnitus`, `atresia`, `implant`, `other`, `med_recommendation`, `medication_given`, `ears_clear_for_assessment_left`, `ears_clear_for_assessment_right`, `comments`) VALUES
(1, 1, 'Left', 'Left', '', '', '', '', '', 'Left', 'Antibiotic', '', '', 'Wax and infection found in left ear'),
(2, 2, 'Right', '', 'Right', '', '', '', '', 'Right', 'Antiseptic', '', '', 'Perforation in right ear noted'),
(3, 3, 'Left,Right', 'Left,Right', '', '', '', '', '', 'Left,Right', 'Antibiotic,Analgesic', 'No', 'No', 'Both ears show signs of infection'),
(4, 4, '', '', '', '', '', '', '', '', '', '', '', 'No issues found during otoscopy'),
(5, 5, '', '', '', 'Left', '', '', '', '', 'Analgesic', '', '', 'Tinnitus reported in left ear'),
(6, 6, 'Right', '', '', '', 'Right', '', '', 'Right', 'Antifungal', '', '', 'Possible implant issue on right ear'),
(7, 7, '', '', '', '', '', '', 'Left', '', '', '', '', 'Unidentified structure in left ear, further analysis needed'),
(8, 8, 'Left', 'Right', 'Left', '', '', '', '', 'Left,Right', 'Antibiotic,Antiseptic', '', '', 'Complex case: multiple findings in both ears');

-- --------------------------------------------------------

--
-- Table structure for table `otp_codes`
--

CREATE TABLE `otp_codes` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `otp_code` varchar(6) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `otp_codes`
--

INSERT INTO `otp_codes` (`id`, `user_id`, `otp_code`, `created_at`) VALUES
(1, 1, '427538', '2025-07-23 11:56:40'),
(2, 1, '818481', '2025-07-23 11:58:07'),
(3, 1, '256751', '2025-07-23 14:20:29'),
(4, 1, '898969', '2025-07-23 14:47:10'),
(5, 1, '114541', '2025-07-23 14:48:15'),
(6, 1, '649811', '2025-07-23 14:48:39'),
(7, 1, '537625', '2025-07-23 14:53:30'),
(8, 1, '997807', '2025-07-23 14:55:48'),
(9, 1, '275103', '2025-07-23 14:56:28'),
(10, 1, '962494', '2025-07-23 14:58:43'),
(11, 1, '801289', '2025-07-23 14:59:41'),
(12, 1, '788312', '2025-07-23 15:00:22'),
(13, 1, '140937', '2025-07-23 15:02:32'),
(14, 1, '240164', '2025-07-23 15:03:32'),
(15, 1, '319934', '2025-07-23 15:11:47'),
(16, 1, '202023', '2025-07-23 15:12:23'),
(17, 1, '404737', '2025-07-24 02:08:38'),
(18, 1, '835266', '2025-07-25 11:59:32'),
(19, 1, '995637', '2025-07-25 12:01:12'),
(20, 1, '960259', '2025-07-25 12:13:45'),
(21, 1, '656283', '2025-07-25 12:23:50'),
(22, 1, '827479', '2025-07-25 12:37:53'),
(23, 1, '997667', '2025-07-25 12:42:36'),
(24, 1, '826981', '2025-07-25 12:50:49'),
(25, 1, '128747', '2025-07-25 13:00:02'),
(26, 1, '912529', '2025-07-25 13:12:13'),
(27, 1, '501960', '2025-07-25 13:14:17'),
(28, 1, '367774', '2025-07-25 13:16:08'),
(29, 1, '110388', '2025-07-25 13:20:17'),
(30, 1, '502201', '2025-07-25 13:20:58'),
(31, 1, '946314', '2025-07-29 12:26:46'),
(32, 1, '937491', '2025-07-29 16:14:17'),
(33, 1, '571328', '2025-07-29 16:15:10'),
(34, 1, '104435', '2025-07-29 16:16:08'),
(35, 1, '100474', '2025-07-29 16:45:05'),
(36, 1, '786630', '2025-07-29 16:53:48'),
(37, 1, '763884', '2025-07-29 16:54:32'),
(38, 1, '780003', '2025-07-29 17:05:12'),
(39, 1, '628639', '2025-07-29 17:08:48'),
(40, 1, '385064', '2025-07-29 17:13:55'),
(41, 1, '359636', '2025-07-29 17:23:45'),
(42, 1, '275215', '2025-07-29 17:25:13'),
(43, 1, '660777', '2025-07-29 17:29:55'),
(44, 1, '416714', '2025-07-29 17:41:16'),
(45, 1, '159290', '2025-07-29 17:53:57'),
(46, 2, '713520', '2025-07-29 18:21:41'),
(47, 2, '254824', '2025-07-29 19:11:21'),
(48, 2, '679932', '2025-07-29 19:19:14'),
(49, 1, '341579', '2025-07-29 19:24:07'),
(50, 1, '985450', '2025-07-29 19:24:55'),
(51, 2, '521613', '2025-07-29 20:00:10'),
(52, 2, '856730', '2025-07-29 20:31:38'),
(53, 2, '625987', '2025-07-29 21:30:42'),
(54, 1, '185051', '2025-07-29 22:37:50'),
(55, 1, '435592', '2025-07-29 22:43:20'),
(56, 2, '350500', '2025-07-30 05:27:29'),
(57, 2, '619477', '2025-07-30 06:12:17'),
(58, 2, '912268', '2025-07-30 06:24:41'),
(59, 1, '662046', '2025-07-30 07:24:52'),
(60, 2, '340076', '2025-07-30 07:25:14'),
(61, 2, '113859', '2025-07-30 07:27:18'),
(62, 2, '925644', '2025-07-30 07:29:06'),
(63, 2, '629658', '2025-07-30 07:29:59'),
(64, 2, '614002', '2025-07-30 14:25:36'),
(65, 2, '474795', '2025-07-30 14:29:52'),
(66, 2, '322896', '2025-07-30 14:33:58'),
(67, 2, '194362', '2025-07-30 14:33:58'),
(68, 2, '643970', '2025-07-30 14:34:45'),
(69, 2, '771294', '2025-07-30 14:40:34'),
(70, 2, '489218', '2025-07-30 16:13:13'),
(71, 1, '325754', '2025-07-30 16:36:05'),
(72, 2, '101370', '2025-07-30 16:42:09'),
(73, 2, '655095', '2025-07-30 16:43:25');

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `id` int(11) NOT NULL,
  `shf_id` varchar(50) NOT NULL,
  `surname` varchar(100) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `gender` enum('Male','Female','Other') DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `mobile_number` varchar(20) DEFAULT NULL,
  `alt_number` varchar(20) DEFAULT NULL,
  `uses_sms` tinyint(1) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `is_current_student` tinyint(1) DEFAULT NULL,
  `school_name` varchar(255) DEFAULT NULL,
  `school_phone` varchar(50) DEFAULT NULL,
  `employment_status` enum('Employed','Self Employed','Not Employed') DEFAULT NULL,
  `education_level` enum('None','Primary','Secondary','Post Secondary') DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`id`, `shf_id`, `surname`, `first_name`, `gender`, `birthdate`, `age`, `mobile_number`, `alt_number`, `uses_sms`, `country_id`, `city_id`, `is_current_student`, `school_name`, `school_phone`, `employment_status`, `education_level`, `created_at`, `updated_at`) VALUES
(1, 'SHF001', 'Dela Cruz', 'Juan', 'Male', '1995-06-12', 30, '09171234567', '09281234567', 1, 138, 1, 0, NULL, NULL, 'Employed', 'Post Secondary', '2025-07-15 16:46:40', '2025-07-25 11:45:56'),
(2, 'SHF002', 'Reyes', 'Maria', 'Female', '2002-03-08', 23, '09181234567', NULL, 1, 138, 1, 1, 'Polytechnic University of the Philippines', '0287140011', 'Not Employed', 'Post Secondary', '2025-07-15 16:46:40', '2025-07-25 11:46:20'),
(3, 'SHF003', 'Garcia', 'Pedro', 'Male', '1988-11-21', 36, '09191234567', NULL, 0, 138, 150, 0, NULL, NULL, 'Self Employed', 'Secondary', '2025-07-15 16:46:40', '2025-07-16 13:04:22'),
(4, 'SHF004', 'Santos', 'Ana', 'Female', '2007-01-17', 18, '09991234567', '09451234567', 1, 138, 12, 1, 'Batangas State University', '0439800011', 'Not Employed', 'Secondary', '2025-07-15 16:46:40', '2025-07-16 13:05:07'),
(5, 'SHF005', 'Torres', 'Luis', 'Male', '1990-09-05', 34, '09081234567', NULL, 0, 138, 20, 0, NULL, NULL, 'Employed', 'Post Secondary', '2025-07-15 16:46:40', '2025-07-16 13:04:49'),
(6, 'SHF006', 'Lopez', 'Carlos', 'Male', '1993-05-10', 32, '09172222222', NULL, 1, 138, 15, 0, NULL, NULL, 'Employed', 'Post Secondary', '2025-07-29 00:00:00', '2025-07-29 00:00:00'),
(7, 'SHF007', 'Ramos', 'Liza', 'Female', '2005-10-25', 19, '09173333333', '09179999999', 1, 138, 22, 1, 'University of the East', '0278123456', 'Not Employed', 'Secondary', '2025-07-29 00:01:00', '2025-07-29 00:01:00'),
(8, 'SHF008', 'Mendoza', 'Erwin', 'Male', '1997-08-13', 27, '09174444444', NULL, 0, 138, 5, 0, NULL, NULL, 'Self Employed', 'Post Secondary', '2025-07-29 00:02:00', '2025-07-29 00:02:00'),
(9, 'SHF009', 'Gutierrez', 'Jasmine', 'Female', '2000-12-01', 24, '09175555555', NULL, 1, 138, 1, 1, 'University of Santo Tomas', '0278991234', 'Not Employed', 'Post Secondary', '2025-07-29 00:03:00', '2025-07-29 00:03:00'),
(10, 'SHF010', 'Navarro', 'Mico', 'Male', '1985-04-07', 40, '09176666666', NULL, 0, 138, 8, 0, NULL, NULL, 'Employed', 'Secondary', '2025-07-29 00:04:00', '2025-07-29 00:04:00'),
(11, 'SHF011', 'Villanueva', 'Sarah', 'Female', '1998-09-30', 26, '09177777777', '09285555555', 1, 138, 3, 0, NULL, NULL, 'Employed', 'Post Secondary', '2025-07-29 00:05:00', '2025-07-29 00:05:00'),
(12, 'SHF012', 'Cruz', 'Ben', 'Male', '1991-07-22', 34, '09178888888', NULL, 1, 138, 10, 0, NULL, NULL, 'Self Employed', 'Post Secondary', '2025-07-29 00:06:00', '2025-07-29 00:06:00'),
(13, 'SHF013', 'Diaz', 'Lara', 'Female', '2004-11-15', 20, '09179999999', NULL, 1, 138, 7, 1, 'De La Salle University', '0278012345', 'Not Employed', 'Post Secondary', '2025-07-29 00:07:00', '2025-07-29 00:07:00'),
(14, 'SHF014', 'Bautista', 'Noel', 'Male', '1994-02-28', 31, '09170000000', NULL, 0, 138, 18, 0, NULL, NULL, 'Employed', 'Post Secondary', '2025-07-29 00:08:00', '2025-07-29 00:08:00'),
(15, 'SHF015', 'Flores', 'Gina', 'Female', '2006-06-03', 19, '09171111111', '09451230000', 1, 138, 14, 1, 'Far Eastern University', '0278987654', 'Not Employed', 'Secondary', '2025-07-29 00:09:00', '2025-07-29 00:09:00');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `RoleID` int(11) NOT NULL,
  `RoleName` enum('Admin','City Coordinator','Country Coordinator','Supply Manager') DEFAULT NULL,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`RoleID`, `RoleName`, `CreatedAt`, `UpdatedAt`) VALUES
(1, 'Admin', '2025-07-15 16:15:55', '2025-07-15 16:15:55'),
(2, 'City Coordinator', '2025-07-15 16:15:55', '2025-07-15 16:15:55'),
(3, 'Country Coordinator', '2025-07-15 16:15:55', '2025-07-15 16:15:55'),
(4, 'Supply Manager', '2025-07-15 16:15:55', '2025-07-15 16:15:55');

-- --------------------------------------------------------

--
-- Table structure for table `sms_logs`
--

CREATE TABLE `sms_logs` (
  `SMSLogID` int(11) NOT NULL,
  `PatientID` int(11) DEFAULT NULL,
  `RecipientNumber` varchar(20) DEFAULT NULL,
  `Message` text NOT NULL,
  `Status` enum('sent','failed') DEFAULT 'sent',
  `SentAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sms_logs`
--

INSERT INTO `sms_logs` (`SMSLogID`, `PatientID`, `RecipientNumber`, `Message`, `Status`, `SentAt`) VALUES
(1, 1, '09171234567', 'Your appointment is tomorrow at 10AM.', 'sent', '2025-06-26 16:16:26'),
(2, 4, '09171234567', 'Good day! Your hearing checkup is scheduled for July 20 at 10:00 AM in Lipa.', 'sent', '2025-07-09 08:15:00'),
(3, 5, '09181234567', 'Reminder: Your follow-up appointment in San Pablo is on July 21 at 2:00 PM.', 'sent', '2025-07-09 09:30:00'),
(4, 6, '09991234567', 'Please confirm your attendance for the consultation in Calamba this July 22.', 'sent', '2025-07-10 14:05:00'),
(5, 7, '09081234567', 'Health reminder: Stay hydrated and take your medication regularly.', 'sent', '2025-07-11 07:45:00'),
(6, 8, '09171234567', 'Gabriela, your health record was updated after your recent visit in Vigan.', 'failed', '2025-07-11 15:00:00'),
(7, 9, '09181234567', 'Lucena RHU: Please visit us to complete your medical record update.', 'sent', '2025-07-12 10:20:00'),
(8, 10, '09191234567', 'Hi Antonio! Don’t forget your check-up at 9:00 AM, July 23 in Manila.', 'failed', '2025-07-12 13:50:00'),
(9, 11, '09991234567', 'Emilio, please call us at (043) 123-4567 to reschedule your appointment.', 'failed', '2025-07-13 11:00:00'),
(10, 12, '09221234567', 'Carmen, your lab results are available. Visit Baguio clinic for consultation.', 'sent', '2025-07-13 16:30:00'),
(11, 13, '09301234567', 'Your appointment is confirmed on July 25 at 1:00 PM in Davao City.', 'sent', '2025-07-14 08:45:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `UserID` int(11) NOT NULL,
  `RoleID` int(11) DEFAULT NULL,
  `FirstName` varchar(100) DEFAULT NULL,
  `LastName` varchar(100) DEFAULT NULL,
  `Username` varchar(50) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `Salt` varchar(64) DEFAULT NULL,
  `PhoneNumber` varchar(20) DEFAULT NULL,
  `Gender` enum('Male','Female','Other') DEFAULT NULL,
  `Birthdate` date DEFAULT NULL,
  `CityID` int(11) DEFAULT NULL,
  `CountryID` int(11) DEFAULT NULL,
  `CoordinatorID` int(11) DEFAULT NULL,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `avatar` varchar(255) DEFAULT NULL,
  `FailedAttempts` int(11) DEFAULT 0,
  `LastFailedLogin` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserID`, `RoleID`, `FirstName`, `LastName`, `Username`, `Password`, `Salt`, `PhoneNumber`, `Gender`, `Birthdate`, `CityID`, `CountryID`, `CoordinatorID`, `CreatedAt`, `UpdatedAt`, `avatar`, `FailedAttempts`, `LastFailedLogin`) VALUES
(1, 1, 'Shekinah Marie', 'Araneta', 'Marie', '9f6436fee2a0bdd741730b54fe113be546f719ac6a518089b6ab16c7919a074d', '78e695eaaa6c4ef7026ab2c230e8a77a', '09708710682', 'Female', '2003-09-29', 12, 138, NULL, '2025-07-15 16:31:44', '2025-07-29 23:18:02', 'uploads/avatars/avatar_1_1753433497.jpg', 0, NULL),
(2, 2, 'Angelo', 'Torano', 'Angelo', '6383f58f907cf9ce73ebde0c190484377fc5cae23960dcaf092507a38faf9cb4', '9d74b30da9e3212140f8e422ce7fdd09', '09396672300', 'Male', '2001-09-09', 12, 138, 1, '2025-07-25 05:51:36', '2025-07-30 08:43:07', 'uploads/avatars/avatar_2_1753422796.jpg', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `visits`
--

CREATE TABLE `visits` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `phase` enum('Phase 1','Phase 2','Phase 3') DEFAULT NULL,
  `visit_date` date DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `coordinator_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `visits`
--

INSERT INTO `visits` (`id`, `patient_id`, `phase`, `visit_date`, `country_id`, `coordinator_id`) VALUES
(1, 1, 'Phase 1', '2025-07-01', 138, 1),
(2, 1, 'Phase 2', '2025-07-10', 138, 1),
(3, 1, 'Phase 3', '2025-07-20', 138, 1),
(4, 2, 'Phase 1', '2025-07-01', 138, 1),
(5, 3, 'Phase 1', '2025-07-01', 138, 1),
(6, 4, 'Phase 1', '2025-07-01', 138, 1),
(7, 5, 'Phase 1', '2025-07-01', 138, 1),
(8, 1, 'Phase 3', '2025-07-30', 138, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD PRIMARY KEY (`LogID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `aftercare_evaluation`
--
ALTER TABLE `aftercare_evaluation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `visit_id` (`visit_id`);

--
-- Indexes for table `aftercare_services`
--
ALTER TABLE `aftercare_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `visit_id` (`visit_id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`CityID`),
  ADD KEY `CountryID` (`CountryID`),
  ADD KEY `fk_cities_coordinator` (`CoordinatorID`);

--
-- Indexes for table `counseling`
--
ALTER TABLE `counseling`
  ADD PRIMARY KEY (`id`),
  ADD KEY `visit_id` (`visit_id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ear_screening`
--
ALTER TABLE `ear_screening`
  ADD PRIMARY KEY (`id`),
  ADD KEY `visit_id` (`visit_id`);

--
-- Indexes for table `final_quality_control`
--
ALTER TABLE `final_quality_control`
  ADD PRIMARY KEY (`id`),
  ADD KEY `visit_id` (`visit_id`);

--
-- Indexes for table `fitting_quality_control`
--
ALTER TABLE `fitting_quality_control`
  ADD PRIMARY KEY (`id`),
  ADD KEY `visit_id` (`visit_id`);

--
-- Indexes for table `general_hearing_questions`
--
ALTER TABLE `general_hearing_questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_id` (`patient_id`);

--
-- Indexes for table `hearing_aid_fitting`
--
ALTER TABLE `hearing_aid_fitting`
  ADD PRIMARY KEY (`id`),
  ADD KEY `visit_id` (`visit_id`);

--
-- Indexes for table `hearing_screening`
--
ALTER TABLE `hearing_screening`
  ADD PRIMARY KEY (`id`),
  ADD KEY `visit_id` (`visit_id`);

--
-- Indexes for table `otoscopy`
--
ALTER TABLE `otoscopy`
  ADD PRIMARY KEY (`id`),
  ADD KEY `visit_id` (`visit_id`);

--
-- Indexes for table `otp_codes`
--
ALTER TABLE `otp_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `shf_id` (`shf_id`),
  ADD UNIQUE KEY `shf_id_2` (`shf_id`),
  ADD KEY `country_id` (`country_id`),
  ADD KEY `fk_patient_city` (`city_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`RoleID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserID`),
  ADD UNIQUE KEY `Username` (`Username`),
  ADD KEY `RoleID` (`RoleID`),
  ADD KEY `CityID` (`CityID`),
  ADD KEY `CountryID` (`CountryID`);

--
-- Indexes for table `visits`
--
ALTER TABLE `visits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `country_id` (`country_id`),
  ADD KEY `coordinator_id` (`coordinator_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_logs`
--
ALTER TABLE `activity_logs`
  MODIFY `LogID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=353;

--
-- AUTO_INCREMENT for table `aftercare_evaluation`
--
ALTER TABLE `aftercare_evaluation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `aftercare_services`
--
ALTER TABLE `aftercare_services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `CityID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=211;

--
-- AUTO_INCREMENT for table `counseling`
--
ALTER TABLE `counseling`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=196;

--
-- AUTO_INCREMENT for table `ear_screening`
--
ALTER TABLE `ear_screening`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `final_quality_control`
--
ALTER TABLE `final_quality_control`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `fitting_quality_control`
--
ALTER TABLE `fitting_quality_control`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `general_hearing_questions`
--
ALTER TABLE `general_hearing_questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `hearing_aid_fitting`
--
ALTER TABLE `hearing_aid_fitting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `hearing_screening`
--
ALTER TABLE `hearing_screening`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `otoscopy`
--
ALTER TABLE `otoscopy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `otp_codes`
--
ALTER TABLE `otp_codes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `RoleID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `visits`
--
ALTER TABLE `visits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD CONSTRAINT `activity_logs_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`);

--
-- Constraints for table `aftercare_evaluation`
--
ALTER TABLE `aftercare_evaluation`
  ADD CONSTRAINT `aftercare_evaluation_ibfk_1` FOREIGN KEY (`visit_id`) REFERENCES `visits` (`id`);

--
-- Constraints for table `aftercare_services`
--
ALTER TABLE `aftercare_services`
  ADD CONSTRAINT `aftercare_services_ibfk_1` FOREIGN KEY (`visit_id`) REFERENCES `visits` (`id`);

--
-- Constraints for table `cities`
--
ALTER TABLE `cities`
  ADD CONSTRAINT `cities_ibfk_1` FOREIGN KEY (`CountryID`) REFERENCES `countries` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_cities_coordinator` FOREIGN KEY (`CoordinatorID`) REFERENCES `users` (`UserID`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `counseling`
--
ALTER TABLE `counseling`
  ADD CONSTRAINT `counseling_ibfk_1` FOREIGN KEY (`visit_id`) REFERENCES `visits` (`id`);

--
-- Constraints for table `ear_screening`
--
ALTER TABLE `ear_screening`
  ADD CONSTRAINT `ear_screening_ibfk_1` FOREIGN KEY (`visit_id`) REFERENCES `visits` (`id`);

--
-- Constraints for table `final_quality_control`
--
ALTER TABLE `final_quality_control`
  ADD CONSTRAINT `final_quality_control_ibfk_1` FOREIGN KEY (`visit_id`) REFERENCES `visits` (`id`);

--
-- Constraints for table `fitting_quality_control`
--
ALTER TABLE `fitting_quality_control`
  ADD CONSTRAINT `fitting_quality_control_ibfk_1` FOREIGN KEY (`visit_id`) REFERENCES `visits` (`id`);

--
-- Constraints for table `general_hearing_questions`
--
ALTER TABLE `general_hearing_questions`
  ADD CONSTRAINT `general_hearing_questions_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`);

--
-- Constraints for table `hearing_aid_fitting`
--
ALTER TABLE `hearing_aid_fitting`
  ADD CONSTRAINT `hearing_aid_fitting_ibfk_1` FOREIGN KEY (`visit_id`) REFERENCES `visits` (`id`);

--
-- Constraints for table `hearing_screening`
--
ALTER TABLE `hearing_screening`
  ADD CONSTRAINT `hearing_screening_ibfk_1` FOREIGN KEY (`visit_id`) REFERENCES `visits` (`id`);

--
-- Constraints for table `otoscopy`
--
ALTER TABLE `otoscopy`
  ADD CONSTRAINT `otoscopy_ibfk_1` FOREIGN KEY (`visit_id`) REFERENCES `visits` (`id`);

--
-- Constraints for table `otp_codes`
--
ALTER TABLE `otp_codes`
  ADD CONSTRAINT `otp_codes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`UserID`);

--
-- Constraints for table `patients`
--
ALTER TABLE `patients`
  ADD CONSTRAINT `fk_patient_city` FOREIGN KEY (`city_id`) REFERENCES `cities` (`CityID`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `patients_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`RoleID`) REFERENCES `roles` (`RoleID`),
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`CityID`) REFERENCES `cities` (`CityID`),
  ADD CONSTRAINT `users_ibfk_3` FOREIGN KEY (`CountryID`) REFERENCES `countries` (`id`);

--
-- Constraints for table `visits`
--
ALTER TABLE `visits`
  ADD CONSTRAINT `visits_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`),
  ADD CONSTRAINT `visits_ibfk_2` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`),
  ADD CONSTRAINT `visits_ibfk_3` FOREIGN KEY (`coordinator_id`) REFERENCES `users` (`UserID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

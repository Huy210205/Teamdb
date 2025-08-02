-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 02, 2025 at 11:51 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotel`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `full_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gender` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `birthday` date NOT NULL,
  `identity_card` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone_number` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `date_set` date DEFAULT NULL,
  `time_set` time DEFAULT NULL,
  `position_id` int(11) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`username`, `password`, `full_name`, `gender`, `birthday`, `identity_card`, `phone_number`, `email`, `date_set`, `time_set`, `position_id`, `id`) VALUES
('admin', 'MTIzNDU2Nzg=', 'Admin', 'Male', '1996-08-10', '1122334455', '0166455079', 'hpvdanh030@gmail.com', '2020-12-23', '20:14:58', 1, 0),
('guest', 'MTIzNDU2Nzg=', 'Long Huy', 'Male', '2005-04-05', '236523152', '0911628126', 'Longhuy@gmail.com', '2025-07-08', '14:17:58', 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `checkin`
--

CREATE TABLE `checkin` (
  `ma_dat_phong` int(11) NOT NULL,
  `ho_ten` varchar(100) DEFAULT NULL,
  `sodt` varchar(15) DEFAULT NULL,
  `email` varchar(250) DEFAULT NULL,
  `socmnd` varchar(20) DEFAULT NULL,
  `tien_coc` decimal(12,0) DEFAULT NULL,
  `ma_phong` int(11) DEFAULT NULL,
  `ngay_dat` date DEFAULT NULL,
  `gio_dat` time DEFAULT NULL,
  `loai_dat` varchar(255) DEFAULT NULL,
  `ten_dang_nhap` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `checkin`
--

INSERT INTO `checkin` (`ma_dat_phong`, `ho_ten`, `sodt`, `email`, `socmnd`, `tien_coc`, `ma_phong`, `ngay_dat`, `gio_dat`, `loai_dat`, `ten_dang_nhap`) VALUES
(3, 'Phạm Nguyên', '1233333', 'hpvodanh030@gmail.com', NULL, NULL, 1, '2021-01-07', NULL, NULL, NULL),
(10, 'kiên', '0965918200', 'huyd57107@gmail.com', NULL, NULL, 3, '2025-07-09', NULL, NULL, NULL),
(12, 'Khiêm', '0965918200', 'huyd57107@gmail.com', NULL, NULL, 4, '2025-07-08', NULL, NULL, NULL),
(14, 'Linh', '0965918200', 'huyd57107@gmail.com', NULL, NULL, 7, '2025-07-08', NULL, NULL, NULL),
(16, 'Quang Khanh', '2312312', 'huyd57107@gmail.com', NULL, NULL, 1, '2025-07-09', NULL, NULL, NULL),
(17, 'huy13', '0965918200', 'huyd57107@gmail.com', NULL, NULL, 22, '2025-07-08', NULL, NULL, NULL),
(20, 'huy', '0965918200', 'huyd57107@gmail.com', NULL, NULL, 24, '2025-07-08', NULL, NULL, NULL),
(22, 'Akebi-2D', '0965918200', 'huyd57107@gmail.com', NULL, NULL, 15, '2025-07-11', NULL, NULL, NULL),
(24, 'quanghuy4567', '', 'huyd57107@gmail.com', NULL, NULL, 20, '2025-08-02', NULL, NULL, NULL),
(34, 'Phạm Nguyên', '1233333', NULL, '123', 10, 1, '2021-01-06', '10:05:00', 'homestay', 'admin'),
(35, 'hpvodanh', '1233333', 'hpvodanh030@gmail.com', '123', 10, 1, '2021-01-06', '10:05:00', 'theongay', 'admin'),
(36, 'Phạm Nguyên', '1233333', 'hpvodanh030@gmail.com', '213123131', 50, 2, '2021-01-06', '10:28:00', 'theongay', 'admin'),
(37, 'Phạm Nguyên', '1233333', NULL, '23432455', 12, 3, '2021-01-06', '10:30:00', 'homestay', 'admin'),
(38, 'hpvodanh', '1233333', 'hpvodanh030@gmail.com', '4354366', 10, 1, '2021-01-06', '11:31:00', 'theongay', 'admin'),
(39, 'longhuy', '546456', 'huythandong@gmail.com', '5645', 100, 5, '2025-07-08', '14:56:00', 'theongay', 'guest'),
(40, 'huy dragon', '093132344', 'huy@gmail.com', '161651651', 1, 20, '2025-07-09', '15:07:00', 'theongay', 'guest'),
(41, 'huy', '16516544', NULL, '161466164', 200, 21, '2025-07-08', '15:13:00', 'homestay', 'guest'),
(42, 'Kiên ', '0965918200', 'huyd57107@gmail.com', '156116661615', 0, 3, '2025-07-08', '17:40:00', 'theongay', 'admin'),
(43, 'khiêm', '0965918200', 'huyd57107@gmail.com', '64564564564', -1, 4, '2025-07-08', '15:54:00', 'theogio', 'admin'),
(44, 'Linh', '0965918200', 'Huyd57107@gmail.com', '16456166451', 0, 7, '2025-07-08', '16:01:00', 'theogio', 'admin'),
(45, 'hgfhfg', '45', '', '45', 45, 22, '2025-07-08', '18:18:00', 'theogio', 'admin'),
(46, 'vhjghjgh', '6445654', 'ghgfjgf@gmail.com', '454', 0, 22, '2025-07-08', '18:19:00', 'theogio', 'admin'),
(47, 'Quang Khanh1', '4', 'khanh@gmail.com', '45', 45, 12, '2025-07-11', '17:35:00', 'theogio', 'admin'),
(48, 'khanh69', '0965918200', 'khanh@gmail.com', '56544', 10, 9, '2025-07-11', '18:12:00', 'theogio', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `checkincalendar`
--

CREATE TABLE `checkincalendar` (
  `ma_lich` int(11) NOT NULL,
  `ten_nguoi_dat` varchar(50) NOT NULL,
  `so_dien_thoai` varchar(20) NOT NULL,
  `ngay_dat` date NOT NULL,
  `gio_dat` time DEFAULT NULL,
  `thong_tin_them` varchar(255) DEFAULT NULL,
  `ten_dang_nhap` varchar(60) DEFAULT NULL,
  `ma_phong` int(11) DEFAULT NULL,
  `imail` varchar(255) DEFAULT NULL,
  `ngay_tra` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `checkincalendar`
--

INSERT INTO `checkincalendar` (`ma_lich`, `ten_nguoi_dat`, `so_dien_thoai`, `ngay_dat`, `gio_dat`, `thong_tin_them`, `ten_dang_nhap`, `ma_phong`, `imail`, `ngay_tra`) VALUES
(3, 'akhanh', '2312312', '2025-07-08', NULL, NULL, NULL, 19, 'khanh@gmail.com', '2025-07-10'),
(6, 'huy12', '0965918200', '2025-07-09', NULL, NULL, NULL, 2, 'huyd57107@gmail.com', '2025-07-10'),
(8, 'huy13', '0965918200', '2025-07-08', '18:17:00', '', 'admin', 22, 'huyd57107@gmail.com', '2025-07-10');

-- --------------------------------------------------------

--
-- Table structure for table `checkout`
--

CREATE TABLE `checkout` (
  `ma_tra_phong` int(11) NOT NULL,
  `ma_dat_phong` int(11) NOT NULL,
  `ngay_tra` date NOT NULL,
  `gio_tra` time DEFAULT NULL,
  `tong_tien` decimal(12,0) NOT NULL,
  `nguoi_thu_tien` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `checkout`
--

INSERT INTO `checkout` (`ma_tra_phong`, `ma_dat_phong`, `ngay_tra`, `gio_tra`, `tong_tien`, `nguoi_thu_tien`) VALUES
(3, 3, '2021-01-08', NULL, 300, NULL),
(10, 10, '2025-07-10', NULL, 380, NULL),
(11, 12, '2025-07-09', NULL, 300, NULL),
(13, 14, '2025-07-09', NULL, 370, NULL),
(14, 16, '2025-07-10', NULL, 300, NULL),
(15, 17, '2025-07-10', NULL, 500, NULL),
(18, 20, '2025-07-11', NULL, 550, NULL),
(20, 22, '2025-07-13', NULL, 300, NULL),
(22, 24, '2025-08-04', NULL, 510, NULL),
(23, 34, '2021-01-06', '10:05:00', 630, 'admin'),
(24, 35, '2021-01-06', '10:06:00', 230, 'admin'),
(25, 36, '2021-01-06', '10:28:00', 230, 'admin'),
(26, 39, '2025-07-08', '14:58:00', 200, 'admin'),
(27, 38, '2025-07-08', '15:05:00', 394794, 'guest'),
(28, 37, '2025-07-08', '15:06:00', 1052788, 'guest'),
(29, 40, '2025-07-08', '15:30:00', 509, 'admin'),
(30, 41, '2025-07-08', '15:32:00', 1000, 'admin'),
(31, 43, '2025-07-08', '15:55:00', 51, 'admin'),
(32, 45, '2025-07-08', '18:19:00', -15, 'admin'),
(33, 46, '2025-07-08', '18:19:00', 30, 'admin'),
(34, 47, '2025-07-11', '17:36:00', 5, 'admin'),
(35, 48, '2025-07-11', '18:15:00', 45, 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `collect`
--

CREATE TABLE `collect` (
  `id` int(11) NOT NULL,
  `content` varchar(255) NOT NULL,
  `collect_type` int(1) NOT NULL,
  `collect_date` date DEFAULT NULL,
  `collect_time` time DEFAULT NULL,
  `money` decimal(12,0) NOT NULL,
  `username` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `collect`
--

INSERT INTO `collect` (`id`, `content`, `collect_type`, `collect_date`, `collect_time`, `money`, `username`) VALUES
(1, 'Buy two Pepsi boxs', 1, '2021-01-05', '15:17:35', 20, 'admin'),
(2, 'Guest buy seven lons Pepsi', 0, '2021-01-05', '15:18:06', 5, 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `display`
--

CREATE TABLE `display` (
  `id` int(2) NOT NULL,
  `position_name` varchar(25) DEFAULT NULL,
  `address` varchar(60) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `display`
--

INSERT INTO `display` (`id`, `position_name`, `address`, `phone_number`) VALUES
(1, 'Homie Hotels', 'CMC Tower Số 11 Duy Tân, Dịch Vọng Hậu, Cầu Giấy, Hà Nội', '0909909909');

-- --------------------------------------------------------

--
-- Table structure for table `historylogin`
--

CREATE TABLE `historylogin` (
  `id` int(11) NOT NULL,
  `login_date` date NOT NULL,
  `login_time` time NOT NULL,
  `account_login` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `historylogin`
--

INSERT INTO `historylogin` (`id`, `login_date`, `login_time`, `account_login`) VALUES
(1, '2020-12-25', '21:07:42', 'admin'),
(2, '2020-12-25', '22:51:44', 'admin'),
(3, '2020-12-25', '22:54:53', 'admin'),
(4, '2020-12-25', '23:03:23', 'admin'),
(5, '2020-12-25', '23:18:36', 'admin'),
(6, '2020-12-25', '23:23:52', 'admin'),
(7, '2020-12-25', '23:33:12', 'admin'),
(8, '2020-12-25', '23:37:58', 'admin'),
(9, '2020-12-25', '23:38:25', 'admin'),
(10, '2020-12-25', '23:38:32', 'admin'),
(11, '2020-12-25', '23:45:57', 'admin'),
(12, '2020-12-25', '23:46:04', 'admin'),
(13, '2020-12-25', '23:51:41', 'admin'),
(14, '2020-12-25', '23:55:41', 'admin'),
(15, '2020-12-25', '23:56:56', 'admin'),
(16, '2020-12-26', '15:34:34', 'admin'),
(17, '2020-12-26', '16:58:49', 'admin'),
(18, '2020-12-26', '17:02:54', 'admin'),
(19, '2020-12-26', '17:15:32', 'admin'),
(20, '2020-12-26', '17:19:25', 'admin'),
(21, '2020-12-26', '17:20:38', 'admin'),
(22, '2020-12-26', '18:13:59', 'admin'),
(23, '2020-12-26', '18:27:28', 'admin'),
(24, '2020-12-26', '21:00:56', 'admin'),
(25, '2020-12-26', '21:03:49', 'guest'),
(26, '2020-12-26', '21:05:31', 'guest'),
(27, '2020-12-26', '21:15:30', 'admin'),
(28, '2020-12-26', '21:30:17', 'admin'),
(29, '2020-12-26', '22:16:26', 'admin'),
(30, '2020-12-27', '10:03:39', 'admin'),
(31, '2020-12-27', '10:12:13', 'admin'),
(32, '2020-12-28', '15:35:41', 'admin'),
(33, '2020-12-28', '15:38:01', 'admin'),
(34, '2020-12-28', '21:59:39', 'admin'),
(35, '2020-12-29', '19:54:10', 'admin'),
(36, '2020-12-29', '19:58:50', 'admin'),
(37, '2020-12-30', '13:24:32', 'admin'),
(38, '2020-12-30', '14:26:26', 'admin'),
(39, '2020-12-30', '17:28:03', 'admin'),
(40, '2020-12-30', '20:32:58', 'admin'),
(41, '2020-12-30', '22:11:13', 'admin'),
(42, '2020-12-30', '23:17:35', 'admin'),
(43, '2020-12-30', '23:47:44', 'admin'),
(44, '2020-12-31', '00:03:42', 'admin'),
(45, '2020-12-31', '00:07:38', 'admin'),
(46, '2021-01-02', '14:51:43', 'admin'),
(47, '2021-01-05', '14:10:52', 'admin'),
(48, '2021-01-05', '14:14:57', 'admin'),
(49, '2021-01-05', '14:20:05', 'admin'),
(50, '2021-01-05', '14:28:29', 'admin'),
(51, '2021-01-05', '14:36:20', 'admin'),
(52, '2021-01-05', '14:41:27', 'admin'),
(53, '2021-01-05', '14:52:26', 'admin'),
(54, '2021-01-05', '14:54:54', 'admin'),
(55, '2021-01-05', '14:56:53', 'admin'),
(56, '2021-01-05', '14:58:49', 'admin'),
(57, '2021-01-05', '14:59:48', 'admin'),
(58, '2021-01-05', '16:19:02', 'admin'),
(59, '2021-01-06', '08:54:13', 'admin'),
(60, '2021-01-06', '08:56:21', 'admin'),
(61, '2021-01-06', '08:58:02', 'admin'),
(62, '2021-01-06', '08:59:26', 'admin'),
(63, '2021-01-06', '09:00:28', 'admin'),
(64, '2021-01-06', '09:02:07', 'admin'),
(65, '2021-01-06', '09:05:02', 'admin'),
(66, '2021-01-06', '09:25:11', 'admin'),
(67, '2025-07-08', '13:51:19', 'admin'),
(68, '2025-07-08', '13:51:40', 'guest'),
(69, '2025-07-08', '13:53:38', 'admin'),
(70, '2025-07-08', '13:56:31', 'guest'),
(71, '2025-07-08', '13:57:55', 'admin'),
(72, '2025-07-08', '14:04:03', 'guest'),
(73, '2025-07-08', '14:13:16', 'guest'),
(74, '2025-07-08', '14:16:06', 'guest'),
(75, '2025-07-08', '14:16:45', 'admin'),
(76, '2025-07-08', '15:14:15', 'guest'),
(77, '2025-07-08', '15:15:45', 'admin'),
(78, '2025-07-08', '16:47:14', 'admin'),
(79, '2025-07-08', '17:17:10', 'admin'),
(80, '2025-07-08', '17:32:34', 'admin'),
(81, '2025-07-11', '15:49:40', 'admin'),
(82, '2025-07-11', '16:35:23', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `hourlyparameters`
--

CREATE TABLE `hourlyparameters` (
  `id` int(11) NOT NULL,
  `many_hours_first` int(11) NOT NULL,
  `hours_turn_to_days` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `hourlyparameters`
--

INSERT INTO `hourlyparameters` (`id`, `many_hours_first`, `hours_turn_to_days`) VALUES
(1, 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `phong`
--

CREATE TABLE `phong` (
  `ma_phong` int(11) NOT NULL,
  `so_phong` int(11) NOT NULL,
  `tang` int(2) DEFAULT NULL,
  `tien_nghi` varchar(250) DEFAULT NULL,
  `ma_loai_phong` int(11) NOT NULL,
  `hinh_anh` varchar(255) DEFAULT NULL,
  `gia_phong` decimal(12,0) NOT NULL,
  `gia_phong_gio_dau` decimal(12,0) NOT NULL,
  `gia_phong_gio_sau` decimal(12,0) NOT NULL,
  `gia_homestay` decimal(12,0) NOT NULL,
  `khuyen_mai` varchar(250) DEFAULT NULL,
  `trang_thai` int(1) NOT NULL,
  `count_homestay` int(11) DEFAULT NULL,
  `count_dat_lich` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `phong`
--

INSERT INTO `phong` (`ma_phong`, `so_phong`, `tang`, `tien_nghi`, `ma_loai_phong`, `hinh_anh`, `gia_phong`, `gia_phong_gio_dau`, `gia_phong_gio_sau`, `gia_homestay`, `khuyen_mai`, `trang_thai`, `count_homestay`, `count_dat_lich`) VALUES
(1, 101, 1, 'Air conditioner, Fan, TV, Water heater, Wifi, Fridge, The simplest room with minimal equipment, Small area, Low floor, No view', 2, '1.jpg', 300, 50, 20, 800, '20', 0, 0, 0),
(2, 102, 1, 'Air conditioner, Fan, TV, Water heater, Wifi, Fridge, The simplest room with minimal equipment, Small area, Low floor, No view', 2, '2.jpg ', 350, 50, 20, 800, '20', 0, NULL, 1),
(3, 103, 1, 'Air conditioner, Fan, TV, Water heater, Wifi, Fridge, The simplest room with minimal equipment, Small area, Low floor, No view', 2, '3.jpg ', 380, 50, 20, 800, '20', 1, 0, NULL),
(4, 104, 1, 'Air conditioner, Fan, TV, Water heater, Wifi, Fridge, The simplest room with minimal equipment, Small area, Low floor, No view', 2, '4.jpg ', 300, 50, 20, 800, '0', 0, NULL, 1),
(5, 105, 1, 'Air conditioner, Fan, TV, Water heater, Wifi, Fridge, The simplest room with minimal equipment, Small area, Low floor, No view', 2, '5.jpg ', 300, 50, 20, 800, '0', 0, NULL, NULL),
(6, 106, 1, 'Air conditioner, Fan, TV, Water heater, Wifi, Fridge, The simplest room with minimal equipment, Small area, Low floor, No view', 2, '6.jpg ', 350, 50, 20, 800, '0', 0, NULL, NULL),
(7, 201, 2, 'Air conditioner, Fan, TV, Water heater, Wifi, Fridge, The simplest room with minimal equipment, Small area, Low floor, No view', 2, '7.jpg ', 370, 50, 20, 800, '0', 1, NULL, NULL),
(8, 202, 2, 'Air conditioner, Fan, TV, Water heater, Wifi, Fridge, The simplest room with minimal equipment, Small area, Low floor, No view', 2, '8.jpg ', 370, 50, 20, 800, '0', 0, NULL, NULL),
(9, 203, 2, 'Air conditioner, Fan, TV, Water heater, Wifi, Fridge, The simplest room with minimal equipment, Small area, Low floor, No view', 2, '9.jpg ', 380, 50, 20, 800, '0', 0, NULL, NULL),
(10, 204, 2, 'Air conditioner, Fan, TV, Water heater, Wifi, Fridge, The simplest room with minimal equipment, Small area, Low floor, No view', 2, '10.jpg ', 390, 50, 20, 800, '0', 0, NULL, NULL),
(11, 205, 2, 'Air conditioner, Fan, TV, Water heater, Wifi, Fridge, The simplest room with minimal equipment, Small area, Low floor, No view', 2, '11.jpg ', 390, 50, 20, 800, '0', 0, NULL, NULL),
(12, 206, 2, 'Air conditioner, Fan, TV, Water heater, Wifi, Fridge, The simplest room with minimal equipment, Small area, Low floor, No view', 2, '12.jpg ', 320, 50, 20, 800, '0', 0, NULL, NULL),
(13, 301, 3, 'Air conditioner, Fan, TV, Water heater, Wifi, Fridge, The simplest room with minimal equipment, Small area, Low floor, No view', 2, '13.jpg ', 320, 50, 20, 800, '0', 0, NULL, NULL),
(14, 302, 3, 'Air conditioner, Fan, TV, Water heater, Wifi, Fridge, The simplest room with minimal equipment, Small area, Low floor, No view', 2, '14.jpg ', 300, 50, 20, 800, '0', 0, NULL, NULL),
(15, 303, 3, 'Air conditioner, Fan, TV, Water heater, Wifi, Fridge, The simplest room with minimal equipment, Small area, Low floor, No view', 2, '15.jpg ', 300, 50, 20, 800, '0', 0, NULL, NULL),
(16, 304, 3, 'Air conditioner, Fan, TV, Water heater, Wifi, Fridge, The simplest room with minimal equipment, Small area, Low floor, No view', 2, '16.jpg ', 300, 50, 20, 800, '0', 0, NULL, NULL),
(17, 305, 3, 'Air conditioner, Fan, TV, Water heater, Wifi, Fridge, The simplest room with minimal equipment, Small area, Low floor, No view', 2, '17.jpg ', 400, 50, 20, 800, '0', 0, NULL, NULL),
(18, 306, 3, 'Air conditioner, Fan, TV, Water heater, Wifi, Fridge, The simplest room with minimal equipment, Small area, Low floor, No view', 2, '18.jpg ', 420, 50, 20, 800, '0', 0, NULL, NULL),
(19, 401, 4, 'Air conditioner, Fan, TV, Water heater, Wifi, Fridge, The simplest room with minimal equipment, Small area, Low floor, No view, S', 1, '19.jpg ', 510, 50, 20, 800, '0', 0, NULL, 1),
(20, 402, 4, 'Air conditioner, Fan, TV, Water heater, Larger area, Equipped with many comfortable equipment, Beautiful view, Nice Location', 1, '20.jpg ', 510, 30, 60, 1200, '0', 0, NULL, NULL),
(21, 403, 4, 'Air conditioner, Fan, TV, Water heater, Larger area, Equipped with many comfortable equipment, Beautiful view, Nice Location', 1, '21.jpg ', 500, 30, 60, 1200, '0', 0, 0, NULL),
(22, 404, 4, 'Air conditioner, Fan, TV, Water heater, Larger area, Equipped with many comfortable equipment, Beautiful view, Nice Location', 1, '22.jpg ', 500, 30, 60, 1200, '0', 0, NULL, 1),
(23, 405, 4, 'Air conditioner, Fan, TV, Water heater, Larger area, Equipped with many comfortable equipment, Beautiful view, Nice Location', 1, '23.jpg ', 550, 30, 60, 1200, '0', 0, NULL, NULL),
(24, 406, 4, 'Air conditioner, Fan, TV, Water heater, Larger area, Equipped with many comfortable equipment, Beautiful view, Nice Location', 1, '24.jpg ', 550, 30, 60, 1200, '0', 0, NULL, NULL),
(25, 501, 5, 'Air conditioner, Fan, TV, Water heater, Larger area, Equipped with many comfortable equipment, Beautiful view, Nice Location', 1, '25.jpg ', 550, 30, 60, 1200, '0', 0, NULL, NULL),
(26, 502, 5, 'Air conditioner, Fan, TV, Water heater, Larger area, Equipped with many comfortable equipment, Beautiful view, Nice Location', 1, '26.jpg ', 580, 30, 60, 1200, '0', 0, NULL, NULL),
(27, 503, 5, 'Air conditioner, Fan, TV, Water heater, Larger area, Equipped with many comfortable equipment, Beautiful view, Nice Location', 1, '27.jpg ', 580, 30, 60, 1200, '0', 0, NULL, NULL),
(28, 504, 5, 'Air conditioner, Fan, TV, Water heater, Larger area, Equipped with many comfortable equipment, Beautiful view, Nice Location', 1, '28.jpg ', 600, 30, 60, 1200, '0', 0, NULL, NULL),
(29, 505, 5, 'Air conditioner, Fan, TV, Water heater, Larger area, Equipped with many comfortable equipment, Beautiful view, Nice Location', 1, '29.jpg ', 600, 30, 60, 1200, '0', 0, NULL, NULL),
(30, 506, 5, 'Air conditioner, Fan, TV, Water heater, Larger area, Equipped with many comfortable equipment, Beautiful view, Nice Location', 1, '30.jpg ', 600, 30, 60, 1200, '0', 0, NULL, NULL),
(31, 601, 6, 'Air conditioning', 1, '70226406757799.jpg', 200, 50, 50, 500, '10', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `position`
--

CREATE TABLE `position` (
  `position_id` int(11) NOT NULL,
  `position_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `position`
--

INSERT INTO `position` (`position_id`, `position_name`) VALUES
(1, 'Manager'),
(2, 'Employee');

-- --------------------------------------------------------

--
-- Table structure for table `roomtype`
--

CREATE TABLE `roomtype` (
  `ma_loai_phong` int(11) NOT NULL,
  `ten_loai_phong` varchar(100) NOT NULL,
  `mo_ta` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `roomtype`
--

INSERT INTO `roomtype` (`ma_loai_phong`, `ten_loai_phong`, `mo_ta`) VALUES
(1, 'VIP', 'The room is spacious and airy, fully equipped.'),
(2, 'Normal', 'The room is usually cheap.'),
(3, 'Homestay', 'Rooms for households, go from 4 people or more.');

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE `service` (
  `ma_dich_vu` int(11) NOT NULL,
  `ten_dich_vu` varchar(50) NOT NULL,
  `loai_dich_vu` int(11) NOT NULL,
  `gia_dich_vu` decimal(12,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `service`
--

INSERT INTO `service` (`ma_dich_vu`, `ten_dich_vu`, `loai_dich_vu`, `gia_dich_vu`) VALUES
(1, 'Pepsi', 0, 1),
(2, 'Coca', 0, 1),
(3, 'Wine CHIVAS', 0, 520),
(4, 'Wine', 0, 100),
(5, 'RedBull', 0, 2),
(6, 'Stomach Drug', 0, 3),
(7, 'Headache Medicine', 0, 2),
(8, 'Hamburger', 0, 4),
(9, 'Broken Rice', 0, 4),
(10, 'Chicken Rice', 0, 3),
(11, 'Pork Rib Rice', 0, 3),
(12, 'Mineral Spring Water', 0, 1),
(13, 'Fried Chicken KFC', 0, 3),
(14, 'Beef Stew', 0, 4),
(15, 'Beef Steak', 0, 5),
(16, 'Noodles Egg', 0, 2),
(17, 'Laundry', 1, 2),
(18, 'Massage Tiket', 2, 6),
(19, 'Swim Pool Tiket', 2, 3),
(20, 'Gym Tiket', 2, 3),
(21, 'Ice', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `servicemenu`
--

CREATE TABLE `servicemenu` (
  `ma_don_dich_vu` int(11) NOT NULL,
  `ma_dat_phong` int(11) NOT NULL,
  `ma_dich_vu` int(11) NOT NULL,
  `so_luong` int(11) NOT NULL,
  `ngay_dat` date DEFAULT NULL,
  `gio_dat` time DEFAULT NULL,
  `thong_tin_them` varchar(255) DEFAULT NULL,
  `ten_dang_nhap` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `servicemenu`
--

INSERT INTO `servicemenu` (`ma_don_dich_vu`, `ma_dat_phong`, `ma_dich_vu`, `so_luong`, `ngay_dat`, `gio_dat`, `thong_tin_them`, `ten_dang_nhap`) VALUES
(8, 38, 1, 2, '2021-01-06', '09:32:20', NULL, 'admin'),
(9, 38, 21, 2, '2021-01-06', '09:32:25', NULL, 'admin'),
(10, 42, 1, 1, '2025-07-08', '17:24:09', NULL, 'admin'),
(11, 48, 1, 1, '2025-07-11', '17:14:14', NULL, 'admin'),
(12, 48, 2, 2, '2025-07-11', '17:14:20', NULL, 'admin'),
(13, 48, 1, 2, '2025-07-11', '17:14:25', NULL, 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`username`),
  ADD KEY `position_id` (`position_id`);

--
-- Indexes for table `checkin`
--
ALTER TABLE `checkin`
  ADD PRIMARY KEY (`ma_dat_phong`),
  ADD KEY `ma_phong` (`ma_phong`);

--
-- Indexes for table `checkincalendar`
--
ALTER TABLE `checkincalendar`
  ADD PRIMARY KEY (`ma_lich`),
  ADD KEY `ma_phong` (`ma_phong`);

--
-- Indexes for table `checkout`
--
ALTER TABLE `checkout`
  ADD PRIMARY KEY (`ma_tra_phong`),
  ADD KEY `ma_dat_phong` (`ma_dat_phong`);

--
-- Indexes for table `collect`
--
ALTER TABLE `collect`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `display`
--
ALTER TABLE `display`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `historylogin`
--
ALTER TABLE `historylogin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hourlyparameters`
--
ALTER TABLE `hourlyparameters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `phong`
--
ALTER TABLE `phong`
  ADD PRIMARY KEY (`ma_phong`),
  ADD KEY `ma_loai_phong` (`ma_loai_phong`);

--
-- Indexes for table `position`
--
ALTER TABLE `position`
  ADD PRIMARY KEY (`position_id`);

--
-- Indexes for table `roomtype`
--
ALTER TABLE `roomtype`
  ADD PRIMARY KEY (`ma_loai_phong`);

--
-- Indexes for table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`ma_dich_vu`);

--
-- Indexes for table `servicemenu`
--
ALTER TABLE `servicemenu`
  ADD PRIMARY KEY (`ma_don_dich_vu`),
  ADD KEY `ma_dat_phong` (`ma_dat_phong`),
  ADD KEY `ma_dich_vu` (`ma_dich_vu`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `checkin`
--
ALTER TABLE `checkin`
  MODIFY `ma_dat_phong` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `checkincalendar`
--
ALTER TABLE `checkincalendar`
  MODIFY `ma_lich` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `checkout`
--
ALTER TABLE `checkout`
  MODIFY `ma_tra_phong` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `collect`
--
ALTER TABLE `collect`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `display`
--
ALTER TABLE `display`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `historylogin`
--
ALTER TABLE `historylogin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT for table `hourlyparameters`
--
ALTER TABLE `hourlyparameters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `phong`
--
ALTER TABLE `phong`
  MODIFY `ma_phong` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `position`
--
ALTER TABLE `position`
  MODIFY `position_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `roomtype`
--
ALTER TABLE `roomtype`
  MODIFY `ma_loai_phong` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `service`
--
ALTER TABLE `service`
  MODIFY `ma_dich_vu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `servicemenu`
--
ALTER TABLE `servicemenu`
  MODIFY `ma_don_dich_vu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `account`
--
ALTER TABLE `account`
  ADD CONSTRAINT `account_ibfk_1` FOREIGN KEY (`position_id`) REFERENCES `position` (`position_id`) ON DELETE CASCADE;

--
-- Constraints for table `checkin`
--
ALTER TABLE `checkin`
  ADD CONSTRAINT `checkin_ibfk_1` FOREIGN KEY (`ma_phong`) REFERENCES `phong` (`ma_phong`) ON DELETE CASCADE;

--
-- Constraints for table `checkincalendar`
--
ALTER TABLE `checkincalendar`
  ADD CONSTRAINT `checkincalendar_ibfk_1` FOREIGN KEY (`ma_phong`) REFERENCES `phong` (`ma_phong`) ON DELETE CASCADE;

--
-- Constraints for table `checkout`
--
ALTER TABLE `checkout`
  ADD CONSTRAINT `checkout_ibfk_1` FOREIGN KEY (`ma_dat_phong`) REFERENCES `checkin` (`ma_dat_phong`) ON DELETE CASCADE;

--
-- Constraints for table `phong`
--
ALTER TABLE `phong`
  ADD CONSTRAINT `phong_ibfk_1` FOREIGN KEY (`ma_loai_phong`) REFERENCES `roomtype` (`ma_loai_phong`) ON DELETE CASCADE;

--
-- Constraints for table `servicemenu`
--
ALTER TABLE `servicemenu`
  ADD CONSTRAINT `servicemenu_ibfk_1` FOREIGN KEY (`ma_dat_phong`) REFERENCES `checkin` (`ma_dat_phong`) ON DELETE CASCADE,
  ADD CONSTRAINT `servicemenu_ibfk_2` FOREIGN KEY (`ma_dich_vu`) REFERENCES `service` (`ma_dich_vu`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

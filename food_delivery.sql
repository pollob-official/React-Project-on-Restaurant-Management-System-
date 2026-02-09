-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 31, 2026 at 04:23 AM
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
-- Database: `food_delivery`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `email`, `phone`, `created_at`) VALUES
(1, 'Adnan Hasan', 'adnan.hasan@example.com', '01710000222', '0000-00-00 00:00:00'),
(2, 'Afsana Akter', 'afsana.akter@example.com', '01710000202', '2025-10-19 10:01:00'),
(3, 'Ayaan Rahman', 'ayaan.rahman@example.com', '01710000203', '2025-10-19 10:02:00'),
(4, 'Aysha Karim', 'aysha.karim@example.com', '01710000204', '2025-10-19 10:03:00'),
(5, 'Bilal Chowdhury', 'bilal.chowdhury@example.com', '01710000205', '2025-10-19 10:04:00'),
(6, 'Bonny Hossain', 'bonny.hossain@example.com', '01710000206', '2025-10-19 10:05:00'),
(7, 'Danish Islam', 'danish.islam@example.com', '01710000207', '2025-10-19 10:06:00'),
(8, 'Deepa Sultana', 'deepa.sultana@example.com', '01710000208', '2025-10-19 10:07:00'),
(9, 'Ehsan Ahmed', 'ehsan.ahmed@example.com', '01710000209', '2025-10-19 10:08:00'),
(10, 'Elina Rahman', 'elina.rahman@example.com', '01710000210', '2025-10-19 10:09:00'),
(107, 'Nadim', 'nadim_official@yahoo.com', '01710000222', '2025-12-02 09:34:12');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `restaurant_id` int(11) DEFAULT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL,
  `tax_amount` decimal(10,2) DEFAULT NULL,
  `discount_amount` decimal(10,2) DEFAULT NULL,
  `grand_total` decimal(10,2) DEFAULT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `payment_status` enum('Paid','Unpaid','Pending') DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `order_id`, `customer_id`, `restaurant_id`, `total_amount`, `tax_amount`, `discount_amount`, `grand_total`, `payment_method`, `payment_status`, `created_at`, `updated_at`) VALUES
(1, 101, 1, 2, 750.00, 37.50, 0.00, 787.50, 'Cash', 'Paid', '2025-10-09 11:12:07', '2025-10-09 11:12:07'),
(2, 102, 2, 3, 450.00, 22.50, 20.00, 452.50, 'Card', 'Paid', '2025-10-09 11:12:07', '2025-10-09 11:12:07'),
(3, 103, 3, 2, 1200.00, 60.00, 50.00, 1210.00, 'bKash', 'Paid', '2025-10-09 11:12:07', '2025-10-09 11:12:07'),
(4, 104, 4, 4, 980.00, 49.00, 0.00, 1029.00, 'Nagad', 'Pending', '2025-10-09 11:12:07', '2025-10-09 11:12:07'),
(5, 105, 5, 3, 640.00, 32.00, 10.00, 662.00, 'Card', 'Paid', '2025-10-09 11:12:07', '2025-10-09 11:12:07'),
(6, 106, 6, 5, 310.00, 15.50, 0.00, 325.50, 'Cash', 'Unpaid', '2025-10-09 11:12:07', '2025-10-09 11:12:07'),
(13, 113, 13, 5, 560.00, 28.00, 0.00, 588.00, 'Card', 'Paid', '2025-10-09 11:12:07', '2025-10-09 11:12:07'),
(14, 114, 14, 4, 760.00, 38.00, 10.00, 788.00, 'bKash', 'Pending', '2025-10-09 11:12:07', '2025-10-09 11:12:07'),
(15, 115, 15, 2, 320.00, 16.00, 5.00, 331.00, 'Cash', 'Paid', '2025-10-09 11:12:07', '2025-10-09 11:12:07'),
(16, 116, 16, 3, 890.00, 44.50, 0.00, 934.50, 'Nagad', 'Paid', '2025-10-09 11:12:07', '2025-10-09 11:12:07'),
(17, 117, 17, 4, 990.00, 49.50, 15.00, 1024.50, 'Card', 'Paid', '2025-10-09 11:12:07', '2025-10-09 11:12:07'),
(18, 118, 18, 5, 370.00, 18.50, 0.00, 388.50, 'bKash', 'Paid', '2025-10-09 11:12:07', '2025-10-09 11:12:07'),
(19, 119, 19, 2, 430.00, 21.50, 10.00, 441.50, 'Cash', 'Unpaid', '2025-10-09 11:12:07', '2025-10-09 11:12:07'),
(20, 120, 20, 3, 1450.00, 72.50, 50.00, 1472.50, 'Card', 'Paid', '2025-10-09 11:12:07', '2025-10-09 11:12:07'),
(21, 121, 21, 4, 970.00, 48.50, 0.00, 1018.50, 'Nagad', 'Paid', '2025-10-09 11:12:07', '2025-10-09 11:12:07'),
(22, 122, 22, 5, 690.00, 34.50, 20.00, 704.50, 'bKash', 'Paid', '2025-10-09 11:12:07', '2025-10-09 11:12:07'),
(23, 123, 23, 3, 810.00, 40.50, 0.00, 850.50, 'Cash', 'Pending', '2025-10-09 11:12:07', '2025-10-09 11:12:07'),
(24, 124, 24, 2, 540.00, 27.00, 10.00, 557.00, 'Card', 'Paid', '2025-10-09 11:12:07', '2025-10-09 11:12:07'),
(25, 125, 25, 4, 730.00, 36.50, 0.00, 766.50, 'bKash', 'Paid', '2025-10-09 11:12:07', '2025-10-09 11:12:07'),
(26, 126, 26, 5, 640.00, 32.00, 0.00, 672.00, 'Nagad', 'Paid', '2025-10-09 11:12:07', '2025-10-09 11:12:07'),
(27, 127, 27, 3, 1280.00, 64.00, 30.00, 1314.00, 'Card', 'Paid', '2025-10-09 11:12:07', '2025-10-09 11:12:07'),
(28, 128, 28, 2, 520.00, 26.00, 0.00, 546.00, 'Cash', 'Paid', '2025-10-09 11:12:07', '2025-10-09 11:12:07'),
(29, 129, 29, 4, 880.00, 44.00, 25.00, 899.00, 'bKash', 'Paid', '2025-10-09 11:12:07', '2025-10-09 11:12:07'),
(30, 130, 30, 5, 770.00, 38.50, 10.00, 798.50, 'Card', 'Paid', '2025-10-09 11:12:07', '2025-10-09 11:12:07'),
(31, 131, 31, 2, 680.00, 34.00, 5.00, 709.00, 'Nagad', 'Paid', '2025-10-09 11:12:07', '2025-10-09 11:12:07'),
(32, 132, 32, 3, 910.00, 45.50, 15.00, 940.50, 'bKash', 'Paid', '2025-10-09 11:12:07', '2025-10-09 11:12:07'),
(33, 133, 33, 4, 560.00, 28.00, 0.00, 588.00, 'Cash', 'Unpaid', '2025-10-09 11:12:07', '2025-10-09 11:12:07'),
(34, 134, 34, 5, 1050.00, 52.50, 30.00, 1072.50, 'Card', 'Paid', '2025-10-09 11:12:07', '2025-10-09 11:12:07'),
(35, 135, 35, 2, 450.00, 22.50, 0.00, 472.50, 'Nagad', 'Paid', '2025-10-09 11:12:07', '2025-10-09 11:12:07'),
(36, 136, 36, 3, 820.00, 41.00, 10.00, 851.00, 'bKash', 'Paid', '2025-10-09 11:12:07', '2025-10-09 11:12:07'),
(37, 137, 37, 4, 1200.00, 60.00, 20.00, 1240.00, 'Cash', 'Paid', '2025-10-09 11:12:07', '2025-10-09 11:12:07'),
(38, 138, 38, 5, 730.00, 36.50, 10.00, 756.50, 'Card', 'Pending', '2025-10-09 11:12:07', '2025-10-09 11:12:07'),
(39, 139, 39, 3, 580.00, 29.00, 0.00, 609.00, 'Nagad', 'Paid', '2025-10-09 11:12:07', '2025-10-09 11:12:07'),
(40, 140, 40, 2, 460.00, 23.00, 0.00, 483.00, 'Cash', 'Paid', '2025-10-09 11:12:07', '2025-10-09 11:12:07'),
(41, 141, 41, 5, 990.00, 49.50, 30.00, 1009.50, 'bKash', 'Paid', '2025-10-09 11:12:07', '2025-10-09 11:12:07'),
(42, 142, 42, 4, 770.00, 38.50, 10.00, 798.50, 'Card', 'Paid', '2025-10-09 11:12:07', '2025-10-09 11:12:07'),
(43, 143, 43, 3, 660.00, 33.00, 0.00, 693.00, 'Nagad', 'Paid', '2025-10-09 11:12:07', '2025-10-09 11:12:07'),
(44, 144, 44, 2, 890.00, 44.50, 20.00, 914.50, 'Cash', 'Paid', '2025-10-09 11:12:07', '2025-10-09 11:12:07'),
(45, 145, 45, 5, 510.00, 25.50, 0.00, 535.50, 'Card', 'Paid', '2025-10-09 11:12:07', '2025-10-09 11:12:07'),
(46, 146, 46, 3, 1080.00, 54.00, 40.00, 1094.00, 'bKash', 'Paid', '2025-10-09 11:12:07', '2025-10-09 11:12:07'),
(47, 147, 47, 4, 720.00, 36.00, 10.00, 746.00, 'Nagad', 'Paid', '2025-10-09 11:12:07', '2025-10-09 11:12:07'),
(48, 148, 48, 5, 830.00, 41.50, 15.00, 856.50, 'Cash', 'Paid', '2025-10-09 11:12:07', '2025-10-09 11:12:07'),
(49, 149, 49, 3, 910.00, 45.50, 10.00, 945.50, 'Card', 'Paid', '2025-10-09 11:12:07', '2025-10-09 11:12:07'),
(50, 150, 50, 2, 460.00, 23.00, 0.00, 483.00, 'bKash', 'Paid', '2025-10-09 11:12:07', '2025-10-09 11:12:07');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_details`
--

CREATE TABLE `invoice_details` (
  `id` int(11) NOT NULL,
  `invoice_id` int(11) DEFAULT NULL,
  `item_name` varchar(100) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `subtotal` decimal(10,2) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `invoice_details`
--

INSERT INTO `invoice_details` (`id`, `invoice_id`, `item_name`, `quantity`, `price`, `subtotal`, `created_at`, `updated_at`) VALUES
(1, 1, 'Margherita Pizza', 1, 400.00, 400.00, '2025-10-09 11:21:06', '2025-10-09 11:21:06'),
(2, 1, 'French Fries', 2, 150.00, 300.00, '2025-10-09 11:21:06', '2025-10-09 11:21:06'),
(3, 2, 'Chicken Burger', 2, 200.00, 400.00, '2025-10-09 11:21:06', '2025-10-09 11:21:06'),
(4, 2, 'Soft Drink', 1, 50.00, 50.00, '2025-10-09 11:21:06', '2025-10-09 11:21:06'),
(5, 3, 'Beef Pizza', 1, 950.00, 950.00, '2025-10-09 11:21:06', '2025-10-09 11:21:06'),
(26, 13, 'French Fries', 1, 60.00, 60.00, '2025-10-09 11:21:06', '2025-10-09 11:21:06'),
(27, 14, 'Pasta Bolognese', 1, 720.00, 720.00, '2025-10-09 11:21:06', '2025-10-09 11:21:06'),
(28, 14, 'Coke', 1, 40.00, 40.00, '2025-10-09 11:21:06', '2025-10-09 11:21:06'),
(29, 15, 'Veg Chowmein', 1, 280.00, 280.00, '2025-10-09 11:21:06', '2025-10-09 11:21:06'),
(30, 15, 'Fried Chicken', 1, 250.00, 250.00, '2025-10-09 11:21:06', '2025-10-09 11:21:06'),
(31, 16, 'Beef Burger', 2, 400.00, 800.00, '2025-10-09 11:21:06', '2025-10-09 11:21:06'),
(32, 16, 'Drink', 1, 60.00, 60.00, '2025-10-09 11:21:06', '2025-10-09 11:21:06'),
(33, 17, 'BBQ Pizza', 1, 950.00, 950.00, '2025-10-09 11:21:06', '2025-10-09 11:21:06'),
(34, 17, 'Garlic Bread', 1, 90.00, 90.00, '2025-10-09 11:21:06', '2025-10-09 11:21:06'),
(35, 18, 'Pasta Alfredo', 1, 350.00, 350.00, '2025-10-09 11:21:06', '2025-10-09 11:21:06'),
(36, 18, 'Lemonade', 1, 50.00, 50.00, '2025-10-09 11:21:06', '2025-10-09 11:21:06'),
(37, 19, 'Sub Sandwich', 1, 390.00, 390.00, '2025-10-09 11:21:06', '2025-10-09 11:21:06'),
(38, 19, 'Fries', 1, 60.00, 60.00, '2025-10-09 11:21:06', '2025-10-09 11:21:06'),
(39, 20, 'Grilled Chicken', 2, 700.00, 1400.00, '2025-10-09 11:21:06', '2025-10-09 11:21:06'),
(40, 20, 'Coke', 1, 50.00, 50.00, '2025-10-09 11:21:06', '2025-10-09 11:21:06'),
(41, 21, 'Beef Pizza', 1, 900.00, 900.00, '2025-10-09 11:21:06', '2025-10-09 11:21:06'),
(42, 21, 'Garlic Bread', 1, 70.00, 70.00, '2025-10-09 11:21:06', '2025-10-09 11:21:06'),
(43, 22, 'Veg Pasta', 1, 620.00, 620.00, '2025-10-09 11:21:06', '2025-10-09 11:21:06'),
(44, 22, 'Mojito', 1, 70.00, 70.00, '2025-10-09 11:21:06', '2025-10-09 11:21:06'),
(45, 23, 'Fried Rice', 1, 430.00, 430.00, '2025-10-09 11:21:06', '2025-10-09 11:21:06'),
(46, 23, 'Soup', 1, 120.00, 120.00, '2025-10-09 11:21:06', '2025-10-09 11:21:06'),
(47, 24, 'Chicken Burger', 2, 250.00, 500.00, '2025-10-09 11:21:06', '2025-10-09 11:21:06'),
(48, 24, 'French Fries', 1, 80.00, 80.00, '2025-10-09 11:21:06', '2025-10-09 11:21:06'),
(49, 25, 'Pizza Pepperoni', 1, 720.00, 720.00, '2025-10-09 11:21:06', '2025-10-09 11:21:06'),
(50, 25, 'Cold Drink', 1, 40.00, 40.00, '2025-10-09 11:21:06', '2025-10-09 11:21:06'),
(51, 26, 'Veg Sub', 1, 450.00, 450.00, '2025-10-09 11:21:06', '2025-10-09 11:21:06'),
(52, 26, 'Brownie', 1, 50.00, 50.00, '2025-10-09 11:21:06', '2025-10-09 11:21:06'),
(53, 27, 'Beef Burger', 1, 850.00, 850.00, '2025-10-09 11:21:06', '2025-10-09 11:21:06'),
(54, 27, 'Drink', 1, 60.00, 60.00, '2025-10-09 11:21:06', '2025-10-09 11:21:06'),
(55, 28, 'Noodles', 2, 250.00, 500.00, '2025-10-09 11:21:06', '2025-10-09 11:21:06'),
(56, 28, 'Fried Chicken', 1, 250.00, 250.00, '2025-10-09 11:21:06', '2025-10-09 11:21:06'),
(57, 29, 'BBQ Pizza', 1, 750.00, 750.00, '2025-10-09 11:21:06', '2025-10-09 11:21:06'),
(58, 29, 'Soft Drink', 1, 50.00, 50.00, '2025-10-09 11:21:06', '2025-10-09 11:21:06'),
(59, 30, 'Cheese Pasta', 1, 680.00, 680.00, '2025-10-09 11:21:06', '2025-10-09 11:21:06'),
(60, 30, 'Coke', 1, 40.00, 40.00, '2025-10-09 11:21:06', '2025-10-09 11:21:06'),
(61, 31, 'Beef Roll', 1, 300.00, 300.00, '2025-10-09 11:21:06', '2025-10-09 11:21:06'),
(62, 31, 'Drink', 1, 50.00, 50.00, '2025-10-09 11:21:06', '2025-10-09 11:21:06'),
(63, 32, 'Grilled Sandwich', 2, 400.00, 800.00, '2025-10-09 11:21:06', '2025-10-09 11:21:06'),
(64, 32, 'Juice', 1, 60.00, 60.00, '2025-10-09 11:21:06', '2025-10-09 11:21:06'),
(65, 33, 'Fried Rice', 1, 480.00, 480.00, '2025-10-09 11:21:06', '2025-10-09 11:21:06'),
(66, 33, 'Soup', 1, 100.00, 100.00, '2025-10-09 11:21:06', '2025-10-09 11:21:06'),
(67, 34, 'Beef Pizza', 1, 950.00, 950.00, '2025-10-09 11:21:06', '2025-10-09 11:21:06'),
(68, 34, 'Cold Drink', 1, 50.00, 50.00, '2025-10-09 11:21:06', '2025-10-09 11:21:06'),
(69, 35, 'Veg Chowmein', 2, 200.00, 400.00, '2025-10-09 11:21:06', '2025-10-09 11:21:06'),
(70, 35, 'Chicken Curry', 1, 350.00, 350.00, '2025-10-09 11:21:06', '2025-10-09 11:21:06'),
(71, 36, 'Beef Burger', 2, 350.00, 700.00, '2025-10-09 11:21:06', '2025-10-09 11:21:06'),
(72, 36, 'Fries', 1, 100.00, 100.00, '2025-10-09 11:21:06', '2025-10-09 11:21:06'),
(73, 37, 'BBQ Chicken Pizza', 1, 1050.00, 1050.00, '2025-10-09 11:21:06', '2025-10-09 11:21:06'),
(74, 37, 'Mushroom Soup', 1, 150.00, 150.00, '2025-10-09 11:21:06', '2025-10-09 11:21:06'),
(75, 38, 'Chicken Sandwich', 2, 300.00, 600.00, '2025-10-09 11:21:06', '2025-10-09 11:21:06'),
(76, 38, 'Drink', 1, 60.00, 60.00, '2025-10-09 11:21:06', '2025-10-09 11:21:06'),
(77, 39, 'Pasta Alfredo', 1, 530.00, 530.00, '2025-10-09 11:21:06', '2025-10-09 11:21:06'),
(78, 39, 'Juice', 1, 50.00, 50.00, '2025-10-09 11:21:06', '2025-10-09 11:21:06'),
(79, 40, 'Grilled Chicken', 1, 420.00, 420.00, '2025-10-09 11:21:06', '2025-10-09 11:21:06'),
(80, 40, 'Rice', 1, 40.00, 40.00, '2025-10-09 11:21:06', '2025-10-09 11:21:06'),
(81, 41, 'Pizza Deluxe', 1, 900.00, 900.00, '2025-10-09 11:21:06', '2025-10-09 11:21:06'),
(82, 41, 'Drink', 1, 60.00, 60.00, '2025-10-09 11:21:06', '2025-10-09 11:21:06'),
(83, 42, 'Beef Burger', 1, 680.00, 680.00, '2025-10-09 11:21:06', '2025-10-09 11:21:06'),
(84, 42, 'Coke', 1, 40.00, 40.00, '2025-10-09 11:21:06', '2025-10-09 11:21:06'),
(85, 43, 'Fried Rice', 1, 560.00, 560.00, '2025-10-09 11:21:06', '2025-10-09 11:21:06'),
(86, 43, 'Soup', 1, 100.00, 100.00, '2025-10-09 11:21:06', '2025-10-09 11:21:06'),
(87, 44, 'Beef Pizza', 1, 820.00, 820.00, '2025-10-09 11:21:06', '2025-10-09 11:21:06'),
(88, 44, 'Mojito', 1, 60.00, 60.00, '2025-10-09 11:21:06', '2025-10-09 11:21:06'),
(89, 45, 'Pasta Carbonara', 1, 470.00, 470.00, '2025-10-09 11:21:06', '2025-10-09 11:21:06'),
(90, 45, 'Garlic Bread', 1, 40.00, 40.00, '2025-10-09 11:21:06', '2025-10-09 11:21:06'),
(91, 46, 'Chicken Sub', 2, 500.00, 1000.00, '2025-10-09 11:21:06', '2025-10-09 11:21:06'),
(92, 46, 'Brownie', 1, 80.00, 80.00, '2025-10-09 11:21:06', '2025-10-09 11:21:06'),
(93, 47, 'Pizza Supreme', 1, 680.00, 680.00, '2025-10-09 11:21:06', '2025-10-09 11:21:06'),
(94, 47, 'Soft Drink', 1, 40.00, 40.00, '2025-10-09 11:21:06', '2025-10-09 11:21:06'),
(95, 48, 'Beef Burger', 2, 350.00, 700.00, '2025-10-09 11:21:06', '2025-10-09 11:21:06'),
(96, 48, 'Drink', 1, 60.00, 60.00, '2025-10-09 11:21:06', '2025-10-09 11:21:06'),
(97, 49, 'BBQ Pizza', 1, 850.00, 850.00, '2025-10-09 11:21:06', '2025-10-09 11:21:06'),
(98, 49, 'Coke', 1, 60.00, 60.00, '2025-10-09 11:21:06', '2025-10-09 11:21:06'),
(99, 50, 'Veg Fried Rice', 1, 400.00, 400.00, '2025-10-09 11:21:06', '2025-10-09 11:21:06'),
(100, 50, 'Chicken Curry', 1, 350.00, 350.00, '2025-10-09 11:21:06', '2025-10-09 11:21:06');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `is_available` tinyint(1) DEFAULT 1,
  `category` varchar(100) DEFAULT NULL,
  `photo` varchar(512) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `restaurant_id`, `name`, `description`, `price`, `is_available`, `category`, `photo`, `created_at`) VALUES
(1, 1, 'Margherita Pizza', 'Classic cheese pizza with tomato sauce and mozzarella.', 450.00, 1, 'Pizza', '1.png', '2025-10-08 11:22:43'),
(2, 1, 'Pepperoni Pizza', 'Spicy pepperoni slices on a cheesy crust.', 520.00, 1, 'Pizza', '2.png', '2025-10-08 11:22:43'),
(3, 2, 'Chicken Burger', 'Grilled chicken patty with lettuce, tomato, and mayo.', 280.00, 1, 'Burger', '3.png', '2025-10-08 11:22:43'),
(4, 2, 'Beef Burger', 'Juicy beef burger with cheese and caramelized onion.', 340.00, 1, 'Burger', '4.png', '2025-10-08 11:22:43'),
(5, 3, 'Caesar Salad', 'Fresh romaine lettuce, croutons, and Caesar dressing.', 220.00, 1, 'Salad', '5.png', '2025-10-08 11:22:43'),
(6, 3, 'Greek Salad', 'Cucumber, tomato, olives, and feta cheese.', 250.00, 1, 'Salad', '6.png', '2025-10-08 11:22:43'),
(7, 4, 'Spaghetti Bolognese', 'Pasta with slow-cooked minced beef sauce.', 480.00, 1, 'Pasta', '7.png', '2025-10-08 11:22:43'),
(8, 4, 'Fettuccine Alfredo', 'Creamy pasta with butter and parmesan cheese.', 460.00, 1, 'Pasta', '8.png', '2025-10-08 11:22:43'),
(9, 5, 'Tandoori Chicken', 'Grilled chicken marinated with Indian spices.', 550.00, 1, 'Indian', '9.png', '2025-10-08 11:22:43'),
(10, 5, 'Butter Naan', 'Soft naan bread with butter topping.', 90.00, 1, 'Indian', '10.png', '2025-10-08 11:22:43'),
(11, 6, 'Sushi Roll', 'Fresh salmon and avocado sushi rolls.', 850.00, 1, 'Japanese', '11.png', '2025-10-08 11:22:43'),
(12, 6, 'Ramen Bowl', 'Noodles in rich broth with pork and egg.', 620.00, 1, 'Japanese', '12.png', '2025-10-08 11:22:43'),
(13, 7, 'French Fries', 'Crispy golden fries with salt.', 130.00, 1, 'Snacks', '13.png', '2025-10-08 11:22:43'),
(14, 7, 'Onion Rings', 'Crispy fried onion rings with dip.', 150.00, 1, 'Snacks', '14.png', '2025-10-08 11:22:43'),
(15, 8, 'Chocolate Cake', 'Moist chocolate sponge with ganache frosting.', 220.00, 1, 'Dessert', '15.png', '2025-10-08 11:22:43'),
(16, 8, 'Vanilla Ice Cream', 'Creamy vanilla ice cream made with fresh milk.', 180.00, 1, 'Dessert', '16.png', '2025-10-08 11:22:43'),
(17, 9, 'Cappuccino', 'Rich espresso with steamed milk foam.', 180.00, 1, 'Beverage', '17.png', '2025-10-08 11:22:43'),
(18, 9, 'Iced Latte', 'Cold espresso drink with milk and ice.', 200.00, 1, 'Beverage', '7.png', '2025-10-08 11:22:43'),
(19, 10, 'Grilled Sandwich', 'Toasted sandwich with cheese and tomato.', 220.00, 1, 'Snack', '18.png', '2025-10-08 11:22:43'),
(20, 10, 'Club Sandwich', 'Triple layer sandwich with chicken, egg, and lettuce.', 320.00, 1, 'Snack', '19.png', '2025-10-08 11:22:43'),
(21, 11, 'Fish and Chips', 'Crispy fried fish served with french fries.', 680.00, 1, 'Seafood', '20.png', '2025-10-08 11:22:43'),
(22, 11, 'Grilled Salmon', 'Fresh salmon grilled with lemon butter sauce.', 1100.00, 1, 'Seafood', '1.png', '2025-10-08 11:22:43'),
(23, 12, 'Margarita Mocktail', 'Refreshing drink with lime, mint, and soda.', 180.00, 1, 'Beverage', '5.png', '2025-10-08 11:22:43'),
(24, 12, 'Orange Juice', 'Freshly squeezed orange juice.', 160.00, 1, 'Beverage', '14.png', '2025-10-08 11:22:43'),
(25, 13, 'Pancakes', 'Fluffy pancakes with maple syrup and butter.', 240.00, 1, 'Breakfast', '8.png', '2025-10-08 11:22:43'),
(26, 13, 'Omelette', 'Three-egg omelette with cheese and herbs.', 190.00, 1, 'Breakfast', '6.png', '2025-10-08 11:22:43'),
(27, 14, 'Chicken Tikka', 'Boneless chicken chunks grilled with Indian spices.', 490.00, 1, 'Indian', '9.png', '2025-10-08 11:22:43'),
(28, 14, 'Paneer Butter Masala', 'Soft paneer cubes in creamy tomato gravy.', 420.00, 1, 'Indian', '10.png', '2025-10-08 11:22:43'),
(29, 15, 'Taco', 'Soft tortilla filled with seasoned beef, lettuce, and cheese.', 280.00, 1, 'Mexican', '11.png', '2025-10-08 11:22:43'),
(30, 15, 'Burrito', 'Stuffed burrito with rice, beans, and chicken.', 340.00, 1, 'Mexican', '12.png', '2025-10-08 11:22:43'),
(31, 16, 'Steak', 'Juicy grilled steak with mashed potatoes.', 950.00, 1, 'Western', '13.png', '2025-10-08 11:22:43'),
(32, 16, 'Grilled Chicken', 'Tender chicken breast with herbs and spices.', 580.00, 1, 'Western', '14.png', '2025-10-08 11:22:43'),
(33, 17, 'Veggie Wrap', 'Healthy wrap filled with grilled vegetables and hummus.', 260.00, 1, 'Healthy', '15.png', '2025-10-08 11:22:43'),
(34, 17, 'Fruit Bowl', 'Mixed seasonal fruits served fresh.', 180.00, 1, 'Healthy', '16.png', '2025-10-08 11:22:43'),
(35, 18, 'Cheese Platter', 'Assorted cheeses with crackers and grapes.', 550.00, 1, 'Appetizer', '17.png', '2025-10-08 11:22:43'),
(36, 18, 'Garlic Bread', 'Toasted bread with garlic butter and herbs.', 140.00, 1, 'Appetizer', '18.png', '2025-10-08 11:22:43'),
(37, 19, 'Miso Soup', 'Traditional Japanese soup with tofu and seaweed.', 220.00, 1, 'Japanese', '19.png', '2025-10-08 11:22:43'),
(39, 20, 'Veg Fried Rice', 'Fried rice with vegetables and soy sauce.', 250.00, 1, 'Chinese', '4.png', '2025-10-08 11:22:43'),
(45, 3, 'Kacchi (Bashmati) Full', 'Kacchi made with basmati rice', 499.00, 1, ' Kacchi', 'kacchi-bashmati-full.png', '2025-12-02 03:55:56');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2026_01_22_045513_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `rider_id` int(11) DEFAULT NULL,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `delivery_address` text DEFAULT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `delivery_fee` decimal(10,2) DEFAULT 0.00,
  `tax_amount` decimal(10,2) DEFAULT 0.00,
  `coupon_id` bigint(20) UNSIGNED DEFAULT NULL,
  `tracking_id` int(100) NOT NULL,
  `payment_status` enum('unpaid','paid','failed','refunded') DEFAULT 'unpaid',
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `version` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `rider_id`, `restaurant_id`, `delivery_address`, `total_amount`, `delivery_fee`, `tax_amount`, `coupon_id`, `tracking_id`, `payment_status`, `created_at`, `updated_at`, `version`) VALUES
(18, 1, 6, 3, 'Mirpur-10', 1621.85, 50.00, 74.85, 0, 6, 'unpaid', '2025-12-02 12:20:34', '2025-12-04 10:53:32', 1),
(19, 2, 1, 2, 'dhaka\n', 239.00, 50.00, 9.00, 0, 6, 'unpaid', '2025-12-02 12:36:42', '2025-12-10 09:19:21', 1),
(20, 1, 4, 5, 'Agargoan', 627.50, 50.00, 27.50, 0, 9, 'unpaid', '2025-12-10 11:42:04', '2025-12-10 11:42:37', 1),
(21, 3, 5, 2, 'Mohammadpur', 942.50, 50.00, 42.50, 0, 9, 'unpaid', '2025-12-15 09:24:59', '2025-12-15 09:25:39', 1),
(22, 7, 0, 3, 'sdfd', 596.00, 50.00, 26.00, 0, 1, 'unpaid', '2025-12-15 10:15:52', '2025-12-15 10:15:52', 1);

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `menu_item_id` bigint(20) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL DEFAULT 1,
  `unit_price` decimal(10,2) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `notes` varchar(512) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `menu_item_id`, `qty`, `unit_price`, `total_price`, `notes`, `created_at`) VALUES
(164, 3, 4, 1, 340.00, 0.00, '', '0000-00-00 00:00:00'),
(165, 3, 5, 1, 220.00, 0.00, '', '0000-00-00 00:00:00'),
(166, 4, 2, 1, 520.00, 0.00, '', '0000-00-00 00:00:00'),
(167, 5, 4, 1, 340.00, 0.00, '', '0000-00-00 00:00:00'),
(168, 5, 5, 1, 220.00, 0.00, '', '0000-00-00 00:00:00'),
(169, 6, 2, 1, 520.00, 0.00, '', '0000-00-00 00:00:00'),
(170, 6, 4, 1, 340.00, 0.00, '', '0000-00-00 00:00:00'),
(171, 7, 16, 1, 180.00, 0.00, '', '0000-00-00 00:00:00'),
(172, 8, 39, 1, 250.00, 0.00, '', '0000-00-00 00:00:00'),
(173, 9, 2, 1, 520.00, 0.00, '', '0000-00-00 00:00:00'),
(174, 9, 6, 5, 250.00, 0.00, '', '0000-00-00 00:00:00'),
(175, 10, 17, 4, 180.00, 0.00, '', '0000-00-00 00:00:00'),
(176, 10, 24, 2, 160.00, 0.00, '', '0000-00-00 00:00:00'),
(177, 11, 2, 1, 520.00, 0.00, '', '0000-00-00 00:00:00'),
(178, 12, 22, 1, 1100.00, 0.00, '', '0000-00-00 00:00:00'),
(179, 13, 11, 1, 850.00, 0.00, '', '0000-00-00 00:00:00'),
(180, 14, 11, 1, 850.00, 0.00, '', '0000-00-00 00:00:00'),
(181, 15, 33, 3, 260.00, 0.00, '', '0000-00-00 00:00:00'),
(182, 16, 2, 1, 520.00, 0.00, '', '0000-00-00 00:00:00'),
(183, 17, 45, 3, 499.00, 0.00, '', '0000-00-00 00:00:00'),
(184, 18, 45, 3, 499.00, 0.00, '', '0000-00-00 00:00:00'),
(185, 19, 16, 1, 180.00, 0.00, '', '0000-00-00 00:00:00'),
(186, 20, 9, 1, 550.00, 0.00, '', '0000-00-00 00:00:00'),
(187, 21, 14, 2, 150.00, 0.00, '', '0000-00-00 00:00:00'),
(188, 21, 9, 1, 550.00, 0.00, '', '0000-00-00 00:00:00'),
(189, 22, 2, 1, 520.00, 0.00, '', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `restaurants`
--

CREATE TABLE `restaurants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `phone` varchar(32) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `open_hours` varchar(100) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `restaurants`
--

INSERT INTO `restaurants` (`id`, `user_id`, `name`, `description`, `phone`, `address`, `open_hours`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, 'Holey Artisan Bakery', 'Upscale bakery & café known for artisan breads & pastries.', '01710011234', 'Gulshan-2, Dhaka', '7:30 AM - 10:00 PM', 1, '2025-10-08 12:48:22', NULL),
(2, 2, 'Star Kabab', 'Iconic kebab house serving classic Bangladeshi grill dishes.', '01820022345', 'Thatari Bazar, Wari, Dhaka', '10:00 AM - 11:30 PM', 1, '2025-10-08 12:48:22', NULL),
(3, 3, 'Sultan Dine', 'Beloved for its kacchi biryani and rich Bangladeshi-Indian dishes.', '01930033456', 'Dhaka, Bangladesh', '11:00 AM - 10:00 PM', 1, '2025-10-08 12:48:22', NULL),
(4, 4, 'Fakruddin Biryani', 'Traditional biryani house with a loyal following.', '01710044567', 'Dhanmondi, Dhaka', '9:30 AM - 10:00 PM', 1, '2025-10-08 12:48:22', NULL),
(5, 5, 'Biryani House', 'Authentic Hyderabadi & Dhakai biryani in a vibrant setting.', '01820055678', 'Khilgaon, Dhaka', '10:30 AM - 11:30 PM', 1, '2025-10-08 12:48:22', NULL),
(6, 6, 'The Manhattan', 'Seafood & Western fare with imported sauces & global touches.', '01930066789', 'Banani, Dhaka', '11:00 AM - 11:00 PM', 1, '2025-10-08 12:48:22', NULL),
(7, 7, 'Curry & Rice', 'Modern fusion of Bangladeshi spices with international cuisine.', '01710077890', 'Gulshan 2, Dhaka', '12:00 PM - 11:30 PM', 1, '2025-10-08 12:48:22', NULL),
(8, 8, 'The Steak House', 'Premium steakhouse offering imported cuts & fine dining experience.', '01820088901', 'Banani 12, Dhaka', '1:00 PM - 11:30 PM', 1, '2025-10-08 12:48:22', NULL),
(9, 9, 'Spice & Rice', 'Bangladeshi & Indian cuisine specialist known for rich gravies and biryanis.', '01930099012', 'Gulshan 1, Dhaka', '12:00 PM - 11:00 PM', 1, '2025-10-08 12:48:22', NULL),
(10, 10, 'Veggie Life', 'Vegetarian & vegan friendly meals in Dhaka’s fast-growing district.', '01710110123', 'Uttara Sector 7, Dhaka', '9:00 AM - 10:00 PM', 1, '2025-10-08 12:48:22', NULL),
(11, 11, 'Tokyo Dine', 'Japanese restaurant: sushi, ramen & tempura for discerning diners.', '01820121234', 'Bashundhara R/A, Dhaka', '12:00 PM - 11:30 PM', 1, '2025-10-08 12:48:22', NULL),
(12, 12, 'Dessert World', 'Cakes, brownies, ice-creams & shakes in a modern dessert lounge.', '01930232345', 'Khilkhet, Dhaka', '10:00 AM - 10:00 PM', 1, '2025-10-08 12:48:22', NULL),
(13, 13, 'Fish & Feast', 'Seafood & Bengali coastal cuisine with fresh catch and bold flavours.', '01710143456', 'Khilgaon, Dhaka', '11:00 AM - 11:00 PM', 1, '2025-10-08 12:48:22', NULL),
(14, 0, 'Snack Station', 'Quick snacks, coffee corner & casual bites for younger crowd.', '01820254567', 'Mohakhali, Dhaka', '8:00 AM - 9:00 PM', 1, '2025-10-08 12:48:22', NULL),
(15, 0, 'The Coffee Bean', 'International café chain with premium coffee & breakfast offerings.', '01930365678', 'Dhanmondi 15A, Dhaka', '7:00 AM - 10:00 PM', 1, '2025-10-08 12:48:22', NULL),
(25, NULL, 'Nadim', 'Desert', '01710000220', 'Mohammadpur, Dhaka', '8:00 AM - 9:00 PM', 1, '2026-01-26 07:18:57', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `riders`
--

CREATE TABLE `riders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(150) NOT NULL,
  `vehicle_type` enum('bike','car','other') DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `is_available` tinyint(1) DEFAULT 1,
  `password` varchar(200) NOT NULL,
  `photo` varchar(200) NOT NULL,
  `car_number` varchar(200) NOT NULL,
  `car_photo` varchar(200) NOT NULL,
  `mobile` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `riders`
--

INSERT INTO `riders` (`id`, `name`, `vehicle_type`, `is_active`, `is_available`, `password`, `photo`, `car_number`, `car_photo`, `mobile`, `email`, `created_at`, `updated_at`) VALUES
(1, 'Aminul Islam', 'bike', 1, 1, 'password123', '', 'DHA-B101', '', '01782345678', 'aminul.islam@example.com', NULL, NULL),
(2, 'Ariful Islam', 'car', 1, 1, 'password123', '', 'DHA-C101', '', '01854236789', 'ariful.islam@example.com', NULL, NULL),
(3, 'Fahad Ahmed', 'bike', 1, 1, 'password123', '', 'DHA-B102', '', '01965437821', 'fahad.ahmed@example.com', NULL, NULL),
(4, 'Farid Khan', 'car', 1, 1, 'password123', '', 'DHA-C102', '', '01673214589', 'farid.khan@example.com', NULL, NULL),
(5, 'Hasib Ullah', 'bike', 1, 1, 'password123', '', 'DHA-B103', '', '01792341568', 'hasib.ullah@example.com', NULL, NULL),
(6, 'Imran Hossain', 'car', 1, 1, 'password123', '', 'DHA-C103', '', '01863457892', 'imran.hossain@example.com', NULL, NULL),
(7, 'Mahfuz Ahmed', 'bike', 1, 1, 'password123', '', 'DHA-B104', '', '01984567231', 'mahfuz.ahmed@example.com', NULL, NULL),
(8, 'Mehedi Hasan', 'car', 1, 1, 'password123', '', 'DHA-C104', '', '01695432871', 'mehedi.hasan@example.com', NULL, NULL),
(9, 'Nayeem Hasan', 'bike', 1, 1, 'password123', '', 'DHA-B105', '', '01773561249', 'nayeem.hasan@example.com', NULL, NULL),
(10, 'Rasel Mahmud', 'car', 1, 1, 'password123', '', 'DHA-C105', '', '01882567493', 'rasel.mahmud@example.com', NULL, NULL),
(11, 'Rifat Islam', 'bike', 1, 1, 'password123', '', 'DHA-B106', '', '01975638421', 'rifat.islam@example.com', NULL, NULL),
(12, 'Rony Chowdhury', 'car', 1, 1, 'password123', '', 'DHA-C106', '', '01683457926', 'rony.chowdhury@example.com', NULL, NULL),
(13, 'Sabbir Ahmed', 'bike', 1, 1, 'password123', '', 'DHA-B107', '', '01763589412', 'sabbir.ahmed@example.com', NULL, NULL),
(14, 'Shahriar Rahman', 'car', 1, 1, 'password123', '', 'DHA-C107', '', '01897643152', 'shahriar.rahman@example.com', NULL, NULL),
(15, 'Tanvir Chowdhury', 'bike', 1, 1, 'password123', '', 'DHA-B188', '', '01962458371', 'tanvir.chowdhury@example.com', NULL, NULL),
(38, 'Mahedi', 'bike', 1, 1, 'Password123', 'E:\\xampp\\tmp\\phpD4C9.tmp', 'Raj-104', 'E:\\xampp\\tmp\\phpD4CA.tmp', '01962458371', 'idbmahedi@gmail.com', '2026-01-26 06:56:51', '2026-01-26 06:56:51'),
(40, 'Tanvir', 'bike', 1, 1, '4356', 'E:\\xampp\\tmp\\php46FC.tmp', 'DM-111', 'E:\\xampp\\tmp\\php46FD.tmp', '01720000001', 'idbmahedi@gmail.com', '2026-01-26 07:01:42', '2026-01-26 07:01:42');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
(1, 'Admin'),
(2, 'Restaurant'),
(3, 'Rider'),
(4, 'Customer');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('4i8XZHlFRlT8drwuHPYpSZtmLcfXGMmmFlEEWxnm', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidk80VzUzRTRzV0JONzVjem44blhBZHVmWldrU1FRWUFiUWdqaVFQaSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1769060462),
('GjUIzdKjHjWv9hLCdQJh9PFwN1wtGmDeltGJC8oK', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUnMzUFg4Ulc4NFphclNHZTg0cDRrM2JiVHdaUVk0Nm9WdUhIU0tJZCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1769407420),
('HYH973KaXqnkuEQGNPCZmekvfS7lUoWN5ZXKkLM1', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRTQ4NXpsZWZqRUZad2tUdnpmUzFFRUZRclpuTEtJMHl1MTJOM1o5dCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjM6Imh0dHA6Ly9sb2NhbGhvc3QvUmVhY3QlMjBMYXJhdmVsJTIwQVBJL3JlYWN0X2FwaV9sYXJhdmVsL3B1YmxpYyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1769063118),
('jKWnUgH19csEMLLsxsnMYtNqDRWk8gFh0ZjJ14Hy', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicXJPRGlxSzI5M3dzYzlwT1FabEpkNVR0bW51dDVQeEZBNDlsOTBQQiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1769311215),
('K5qvXr4j3AEM9NIXA2ytAsesncNVddD6n6NuGwRx', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTkhuQ0M5Q2tZRkNkWmh4ek1wR1RBZGJaOGtsMUF3anRXMmdLcWQ2QiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjM6Imh0dHA6Ly9sb2NhbGhvc3QvUmVhY3QlMjBMYXJhdmVsJTIwQVBJL3JlYWN0X2FwaV9sYXJhdmVsL3B1YmxpYyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1769397233);

-- --------------------------------------------------------

--
-- Table structure for table `trackings`
--

CREATE TABLE `trackings` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `trackings`
--

INSERT INTO `trackings` (`id`, `name`) VALUES
(1, 'pending'),
(2, 'paid'),
(3, 'accepted'),
(4, 'preparing'),
(5, 'ready_for_pickup'),
(6, 'assigned_to_rider'),
(7, 'picked_up'),
(8, 'on_the_way'),
(9, 'delivered'),
(10, 'failed_delivery'),
(11, 'cancelled'),
(12, 'refunded');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(32) DEFAULT NULL,
  `password_hash` varchar(255) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `name` varchar(120) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `phone`, `password_hash`, `role_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin@foodapp.com', '01700000000', '$2y$10$Fgo7ihMsnK7bFaTO6sGXduCxCFWWwRayKPH4qyDIjpMsVXyDnQYeK', 1, 'admin', '2025-10-09 10:26:53', '2025-12-15 09:23:12'),
(2, 'restaurant@foodapp.com', '01711111111', '$2y$10$Fgo7ihMsnK7bFaTO6sGXduCxCFWWwRayKPH4qyDIjpMsVXyDnQYeK', 2, 'Restaurant', '2025-10-09 10:26:53', '2025-12-10 11:20:14'),
(3, 'rider@foodapp.com', '01722222222', '$2y$10$Fgo7ihMsnK7bFaTO6sGXduCxCFWWwRayKPH4qyDIjpMsVXyDnQYeK', 3, 'Rider', '2025-10-09 10:26:53', '2025-12-10 11:20:22'),
(4, 'customer@foodapp.com', '01733333333', '$2y$10$Fgo7ihMsnK7bFaTO6sGXduCxCFWWwRayKPH4qyDIjpMsVXyDnQYeK', 4, 'Customer', '2025-10-09 10:26:53', '2025-12-10 11:20:29');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_locks_expiration_index` (`expiration`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoice_details`
--
ALTER TABLE `invoice_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_id` (`invoice_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- Indexes for table `restaurants`
--
ALTER TABLE `restaurants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `riders`
--
ALTER TABLE `riders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `trackings`
--
ALTER TABLE `trackings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `invoice_details`
--
ALTER TABLE `invoice_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=190;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `restaurants`
--
ALTER TABLE `restaurants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `riders`
--
ALTER TABLE `riders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `trackings`
--
ALTER TABLE `trackings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `invoice_details`
--
ALTER TABLE `invoice_details`
  ADD CONSTRAINT `invoice_details_ibfk_1` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 16, 2024 at 08:44 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shop_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `password`) VALUES
(1, 'Admin', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `pid` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(10) NOT NULL,
  `quantity` int(10) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`id`, `user_id`, `name`, `description`) VALUES
(1, 1, 'Alok Amar', 'I have been ordering this for two years now. Product quality is very good. '),
(2, 2, 'Priti Kumari', 'I have been ordering this for one years now. Product Prices are too good. '),
(3, 3, 'Raj Kumar', 'I have been ordering this for three years now. Product Delivery is very good. '),
(4, 4, 'Suhail Ahmad', 'I have been ordering this for two years now. Cancellation and Refund Services are good. '),
(5, 5, 'Saket Anand', 'I have been ordering this for three years now. Lots of Product Brand is available. ');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `number` varchar(12) NOT NULL,
  `message` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `number` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `method` varchar(50) NOT NULL,
  `address` varchar(500) NOT NULL,
  `total_products` varchar(1000) NOT NULL,
  `total_price` int(100) NOT NULL,
  `placed_on` date NOT NULL DEFAULT current_timestamp(),
  `payment_status` varchar(20) NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `details` varchar(500) NOT NULL,
  `price` int(10) NOT NULL,
  `image_01` varchar(100) NOT NULL,
  `image_02` varchar(100) NOT NULL,
  `image_03` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `details`, `price`, `image_01`, `image_02`, `image_03`) VALUES
(1, 'HP X200', 'Stay unbound, stay in control - enjoy lag-free 2.4GHz wireless connectivity on this durable mouse by HP with an 18-month long battery life.', 499, 'hp x200 mouse-1.webp', 'hp x200 mouse-2.webp', 'hp x200 mouse-3.webp'),
(2, 'Canon EOS 1500D', 'APS-C CMOS Sensor with 24.1 MP (high resolution for large prints and image cropping). Transmission frequency (central frequency):Frequency: 2 412 to 2 462MHz. Standard diopter :-2.5 - +0.5m-1 (dpt).', 35990, 'Canon EOS 1500D camera-1.webp', 'Canon EOS 1500D camera-2.webp', 'Canon EOS 1500D camera-3.webp'),
(3, 'realme C21Y', '3 GB RAM | 32 GB ROM | Expandable Upto 256 GB\r\n16.51 cm (6.5 inch) HD+ Display\r\n13MP + 2MP + 2MP | 5MP Front Camera\r\n5000 mAh Battery\r\nUnisoc T610 Processor', 8998, 'realme C21Y mobile phone-2.webp', 'realme C21Y mobile phone-1.webp', 'realme C21Y mobile phone-3.webp'),
(4, 'Lenovo ThinkPad E14', 'ThinkPad Reliability (12 Military Specifications Certified) | Built to withstand rugged usage and can handle accidental knocks, drops, and even spills | Best for Work/ Learn/ Play from home\r\nProcessor: AMD Ryzen 5 4650U Professional processor, 2.1Ghz base speed, 4.0Ghz max speed, 6Cores, 8Mb Smart Cache', 64750, 'Lenovo ThinkPad E14 laptop-1.webp', 'Lenovo ThinkPad E14 laptop-2.webp', 'Lenovo ThinkPad E14 laptop-3.webp'),
(5, 'Casio G-Shock', 'Dial Color : Black, Strap Color : Black\r\nStrap Material : Resin, Clasp Type : Buckle\r\nCase Material : Resin, Water Resistant\r\nWater Resistance : 200', 3500, 'Casio G-Shock watch-1.webp', 'Casio G-Shock watch-2.webp', 'Casio G-Shock watch-3.webp'),
(6, 'OnePlus 55 inch (139cm)', '139cm (55 inch)\r\n3840 x 2160 Pixels\r\n4K UHD TV\r\nDolby Audio\r\n24 W Speakers\r\n60 Hz Refresh Rate\r\nAndroid 10 Operating System\r\n2.0 CH Speaker\r\n2 Years Comprehensive Warranty (1st Year Comprehensive Warranty & 2nd Year only on Panel)', 39999, 'OnePlus 55 inch (139cm) tv-1.webp', 'OnePlus 55 inch (139cm) tv-2.webp', 'OnePlus 55 inch (139cm) tv-3.webp'),
(7, 'Croma 7.5 kg 5 Star', '7.5kg, Top Load, Fully Automatic\nBEE 5 Star Rating\nIdeal for 6-8 Family Size\n10 Wash Programs​\nAdvanced Anti-Tangle Technology, Pulsator Wash, Air Dry Function\n24 Months Warranty, 10 Years Motor Warranty', 20000, 'Croma 7.5 kg 5 Star Fully Automatic washing machine-1.webp', 'Croma 7.5 kg 5 Star Fully Automatic washing machine-2.webp', 'Croma 7.5 kg 5 Star Fully Automatic washing machine-3.webp'),
(8, 'Godrej 236 L 2 Star', 'The star rating changes are as per BEE guidelines on or before 1st Jan 2023\r\nFrost Free Refrigerator: Auto defrost function to prevent ice-build up\r\nCapacity 236 litres : Suitable for families with 2 to 3 members\r\nEnergy rating: 2 star, Annual energy consumption: 243 Kilowatt Hours', 19990, 'Godrej 236 L 2 Star refrigerator-1.webp', 'Godrej 236 L 2 Star refrigerator-2.webp', 'Godrej 236 L 2 Star refrigerator-3.webp'),
(9, 'iPhone 14', '15.40 cm (6.1-inch) Super Retina XDR display\r\nAdvanced camera system for better photos in any light\r\nCinematic mode now in 4K Dolby Vision up to 30 fps\r\nAction mode for smooth, steady, handheld videos\r\nVital safety technology — Crash Detection calls for help when you can’t', 159000, 'iphone 14 mobile phone-1.jpg', 'iphone 14 mobile phone-2.jpg', 'iphone 14 mobile phone-3.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(5) NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`) VALUES
(1, 'Alok Amar', 'alok@gmail.com', '6f5aedb74d4f58a5399d301da46e0e37ab8cbe03'),
(2, 'Priti Kumari', 'priti@gmail.com', '6a5771f990f5b1043e5fd63b80fb94e8655fddd0'),
(3, 'Raj Kumar', 'raj@gmail.com', 'a834e747ffe8fc98b314b1703c868698ea4d0601'),
(4, 'Suhail Ahmad', 'suhail@gmail.com', '798bb167d3f303a18da62747cf6252ea6e015a3a'),
(5, 'Saket Anand', 'saket@gmail.com', '1764561a05cf8b582c34d9650290bed9ab09a2f3');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `pid` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(100) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 26, 2017 at 07:38 AM
-- Server version: 5.6.33
-- PHP Version: 5.6.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tiffin_dabba`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_login`
--

CREATE TABLE `admin_login` (
  `id` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_login`
--

INSERT INTO `admin_login` (`id`, `pass`) VALUES
('admin', 'kunal2181995');

-- --------------------------------------------------------

--
-- Table structure for table `app_home_images`
--

CREATE TABLE `app_home_images` (
  `Id` int(11) NOT NULL,
  `Image` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `app_home_images`
--

INSERT INTO `app_home_images` (`Id`, `Image`) VALUES
(1, '~//admin//AppSetting//HomeImages//happy-diwali.jpg'),
(2, '~//admin//AppSetting//HomeImages//CoverTemplate.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `app_setting`
--

CREATE TABLE `app_setting` (
  `Id` varchar(255) NOT NULL,
  `ProfileImg` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `app_setting`
--

INSERT INTO `app_setting` (`Id`, `ProfileImg`) VALUES
('App1', '~//admin//AppSetting//ProfileImage//AndroidApp.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `cancelled_simple_tiffin_daily_order`
--

CREATE TABLE `cancelled_simple_tiffin_daily_order` (
  `order_id` varchar(255) NOT NULL,
  `book_for` varchar(255) NOT NULL,
  `tid` varchar(255) NOT NULL,
  `pid` varchar(255) NOT NULL,
  `uid` varchar(255) NOT NULL,
  `uname` varchar(255) NOT NULL,
  `ueid` varchar(255) NOT NULL,
  `time` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  `umob_no` varchar(255) NOT NULL,
  `delivery_area` varchar(255) NOT NULL,
  `uadd` varchar(255) NOT NULL,
  `sabji` varchar(255) NOT NULL,
  `roti` varchar(255) NOT NULL,
  `dal` varchar(255) NOT NULL,
  `chawal` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `st_image` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cancelled_tiffin_with_sweet_daily_order`
--

CREATE TABLE `cancelled_tiffin_with_sweet_daily_order` (
  `order_id` varchar(255) NOT NULL,
  `book_for` varchar(255) NOT NULL,
  `tid` varchar(255) NOT NULL,
  `pid` varchar(255) NOT NULL,
  `uid` varchar(255) NOT NULL,
  `uname` varchar(255) NOT NULL,
  `ueid` varchar(255) NOT NULL,
  `time` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  `umob_no` varchar(255) NOT NULL,
  `delivery_area` varchar(255) NOT NULL,
  `uadd` varchar(255) NOT NULL,
  `sabji` varchar(255) NOT NULL,
  `roti` varchar(255) NOT NULL,
  `dal` varchar(255) NOT NULL,
  `chawal` varchar(255) NOT NULL,
  `sweet` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `st_image` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `city` varchar(255) NOT NULL,
  `is_fastfood` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`city`, `is_fastfood`) VALUES
('--To Select--', 1),
('Vidhya Nagar', 1),
('Anand', 1);

-- --------------------------------------------------------

--
-- Table structure for table `delivery_area`
--

CREATE TABLE `delivery_area` (
  `city` varchar(255) NOT NULL,
  `area` varchar(255) NOT NULL,
  `standard` int(11) NOT NULL,
  `average` int(11) NOT NULL,
  `poor` int(11) NOT NULL,
  `is_fastfood` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `delivery_area`
--

INSERT INTO `delivery_area` (`city`, `area`, `standard`, `average`, `poor`, `is_fastfood`) VALUES
('Udaipur', 'Tekri', 1, 1, 1, 0),
('Udaipur', 'Savina', 1, 1, 1, 0),
('Udaipur', 'Science college', 1, 1, 1, 0),
('Udaipur', 'Durga nursari Road', 1, 1, 1, 1),
('Udaipur', 'Shakti Nagar', 1, 1, 1, 0),
('Udaipur', 'Ayad', 1, 1, 1, 0),
('Udaipur', 'Titardi', 1, 1, 1, 0),
('Udaipur', 'Bhopal Pura', 1, 1, 1, 0),
('Udaipur', 'Udiapole', 1, 1, 1, 0),
('Udaipur', 'Sector-3,4,5,6,7,9', 1, 1, 1, 0),
('Udaipur', 'Sevashram', 1, 1, 1, 0),
('Udaipur', 'Thoker', 1, 1, 1, 0),
('Udaipur', 'Panerio ki madri', 1, 1, 1, 0),
('Udaipur', 'Ashok Nagar', 1, 1, 1, 0),
('Udaipur', 'Suraj Pole', 1, 1, 1, 0),
('Udaipur', 'Shubhash Nagar', 1, 1, 1, 0),
('Udaipur', 'Manva Kheda', 1, 1, 1, 0),
('Udaipur', 'Geetanjali Medical', 1, 1, 0, 0),
('Udaipur', 'sector-11', 1, 1, 1, 0),
('Anand', 'Rajodpura', 1, 1, 1, 0),
('Anand', 'MangalPura Rd.', 1, 1, 1, 0),
('Anand', 'Collector Banglow', 1, 1, 1, 0),
('Anand', 'Amul Dairy Rd.', 1, 1, 1, 1),
('Anand', 'Dr.Kurian Rd.', 1, 1, 1, 1),
('Anand', 'Circuit House Rd.', 1, 1, 1, 1),
('Anand', 'Sardar Ganj Rd.', 1, 1, 1, 1),
('Anand', 'Shak Market', 1, 1, 1, 1),
('Anand', 'Station Rd.', 1, 1, 1, 1),
('Anand', 'Ismile Nagar', 1, 1, 1, 1),
('Anand', 'Old Bus-stand', 1, 1, 1, 1),
('Anand', 'Mafaire Rd.', 1, 1, 1, 1),
('Anand', 'New Bus-stand', 1, 1, 1, 1),
('Anand', 'Gamdi Vad', 1, 1, 1, 1),
('Anand', 'Chopato', 1, 1, 1, 1),
('Anand', 'Vyayamsada Rd.', 1, 1, 1, 1),
('Vidhya Nagar', 'A.v. Rd.', 1, 1, 1, 1),
('Vidhya Nagar', 'AksharFarm Rd.', 1, 1, 1, 1),
('Vidhya Nagar', 'Bhaikaka Statue', 1, 1, 1, 1),
('Vidhya Nagar', 'SardarPatel Statue', 1, 1, 1, 1),
('Vidhya Nagar', 'Mota Bazar', 1, 1, 1, 1),
('Vidhya Nagar', 'Iskon Tempale', 1, 1, 1, 1),
('Vidhya Nagar', 'University Circle', 1, 1, 1, 1),
('Vidhya Nagar', 'Nana Bazar', 1, 1, 1, 1),
('Vidhya Nagar', 'Hariom Nagar', 1, 1, 1, 0),
('Vidhya Nagar', 'Bakrol Rd.', 1, 1, 1, 1),
('Vidhya Nagar', 'Sastri Medan Circle', 1, 1, 1, 1),
('Vidhya Nagar', 'G.I.D.C', 1, 1, 1, 0),
('Anand', 'Gopal Cinema', 1, 1, 1, 0),
('Vidhya Nagar', 'ADIT', 1, 1, 1, 1),
('Anand', 'Grid Chokdi', 1, 1, 1, 1),
('Anand', 'Gopal Chokdi', 1, 1, 1, 1),
('Anand', '80 ft. Rd.', 1, 1, 1, 1),
('Anand', 'Lotiya Bhagod', 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `delivery_charges`
--

CREATE TABLE `delivery_charges` (
  `charges_id` int(11) NOT NULL,
  `del_charge_limit` varchar(50) NOT NULL,
  `del_charge` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `delivery_charges`
--

INSERT INTO `delivery_charges` (`charges_id`, `del_charge_limit`, `del_charge`) VALUES
(2, '150', '30');

-- --------------------------------------------------------

--
-- Table structure for table `fast_food_categories`
--

CREATE TABLE `fast_food_categories` (
  `cat_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `Image` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fast_food_categories`
--

INSERT INTO `fast_food_categories` (`cat_id`, `name`, `Image`) VALUES
(1, 'Hot Coffee', '~//admin//fast_food_image//FastFoodCatImage//Cafe-Mocha.jpg'),
(2, 'Cold Coffee', '~//admin//fast_food_image//FastFoodCatImage//cafe_frappe.jpg'),
(3, 'Choco Shake', '~//admin//fast_food_image//FastFoodCatImage//KitKatShake.jpg'),
(4, 'Hot Milk', '~//admin//fast_food_image//FastFoodCatImage//Bournvita.jpg'),
(5, 'Pizza', '~//admin//fast_food_image//FastFoodCatImage//OTC.jpg'),
(6, 'Pasta', '~//admin//fast_food_image//FastFoodCatImage//RedSaucePasta.jpeg'),
(7, 'Burger', '~//admin//fast_food_image//FastFoodCatImage//veg-burger.png'),
(8, 'Sticks', '~//admin//fast_food_image//FastFoodCatImage//Garlic-Stick.jpg'),
(9, 'Wrap', '~//admin//fast_food_image//FastFoodCatImage//PaneerWrap.jpg'),
(10, 'Sandwich', '~//admin//fast_food_image//FastFoodCatImage//Veg-Cheese-Sandwich.jpg'),
(11, 'Maggi', '~//admin//fast_food_image//FastFoodCatImage//MasalaMaggi.jpg'),
(12, 'Small Eats', '~//admin//fast_food_image//FastFoodCatImage//FrenchFries.jpg'),
(13, 'Shake', '~//admin//fast_food_image//FastFoodCatImage//BlackCurrent.jpg'),
(14, 'Tea', '~//admin//fast_food_image//FastFoodCatImage//HotTea.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `fast_food_orders`
--

CREATE TABLE `fast_food_orders` (
  `order_id` int(11) NOT NULL,
  `provider_id` varchar(255) NOT NULL,
  `product_id` varchar(255) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `quantity` varchar(255) NOT NULL,
  `unit_price` varchar(255) NOT NULL,
  `total_price` varchar(255) NOT NULL,
  `email_id` varchar(255) NOT NULL,
  `mobile_no` varchar(255) NOT NULL,
  `del_city` varchar(255) NOT NULL,
  `del_area` varchar(255) NOT NULL,
  `del_address` longtext NOT NULL,
  `date` varchar(255) NOT NULL,
  `time` varchar(255) NOT NULL,
  `read_order` tinyint(1) NOT NULL,
  `delivered` tinyint(1) NOT NULL,
  `cancelled` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fast_food_orders`
--

INSERT INTO `fast_food_orders` (`order_id`, `provider_id`, `product_id`, `user_id`, `quantity`, `unit_price`, `total_price`, `email_id`, `mobile_no`, `del_city`, `del_area`, `del_address`, `date`, `time`, `read_order`, `delivered`, `cancelled`) VALUES
(1, 'Hardikshah@gmail.com', '23', 'pkunal22@gmail.com', '1', '94', '94', 'pkunal22@gmail.com', '8875296256', 'Anand', 'Grid Chokdi', 'Shree Shantipuram hostel A,ss college of engineering umarda,udaipur,Rajasthan', 'Thursday, October 5, 2017', '20:00:42', 0, 1, 0),
(1, 'Hardikshah@gmail.com', '31', 'pkunal22@gmail.com', '1', '61', '61', 'pkunal22@gmail.com', '8875296256', 'Anand', 'Grid Chokdi', 'Shree Shantipuram hostel A,ss college of engineering umarda,udaipur,Rajasthan', 'Thursday, October 5, 2017', '20:00:42', 0, 1, 0),
(2, 'Hardikshah@gmail.com', '35', 'pkunal22@gmail.com', '2', '61', '122', 'pkunal22@gmail.com', '8875296256', 'Vidhya Nagar', 'ADIT', 'Shree Shantipuram hostel A,ss college of engineering umarda,udaipur,Rajasthan', 'Friday, October 6, 2017', '20:12:13', 0, 1, 0),
(2, 'Hardikshah@gmail.com', '45', 'pkunal22@gmail.com', '1', '91', '91', 'pkunal22@gmail.com', '8875296256', 'Vidhya Nagar', 'ADIT', 'Shree Shantipuram hostel A,ss college of engineering umarda,udaipur,Rajasthan', 'Friday, October 6, 2017', '20:12:13', 0, 1, 0),
(2, 'Hardikshah@gmail.com', '61', 'pkunal22@gmail.com', '1', '86', '86', 'pkunal22@gmail.com', '8875296256', 'Vidhya Nagar', 'ADIT', 'Shree Shantipuram hostel A,ss college of engineering umarda,udaipur,Rajasthan', 'Friday, October 6, 2017', '20:12:13', 0, 1, 0),
(2, 'Hardikshah@gmail.com', '24', 'pkunal22@gmail.com', '1', '114', '114', 'pkunal22@gmail.com', '8875296256', 'Vidhya Nagar', 'ADIT', 'Shree Shantipuram hostel A,ss college of engineering umarda,udaipur,Rajasthan', 'Friday, October 6, 2017', '20:12:13', 0, 1, 0),
(3, 'Hardikshah@gmail.com', '23', 'pkunal22@gmail.com', '1', '94', '94', 'pkunal22@gmail.com', '8875296256', 'Vidhya Nagar', 'Bhaikaka Statue', 'Three gates,Chiman sheth Street,chikhodra,anand', '22 November 2017', '19:55:34', 0, 0, 0),
(3, 'Hardikshah@gmail.com', '58', 'pkunal22@gmail.com', '2', '51', '102', 'pkunal22@gmail.com', '8875296256', 'Vidhya Nagar', 'Bhaikaka Statue', 'Three gates,Chiman sheth Street,chikhodra,anand', '22 November 2017', '19:55:34', 0, 0, 0),
(3, 'Hardikshah@gmail.com', '30', 'pkunal22@gmail.com', '2', '49', '98', 'pkunal22@gmail.com', '8875296256', 'Vidhya Nagar', 'Bhaikaka Statue', 'Three gates,Chiman sheth Street,chikhodra,anand', '22 November 2017', '19:55:34', 0, 0, 0),
(3, 'Hardikshah@gmail.com', '45', 'pkunal22@gmail.com', '1', '91', '91', 'pkunal22@gmail.com', '8875296256', 'Vidhya Nagar', 'Bhaikaka Statue', 'Three gates,Chiman sheth Street,chikhodra,anand', '22 November 2017', '19:55:34', 0, 0, 0),
(4, 'Hardikshah@gmail.com', '23', 'pkunal22@gmail.com', '1', '94', '94', 'pkunal22@gmail.com', '8875296256', 'Vidhya Nagar', 'Mota Bazar', 'Three gates,Chiman sheth Street,chikhodra,anand', '22 November 2017', '19:58:52', 0, 0, 0),
(4, 'Hardikshah@gmail.com', '30', 'pkunal22@gmail.com', '2', '49', '98', 'pkunal22@gmail.com', '8875296256', 'Vidhya Nagar', 'Mota Bazar', 'Three gates,Chiman sheth Street,chikhodra,anand', '22 November 2017', '19:58:52', 0, 0, 0),
(4, 'Hardikshah@gmail.com', '35', 'pkunal22@gmail.com', '1', '61', '61', 'pkunal22@gmail.com', '8875296256', 'Vidhya Nagar', 'Mota Bazar', 'Three gates,Chiman sheth Street,chikhodra,anand', '22 November 2017', '19:58:52', 0, 0, 0),
(4, 'Hardikshah@gmail.com', '58', 'pkunal22@gmail.com', '2', '51', '102', 'pkunal22@gmail.com', '8875296256', 'Vidhya Nagar', 'Mota Bazar', 'Three gates,Chiman sheth Street,chikhodra,anand', '22 November 2017', '19:58:52', 0, 0, 0),
(5, 'Hardikshah@gmail.com', '30', 'pkunal22@gmail.com', '2', '49', '98', 'pkunal22@gmail.com', '8875296256', 'Vidhya Nagar', 'Mota Bazar', 'Three gates,Chiman sheth Street,chikhodra,anand', '22 November 2017', '20:02:01', 0, 0, 0),
(5, 'Hardikshah@gmail.com', '45', 'pkunal22@gmail.com', '1', '91', '91', 'pkunal22@gmail.com', '8875296256', 'Vidhya Nagar', 'Mota Bazar', 'Three gates,Chiman sheth Street,chikhodra,anand', '22 November 2017', '20:02:01', 0, 0, 0),
(6, 'Hardikshah@gmail.com', '35', 'pkunal22@gmail.com', '1', '61', '61', 'pkunal22@gmail.com', '8875296256', 'Vidhya Nagar', 'Bhaikaka Statue', 'Three gates,Chiman sheth Street,chikhodra,anand', '23 November 2017', '08:14:02', 0, 0, 1),
(6, 'Hardikshah@gmail.com', '23', 'pkunal22@gmail.com', '1', '94', '94', 'pkunal22@gmail.com', '8875296256', 'Vidhya Nagar', 'Bhaikaka Statue', 'Three gates,Chiman sheth Street,chikhodra,anand', '23 November 2017', '08:14:02', 0, 0, 1),
(7, 'Hardikshah@gmail.com', '45', 'pkunal22@gmail.com', '1', '91', '91', 'pkunal22@gmail.com', '8875296256', 'Vidhya Nagar', 'Bhaikaka Statue', 'Three gates,Chiman sheth Street,chikhodra,anand', '23 November 2017', '08:15:09', 0, 0, 1),
(7, 'Hardikshah@gmail.com', '30', 'pkunal22@gmail.com', '1', '49', '49', 'pkunal22@gmail.com', '8875296256', 'Vidhya Nagar', 'Bhaikaka Statue', 'Three gates,Chiman sheth Street,chikhodra,anand', '23 November 2017', '08:15:09', 0, 0, 1),
(7, 'Hardikshah@gmail.com', '35', 'pkunal22@gmail.com', '1', '61', '61', 'pkunal22@gmail.com', '8875296256', 'Vidhya Nagar', 'Bhaikaka Statue', 'Three gates,Chiman sheth Street,chikhodra,anand', '23 November 2017', '08:15:09', 0, 0, 1),
(7, 'Hardikshah@gmail.com', '23', 'pkunal22@gmail.com', '1', '94', '94', 'pkunal22@gmail.com', '8875296256', 'Vidhya Nagar', 'Bhaikaka Statue', 'Three gates,Chiman sheth Street,chikhodra,anand', '23 November 2017', '08:15:09', 0, 0, 1),
(8, 'Hardikshah@gmail.com', '45', 'pkunal22@gmail.com', '1', '91', '91', 'pkunal22@gmail.com', '8875296256', 'Vidhya Nagar', 'Mota Bazar', 'Three gates,Chiman sheth Street,chikhodra,anand', '23 November 2017', '08:18:49', 0, 0, 1),
(8, 'Hardikshah@gmail.com', '30', 'pkunal22@gmail.com', '3', '49', '147', 'pkunal22@gmail.com', '8875296256', 'Vidhya Nagar', 'Mota Bazar', 'Three gates,Chiman sheth Street,chikhodra,anand', '23 November 2017', '08:18:49', 0, 0, 1),
(8, 'Hardikshah@gmail.com', '35', 'pkunal22@gmail.com', '1', '61', '61', 'pkunal22@gmail.com', '8875296256', 'Vidhya Nagar', 'Mota Bazar', 'Three gates,Chiman sheth Street,chikhodra,anand', '23 November 2017', '08:18:49', 0, 0, 1),
(8, 'Hardikshah@gmail.com', '23', 'pkunal22@gmail.com', '1', '94', '94', 'pkunal22@gmail.com', '8875296256', 'Vidhya Nagar', 'Mota Bazar', 'Three gates,Chiman sheth Street,chikhodra,anand', '23 November 2017', '08:18:49', 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `fast_food_products`
--

CREATE TABLE `fast_food_products` (
  `product_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `provider_city` varchar(255) NOT NULL,
  `provider_id` varchar(255) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `price` varchar(255) NOT NULL,
  `start_time` varchar(255) DEFAULT NULL,
  `end_time` varchar(255) DEFAULT NULL,
  `is_available` tinyint(1) NOT NULL,
  `image` longtext NOT NULL,
  `IsAppHome` tinyint(1) NOT NULL,
  `DiscountedPrice` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fast_food_products`
--

INSERT INTO `fast_food_products` (`product_id`, `cat_id`, `provider_city`, `provider_id`, `product_name`, `description`, `price`, `start_time`, `end_time`, `is_available`, `image`, `IsAppHome`, `DiscountedPrice`) VALUES
(1, 1, 'Vidhya Nagar', 'Hardikshah@gmail.com', 'Black Coffee', '', '37', NULL, NULL, 1, '~//admin//fast_food_image//BlackCoffee.jpg', 0, ''),
(2, 1, 'Vidhya Nagar', 'Hardikshah@gmail.com', 'Macchialo', '', '45', '', '', 1, '~//admin//fast_food_image//caffe-latte.jpg', 0, ''),
(3, 1, 'Vidhya Nagar', 'Hardikshah@gmail.com', 'Espresso Float', '', '55', NULL, NULL, 1, '~//admin//fast_food_image//img_not_available.jpg', 0, ''),
(4, 1, 'Vidhya Nagar', 'Hardikshah@gmail.com', 'Cappaccinno', '', '55', NULL, NULL, 1, '~//admin//fast_food_image//cappuccino.jpg', 0, ''),
(5, 1, 'Vidhya Nagar', 'Hardikshah@gmail.com', 'Cafe Latte', '', '62', NULL, NULL, 1, '~//admin//fast_food_image//caffe-latte.jpg', 0, ''),
(6, 1, 'Vidhya Nagar', 'Hardikshah@gmail.com', 'Cafe Mocha', '', '62', NULL, NULL, 1, '~//admin//fast_food_image//Cafe-Mocha.jpg', 0, ''),
(7, 1, 'Vidhya Nagar', 'Hardikshah@gmail.com', 'Irish', '', '71', NULL, NULL, 1, '~//admin//fast_food_image//img_not_available.jpg', 0, ''),
(8, 1, 'Vidhya Nagar', 'Hardikshah@gmail.com', 'Hot Chocolate', '', '62', NULL, NULL, 1, '~//admin//fast_food_image//hot_chocolate_coffee.jpg', 0, ''),
(9, 2, 'Vidhya Nagar', 'Hardikshah@gmail.com', 'Cream Blast', '', '85', NULL, NULL, 1, '~//admin//fast_food_image//cream_blast.jpg', 0, ''),
(10, 2, 'Vidhya Nagar', 'Hardikshah@gmail.com', 'Cafe Frape', '', '75', NULL, NULL, 1, '~//admin//fast_food_image//cafe_frappe.jpg', 0, ''),
(11, 2, 'Vidhya Nagar', 'Hardikshah@gmail.com', 'Choco Frape', '', '85', NULL, NULL, 1, '~//admin//fast_food_image//choco_frappe.jpg', 0, ''),
(12, 2, 'Vidhya Nagar', 'Hardikshah@gmail.com', 'Double Choco Frape', '', '97', NULL, NULL, 1, '~//admin//fast_food_image//choco_frappe.jpg', 0, ''),
(13, 2, 'Vidhya Nagar', 'Hardikshah@gmail.com', 'Choco Crunch Mocha', '', '97', NULL, NULL, 1, '~//admin//fast_food_image//choco_crunch_mocha.jpg', 0, ''),
(14, 2, 'Vidhya Nagar', 'Hardikshah@gmail.com', 'Naughty Cocolate', '', '105', NULL, NULL, 1, '~//admin//fast_food_image//img_not_available.jpg', 0, ''),
(15, 2, 'Vidhya Nagar', 'Hardikshah@gmail.com', 'Mint Chocolat Blast', '', '105', NULL, NULL, 1, '~//admin//fast_food_image//img_not_available.jpg', 0, ''),
(16, 3, 'Vidhya Nagar', 'Hardikshah@gmail.com', 'Oreo Shake', '', '85', NULL, NULL, 1, '~//admin//fast_food_image//OreoShake.jpeg', 0, ''),
(17, 3, 'Vidhya Nagar', 'Hardikshah@gmail.com', 'Kit Kat Shake', '', '105', NULL, NULL, 1, '~//admin//fast_food_image//KitKatShake.jpg', 0, ''),
(18, 3, 'Vidhya Nagar', 'Hardikshah@gmail.com', 'Snicker Shake', '', '105', NULL, NULL, 1, '~//admin//fast_food_image//SnickersShake.jpg', 0, ''),
(19, 3, 'Vidhya Nagar', 'Hardikshah@gmail.com', 'Toblerone', '', '115', NULL, NULL, 1, '~//admin//fast_food_image//img_not_available.jpg', 0, ''),
(20, 3, 'Vidhya Nagar', 'Hardikshah@gmail.com', 'Brownie Shake', '', '115', NULL, NULL, 1, '~//admin//fast_food_image//BrownieShake.jpg', 0, ''),
(21, 3, 'Vidhya Nagar', 'Hardikshah@gmail.com', 'M and M', '', '90', NULL, NULL, 1, '~//admin//fast_food_image//img_not_available.jpg', 0, ''),
(22, 4, 'Vidhya Nagar', 'Hardikshah@gmail.com', 'Bournvita', '', '35', NULL, NULL, 1, '~//admin//fast_food_image//Bournvita.jpg', 0, ''),
(23, 5, 'Vidhya Nagar', 'Hardikshah@gmail.com', 'Onion Tomato Capsicum Pizza', '', '94', '', '', 1, '~//admin//fast_food_image//OTC.jpg', 1, ''),
(24, 5, 'Vidhya Nagar', 'Hardikshah@gmail.com', 'Margherita Pizza', '', '114', NULL, NULL, 1, '~//admin//fast_food_image//margreta.jpg', 0, ''),
(25, 5, 'Vidhya Nagar', 'Hardikshah@gmail.com', 'Spicy Panner Pizza', '', '140', NULL, NULL, 1, '~//admin//fast_food_image//SpicyPaneer.jpg', 0, ''),
(26, 5, 'Vidhya Nagar', 'Hardikshah@gmail.com', 'Maxican Pizza', '', '120', '', '', 1, '~//admin//fast_food_image//Mexican-Pizza.jpg', 1, ''),
(27, 6, 'Vidhya Nagar', 'Hardikshah@gmail.com', 'Red Sause Pasta', '', '74', NULL, NULL, 1, '~//admin//fast_food_image//RedSaucePasta.jpeg', 0, ''),
(28, 6, 'Vidhya Nagar', 'Hardikshah@gmail.com', 'White Sause Pasta', '', '82', NULL, NULL, 1, '~//admin//fast_food_image//whiteSaucePasta.jpg', 0, ''),
(29, 6, 'Vidhya Nagar', 'Hardikshah@gmail.com', 'Cheeze Garlic Pasta', '', '109', NULL, NULL, 1, '~//admin//fast_food_image//CheezeGarlicPasta.jpg', 0, ''),
(30, 7, 'Vidhya Nagar', 'Hardikshah@gmail.com', 'Veg Burger', '', '49', NULL, NULL, 1, '~//admin//fast_food_image//veg-burger.png', 0, ''),
(31, 7, 'Vidhya Nagar', 'Hardikshah@gmail.com', 'Veg Chezze Burger', '', '61', '', '', 1, '~//admin//fast_food_image//Veg-CheezeBurger.jpg', 1, ''),
(32, 7, 'Vidhya Nagar', 'Hardikshah@gmail.com', 'Paneer Spicy Burger', '', '80', NULL, NULL, 1, '~//admin//fast_food_image//img_not_available.jpg', 0, ''),
(34, 7, 'Vidhya Nagar', 'Hardikshah@gmail.com', 'BBQ Cheeze Burger', '', '80', NULL, NULL, 1, '~//admin//fast_food_image//img_not_available.jpg', 0, ''),
(35, 8, 'Vidhya Nagar', 'Hardikshah@gmail.com', 'Garlic Stick', '', '61', '', '', 1, '~//admin//fast_food_image//Garlic-Stick.jpg', 1, ''),
(36, 8, 'Vidhya Nagar', 'Hardikshah@gmail.com', 'Chilly Cheeze', '', '70', NULL, NULL, 1, '~//admin//fast_food_image//img_not_available.jpg', 0, ''),
(37, 8, 'Vidhya Nagar', 'Hardikshah@gmail.com', 'Garlic Bread', '', '75', NULL, NULL, 1, '~//admin//fast_food_image//garlic-bread.jpg', 0, ''),
(38, 9, 'Vidhya Nagar', 'Hardikshah@gmail.com', 'Patty Wrap', '', '65', NULL, NULL, 1, '~//admin//fast_food_image//Patty-Wrap.jpg', 0, ''),
(39, 9, 'Vidhya Nagar', 'Hardikshah@gmail.com', 'Panner Wrap', '', '76', NULL, NULL, 1, '~//admin//fast_food_image//PaneerWrap.jpg', 0, ''),
(40, 9, 'Vidhya Nagar', 'Hardikshah@gmail.com', 'Maxican Wrap', '', '85', NULL, NULL, 1, '~//admin//fast_food_image//MaxicanWrap.jpg', 0, ''),
(41, 9, 'Vidhya Nagar', 'Hardikshah@gmail.com', 'Fushion Fire', '', '94', NULL, NULL, 1, '~//admin//fast_food_image//FusionWrap.jpg', 0, ''),
(42, 10, 'Vidhya Nagar', 'Hardikshah@gmail.com', 'Cheeze Sandwich', '', '60', NULL, NULL, 1, '~//admin//fast_food_image//Cheese-Sandwich.jpg', 0, ''),
(43, 10, 'Vidhya Nagar', 'Hardikshah@gmail.com', 'Veg Cheeze Sndwich', '', '76', '', '', 1, '~//admin//fast_food_image//Veg-Cheese-Sandwich.jpg', 1, ''),
(44, 10, 'Vidhya Nagar', 'Hardikshah@gmail.com', 'Chocolate Sandwich', '', '83', NULL, NULL, 1, '~//admin//fast_food_image//chocolate-sandwich.jpg', 0, ''),
(45, 10, 'Vidhya Nagar', 'Hardikshah@gmail.com', 'Pizza Sandwich', '', '91', NULL, NULL, 1, '~//admin//fast_food_image//PizzaSandwich.jpg', 0, ''),
(46, 10, 'Vidhya Nagar', 'Hardikshah@gmail.com', 'Masala Tikki Sandwich', '', '85', NULL, NULL, 1, '~//admin//fast_food_image//img_not_available.jpg', 0, ''),
(47, 10, 'Vidhya Nagar', 'Hardikshah@gmail.com', 'Panner Masala Grill', '', '85', NULL, NULL, 1, '~//admin//fast_food_image//img_not_available.jpg', 0, ''),
(48, 10, 'Vidhya Nagar', 'Hardikshah@gmail.com', 'Colslow Sandwich', '', '109', NULL, NULL, 1, '~//admin//fast_food_image//ColSlawSandwich.jpg', 0, ''),
(49, 10, 'Vidhya Nagar', 'Hardikshah@gmail.com', 'Chilly Cheeze', '', '65', NULL, NULL, 1, '~//admin//fast_food_image//img_not_available.jpg', 0, ''),
(50, 10, 'Vidhya Nagar', 'Hardikshah@gmail.com', 'Spicy Nuggest ', '', '85', NULL, NULL, 1, '~//admin//fast_food_image//img_not_available.jpg', 0, ''),
(51, 10, 'Vidhya Nagar', 'Hardikshah@gmail.com', 'Bread Butter', '', '39', NULL, NULL, 1, '~//admin//fast_food_image//BreadButter.jpg', 0, ''),
(52, 10, 'Vidhya Nagar', 'Hardikshah@gmail.com', 'Bread Jam', '', '30', NULL, NULL, 1, '~//admin//fast_food_image//BreadJam.jpg', 0, ''),
(53, 11, 'Vidhya Nagar', 'Hardikshah@gmail.com', 'Masala Maggi', '', '49', NULL, NULL, 1, '~//admin//fast_food_image//MasalaMaggi.jpg', 0, ''),
(54, 11, 'Vidhya Nagar', 'Hardikshah@gmail.com', 'Veg Maggi', '', '67', NULL, NULL, 1, '~//admin//fast_food_image//VegMaggi.jpg', 0, ''),
(55, 11, 'Vidhya Nagar', 'Hardikshah@gmail.com', 'Cheeze Maggi', '', '75', NULL, NULL, 1, '~//admin//fast_food_image//CheezeMaggi.jpg', 0, ''),
(56, 11, 'Vidhya Nagar', 'Hardikshah@gmail.com', 'Shezwan Maggi', '', '61', NULL, NULL, 1, '~//admin//fast_food_image//img_not_available.jpg', 0, ''),
(57, 11, 'Vidhya Nagar', 'Hardikshah@gmail.com', 'Cheeze Mayo Maggi', '', '86', NULL, NULL, 1, '~//admin//fast_food_image//img_not_available.jpg', 0, ''),
(58, 12, 'Vidhya Nagar', 'Hardikshah@gmail.com', 'French Fries', '', '51', NULL, NULL, 1, '~//admin//fast_food_image//FrenchFries.jpg', 0, ''),
(59, 12, 'Vidhya Nagar', 'Hardikshah@gmail.com', 'Masala Fries', '', '67', NULL, NULL, 1, '~//admin//fast_food_image//MasalaFrise.jpg', 0, ''),
(60, 12, 'Vidhya Nagar', 'Hardikshah@gmail.com', 'Lord Of Fries', '', '78', NULL, NULL, 1, '~//admin//fast_food_image//FrenchFries.jpg', 0, ''),
(61, 12, 'Vidhya Nagar', 'Hardikshah@gmail.com', 'Pizza Frise', '', '86', NULL, NULL, 1, '~//admin//fast_food_image//PizzaFrise.jpg', 0, ''),
(62, 12, 'Vidhya Nagar', 'Hardikshah@gmail.com', 'Chilly Garlic Bites', '', '61', NULL, NULL, 1, '~//admin//fast_food_image//ChilliGarlicBites.jpg', 0, ''),
(63, 12, 'Vidhya Nagar', 'Hardikshah@gmail.com', 'Tandori Veg Nugest', '', '70', NULL, NULL, 1, '~//admin//fast_food_image//tandoori-veg-nuggets.jpg', 0, ''),
(64, 12, 'Vidhya Nagar', 'Hardikshah@gmail.com', 'Cheeze Pops', '', '105', NULL, NULL, 1, '~//admin//fast_food_image//CheezePops.jpeg', 0, ''),
(65, 12, 'Vidhya Nagar', 'Hardikshah@gmail.com', 'Weges', '', '65', NULL, NULL, 1, '~//admin//fast_food_image//img_not_available.jpg', 0, ''),
(66, 12, 'Vidhya Nagar', 'Hardikshah@gmail.com', 'Spring Roll Cheeze', '', '65', NULL, NULL, 1, '~//admin//fast_food_image//SpringRollCheeze.jpg', 0, ''),
(67, 12, 'Vidhya Nagar', 'Hardikshah@gmail.com', 'Samosha Cheeze', '', '65', NULL, NULL, 1, '~//admin//fast_food_image//SamoshaCheeze.jpg', 0, ''),
(68, 13, 'Vidhya Nagar', 'Hardikshah@gmail.com', 'Vanila', '', '62', NULL, NULL, 1, '~//admin//fast_food_image//Vanila.jpg', 0, ''),
(69, 13, 'Vidhya Nagar', 'Hardikshah@gmail.com', 'Black Current', '', '76', NULL, NULL, 1, '~//admin//fast_food_image//BlackCurrent.jpg', 0, ''),
(70, 13, 'Vidhya Nagar', 'Hardikshah@gmail.com', 'Strawberry', '', '76', NULL, NULL, 1, '~//admin//fast_food_image//StrawberryShake.jpg', 0, ''),
(71, 13, 'Vidhya Nagar', 'Hardikshah@gmail.com', 'Cold Choco', '', '82', NULL, NULL, 1, '~//admin//fast_food_image//ColdCoco.jpg', 0, ''),
(72, 13, 'Vidhya Nagar', 'Hardikshah@gmail.com', 'Kiwi', '', '82', NULL, NULL, 1, '~//admin//fast_food_image//Kiwi.jpg', 0, ''),
(73, 13, 'Vidhya Nagar', 'Hardikshah@gmail.com', 'Butter Schoch', '', '94', NULL, NULL, 1, '~//admin//fast_food_image//ButterSchochShake.jpg', 0, ''),
(74, 13, 'Vidhya Nagar', 'Hardikshah@gmail.com', 'Fings and Honey', '', '94', NULL, NULL, 1, '~//admin//fast_food_image//img_not_available.jpg', 0, ''),
(75, 13, 'Vidhya Nagar', 'Hardikshah@gmail.com', 'American Jelly', '', '82', NULL, NULL, 1, '~//admin//fast_food_image//AmericanJellyShake.jpg', 0, ''),
(76, 13, 'Vidhya Nagar', 'Hardikshah@gmail.com', 'Mango', '', '76', NULL, NULL, 1, '~//admin//fast_food_image//MangoShake.png', 0, ''),
(77, 14, 'Vidhya Nagar', 'Hardikshah@gmail.com', 'Leamon Tea', '', '70', NULL, NULL, 1, '~//admin//fast_food_image//LemonTea.jpg', 0, ''),
(78, 14, 'Vidhya Nagar', 'Hardikshah@gmail.com', 'Peach Ice Tea', '', '63', NULL, NULL, 1, '~//admin//fast_food_image//PichedIceTea.jpg', 0, ''),
(79, 14, 'Vidhya Nagar', 'Hardikshah@gmail.com', 'Hot Tea', '', '25', NULL, NULL, 1, '~//admin//fast_food_image//HotTea.jpg', 0, ''),
(80, 14, 'Vidhya Nagar', 'Hardikshah@gmail.com', 'Green Tea', '', '35', NULL, NULL, 1, '~//admin//fast_food_image//GreenTea.jpg', 0, ''),
(81, 7, 'Vidhya Nagar', 'Hardikshah@gmail.com', 'Indiano Burger', '', '61', NULL, NULL, 1, '~//admin//fast_food_image//img_not_available.jpg', 0, ''),
(82, 12, 'Vidhya Nagar', 'Hardikshah@gmail.com', 'Cold Drink', '', '25', NULL, NULL, 1, '~//admin//fast_food_image//ColdDrink.jpg', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `ff_order_timmings`
--

CREATE TABLE `ff_order_timmings` (
  `time_id` int(11) NOT NULL,
  `start_time` varchar(50) NOT NULL,
  `end_time` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ff_order_timmings`
--

INSERT INTO `ff_order_timmings` (`time_id`, `start_time`, `end_time`) VALUES
(1, '10:30 AM', '08:30 PM');

-- --------------------------------------------------------

--
-- Table structure for table `monthly_order`
--

CREATE TABLE `monthly_order` (
  `order_id` varchar(255) NOT NULL,
  `book_for` varchar(25) NOT NULL,
  `tiffin_id` varchar(255) NOT NULL,
  `pid` varchar(255) NOT NULL,
  `uid` varchar(255) NOT NULL,
  `uname` varchar(255) NOT NULL,
  `ueid` varchar(255) NOT NULL,
  `mobile_no` varchar(255) NOT NULL,
  `delivery_area` varchar(255) NOT NULL,
  `delivery_add` varchar(255) NOT NULL,
  `booking_date` varchar(255) NOT NULL,
  `no_of_days` varchar(255) NOT NULL,
  `start_date` varchar(255) NOT NULL,
  `finish_date` varchar(255) NOT NULL,
  `no_of_roti` varchar(25) NOT NULL,
  `price` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `monthly_order`
--

INSERT INTO `monthly_order` (`order_id`, `book_for`, `tiffin_id`, `pid`, `uid`, `uname`, `ueid`, `mobile_no`, `delivery_area`, `delivery_add`, `booking_date`, `no_of_days`, `start_date`, `finish_date`, `no_of_roti`, `price`) VALUES
('2', 'Lunch', 'MT1', 'darshan77vyas@gmail.com', 'chopragautam1@gmail.com', 'GOUTAM GANNA', 'chopragautam1@gmail.com', '8058706191', 'Titardi', 'MEERA KANTA KE PICHE\nTITARDI', 'Tuesday, March 21, 2017', '30 Days', '22/03/2017', '20/04/2017', '5', '59'),
('3', 'Dinner', 'MT1', 'pragy20patel@gmail.com', 'Garimapandey8804@gmail.com', 'Garima', 'Garimapandey8804@gmail.com', '9723585652', 'Amul Dairy Rd.', 'A-401, amul heights, ganesh chokdi, anand.', 'Wednesday, June 28, 2017', '15 Days', '29/06/2017', '13/07/2017', '5', '59');

-- --------------------------------------------------------

--
-- Table structure for table `monthly_tiffin_menu`
--

CREATE TABLE `monthly_tiffin_menu` (
  `tiffin_id` varchar(255) NOT NULL,
  `no_of_roti` varchar(25) NOT NULL,
  `pid` varchar(255) NOT NULL,
  `p_city` varchar(255) NOT NULL,
  `price` varchar(25) NOT NULL,
  `trial_price` varchar(255) NOT NULL,
  `standard` int(11) NOT NULL,
  `average` int(11) NOT NULL,
  `poor` int(11) NOT NULL,
  `tagline` varchar(255) NOT NULL,
  `recommend` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `monthly_tiffin_menu`
--

INSERT INTO `monthly_tiffin_menu` (`tiffin_id`, `no_of_roti`, `pid`, `p_city`, `price`, `trial_price`, `standard`, `average`, `poor`, `tagline`, `recommend`, `image`) VALUES
('MT1', '5', 'pragy20patel@gmail.com', 'Anand', '59', '65', 1, 1, 1, '', '0', '~//admin//monthly_tiffin_image//2kunchboxcroped.jpg'),
('MT2', '5', 'bijalpatel2121@gmail.com', 'Vidhya Nagar', '59', '65', 1, 1, 1, '', '0', '~//admin//monthly_tiffin_image//2kunchboxcroped.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `order_timmings`
--

CREATE TABLE `order_timmings` (
  `order_for` varchar(255) NOT NULL,
  `time` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order_timmings`
--

INSERT INTO `order_timmings` (`order_for`, `time`) VALUES
('Lunch', '10:00 AM'),
('Dinner', '05:00 PM');

-- --------------------------------------------------------

--
-- Table structure for table `providers`
--

CREATE TABLE `providers` (
  `pid` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `mob_no` varchar(255) NOT NULL,
  `e_id` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `is_fastfood` tinyint(1) NOT NULL,
  `pass` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `providers`
--

INSERT INTO `providers` (`pid`, `name`, `city`, `mob_no`, `e_id`, `address`, `is_fastfood`, `pass`) VALUES
('pragy20patel@gmail.com', 'Pragnesh', 'Anand', '9099322433', 'pragy20patel@gmail.com', 'chikhodra', 0, '28121991'),
('bijalpatel2121@gmail.com', 'pragnesh', 'Vidhya Nagar', '9099322433', 'bijalpatel2121@gmail.com', 'chikhodra', 0, 'bijal'),
('Hardikshah@gmail.com', 'Hardik Shah', 'Vidhya Nagar', '9714854206', 'Hardikshah@gmail.com', 'AvRd. VidhyaNagar', 1, 'hardikshah');

-- --------------------------------------------------------

--
-- Table structure for table `simple_tiffin`
--

CREATE TABLE `simple_tiffin` (
  `t_id` varchar(255) NOT NULL,
  `p_city` varchar(255) NOT NULL,
  `p_id` varchar(255) NOT NULL,
  `p_name` varchar(255) NOT NULL,
  `sabji` varchar(255) NOT NULL,
  `roti` varchar(255) NOT NULL,
  `dal` varchar(255) NOT NULL,
  `chawal` varchar(255) NOT NULL,
  `other` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `standard` int(11) NOT NULL,
  `average` int(11) NOT NULL,
  `poor` int(11) NOT NULL,
  `tagline` varchar(255) NOT NULL,
  `recommend` varchar(255) NOT NULL,
  `st_image` varchar(255) NOT NULL,
  `available` varchar(255) NOT NULL,
  `IsAppHome` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `simple_tiffin`
--

INSERT INTO `simple_tiffin` (`t_id`, `p_city`, `p_id`, `p_name`, `sabji`, `roti`, `dal`, `chawal`, `other`, `price`, `standard`, `average`, `poor`, `tagline`, `recommend`, `st_image`, `available`, `IsAppHome`) VALUES
('ST10', 'Anand', 'pragy20patel@gmail.com', 'Pragnesh', 'Dungri Bataka', 'Regular', 'Kadhi', 'Khichdi', 'Salad', '65', 1, 1, 1, '', '0', '~//admin//simple_tiffin_image//img_not_available.jpg', 'Order Now', 0),
('ST3', 'Anand', 'pragy20patel@gmail.com', 'Pragnesh', 'Chori Ringan', 'Regular', 'Kadhi', 'Chawal', 'Pickle', '65', 1, 1, 1, '', '0', '~//admin//simple_tiffin_image//img_not_available.jpg', 'Order Now', 0),
('St4', 'Anand', 'pragy20patel@gmail.com', 'Pragnesh', 'Kobiz Bataka', 'Regular', 'Kadhi', 'Khichdi', 'Pickle', '65', 1, 1, 1, '', '0', '~//admin//simple_tiffin_image//img_not_available.jpg', 'Order Now', 0),
('ST2', 'Anand', 'pragy20patel@gmail.com', 'Pragnesh', 'Bhinda Bataka', 'Regular', 'Dal', 'Chawal', 'Salad', '65', 1, 1, 1, '', '0', '~//admin//simple_tiffin_image//img_not_available.jpg', 'Order Now', 0),
('ST7', 'Anand', 'pragy20patel@gmail.com', 'Pragnesh', 'Giloda Bataka', 'Regular', 'Kadhi', 'Chawal', 'Salad', '65', 1, 1, 1, '', '0', '~//admin//simple_tiffin_image//img_not_available.jpg', 'Order Now', 0),
('ST9', 'Anand', 'pragy20patel@gmail.com', 'Pragnesh', 'Flawar Vatana', 'Regular', 'Dal', 'Chawal', 'Salad', '65', 1, 1, 1, '', '0', '~//admin//simple_tiffin_image//img_not_available.jpg', 'Order Now', 0),
('ST12', 'Vidhya Nagar', 'bijalpatel2121@gmail.com', 'pragnesh', 'Bhinda Bataka', 'Regular', 'Dal', 'Chawal', 'Salad', '65', 1, 1, 1, '', '0', '~//admin//simple_tiffin_image//img_not_available.jpg', 'Order Now', 0),
('ST13', 'Vidhya Nagar', 'bijalpatel2121@gmail.com', 'pragnesh', 'Chori Ringan', 'Regular', 'Kadhi', 'Chawal', 'Salad', '65', 1, 1, 1, '', '0', '~//admin//simple_tiffin_image//img_not_available.jpg', 'Order Now', 0),
('ST14', 'Vidhya Nagar', 'bijalpatel2121@gmail.com', 'pragnesh', 'Kobiz Bataka', 'Regular', 'Kadhi', 'Khichdi', 'Salad', '65', 1, 1, 1, '', '0', '~//admin//simple_tiffin_image//img_not_available.jpg', 'Order Now', 0),
('ST22', 'Vidhya Nagar', 'bijalpatel2121@gmail.com', 'pragnesh', '', '', 'Kadhi OR Chas', 'Vagareli Khichdi', 'Salad', '40', 1, 1, 1, '', '0', '~//admin//simple_tiffin_image//khichdi-kadhi2.jpg', 'Order Now', 0),
('ST17', 'Vidhya Nagar', 'bijalpatel2121@gmail.com', 'pragnesh', 'Giloda Bataka', 'Regular', 'Kadhi', 'Chawal', 'Salad', '65', 1, 1, 1, '', '0', '~//admin//simple_tiffin_image//img_not_available.jpg', 'Order Now', 0),
('ST21', 'Anand', 'pragy20patel@gmail.com', 'Pragnesh', '', '', 'Kadhi OR Chas', 'Vagareli Khichdi', 'Salad', '40', 1, 1, 1, '', '0', '~//admin//simple_tiffin_image//khichdi-kadhi2.jpg', 'Order Now', 1),
('ST19', 'Vidhya Nagar', 'bijalpatel2121@gmail.com', 'pragnesh', 'Flawar Vatana', 'Regular', 'Dal', 'Chawal', 'Salad', '65', 1, 1, 1, '', '0', '~//admin//simple_tiffin_image//img_not_available.jpg', 'Order Now', 0),
('ST20', 'Vidhya Nagar', 'bijalpatel2121@gmail.com', 'pragnesh', 'Dungri Bataka', 'Regular', 'Kadhi', 'Khichdi', 'Salad', '65', 1, 1, 1, '', '0', '~//admin//simple_tiffin_image//img_not_available.jpg', 'Order Now', 0);

-- --------------------------------------------------------

--
-- Table structure for table `simple_tiffin_daily_order`
--

CREATE TABLE `simple_tiffin_daily_order` (
  `order_id` int(11) NOT NULL,
  `book_for` varchar(255) NOT NULL,
  `tid` varchar(255) NOT NULL,
  `pid` varchar(255) NOT NULL,
  `uid` varchar(255) NOT NULL,
  `uname` varchar(255) NOT NULL,
  `ueid` varchar(255) NOT NULL,
  `time` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  `umob_no` varchar(255) NOT NULL,
  `delivery_area` varchar(255) NOT NULL,
  `uadd` varchar(255) NOT NULL,
  `sabji` varchar(255) NOT NULL,
  `roti` varchar(255) NOT NULL,
  `dal` varchar(255) NOT NULL,
  `chawal` varchar(255) NOT NULL,
  `other` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `st_image` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `simple_tiffin_daily_order`
--

INSERT INTO `simple_tiffin_daily_order` (`order_id`, `book_for`, `tid`, `pid`, `uid`, `uname`, `ueid`, `time`, `date`, `umob_no`, `delivery_area`, `uadd`, `sabji`, `roti`, `dal`, `chawal`, `other`, `price`, `st_image`, `status`) VALUES
(1, 'Dinner', 'ST6', 'darshan77vyas@gmail.com', 'Kdolly486@gmail.com', 'Dolly verma', 'Kdolly486@gmail.com', '10:00:04 AM', 'Saturday, January 21, 2017', '9024196593', 'Sector-3,4,5,6,7,9', '1 p-39,gayatri nagar sector -5,near satellite hospital,udaipur rajasthan', 'Aalu Gobi', 'Regular', 'Dal', 'Chawal', 'Salad', '69', '~//admin//simple_tiffin_image//img_not_available.jpg', 'Delivered'),
(2, 'Lunch', 'ST1', 'darshan77vyas@gmail.com', 'pkunal22@gmail.com', 'Kunal Patel', 'pkunal22@gmail.com', '9:29:39 AM', 'Thursday, February 16, 2017', '8875296256', 'Science college', 'anand', 'Gobi Matar', 'Regular', 'Dal', 'Chawal', 'Salad', '69', '~//admin//simple_tiffin_image//flawaermatar_bhat_kadi.JPG', 'Not Delivered'),
(3, 'Lunch', 'ST8', 'chiragjain10586@gmail.com', 'vipintripathi73@gmail.com', 'vipin bhai', 'vipintripathi73@gmail.com', '8:17:05 AM', 'Friday, March 17, 2017', '8619060862', 'Sector-3,4,5,6,7,9', 'flat no. 104,mangalmurti plaza,Nh 8,eklingpura,udaipur', 'Any Sabzi', 'Regular', 'Dal or Kadi', 'Chawal', 'Salad', '69', '~//admin//simple_tiffin_image//flawaermatar_bhat_kadi.JPG', 'Not Delivered'),
(4, 'Lunch', 'ST8', 'chiragjain10586@gmail.com', 'vipintripathi73@gmail.com', 'vipin bhai', 'vipintripathi73@gmail.com', '8:18:46 AM', 'Friday, March 17, 2017', '8619060862', 'Sector-3,4,5,6,7,9', 'flat no. 104,mangalmurti plaza,Nh 8,eklingpura,udaipur', 'Any Sabzi', 'Regular', 'Dal or Kadi', 'Chawal', 'Salad', '69', '~//admin//simple_tiffin_image//flawaermatar_bhat_kadi.JPG', 'Not Delivered'),
(5, 'Lunch', 'ST8', 'chiragjain10586@gmail.com', 'heenashahani@gmail.com', 'heena shahani ', 'heenashahani@gmail.com', '8:18:26 AM', 'Tuesday, March 21, 2017', '8952017356', 'Udiapole', '31 B,sarw ritu vilas, near gulab bagh,Jain mandir ke paas wali road,udaipur', 'Any Sabzi', 'Regular', 'Dal or Kadi', 'Chawal', 'Salad', '69', '~//admin//simple_tiffin_image//flawaermatar_bhat_kadi.JPG', 'Not Delivered'),
(6, 'Dinner', 'ST8', 'chiragjain10586@gmail.com', 'heenashahani@gmail.com', 'heena shahani ', 'heenashahani@gmail.com', '8:19:21 AM', 'Tuesday, March 21, 2017', '8952017356', 'Savina', '31 B,sarw ritu vilas, near gulab bagh,Jain mandir ke paas wali road,udaipur', 'Any Sabzi', 'Regular', 'Dal or Kadi', 'Chawal', 'Salad', '69', '~//admin//simple_tiffin_image//flawaermatar_bhat_kadi.JPG', 'Not Delivered'),
(7, 'Dinner', 'ST7', 'darshan77vyas@gmail.com', 'Shine.piyush@gmail.com', 'Piyush Baiswar', 'Shine.piyush@gmail.com', '3:02:27 PM', 'Saturday, May 6, 2017', '9530405501', 'sector-11', 'House no 200, sector 11, udaipur, near alok sansthan and jain departmental store', 'Aalu Matar', 'Regular', 'Dal', 'Chawal', 'Salad', '69', '~//admin//simple_tiffin_image//alumatar_bhat_kadi.JPG', 'Not Delivered'),
(8, 'Dinner', 'ST3', 'pragy20patel@gmail.com', 'pkunal22@gmail.com', 'Kunal Patel', 'pkunal22@gmail.com', '10:03:02 AM', 'Saturday, June 3, 2017', '8875296256', 'Gamdi Vad', 'anand', 'Chori Ringan', 'Regular', 'Kadhi', 'Chawal', 'Pickle', '65', '~//admin//simple_tiffin_image//img_not_available.jpg', 'Not Delivered'),
(9, 'Lunch', 'ST10', 'pragy20patel@gmail.com', 'dhruvstar1009@gmail.com', 'Dhruv', 'dhruvstar1009@gmail.com', '9:41:40 AM', 'Thursday, June 15, 2017', '9978440020', 'New Bus-stand', '201,Second Floor, Orangepole Building, Massivesoftech LTD, Near Patcone House and Siddhivinayak Mandir, 80ffet Road, Anand.', 'Dungri Bataka', 'Regular', 'Kadhi', 'Khichdi', 'Salad', '65', '~//admin//simple_tiffin_image//img_not_available.jpg', 'Not Delivered'),
(10, 'Dinner', 'ST14', 'bijalpatel2121@gmail.com', 'elejaybhavsar@gmail.com', 'Jay Bhavsar', 'elejaybhavsar@gmail.com', '1:45:46 PM', 'Sunday, August 20, 2017', '9426113837', 'Bakrol Rd.', '301,White Hart  Boys Residency,B/H GCET library,bakrol road,V.V. nagar', 'Kobiz Bataka', 'Regular', 'Kadhi', 'Khichdi', 'Salad', '65', '~//admin//simple_tiffin_image//img_not_available.jpg', 'Not Delivered'),
(11, 'Dinner', 'ST19', 'bijalpatel2121@gmail.com', 'sagarnathani1995@gmail.com', 'Sagar Nathani', 'sagarnathani1995@gmail.com', '3:40:59 PM', 'Sunday, September 17, 2017', '9033750373', 'Iskon Tempale', 'room no 401,prajapati boys hostel,\nbeside man-mandir girls hostel,\niskon road, v.v nagar', 'Flawar Vatana', 'Regular', 'Dal', 'Chawal', 'Salad', '65', '~//admin//simple_tiffin_image//img_not_available.jpg', 'Not Delivered'),
(12, 'Dinner', 'ST12', 'bijalpatel2121@gmail.com', 'vasupatel0611@gmail.com', 'Vasu patel', 'vasupatel0611@gmail.com', '2:21:42 PM', 'Monday, September 18, 2017', '8849952939', 'Mota Bazar', 'Bhagwati niwas, beside kotak bank, mota bazar, Vallabh Vidhyanagar ', 'Bhinda Bataka', 'Regular', 'Dal', 'Chawal', 'Salad', '65', '~//admin//simple_tiffin_image//img_not_available.jpg', 'Not Delivered'),
(13, 'Dinner', 'ST14', 'bijalpatel2121@gmail.com', 'vasupatel0611@gmail.com ', 'Vasu patel', 'vasupatel0611@gmail.com', '1:13:56 PM', 'Tuesday, September 19, 2017', '8849952939', 'Mota Bazar', 'Bhagwati niwas, beside kotak bank, mota bazar. Vallabh Vidhyanagar ', 'Kobiz Bataka', 'Regular', 'Kadhi', 'Khichdi', 'Salad', '65', '~//admin//simple_tiffin_image//img_not_available.jpg', 'Not Delivered'),
(14, 'Dinner', 'ST20', 'bijalpatel2121@gmail.com', 'elejaybhavsar@gmail.com', 'Jay Bhavsar', 'elejaybhavsar@gmail.com', '16:17:57', '30 October 2017', '9426113837', 'Bakrol Rd.', '301,white hart,b/h GCET library,bakrol road vvnagar-388120', 'Dungri Bataka', 'Regular', 'Kadhi', 'Khichdi', 'Salad', '65', '~//admin//simple_tiffin_image//img_not_available.jpg', 'Not Delivered');

-- --------------------------------------------------------

--
-- Table structure for table `specialtiffin`
--

CREATE TABLE `specialtiffin` (
  `TiffinId` int(11) NOT NULL,
  `ProviderId` varchar(255) NOT NULL,
  `ProviderCity` varchar(255) NOT NULL,
  `TiffinName` varchar(255) NOT NULL,
  `Description` longtext NOT NULL,
  `Price` varchar(255) NOT NULL,
  `StartTime` varchar(255) NOT NULL,
  `EndTime` varchar(255) NOT NULL,
  `IsAvailable` tinyint(1) NOT NULL,
  `IsAppHome` tinyint(1) NOT NULL,
  `Image` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `specialtiffin`
--

INSERT INTO `specialtiffin` (`TiffinId`, `ProviderId`, `ProviderCity`, `TiffinName`, `Description`, `Price`, `StartTime`, `EndTime`, `IsAvailable`, `IsAppHome`, `Image`) VALUES
(1, 'pragy20patel@gmail.com', 'Anand', 'Chole', '2 box Chole and 3 pice Bhature', '50', '10:00 AM', '11:00 PM', 1, 1, '~//admin//special_tiffin_image//chole-bhature-cover.jpg'),
(2, 'pragy20patel@gmail.com', 'Anand', 'Pav Bhaji', '1 plate bhaji and 2 pice pav', '70', '10:00 AM', '11:00 PM', 1, 1, '~//admin//special_tiffin_image//pav.bhaji.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `specialtiffinorder`
--

CREATE TABLE `specialtiffinorder` (
  `OrderId` int(11) NOT NULL,
  `UserId` varchar(255) NOT NULL,
  `TiffinId` varchar(255) NOT NULL,
  `DelCity` varchar(255) NOT NULL,
  `DelArea` varchar(255) NOT NULL,
  `DelAddress` varchar(255) NOT NULL,
  `BookDate` varchar(255) NOT NULL,
  `BookTime` varchar(255) NOT NULL,
  `IsRead` tinyint(1) NOT NULL,
  `IsDelivered` tinyint(1) NOT NULL,
  `IsCancelled` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `specialtiffinorder`
--

INSERT INTO `specialtiffinorder` (`OrderId`, `UserId`, `TiffinId`, `DelCity`, `DelArea`, `DelAddress`, `BookDate`, `BookTime`, `IsRead`, `IsDelivered`, `IsCancelled`) VALUES
(1, 'pkunal22@gmail.com', '1', 'Anand', 'Chopato', 'Three gates,Chiman Street,chikhodra,anand', '21 October 2017', '14:57:34', 0, 0, 0),
(2, 'pkunal22@gmail.com', '2', 'Anand', 'Chopato', 'Three gates,Chiman sheth Street,chikhodra,anand', '22 October 2017', '10:08:42', 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tiffin_with_sweet`
--

CREATE TABLE `tiffin_with_sweet` (
  `t_id` varchar(255) NOT NULL,
  `p_city` varchar(255) NOT NULL,
  `p_id` varchar(255) NOT NULL,
  `p_name` varchar(255) NOT NULL,
  `sabji` varchar(255) NOT NULL,
  `roti` varchar(255) NOT NULL,
  `dal` varchar(255) NOT NULL,
  `chawal` varchar(255) NOT NULL,
  `sweet` varchar(255) NOT NULL,
  `other` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `standard` int(11) NOT NULL,
  `average` int(11) NOT NULL,
  `poor` int(11) NOT NULL,
  `tagline` varchar(255) NOT NULL,
  `recommend` varchar(255) NOT NULL,
  `tws_image` varchar(255) NOT NULL,
  `available` varchar(255) NOT NULL,
  `IsAppHome` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tiffin_with_sweet`
--

INSERT INTO `tiffin_with_sweet` (`t_id`, `p_city`, `p_id`, `p_name`, `sabji`, `roti`, `dal`, `chawal`, `sweet`, `other`, `price`, `standard`, `average`, `poor`, `tagline`, `recommend`, `tws_image`, `available`, `IsAppHome`) VALUES
('TWS5', 'Anand', 'pragy20patel@gmail.com', 'Pragnesh', 'Flawar Vatana', 'Regular', 'Dal', 'Chawal', 'Gulab Jamun', 'Salad', '75', 1, 1, 1, '', '0', '~//admin//tiffin_with_sweet_image//img_not_available.jpg', 'Order Now', 1),
('TWS7', 'Vidhya Nagar', 'bijalpatel2121@gmail.com', 'pragnesh', 'Bhinda Bataka', 'Regular', 'Dal', 'Chawal', 'Gulab Jamun', 'Salad', '75', 1, 1, 1, '', '0', '~//admin//tiffin_with_sweet_image//img_not_available.jpg', 'Order Now', 1),
('TWS2', 'Anand', 'pragy20patel@gmail.com', 'Pragnesh', 'Bhinda Bataka', 'Regular', 'Dal', 'Chawal', 'Gulab Jamun', 'Salad', '75', 1, 1, 1, '', '0', '~//admin//tiffin_with_sweet_image//img_not_available.jpg', 'Order Now', 0),
('TWS10', 'Vidhya Nagar', 'bijalpatel2121@gmail.com', 'pragnesh', 'Flawar Vatana', 'Regular', 'Dal', 'Chawal', 'Gulab Jamun', 'Salad', '75', 1, 1, 1, '', '0', '~//admin//tiffin_with_sweet_image//img_not_available.jpg', 'Order Now', 0),
('TWS11', 'Anand', 'pragy20patel@gmail.com', 'Pragnesh', 'Bhinda Bataka', 'Regular', 'Dal', 'Chawal', 'Keri no Ras', 'Salad', '75', 1, 1, 1, '', '0', '~//admin//tiffin_with_sweet_image//IMG-20170202-WA0012.jpg', 'Order Now', 0),
('TWS12', 'Vidhya Nagar', 'bijalpatel2121@gmail.com', 'pragnesh', 'Bhinda Bataka', 'Regular', 'Dal', 'Chawal', 'Keri no Ras', 'Salad', '75', 1, 1, 1, '', '0', '~//admin//tiffin_with_sweet_image//IMG-20170202-WA0011.jpg', 'Order Now', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tiffin_with_sweet_daily_order`
--

CREATE TABLE `tiffin_with_sweet_daily_order` (
  `order_id` int(11) NOT NULL,
  `book_for` varchar(255) NOT NULL,
  `tid` varchar(255) NOT NULL,
  `pid` varchar(255) NOT NULL,
  `uid` varchar(255) NOT NULL,
  `uname` varchar(255) NOT NULL,
  `ueid` varchar(255) NOT NULL,
  `time` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  `umob_no` varchar(255) NOT NULL,
  `delivery_area` varchar(255) NOT NULL,
  `uadd` varchar(255) NOT NULL,
  `sabji` varchar(255) NOT NULL,
  `roti` varchar(255) NOT NULL,
  `dal` varchar(255) NOT NULL,
  `chawal` varchar(255) NOT NULL,
  `sweet` varchar(255) NOT NULL,
  `other` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `tws_image` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tiffin_with_sweet_daily_order`
--

INSERT INTO `tiffin_with_sweet_daily_order` (`order_id`, `book_for`, `tid`, `pid`, `uid`, `uname`, `ueid`, `time`, `date`, `umob_no`, `delivery_area`, `uadd`, `sabji`, `roti`, `dal`, `chawal`, `sweet`, `other`, `price`, `tws_image`, `status`) VALUES
(1, 'Dinner', 'TWS7', 'darshan77vyas@gmail.com', 'adarsh9799@gmail.com', 'adarsh patel', 'adarsh9799@gmail.com', '9:16:23 AM', 'Sunday, January 22, 2017', '9998813806', 'Savina', 'p-39,tekri,udaipur,rajasthan', 'Gobi Matar', 'Regular', 'Dal', 'Chawal', 'Gulab jamun', 'Salad', '75', '~//admin//tiffin_with_sweet_image//img_not_available.jpg', 'Delivered'),
(2, 'Dinner', 'TWS7', 'bijalpatel2121@gmail.com', 'Nikhilpatel54321@yahoo.com', 'Nikhil', 'Nikhilpatel54321@yahoo.com', '12:06:41 PM', 'Saturday, July 15, 2017', '7874829029', 'Bakrol Rd.', 'Triveni Vishwa society 57, vadtal road, near Zen school, vallabh vidhyanagar', 'Bhinda Bataka', 'Regular', 'Dal', 'Chawal', 'Gulab Jamun', 'Salad', '75', '~//admin//tiffin_with_sweet_image//img_not_available.jpg', 'Delivered');

-- --------------------------------------------------------

--
-- Table structure for table `trial_tiffin_order`
--

CREATE TABLE `trial_tiffin_order` (
  `order_id` int(11) NOT NULL,
  `book_for` varchar(255) NOT NULL,
  `tid` varchar(255) NOT NULL,
  `pid` varchar(255) NOT NULL,
  `uid` varchar(255) NOT NULL,
  `uname` varchar(255) NOT NULL,
  `ueid` varchar(255) NOT NULL,
  `time` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  `umob_no` varchar(255) NOT NULL,
  `delivery_area` varchar(255) NOT NULL,
  `uadd` varchar(255) NOT NULL,
  `no_of_roti` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `tiffin_image` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trial_tiffin_order`
--

INSERT INTO `trial_tiffin_order` (`order_id`, `book_for`, `tid`, `pid`, `uid`, `uname`, `ueid`, `time`, `date`, `umob_no`, `delivery_area`, `uadd`, `no_of_roti`, `price`, `tiffin_image`, `status`) VALUES
(1, 'Dinner', 'MT1', 'chiragjain10586@gmail.com', 'pkunal22@gmail.com', 'Kunal Patel', 'pkunal22@gmail.com', '14:22:55', '13 March 2017', '8875296256', 'Suraj Pole', 'anand', '5', '69', '~//admin//monthly_tiffin_image//papdi_khichdi.JPG', 'Delivered'),
(2, 'Lunch', 'MT1', 'chiragjain10586@gmail.com', 'jitu_patel1978@yahoo.co.in', 'jitu patel', 'jitu_patel1978@yahoo.co.in', '8:18:47 AM', 'Saturday, April 1, 2017', '8488813033', 'sector-11', '12,sugan amba,govindpura road,hiranmagri,sector-13,udaipur', '5', '69', '~//admin//monthly_tiffin_image//papdi_khichdi.JPG', 'Not Delivered'),
(3, 'Dinner', 'MT2', 'bijalpatel2121@gmail.com', 'deepakrajksoni@gmail.com', 'Deepak Kumar Soni', 'deepakrajksoni@gmail.com', '2:08:07 PM', 'Monday, August 21, 2017', '8239524994', 'AksharFarm Rd.', 'Udaipur me Dena hai', '5', '65', '~//admin//monthly_tiffin_image//2kunchboxcroped.jpg', 'Not Delivered');

-- --------------------------------------------------------

--
-- Table structure for table `user_accounts`
--

CREATE TABLE `user_accounts` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `mob_no` varchar(255) NOT NULL,
  `eid` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `DeviceToken` longtext
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_accounts`
--

INSERT INTO `user_accounts` (`id`, `name`, `address`, `mob_no`, `eid`, `pass`, `status`, `DeviceToken`) VALUES
('pkunal22@gmail.com', 'Kunal Patel', 'Three gates,Chiman sheth Street,chikhodra,anand', '8875296256', 'pkunal22@gmail.com', '2181995', 'Allowed', 'fFI-q0kRN5Q:APA91bHPov0LqukuLEt3rZpUhTmGYiHQq9PQQqNn8MrG2JPGRxhHUce9M8XmXZ5LUtCsEY03SiBthfhzUwEVZCd3XESiwRvGclJeOOP1DoTs3T0cNJhuxVElQyi74PjI02iwP2QwiKcU'),
('Ajayjoshi996@gmail.com', 'Ajay joshi', 'Sec 4 udaipur', '9784220049', 'Ajayjoshi996@gmail.com', 'ajay123', 'Allowed', NULL),
('zainabmushtaqwani@gmail.com', 'zainab', 'shanti vihar girls hostel ss college of engineering umarda,udaipur,rajasthan.', '8302162717', 'zainabmushtaqwani@gmail.com', 'zainab', 'Allowed', NULL),
('Itskhushboomantri@gmail.com', 'Khushboo', 'Umrada,udaipur', '9829725151', 'Itskhushboomantri@gmail.com', '11111', 'Allowed', NULL),
('vpsrathore62@gmail.com', 'veerendra singh', 'Near titanium coaching centre, Thokar choraha , udaipur', '9660352433', 'vpsrathore62@gmail.com', '9772987476', 'Allowed', NULL),
('adarsh9799@gmail.com', 'adarsh patel', 'Shree shntipuram hostel a  ss college of engineering umarda udaipur.', '9998813806', 'adarsh9799@gmail.com', 'adarsh1234', 'Allowed', NULL),
('Kdolly486@gmail.com', 'Dolly verma', '1 p-39,gayatri nagar sector -5,near satellite hospital,udaipur rajasthan', '9024196593', 'Kdolly486@gmail.com', 'JAANILOVEUALOT', 'Allowed', NULL),
('ps1995.ps@gmail.com', 'praveen', 'soni', '8003630434', 'ps1995.ps@gmail.com', 'neenee', 'Allowed', NULL),
('dravid.bansal@gmail.com', 'Dravid Bansal', '2 ch 32 shanti nagar sector 5 corner of Shishu bharti sen sec school hiran magri ', '9314088966', 'dravid.bansal@gmail.com', 'dravid1', 'Allowed', NULL),
('dineshmsachdev1985@gmail.com', 'Dinesh', 'Shakti nagar colony', '8291604713', 'dineshmsachdev1985@gmail.com', 'dinesh143', 'Allowed', NULL),
('niksart124@gmail.com', 'nikunj boghani', 'Opp:indian oil petrol pump, sector 4, hiran magri, udaipur', '9662222124', 'niksart124@gmail.com', 'Nopasscode1', 'Allowed', NULL),
('hemant.kalal2308@gmail.com', 'Hemant Kalal', 'Sector 6', '8561055466', 'hemant.kalal2308@gmail.com', '212927him', 'Allowed', NULL),
('ashutoshtathagat@hotmail.com', 'Ashutosh Misra', 'E 45,road No3,Essar Steel India Ltd.', '9671777739', 'ashutoshtathagat@hotmail.com', 'naman05012017', 'Allowed', NULL),
('raj551030@gmail.com', 'raj', 's s college or engineering udaipur Rajasthan.', '8302311766', 'raj551030@gmail.com', '551030', 'Allowed', NULL),
('umarmukhtar583@gmail.com', 'umar', 'Umarda udaipur', '8290313597', 'umarmukhtar583@gmail.com', 'umar1234', 'Allowed', NULL),
('lovesalaria13@gmail.com', 'love salaria', 'ss college of eng', '8003242782', 'lovesalaria13@gmail.com', 'love', 'Allowed', NULL),
('madhukarprashant@gmail.com', 'prashant', 'ss colege of engg', '7688964118', 'madhukarprashant@gmail.com', 'prashant', 'Allowed', NULL),
('bhata202@gmail.com', 'gowhar khan', 'ss college of engineering', '8003711527', 'bhata202@gmail.com', 'gowharkhan', 'Allowed', NULL),
('Kavya.bairwa143@gmail.com', 'Kavya bairwa', '100ft road near vraju villa hotel Udaipur ', '7014906556', 'Kavya.bairwa143@gmail.com', 'kavya123', 'Allowed', NULL),
('vipintripathi73@gmail.com', 'vipin bhai', 'flat no-104,mangal murti plaza,NH 8\neklingpura,udaipur', '8619060862', 'vipintripathi73@gmail.com', 'vipintripathi', 'Allowed', NULL),
('bistms@yahoo.com', 'Mannu', '85, Sanjay Gandhi Nagar, Sector 8, Hiran Magri, Udaipur, Rajasthan-313002', '9414290291', 'bistms@yahoo.com', 'm31m22v21', 'Allowed', NULL),
('shohelhussain1995@gmail.com', 'shohel', 'sector-9 VIP colony\nblock-A \nnear by sheetal park', '8005681656', 'shohelhussain1995@gmail.com', 'pass1234', 'Allowed', NULL),
('heenashahani@gmail.com', 'heena shahani ', '31 B,sarw ritu vilas, near gulab bagh,Jain mandir ke paas wali road,udaipur', '8952017356', 'heenashahani@gmail.com', 'heena', 'Allowed', NULL),
('chopragautam1@gmail.com', 'GOUTAM GANNA', 'TITARDI\nMEERA KANTA KE PICHE', '8058706191', 'chopragautam1@gmail.com', 'GOUTAMGANNA', 'Allowed', NULL),
('asdf123@gmail.com', 'shohel', 'naya mohalla', '1234567890', 'asdf123@gmail.com', 'pass12345', 'Allowed', NULL),
('jitu_patel1978@yahoo.co.in', 'jitu patel', '12,sugan amba,govindpura road,hiranmagri,sector-13,udaipur', '8488813033', 'jitu_patel1978@yahoo.co.in', 'jitupatel', 'Allowed', NULL),
('Shine.piyush@gmail.com', 'Piyush Baiswar', 'House no. 200, sector-11, udaipur near alok sansthan and jain departmental store', '9530405501', 'Shine.piyush@gmail.com', 'assassin', 'Allowed', NULL),
('Pragy20patel@gmail.com ', 'Pragnesh Patel ', 'Three gate, chiman Sheth street \nAt &  Po- Chikhodra \nTable &  Di- Anand. ', '9099322433', 'Pragy20patel@gmail.com ', 'pragy28121991', 'Allowed', ''),
('wardie2882@outlook.com', 'Devul Thakkar', '1-suryavilla,vinu kaka marg, bakrol road,Anand,Gujarat,India.', '9727151021', 'wardie2882@outlook.com', 'Wardiekings82', 'Allowed', NULL),
('lav.soni@gmail.com', 'lav soni', '09, paras bunglows, 80 foot road, near bhakti avanue, anand,  388001', '9428160849', 'lav.soni@gmail.com', 'lav19851985', 'Allowed', NULL),
('kishanpatel062@gmail.com', 'Shekhda kishan mansukhbhai', 'D7,  vidhyavihar society,  near abhilasha circle,  new sama road,  Vadodara', '9722125627', 'kishanpatel062@gmail.com', 'kishan85112', 'Allowed', NULL),
('priyank8608@gmail.com', 'Priyank Patel', 'Sardar chowk\nVaherai Mata Road', '9427946148', 'priyank8608@gmail.com', 'hiral1387', 'Allowed', NULL),
('Muneera_Coachella@yahoo.in', 'A s kachwala', 'Garden soc\nb/h madni park\nNr water tank \nAnand', '9825252385', 'Muneera_Coachella@yahoo.in', 'ask4tiffin', 'Allowed', NULL),
('Kishan9927@gmail.com', 'Kishan Thakor', 'G-13, The luggage Factory, Sanket Complex, Grid Chowkdi, Anand', '8460831596', 'Kishan9927@gmail.com', 'kishan112', 'Allowed', NULL),
('dhruvstar1009@gmail.com', 'Dhruv', '201,Second Floor, Orangepole Building, Massivesoftech LTD, Near Patcone House and Siddhivinayak Mandir, 80ffet Road, Anand.', '9978440020', 'dhruvstar1009@gmail.com', 'Crunch1', 'Allowed', NULL),
('jbrijesh97@gmail.com', 'Joshi brijesh', 'L-8,lotus complex,next to rk cycle store,mota bajar,anand vidhyanagar', '7600020085', 'jbrijesh97@gmail.com', 'ziper007', 'Allowed', NULL),
('Pateljanu129@yahoo.com', 'Keyur patel', '8 Anand bag society ganesh crossing anand', '7041541260', 'Pateljanu129@yahoo.com', 'keyur1087', 'Allowed', NULL),
('aniranu1984@gmail.com', 'Anirudha Singh', '3, Ambee Bunglows, Nr. Tulip Bunglows, Behind Jogni Mata Mandir, Lambhel Road, Anand.', '9328113261', 'aniranu1984@gmail.com', 'lovesaku', 'Allowed', NULL),
('cmamohsinali@gmail.com', 'Mohsinali Momin', 'GMM Pfaudler Limited,\nAnand Sojitra Road, Karamsad', '8866111824', 'cmamohsinali@gmail.com', '9712809440', 'Allowed', NULL),
('patelutam92@gmail.com', 'uttam patel', 'No. 8 divarkar apartment\nIscon temple near\nVvngr anand\n', '9558142603', 'patelutam92@gmail.com', '9558142603', 'Allowed', NULL),
('Rahulshah111@yahoo.com', 'Rahul', 'Surya Nagar.dakor', '9879726867', 'Rahulshah111@yahoo.com', 'sunfeast23', 'Allowed', NULL),
('Garimapandey8804@gmail.com', 'Garima', 'A-401 amul heights,ganesh chokdi, anand', '9723585652', 'Garimapandey8804@gmail.com', 'garima7794', 'Allowed', NULL),
('manavc9@icloud.com', 'manav chauhan', '206,rughuveer chambers,university circle, vallabh vidhyanagar', '9978366377', 'manavc9@icloud.com', 'kutti9dabba', 'Allowed', NULL),
('skm2051@yahoo.com', 'Sandeep Krishnagopal Maheshwari', '15,Laxmi Park,Maniya-ni-khad,B/h Gopi cinema,Anand', '8460711375', 'skm2051@yahoo.com', 'Sandeep2051', 'Allowed', NULL),
('sagar.gotu100@gmail.com', 'Sagar', 'A-206 raghuvir Cambers,\nUniversity Circle', '7405501193', 'sagar.gotu100@gmail.com', 'Sagargotu100', 'Allowed', NULL),
('Sagardarji@gmail.com', 'Sagar', 'A/6 urmi society\nRto office \nAnand', '9409239799', 'Sagardarji@gmail.com', 'Sagar123', 'Allowed', NULL),
('Nikhilpatel54321@yahoo.com', 'Nikhil', 'Triveni Vishwa society 57, vadtal road, before Zen school, OPP service force , \nVallabh vidhyanagar\n', '7874829029', 'Nikhilpatel54321@yahoo.com', '9825852126', 'Allowed', NULL),
('just4gaurav9@yahoo.com', 'Gaurav parekh', 'B/4,Ambakrupa,chaitanya vrund part 2,b/h axar farm, gopi vidhyanagar road anand. ', '9558656957', 'just4gaurav9@yahoo.com', '8155004453', 'Allowed', NULL),
('vikramrathore66223@gmail.com', 'Vikram Singh Rathore', '201, Burfani manzil Chatak road hathipole 313001\nudaipur (raj.0)', '8824398932', 'vikramrathore66223@gmail.com', 'vikram123', 'Allowed', NULL),
('elejaybhavsar@gmail.com', 'Jay Bhavsar', '301,white hart boys residency,b/h Gcet  library,bakrol road,v.v. nagar', '9426113837', 'elejaybhavsar@gmail.com', 'jay7535', 'Allowed', NULL),
('Ershefali13@gmail.com', 'Shefali', 'B8, kaira can, Anand', '9904806576', 'Ershefali13@gmail.com', '123456', 'Allowed', NULL),
('jezu383@gmail.com', 'jernaz dastur', 'B308 viral plaza nr dominos motabazar vallabhvidhyanagar', '8460631721', 'jezu383@gmail.com', '1234567', 'Allowed', NULL),
('Hardik_hany82@yahoo.com', 'HARDIK SUTHAR', '28-sahajanand Society,\nOpp.Motikaka ni chawl,\nAnand-v.v.nagar road,\nAnand', '9724972240', 'Hardik_hany82@yahoo.com', 'swatilove', 'Allowed', NULL),
('thakertarak@yahoo.in', 'Tarak Thaker', 'B/3, \"SAI AUM KRUPA\", ASTHA BUNGLOWS\nNEAR PALIKA NAGAR', '9428223913', 'thakertarak@yahoo.in', 'japanpark', 'Allowed', NULL),
('ashishpal2810@gmail.com', 'ASHISH PAL', '205, Raghuveer Chambers ,University Circle, Vallabh Vidhyanagar', '9537935094', 'ashishpal2810@gmail.com', 'Ashish2810', 'Allowed', NULL),
('deepakrajksoni@gmail.com', 'Deepak Kumar Soni', 'Test', '8239524994', 'deepakrajksoni@gmail.com', 'Test123', 'Allowed', NULL),
('yashgoti23@gmail.com', 'Yash goti', 'A110 madhav gurukul', '8530667432', 'yashgoti23@gmail.com', 'yhgoti23', 'Allowed', NULL),
('darshanpatel2021@gmail.com', 'Darshan', 'Nr.urban bank gamdivad Anand', '7778070314', 'darshanpatel2021@gmail.com', 'darshan22', 'Allowed', NULL),
('muneebbhatt59@gmail.com', 'Muneeb', 'SS college of engineering', '8825066009', 'muneebbhatt59@gmail.com', 'zainab', 'Allowed', NULL),
('dipakcbhatt@yahoo.com', 'DIPAK BHATT', '305, NATHWANI CHAMBER,\nSARDAR GANJ,\nANAND 388001.', '9925025011', 'dipakcbhatt@yahoo.com', 'DIPAKBHATT9999', 'Allowed', NULL),
('jaivikpatel47@gmail.com', 'jaivik patel ', 'Flate no 4 priya appartment \nopp purohit daining hall\ndhobhigat road,\nIscon', '7567572841', 'jaivikpatel47@gmail.com', 'Qwerty', 'Allowed', NULL),
('sagarnathani95@gmail.com', 'Sagar Nathani', 'room no 401,prajapati boys hostel;\nbeside man-mandir girls hostel;\niskon road, v.v nagar', '9033750373', 'sagarnathani95@gmail.com', 'sagar6605', 'Allowed', NULL),
('sagarnathani1995@gmail.com', 'Sagar Nathani', 'room no 401,prajapati boys hostel,\nbeside man-mandir girls hostel,\niskon road, v.v nagar', '9033750373', 'sagarnathani1995@gmail.com', 'sagar6605', 'Allowed', NULL),
('vasupatel0611@gmail.com', 'Vasu patel', 'Bhagwati niwas, beside kotak bank , mota bazar, Vallabh Vidhyanagar. ', '8849952939', 'vasupatel0611@gmail.com', 'vasu0611', 'Allowed', NULL),
('Pandyanishit26@gmail.com', 'Nishit pandya', '302 nest hostel motabazar v.v.nagar anand 388120', '9428504555', 'Pandyanishit26@gmail.com', 'npandya2698', 'Allowed', NULL),
('Krupavansadia@gmail.com', 'Krupa', '204-Atmiya Avenue \nNear Nagarpalika garden\n behind iscon temple\nVvnagar', '9824436699', 'Krupavansadia@gmail.com', 'ruhi0497', 'Allowed', NULL),
('Patel.sagar171296@gmail.com', 'Sagar Patel ', 'Raghuvir cambers\nUniversity circle \nVallab vidhyanagar ', '7405501193', 'Patel.sagar171296@gmail.com', 'Sagargotu100', 'Allowed', NULL),
('Jinit21988@gmail.com', 'Jinit shah', '109 ramsagar complex\nNana bazar\nPanchayat road\nV.v.nagar\nAnand', '9979899528', 'Jinit21988@gmail.com', 'jin210988', 'Allowed', NULL),
('vmaharajwala@gmail.com', 'Vrushank', '303- J.K. smruti Hostel  Uco Park Society\nNr. Railway crossing v.v.nagar', '8200370176', 'vmaharajwala@gmail.com', '19081997', 'Allowed', NULL),
('Jayshah415@yahoo.com', 'Shah jay manojkumar', 'B-18,chaitanya vihar society,Behind hotel-h,anand-vidhyanagar road,anand', '8866499570', 'Jayshah415@yahoo.com', '8866499570', 'Allowed', NULL),
('chiragchaudhary102@gmail.com', 'Chirag Chaudhary', 'Room no 301 Uday boys hostel behind \nRatna motors Motabazaar Vallabh Vidyanagar', '9726963015', 'chiragchaudhary102@gmail.com', 'technocrat', 'Allowed', NULL),
('Nkhackz@gmail.com', 'Nayan', '202 shyam appartment nana bazar \nOpposite blind association', '7874559668', 'Nkhackz@gmail.com', 'nayan12345', 'Allowed', NULL),
('anish.vahora105@gmail.com', 'ANISH VAHORA', 'EC DEPT.\nBVM ENGG COLLEGE\nOPP. SASTRI MAIDAN\nV V NAGAR', '9998322871', 'anish.vahora105@gmail.com', 'anish1984', 'Allowed', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vacation_details`
--

CREATE TABLE `vacation_details` (
  `Id` int(11) NOT NULL,
  `IsVacation` tinyint(1) NOT NULL,
  `BtnTxt` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vacation_details`
--

INSERT INTO `vacation_details` (`Id`, `IsVacation`, `BtnTxt`) VALUES
(1, 0, '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_login`
--
ALTER TABLE `admin_login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_home_images`
--
ALTER TABLE `app_home_images`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `app_setting`
--
ALTER TABLE `app_setting`
  ADD PRIMARY KEY (`Id`(250));

--
-- Indexes for table `cancelled_simple_tiffin_daily_order`
--
ALTER TABLE `cancelled_simple_tiffin_daily_order`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `cancelled_tiffin_with_sweet_daily_order`
--
ALTER TABLE `cancelled_tiffin_with_sweet_daily_order`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`city`);

--
-- Indexes for table `delivery_charges`
--
ALTER TABLE `delivery_charges`
  ADD PRIMARY KEY (`charges_id`);

--
-- Indexes for table `fast_food_categories`
--
ALTER TABLE `fast_food_categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `fast_food_products`
--
ALTER TABLE `fast_food_products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `ff_order_timmings`
--
ALTER TABLE `ff_order_timmings`
  ADD PRIMARY KEY (`time_id`);

--
-- Indexes for table `monthly_order`
--
ALTER TABLE `monthly_order`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `monthly_tiffin_menu`
--
ALTER TABLE `monthly_tiffin_menu`
  ADD PRIMARY KEY (`tiffin_id`);

--
-- Indexes for table `providers`
--
ALTER TABLE `providers`
  ADD PRIMARY KEY (`pid`);

--
-- Indexes for table `simple_tiffin`
--
ALTER TABLE `simple_tiffin`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `simple_tiffin_daily_order`
--
ALTER TABLE `simple_tiffin_daily_order`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `specialtiffin`
--
ALTER TABLE `specialtiffin`
  ADD PRIMARY KEY (`TiffinId`);

--
-- Indexes for table `specialtiffinorder`
--
ALTER TABLE `specialtiffinorder`
  ADD PRIMARY KEY (`OrderId`);

--
-- Indexes for table `tiffin_with_sweet`
--
ALTER TABLE `tiffin_with_sweet`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `tiffin_with_sweet_daily_order`
--
ALTER TABLE `tiffin_with_sweet_daily_order`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `trial_tiffin_order`
--
ALTER TABLE `trial_tiffin_order`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `user_accounts`
--
ALTER TABLE `user_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vacation_details`
--
ALTER TABLE `vacation_details`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `app_home_images`
--
ALTER TABLE `app_home_images`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `delivery_charges`
--
ALTER TABLE `delivery_charges`
  MODIFY `charges_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `fast_food_categories`
--
ALTER TABLE `fast_food_categories`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `fast_food_products`
--
ALTER TABLE `fast_food_products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;
--
-- AUTO_INCREMENT for table `ff_order_timmings`
--
ALTER TABLE `ff_order_timmings`
  MODIFY `time_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `specialtiffin`
--
ALTER TABLE `specialtiffin`
  MODIFY `TiffinId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `specialtiffinorder`
--
ALTER TABLE `specialtiffinorder`
  MODIFY `OrderId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `vacation_details`
--
ALTER TABLE `vacation_details`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.0.10.12
-- http://www.phpmyadmin.net
--
-- Host: 127.5.20.130:3306
-- Generation Time: Apr 17, 2016 at 09:06 PM
-- Server version: 5.5.45
-- PHP Version: 5.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `uiuap`
--

-- --------------------------------------------------------

--
-- Table structure for table `advertisement_info`
--

CREATE TABLE IF NOT EXISTS `advertisement_info` (
  `u_id` varchar(100) NOT NULL,
  `address` varchar(200) NOT NULL,
  `type` varchar(20) NOT NULL,
  `quantity` varchar(5) NOT NULL,
  `deadline` varchar(30) NOT NULL,
  `availability` varchar(2) NOT NULL DEFAULT 'Y',
  `house_rent` varchar(6) DEFAULT NULL,
  `utility_cost` varchar(6) DEFAULT NULL,
  `provided_fasility` varchar(200) DEFAULT NULL,
  `post_id` int(11) NOT NULL AUTO_INCREMENT,
  `post_date` varchar(30) NOT NULL,
  PRIMARY KEY (`post_id`),
  KEY `ID` (`u_id`),
  KEY `ADDRESS` (`address`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `advertisement_info`
--

INSERT INTO `advertisement_info` (`u_id`, `address`, `type`, `quantity`, `deadline`, `availability`, `house_rent`, `utility_cost`, `provided_fasility`, `post_id`, `post_date`) VALUES
('011111', 'Dhaka', 'Seat', '2', '30/03/2016', 'Y', '3000', '1000', 'Many Facility', 1, '21/03/2016'),
('011131185', 'Dhanmondi-15', 'Room', '2', '30/03/2016', 'Y', NULL, NULL, NULL, 2, '21/03/2016'),
('011133002', 'Dhanmondi-9/A', 'Room', '1', '30/03/2016', 'Y', NULL, NULL, NULL, 3, '21/03/2016'),
('011133003', 'Dhaka', 'Seat', '3', '30/03/2016', 'Y', NULL, NULL, NULL, 4, '21/03/2016'),
('011131185', 'Dhanmondi, Dhaka, Dhaka Division, Bangladesh', 'Seat', '2', '30/03/2016', 'Y', '3000', '1000', 'Good Enough', 5, '21/03/2016'),
('1212', 'daghjgjaj', 'jdjagj', '2', '30/03/2016', 'y', 'ty', 'rt', 'ty', 6, '21/03/2016'),
('011131185', 'Dhanmondi, Dhaka, Dhaka Division, Bangladesh', 'Seat', '2', '30/03/2016', 'Y', '3000', '1000', 'Valo', 7, '21/03/2016'),
('011131185', 'Dhanmondi, Dhaka, Dhaka Division, Bangladesh', 'Room', '2', '30/03/2016', 'Y', '3000', '500', 'Kharap Na', 8, '21/03/2016'),
('011131185', 'Khulna, Khulna Division, Bangladesh', 'Seat', '2', '30/04/2016', 'Y', '3000', '1000', 'Good Enough', 9, '21/03/2016'),
('011131185', 'Shankar', 'Room', '1', '30/04/2016', 'Y', '3000', '1000', 'Ok Fine.', 10, '21/03/2016'),
('011111111', 'Mohammadpur, Dhaka, Dhaka Division, Bangladesh', 'Seat', '1', '05.04.2016', 'Y', '3000', '1000', 'Awesome accommodation all time  ', 11, '27/03/2016');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE IF NOT EXISTS `messages` (
  `sender_id` varchar(100) NOT NULL,
  `receiver_id` varchar(100) NOT NULL,
  `seen` varchar(2) NOT NULL DEFAULT 'N',
  `last_edited` varchar(20) NOT NULL,
  `messages_text` text NOT NULL,
  KEY `sender` (`sender_id`),
  KEY `receiver` (`receiver_id`),
  KEY `sender_id` (`sender_id`,`receiver_id`),
  KEY `seen` (`seen`),
  KEY `last_edited` (`last_edited`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`sender_id`, `receiver_id`, `seen`, `last_edited`, `messages_text`) VALUES
('011', '0112', 'N', '0000-00-00', 'Updated'),
('011133002', '011131185', 'N', '0000-00-00', '4/11/16 6:22 AM::[/])):Hello, Yes-No Testing<%(#%#)*/*>What can i say....'),
('011131185', '011133003', 'N', '0000-00-00', '4/11/16 5:31 AM::[/])):Testing message 2<%(#%#)*/*>4/11/16 5:19 AM::[/])):Hey How are you buddy ?'),
('011131185', '011133002', 'N', '0000-00-00', '4/11/16 5:26 AM::[/])):tikolo <%(#%#)*/*>4/11/16 5:22 AM::[/])):test 2'),
('123', '234', 'N', '0000-00-00', 'jhgjjhgjhghjgjh'),
('011133003', '011131185', 'N', '0000-00-00', '4/11/16 6:23 AM::[/])):hjdhajkhjkdshkjahkjdhk'),
('011111111', '011131185', 'N', '4/11/16 6:37 AM', '4/11/16 6:37 AM::[/])):testing'),
('null', '011131185', 'N', '4/11/16 6:59 AM', '4/11/16 6:59 AM::[/])):testing'),
('tretret', '011131185', 'N', '4/10/16 11:19 PM', '4/10/16 11:19 PM::[/])):');

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE IF NOT EXISTS `user_info` (
  `u_id` varchar(100) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `password` varchar(500) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `contact_num` varchar(100) DEFAULT NULL,
  `gender` varchar(10) NOT NULL,
  PRIMARY KEY (`u_id`),
  UNIQUE KEY `user_infocol2_UNIQUE` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`u_id`, `name`, `password`, `email`, `contact_num`, `gender`) VALUES
('011111111', 'Rafiul Islam ', '123', 'xyz@gmail.com', '01711446427', 'male'),
('011111123', 'Test User', '123', 'test@test.com', '1234567890', 'female'),
('011111569', 'Zahid Himel', '1234', 'fhgjdfh@hotmail.com', '654651567', 'male'),
('011121038', 'MD. Rafiul Islam', '038', 'rafiul@gmail.com', '478928979', 'male'),
('011122013', 'Mohammad Ali', '123', 'a@a.com', '876', 'male'),
('011131185', 'Md. Ashikuzzaman', '185', 'ashikuzzaman.ar@gmail.com', '01766750645', 'male'),
('011133002', 'Sajid Ahmed', '002', 'sazid860@gmail.com', '01624117337', 'male'),
('011133003', 'Iftakhar Ali Khandokar', '003', 'iftakharyeamid@gmail.com', '01677952525', 'male'),
('011141091', 'Fahim', '091', 'fahim.cross', '72874829', 'male'),
('12345', 'mmmms', '12356', 'hjkjhj', 'khkjh', 'female'),
('7879', 'fsdfsd', '9', 'dsfdsf', 'fsdfdsfds', 'female'),
('adasd', 'asd', 'asda', 'asd', 'asd', 'male'),
('asa', 'ba', 'asa', 'as', 'asa', 'male'),
('asda', 'AccomodationProcider(Web-App)', 'a', 'ashikuzzaman.ar', 'a', 'male'),
('rwerwerw', 'erwerwe', 'arb', 'fgfgfd', '44444', 'male'),
('Test2', 'Test2', 'test2', 'test2@gmail.com', '08347728379', 'female'),
('Test3', 'Test3', 'test3', 'test3@gmail.com', '0', 'female'),
('Test4', 'Test4', 'test4', 'test4@gmail.com', '08347728379', 'female'),
('Test5', 'Test5', 'test5', 'test5@gmail.com', '08347728379', 'female'),
('Test6', 'Test6', 'test6', 'test6@gmail.com', '08347728379', 'female'),
('Test7', 'Test7', 'test7', 'test7@gmail.com', '08347728379', 'female'),
('tretret', 'ttretre', '123', 'eretewt', '43243243243243243', 'male');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

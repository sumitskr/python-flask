-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 05, 2020 at 02:38 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blog`
--

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `sno` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `subtitle` varchar(50) NOT NULL,
  `slug` varchar(30) NOT NULL,
  `content` text NOT NULL,
  `img_url` varchar(30) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`sno`, `title`, `subtitle`, `slug`, `content`, `img_url`, `date`) VALUES
(1, 'This is my first blog using flask Documentation', 'Flask Documentation', 'first-post', 'Heyy !! Whatsup guys youre welcome to my first blogging website ,Hope you will enjoy my blogs and give support to me,Its my first blog as I testing my site.....', 'post2.jpg', '2020-01-29 15:32:10'),
(2, 'How to create website With Flask ??', 'Create websites using flask ', 'second-post', 'We will write code that will take care of the server side processing. Our code will receive requests. It will figure out what those requests are dealing with and what they are asking. It will also figure out what response to send to the user.\r\n\r\nTo do all this we will use Flask.', 'flask.jpg', '2020-01-24 14:50:24'),
(3, 'Jinja Template', 'Jinja is beautifull', 'third-post', 'Jinja2 is one of the most used template engines for Python. It is inspired by Django\'s templating system but extends it with an expressive language that gives template authors a more powerful set of tools. On top of that it adds sandboxed execution and optional automatic escaping for applications where security is important.\r\n\r\nIt is internally based on Unicode and runs on a wide range of Python versions from 2.5 to current versions including Python 3.', 'dsdsd', '2020-01-29 22:22:39'),
(4, 'Bootstrap', 'A easy way to create designs', 'fourth-post', 'Build responsive, mobile-first projects on the web with the world’s most popular front-end component library.\r\n\r\nBootstrap is an open source toolkit for developing with HTML, CSS, and JS. Quickly prototype your ideas or build your entire app with our Sass variables and mixins, responsive grid system, extensive prebuilt components, and powerful plugins built on jQuery.', 'https://bit.ly/2RPp2Tm', '2020-01-24 15:51:21'),
(5, 'DigitalOcean', 'Cloud computing company', 'fifth-post', 'DigitalOcean, Inc. is an American cloud infrastructure provider headquartered in New York City with data centers worldwide. DigitalOcean provides developers cloud services that help to deploy and scale applications that run simultaneously on multiple computers.', '', '2020-01-24 16:04:12'),
(6, 'Python', 'High-level programming language', 'sixth-post', 'Python is an interpreted, high-level, general-purpose programming language. Created by Guido van Rossum and first released in 1991, Python\'s design philosophy emphasizes code readability with its notable use of significant whitespace', '', '2020-01-24 16:25:48'),
(25, 'sumit', 'ssssss', 'ssss', 'ss', 'sss', '2020-01-29 22:52:43');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

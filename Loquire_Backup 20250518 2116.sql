-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema library
--

CREATE DATABASE IF NOT EXISTS library;
USE library;

--
-- Temporary table structure for view `borrowed_books_view`
--
DROP TABLE IF EXISTS `borrowed_books_view`;
DROP VIEW IF EXISTS `borrowed_books_view`;
CREATE TABLE `borrowed_books_view` (
  `student_id` int(11),
  `full_name` text,
  `book_id` int(11),
  `book_title` varchar(120),
  `borrowed_date` date,
  `return_date` date
);

--
-- Temporary table structure for view `grouped_available_books`
--
DROP TABLE IF EXISTS `grouped_available_books`;
DROP VIEW IF EXISTS `grouped_available_books`;
CREATE TABLE `grouped_available_books` (
  `book_id` int(11),
  `book_title` varchar(120),
  `Author` varchar(120),
  `genre` varchar(50),
  `total_copies` int(11),
  `description` varchar(120),
  `publisher` varchar(120),
  `date_added` datetime,
  `status` enum('Available','Notavailable'),
  `availability_status` varchar(12)
);

--
-- Temporary table structure for view `overdue_books`
--
DROP TABLE IF EXISTS `overdue_books`;
DROP VIEW IF EXISTS `overdue_books`;
CREATE TABLE `overdue_books` (
  `student_id` int(11),
  `student_name` varchar(241),
  `book_id` int(11),
  `borrowed_date` date,
  `return_date` date,
  `status` varchar(11)
);

--
-- Temporary table structure for view `showall`
--
DROP TABLE IF EXISTS `showall`;
DROP VIEW IF EXISTS `showall`;
CREATE TABLE `showall` (
  `book_id` int(11),
  `book_title` varchar(120),
  `Author` varchar(120),
  `publisher` varchar(120),
  `Description` varchar(120),
  `genre` varchar(50),
  `date_added` datetime,
  `status` enum('Available','Notavailable'),
  `total_copies` int(11)
);

--
-- Definition of table `books`
--

DROP TABLE IF EXISTS `books`;
CREATE TABLE `books` (
  `book_id` int(11) NOT NULL AUTO_INCREMENT,
  `book_title` varchar(120) NOT NULL,
  `Author` varchar(120) NOT NULL,
  `publisher` varchar(120) NOT NULL,
  `Description` varchar(120) NOT NULL,
  `genre` varchar(50) NOT NULL,
  `date_added` datetime DEFAULT curdate(),
  `status` enum('Available','Notavailable') DEFAULT NULL,
  `total_copies` int(11) DEFAULT 0,
  PRIMARY KEY (`book_id`),
  UNIQUE KEY `unique_book_title` (`book_title`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `books`
--

/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` (`book_id`,`book_title`,`Author`,`publisher`,`Description`,`genre`,`date_added`,`status`,`total_copies`) VALUES 
 (20,'Asdas','Asdas','Asd','Asd','asd','2025-05-18 00:00:00','Available',1);
/*!40000 ALTER TABLE `books` ENABLE KEYS */;


--
-- Definition of table `borrow`
--

DROP TABLE IF EXISTS `borrow`;
CREATE TABLE `borrow` (
  `borrow_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) DEFAULT NULL,
  `book_id` int(11) DEFAULT NULL,
  `borrow_date` date NOT NULL,
  `return_date` date DEFAULT NULL,
  PRIMARY KEY (`borrow_id`),
  KEY `student_id` (`student_id`),
  KEY `book_id` (`book_id`),
  CONSTRAINT `borrow_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`),
  CONSTRAINT `borrow_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `borrow`
--

/*!40000 ALTER TABLE `borrow` DISABLE KEYS */;
/*!40000 ALTER TABLE `borrow` ENABLE KEYS */;


--
-- Definition of table `borrow_archive`
--

DROP TABLE IF EXISTS `borrow_archive`;
CREATE TABLE `borrow_archive` (
  `archive_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_name` varchar(255) NOT NULL,
  `book_id` int(11) NOT NULL,
  `actual_return_date` date DEFAULT curdate(),
  PRIMARY KEY (`archive_id`),
  KEY `book_id` (`book_id`),
  CONSTRAINT `borrow_archive_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `borrow_archive`
--

/*!40000 ALTER TABLE `borrow_archive` DISABLE KEYS */;
INSERT INTO `borrow_archive` (`archive_id`,`student_name`,`book_id`,`actual_return_date`) VALUES 
 (18,'Jude Arriba',20,'2025-05-18'),
 (19,'Fdfsf Ssdfs',20,'2025-05-18'),
 (20,'Jude Arriba',20,'2025-05-18');
/*!40000 ALTER TABLE `borrow_archive` ENABLE KEYS */;


--
-- Definition of table `student`
--

DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `student_id` int(11) NOT NULL,
  `first_name` varchar(120) NOT NULL,
  `last_name` varchar(120) NOT NULL,
  `course` varchar(50) NOT NULL,
  `year` int(11) NOT NULL,
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student`
--

/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` (`student_id`,`first_name`,`last_name`,`course`,`year`) VALUES 
 (123,'Jude','Arriba','Bsit',1),
 (123123,'Fdfsf','Ssdfs','Fsdfsd',1);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;


--
-- Definition of table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(15) NOT NULL,
  `password` varchar(15) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`user_id`,`username`,`password`) VALUES 
 (1,'admin','admin123');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;


--
-- Definition of view `borrowed_books_view`
--

DROP TABLE IF EXISTS `borrowed_books_view`;
DROP VIEW IF EXISTS `borrowed_books_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `borrowed_books_view` AS select `s`.`student_id` AS `student_id`,concat(ucase(substr(`s`.`first_name`,1,1)),lcase(substr(`s`.`first_name`,2)),' ',ucase(substr(`s`.`last_name`,1,1)),lcase(substr(`s`.`last_name`,2))) AS `full_name`,`bks`.`book_id` AS `book_id`,`bks`.`book_title` AS `book_title`,`br`.`borrow_date` AS `borrowed_date`,`br`.`return_date` AS `return_date` from ((`borrow` `br` join `student` `s` on(`br`.`student_id` = `s`.`student_id`)) join `books` `bks` on(`br`.`book_id` = `bks`.`book_id`));

--
-- Definition of view `grouped_available_books`
--

DROP TABLE IF EXISTS `grouped_available_books`;
DROP VIEW IF EXISTS `grouped_available_books`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `grouped_available_books` AS select `books`.`book_id` AS `book_id`,`books`.`book_title` AS `book_title`,`books`.`Author` AS `Author`,`books`.`genre` AS `genre`,`books`.`total_copies` AS `total_copies`,`books`.`Description` AS `description`,`books`.`publisher` AS `publisher`,`books`.`date_added` AS `date_added`,`books`.`status` AS `status`,if(`books`.`status` = 1,'Available','NotAvailable') AS `availability_status` from `books` where `books`.`status` = 1;

--
-- Definition of view `overdue_books`
--

DROP TABLE IF EXISTS `overdue_books`;
DROP VIEW IF EXISTS `overdue_books`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `overdue_books` AS select `s`.`student_id` AS `student_id`,concat(`s`.`first_name`,' ',`s`.`last_name`) AS `student_name`,`b`.`book_id` AS `book_id`,`b`.`borrow_date` AS `borrowed_date`,`b`.`return_date` AS `return_date`,if(`b`.`return_date` < curdate(),'Overdue','Not Overdue') AS `status` from (`student` `s` join `borrow` `b` on(`s`.`student_id` = `b`.`student_id`)) where `b`.`return_date` < curdate() and `b`.`return_date` is not null;

--
-- Definition of view `showall`
--

DROP TABLE IF EXISTS `showall`;
DROP VIEW IF EXISTS `showall`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `showall` AS select `books`.`book_id` AS `book_id`,`books`.`book_title` AS `book_title`,`books`.`Author` AS `Author`,`books`.`publisher` AS `publisher`,`books`.`Description` AS `Description`,`books`.`genre` AS `genre`,`books`.`date_added` AS `date_added`,`books`.`status` AS `status`,`books`.`total_copies` AS `total_copies` from `books`;



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

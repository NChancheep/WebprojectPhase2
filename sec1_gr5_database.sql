-- Section 1 group 21
-- Kittitad Jiraprasitchai 6288073
-- Arnon Noonkhan 6288090
-- Chancheep Mahacharoensuk 6288092
-- Kantapong Matangkarat 6288160

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Webprogramming: `greyhound`
--
DROP DATABASE IF EXISTS `project1_phase2_group5`;
CREATE DATABASE IF NOT EXISTS `project1_phase2_group5`;
USE `project1_phase2_group5`;

-- ---------------------------------------------------------------------------------------

--
-- Table structure for table `Login_Information`
--

CREATE TABLE Login_Information
(
  `login_id` int(4) NOT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `role` varchar(20) DEFAULT NULL,
  `log` varchar(100) DEFAULT NULL
);

--
-- Alter & drop for table `Login_Information`
--

ALTER TABLE LoginInformation
  ADD PRIMARY KEY (`login_id`);

-- ---------------------------------------------------------------------------------------

--
-- Table structure for table `User_Information`
--

CREATE TABLE User_Information
(
  `user_id` int(5) NOT NULL,
  `firstname` varchar(20) DEFAULT NULL,
  `lastname` varchar(20) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `age` int(2) DEFAULT NULL,
  `preferences` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `login_id` int(4) NOT NULL,
  CONSTRAINT FK_UserLoginID FOREIGN KEY (login_id) REFERENCES Login_Information(login_id)
);

--
-- Alter & drop for table `User_Information`
--

ALTER TABLE User_Information
  ADD PRIMARY KEY (`user_id`);
  
-- ---------------------------------------------------------------------------------------

--
-- Table structure for table `Admin_Information`
--

CREATE TABLE Admin_Information
(
  `admin_id` int(6) NOT NULL,
  `firstname` varchar(20) DEFAULT NULL,
  `lastname` varchar(20) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `age` int(2) DEFAULT NULL,
  `preferences` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `login_id` int(4) NOT NULL,
  CONSTRAINT FK_AdminLoginID FOREIGN KEY (login_id) REFERENCES Login_Information(login_id)
);

--
-- Alter & drop for table `Admin_Information`
--

ALTER TABLE Admin_Information
  ADD PRIMARY KEY (`admin_id`);
  
-- ---------------------------------------------------------------------------------------

--
-- Business Domain Data
-- 
-- Table structure for table `Branch`
--

CREATE TABLE Branch 
(
  `Branch_id` int NOT NULL,
  `Contact_No` varchar(20) DEFAULT NULL,
  `Location` varchar(20) DEFAULT NULL,
  `Name` varchar(20) DEFAULT NULL
);

--
-- Alter & drop for table `Branch`
--

ALTER TABLE Branch
  ADD PRIMARY KEY (`Branch_id`);
  
--
-- Table structure for table `Order`
--  

CREATE TABLE Orders 
(
  `Order_id` int NOT NULL,
  `Tip` varchar(10) DEFAULT NULL,
  `Date` varchar(20) DEFAULT NULL,
  `Discount_Amount` int DEFAULT NULL,
  `Branch_id` int NOT NULL,
   CONSTRAINT FK_BranchID FOREIGN KEY (Branch_id) REFERENCES Branch(Branch_id)
);

--
-- Alter for table `Orders`
--

ALTER TABLE Orders
  ADD PRIMARY KEY (`Order_id`);
  
--
-- Table structure for table `Payment`
--

CREATE TABLE Payment 
(
  `Pay_id` int NOT NULL,
  `Date_and_time` datetime NOT NULL,
  `Operated_by` varchar(20) DEFAULT NULL,
  `Order_id` int NOT NULL,
   CONSTRAINT FK_orderID1 FOREIGN KEY (Order_id) REFERENCES Orders(Order_id)
);

--
-- Alter & drop for table `Payment`
--

ALTER TABLE Payment
  ADD PRIMARY KEY (`Pay_id`);
  
--
-- Table structure for table `Customer`
--

CREATE TABLE Customer 
(
  `Cus_id` int NOT NULL,
  `Name` varchar(20) DEFAULT NULL,
  `Birthdate` datetime NOT NULL,
  `Phone` varchar(20) DEFAULT NULL
);

--
-- Alter for table `Customer`
--

ALTER TABLE Customer
  ADD PRIMARY KEY (`Cus_id`);
  
--
-- Table structure for table `Order_detail`
--

CREATE TABLE Order_detail 
(
  `Order_id`  int NOT NULL,
  `Item_number` varchar(200) DEFAULT NULL,
  `Price` int NOT NULL,
  `Amount` varchar(200) DEFAULT NULL,
  `Time` datetime NOT NULL,
  `Food_list` varchar(200) DEFAULT NULL,
   CONSTRAINT FK_orderID2 FOREIGN KEY (Order_id) REFERENCES Orders(Order_id)
);

--
-- Table structure for table `Credit_card`
--

CREATE TABLE Credit_card 
(
  `Pay_id` int NOT NULL,
  `Card_number` bigint NOT NULL,
  `CCV` int NOT NULL,
  `Expired_date` varchar(20) DEFAULT NULL,
   CONSTRAINT FK_payID1 FOREIGN KEY (Pay_id) REFERENCES Payment(Pay_id)
);

--
-- Table structure for table `Cash`
--

CREATE TABLE Cash 
(
  `Pay_id` int NOT NULL,
  `Cost` int NOT NULL,
  `Final_Cost` int NOT NULL,
  `Changes` int NOT NULL,
  `Currency` varchar(20) DEFAULT NULL,
  CONSTRAINT FK_payID2 FOREIGN KEY (Pay_id) REFERENCES Payment(Pay_id)
);

--
-- Table structure for table `Onsite`
--

CREATE TABLE Onsite
(
  `Order_id`  int NOT NULL,
  `Table_No` int NOT NULL,
  `Statuss` varchar(20) DEFAULT NULL,
  `No_of_people` int DEFAULT NULL,
  `Booking_Schedule` datetime NOT NULL,
   CONSTRAINT FK_orderID3 FOREIGN KEY (Order_id) REFERENCES Orders(Order_id)
);

--
-- Alter & add for table `Onsite`
--

ALTER TABLE Onsite
  ADD `WhenOrder` datetime NOT NULL,
  ADD `Reserved` int NOT NULL;
  
--
-- Table structure for table `Onlines`
--

CREATE TABLE Onlines 
(
  `Order_id`  int NOT NULL,
  `Tax_invoice` int NOT NULL,
  `Delivery_status`  varchar(20) DEFAULT NULL,
  `Date_of_ordering` datetime NOT NULL,
  `Location` varchar(20) DEFAULT NULL,
  `Account` varchar(20) DEFAULT NULL,
  `Cus_id` int NOT NULL,
   CONSTRAINT FK_orderID4online FOREIGN KEY (Order_id) REFERENCES Orders(Order_id),
   CONSTRAINT FK_cusID FOREIGN KEY (Cus_id) REFERENCES Customer(Cus_id)
);

-- ---------------------------------------------------------------------------------------

--
-- Dumping data for table `Login_Information`
--

INSERT INTO LoginInformation (`login_id`, `username`, `password`, `role`, `log`) VALUES
(0001, "apadij", "itcs212_1", "user", "Access-granted"),
(0002, "kculialip", "itcs381_1", "user", "Access-granted"),
(0003, "trahcihduw", "itcs212_2", "user", "Access-granted"),
(0004, "tisnoob", "itcs323_1", "user", "Access-granted"),
(0005, "naugnasdus", "itcs343_1", "user", "Access-granted"),
(0073, "maxnacata", "6288073", "admin", "Access-granted"),
(0090, "IMVISCaRaMel", "6288090", "admin", "Access-granted"),
(0092, "SxYuki", "6288092", "admin", "Access-granted"),
(0160, "JumpKM", "6288160", "admin", "Access-granted"),
(2512, "LeviAKM", "2512820", "admin", "Access-granted");

--
-- Dumping data for table `User_Information`
--

INSERT INTO User_Information (`user_id`, `firstname`, `lastname`, `address`, `age`, `preferences`, `email`, `login_id`) VALUES
(00001, "Jidapa", "Kraisangka", "MUICT", 30, "Not Spicy Food", "jidapa.kra@mahidol.ac.th", 0001),
(00002, "Pilailuck", "Panphattarasap", "MUICT", 35, "Not Spicy Food", "pilailuck.pan@mahidol.ac.th", 0002),
(00003, "Wudhichart", "Sawangphol", "MUICT", 40, "Not Spicy Food", "wudhichart.saw@mahidol.ac.th", 0003),
(00004, "Boonsit", "Yimwadsana", "MUICT", 45, "Not Spicy Food", "boonsit.yim@mahidol.ac.th", 0004),
(00005, "Sudsanguan", "Ngamsuriyaroj", "MUICT", 50, "Not Spicy Food", "sudsanguan.nga@mahidol.ac.th", 0005);

--
-- Dumping data for table `Admin_Information`
--

INSERT INTO Admin_Information (`admin_id`, `firstname`, `lastname`, `address`, `age`, `preferences`, `email`, `login_id`) VALUES
(620073, "Kittitad", "Jiraprasitchai", "MUICT", 20, "Beef Pepperoni Pizza", "kittitad.jir@student.mahidol.ac.th", 0073),
(620090, "Arnon", "Noonkhan", "MUICT", 20, "Grilled Pork", "arnon.noo@student.mahidol.ac.th", 0090),
(620092, "Chancheep", "Mahacharoensuk", "MUICT", 20, "T bone Steak", "chancheeo.mah@student.mahidol.ac.th", 0092),
(620160, "Kantapong", "Matangkarat", "MUICT", 20, "Lemon Soda", "kantapong.mat@student.mahidol.ac.th", 0160),
(622512, "Levi", "Ackerman", "Paradise Island", 34, "Lemon and Vanilla Ice Cream", "levi.ack@survey.com", 2512);

--
-- Dumping data for table `Branch`
--

INSERT INTO Branch (`Branch_id`, `Contact_No`, `Location`, `Name`) VALUES
(01, '025-264-395', 'Siam Center', 'Greyhound Cafe'),
(02, '023-364-064', 'ICONSIAM', 'Greyhound Cafe'),
(03, '028-112-108', 'Emquartier', 'Greyhound Cafe'),
(04, '021-382-895', 'Centralplaza Pinklao', 'Greyhound Cafe'),
(05, '024-172-624', 'The Crystal', 'Greyhound Cafe'),
(06, '022-555-062', 'The Circle', 'Greyhound Cafe'),
(07, '023-094-566', 'J Avenue', 'Greyhound Cafe'),
(08, '027-704-141', 'Mega Bangna', 'Greyhound Cafe'),
(09, '024-474-191', 'The Promenada', 'Greyhound Cafe'),
(10, '029-061-440', 'Phaholyothin (Ari)', 'Greyhound Cafe');

--
-- Dumping data for table `Order`
--

INSERT INTO Orders (`Order_id`, `Tip`, `Date`, `Discount_Amount`, `Branch_id`) VALUES
(001, null, '2020-06-02 17:03:07', null, 05),
(002, '0200', '2020-11-07 10:30:13', 500, 01),
(003, '0500', '2020-10-19 21:14:43', null, 05),
(004, '0100', '2020-11-24 20:50:36', null, 03),
(005, null, '2020-02-07 11:49:15', null, 02),
(006, null, '2020-11-22 10:00:33', 300, 05),
(007, '0050', '2020-10-06 14:26:43', null, 10),
(008, '0200', '2020-07-03 12:31:44', null, 01),
(009, '0100', '2020-06-14 11:26:16', 400, 06),
(010, '0300', '2020-07-13 18:56:33', 400, 02),
(011, '0100', '2020-05-11 15:55:55', 500, 06),
(012, '0050', '2020-11-04 19:24:33', null, 07),
(013, null, '2020-01-31 14:48:20', 300, 04),
(014, '0300', '2020-02-19 11:31:07', null, 03),
(015, '0550', '2020-07-07 17:07:54', 100, 08),
(016, null, '2020-03-21 10:32:17', null, 04),
(017, null, '2020-04-30 16:20:21', null, 02),
(018, null, '2020-10-11 13:14:15', 200, 01),
(019, '0750', '2020-01-02 12:07:37', null, 01),
(020, null, '2020-05-09 19:27:18', 200, 06),
(021, '0150', '2020-08-26 15:39:54', null, 07),
(022, null, '2020-06-28 21:18:09', 300, 02),
(023, '0500', '2020-09-26 17:51:12', 100, 05),
(024, '0150', '2020-02-27 11:19:31', null, 09),
(025, null, '2020-05-31 19:24:39', 500, 04),
(026, '0400', '2020-06-19 13:27:10', null, 01),
(027, '0200', '2020-07-05 18:05:19', null, 01),
(028, null, '2020-08-16 20:39:47', null, 08),
(029, '0400', '2020-09-19 11:37:15', null, 07),
(030, null, '2020-10-15 18:20:58', null, 03),
(031, '0100', '2020-02-05 14:21:35', null, 07),
(032, '0050', '2020-05-15 13:42:11', null, 02),
(033, null, '2020-03-26 18:31:45', null, 02),
(034, '0400', '2020-08-27 19:30:30', null, 01),
(035, null, '2020-03-16 10:47:52', null, 06),
(036, '0500', '2020-04-16 20:48:01', null, 10),
(037, '1000', '2020-01-30 21:11:12', null, 08),
(038, null, '2020-07-04 21:23:46', null, 05),
(039, null, '2020-09-02 14:17:26', null, 05),
(040, null, '2020-02-06 18:25:38', null, 07),
(041, '0200', '2020-11-02 16:42:59', null, 04),
(042, '0150', '2020-03-14 12:42:13', null, 01),
(043, '0100', '2020-10-29 11:32:41', null, 03),
(044, null, '2020-04-16 17:02:48', null, 06),
(045, '0150', '2020-11-14 11:21:09', null, 05),
(046, '0350', '2020-03-08 11:08:09', null, 08),
(047, null, '2020-05-31 19:54:12', null, 04),
(048, null, '2020-07-21 16:21:47', null, 09),
(049, '0300', '2020-05-09 12:13:14', null, 06),
(050, '0500', '2020-03-29 15:47:56', null, 09),
(051, '0050', '2020-08-04 20:45:31', null, 10),
(052, null, '2020-02-28 17:59:45', null, 01),
(053, '0450', '2020-03-02 13:58:16', null, 03),
(054, null, '2020-06-08 11:43:52', null, 05),
(055, '0100', '2020-07-19 14:27:51', null, 01),
(056, null, '2020-08-16 11:40:42', null, 02),
(057, '0200', '2020-03-30 13:17:18', null, 09),
(058, null, '2020-09-20 18:58:12', null, 10),
(059, null, '2020-10-14 11:14:54', null, 04),
(060, '0300', '2020-04-13 16:45:46', null, 10);

--
-- Dumping data for table `Payment`
--

INSERT INTO Payment (`Pay_id`, `Date_and_time`, `Operated_by`, `Order_id`) VALUES
(0001, '2020-06-02 17:33:07', 'Siripen', 001),
(0002, '2020-11-07 11:00:13', 'Jin', 002),
(0003, '2020-10-19 21:44:43', 'Suga', 003),
(0004, '2020-11-24 21:20:36', 'J-Hope', 004),
(0005, '2020-02-07 12:19:15', 'Rap Monster', 005),
(0006, '2020-11-22 10:30:33', 'Jimin', 006),
(0007, '2020-10-06 14:56:43', 'V', 007),
(0008, '2020-07-03 13:01:44', 'Jungkook', 008),
(0009, '2020-06-14 11:56:16', 'Eunwoo', 009),
(0010, '2020-07-13 19:26:33', 'Baekhyun', 010),
(0011, '2020-05-11 16:25:55', 'Chanyeol', 011),
(0012, '2020-11-04 19:54:33', 'Kai', 012),
(0013, '2020-01-31 15:18:20', 'Sehun', 013),
(0014, '2020-02-19 12:01:07', 'Nichkhun', 014),
(0015, '2020-07-07 17:37:54', 'BamBam', 015),
(0016, '2020-03-21 11:02:17', 'Ten', 016),
(0017, '2020-04-30 16:50:21', 'Sorn', 017),
(0018, '2020-10-11 13:44:15', 'Minnie', 018),
(0019, '2020-01-02 12:37:37', 'Lisa', 019),
(0020, '2020-05-09 19:57:18', 'Jisoo', 020),
(0021, '2020-08-26 16:09:54', 'Rose', 021),
(0022, '2020-06-28 21:48:09', 'Jennie', 022),
(0023, '2020-09-26 18:21:12', 'Tzuyu', 023),
(0024, '2020-02-27 11:49:31', 'Nayeon', 024),
(0025, '2020-05-31 19:54:39', 'Irene', 025),
(0026, '2020-06-19 13:57:10', 'IU', 026),
(0027, '2020-07-05 18:35:19', 'Taeyeon', 027),
(0028, '2020-08-16 21:09:47', 'YoonA', 028),
(0029, '2020-09-19 12:07:15', 'Hwasa', 029),
(0030, '2020-10-15 18:50:58', 'Soyeon', 030),
(0031, '2020-02-05 14:51:35', 'BangChan', 031),
(0032, '2020-05-15 14:12:11', 'Hyunjin', 032),
(0033, '2020-03-26 19:01:45', 'Felix', 033),
(0034, '2020-08-27 20:00:30', 'Mingyu', 034),
(0035, '2020-03-16 11:17:52', 'DK', 035),
(0036, '2020-04-16 21:18:01', 'The8', 036),
(0037, '2020-01-30 21:41:12', 'Minho', 037),
(0038, '2020-07-04 21:53:46', 'Taemin', 038),
(0039, '2020-09-02 14:47:26', 'Leeteuk', 039),
(0040, '2020-02-06 18:55:38', 'Heechul', 040),
(0041, '2020-11-02 17:12:59', 'Siwon', 041),
(0042, '2020-03-14 13:12:13', 'Kyuhyun', 042),
(0043, '2020-10-29 12:02:41', 'Henry', 043),
(0044, '2020-04-16 17:32:48', 'G-Dragon', 044),
(0045, '2020-11-14 11:51:09', 'Taeyang', 045),
(0046, '2020-03-08 11:38:09', 'Tiffany', 046),
(0047, '2020-05-31 20:24:12', 'Yuri', 047),
(0048, '2020-07-21 16:51:47', 'Seohyun', 048),
(0049, '2020-05-09 12:43:14', 'ParkBom', 049),
(0050, '2020-03-29 16:17:56', 'Dara', 050),
(0051, '2020-08-04 20:15:31', 'CL', 051),
(0052, '2020-02-28 18:29:45', 'Jiyeon', 052),
(0053, '2020-03-02 14:28:16', 'Yubin', 053),
(0054, '2020-06-08 12:13:52', 'Yeeun', 054),
(0055, '2020-07-19 14:57:51', 'Sunmi', 055),
(0056, '2020-08-16 12:10:42', 'HyunA', 056),
(0057, '2020-03-30 13:47:18', 'ChungHa', 057),
(0058, '2020-09-20 19:28:12', 'Suzy', 058),
(0059, '2020-10-14 11:44:54', 'Hyolyn', 059),
(0060, '2020-04-13 17:15:46', 'Soyou', 060);

--
-- Dumping data for table `Customer`
--

INSERT INTO Customer (`Cus_id`, `Name`, `Birthdate`, `Phone`) VALUES
(6288024, 'Komsan', '2001-04-27', '0655540138'),
(6288035, 'Veerakit', '2000-06-10', '0855519009'),
(6288037, 'Natanon', '2000-09-13', '0855581072'),
(6288058, 'Picha', '2000-06-16', '0655562237'),
(6288060, 'Anyamanee', '2000-08-17', '0955553361'),
(6288071, 'Kasidis', '2001-03-30', '0855521494'),
(6288073, 'Kittitad', '2000-10-21', '0655542696'),
(6288090, 'Arnon', '2001-02-19', '0655584767'),
(6288092, 'Chancheep', '2000-12-29', '0655542961'),
(6288093, 'Thanakrit', '2000-10-16', '0955587232'),
(6288106, 'Ray', '2001-03-20', '0855529427'),
(6288118, 'Paphon', '2000-08-29', '0955586012'),
(6288127, 'Pattadon', '2001-01-02', '0955524914'),
(6288144, 'Pasakorn', '2000-10-09', '0655569350'),
(6288160, 'Kantapong', '2000-11-20', '0955549423'),
(6288002, 'Cherdrush', '2000-09-28', '0855510582'),
(6288034, 'Pranungfun', '2000-12-27', '0855568900'),
(6288059, 'Detbodi', '2000-08-02', '0655563168'),
(6288064, 'Kanpitcha', '2001-03-09', '0855586752'),
(6288079, 'Cholravee', '2000-08-02', '0655576298'),
(6288084, 'Jane', '2001-04-08', '0955510897'),
(6288089, 'Intr-Orn', '2001-04-26', '0855549394'),
(6288108, 'Nattaprapa', '2000-10-06', '0955513038'),
(6288126, 'Tasha', '2000-07-09', '0955552525'),
(6288128, 'Donlawat', '1996-08-04', '0855571129'),
(6288130, 'Akkarapong', '2001-01-30', '0955577156'),
(6288137, 'Chayaphol', '2000-08-20', '0855522196'),
(6288193, 'Araya', '2001-02-18', '0655569610'),
(6288010, 'Nakamon', '2001-03-26', '0655546992'),
(6288134, 'Rathakit', '2000-10-15', '0855547457'),
(4288001, 'Naruto', '1984-10-10', '0655534223'),
(4288002, 'Sasuke', '1984-07-23', '0855576747'),
(4288003, 'Sakura', '1984-03-28', '0955516054'),
(4288004, 'Shikamaru', '1984-09-22', '0955518786'),
(4288005, 'Choji', '1984-05-01', '0955563834'),
(4288006, 'Ino', '1984-09-23', '0855593121'),
(4288007, 'Kiba', '1984-07-07', '0655543519'),
(4288008, 'Shino', '1984-01-23', '0855521953'),
(4288009, 'Hinata', '1984-12-27', '0655550287'),
(4288010, 'Neji', '1983-07-03', '0955575837'),
(4288011, 'Lee', '1983-09-27', '0655575877'),
(4288012, 'Tenten', '1983-03-09', '0655504109'),
(4288013, 'Gaara', '1984-01-19', '0955502787'),
(4288014, 'Kankuro', '1982-05-15', '0655556033'),
(4288015, 'Temari', '1981-08-23', '0655528451'),
(4288016, 'Kakashi', '1970-09-15', '0855514981'),
(4288017, 'Asuma', '1970-10-18', '0955552297'),
(4288018, 'Kurenai', '1970-06-11', '0955520620'),
(4288019, 'MightGuy', '1970-01-01', '0655551648'),
(4288020, 'Hashirama', '1892-10-23', '0855526789'),
(4288021, 'Tobirama', '1911-02-19', '0955505569'),
(4288022, 'Hiruzen', '1926-02-08', '0955584195'),
(4288023, 'Minato', '1960-01-25', '0855578606'),
(4288024, 'Tsunade', '1946-08-02', '0955552289'),
(4288025, 'Jiraiya', '1946-11-11', '0855521461'),
(4288026, 'Orochimaru', '1946-10-27', '0655511245'),
(4288027, 'Itachi', '1979-06-09', '0955524545'),
(4288028, 'Obito', '1970-02-10', '0955500504'),
(4288029, 'Madara', '1892-12-24', '0955546634'),
(4288030, 'Shisui', '1976-09-18', '0655510564');

--
-- Dumping data for table `Order_detail`
--

INSERT INTO Order_detail (`Order_id`, `Item_number`, `Price`,`Amount`,`Time`,`Food_list`) VALUES
(001, 'F2-04 F3-01 F4-08 F7-05, D1-01 D1-09 D3-03, K3-04 K5-05', 1920, '1 1 1 1, 2 1 1, 1 1', '2020-06-02 17:03:07', 'OceaGang HamCheeGril SpagiCarbo EggBaconRice, IceLemTea IceCoco WamelShak, BerCrepCake BanaChoc'),
(002, 'F1-09 F1-11, D3-08', 800, '1 1, 2, null', '2020-11-07 10:30:13', 'StekSala CrabSala, LimeSoda'),
(003, 'F1-06 F4-12, D3-09, K1-01', 1190, '1 2, 3, 1', '2020-10-19 21:14:43', 'SanwiBow SpagiThaiBeef, MixFruPunc, HapToast'),
(004, 'F5-01 D5-03', 680, '2, 2, null', '2020-11-24 20:50:36', 'CompNood, NomYenGran'),
(005, 'F7-01 F7-03, D1-12', 680, '1 1, 2, null', '2020-02-07 11:49:15', 'RiceDryBeef HainanChicRice, IceMoch'),
(006, 'F6-02, D1-01 D1-02, K2-01', 1010, '2, 1 1, 1', '2020-11-22 10:00:33', 'SalmStek, IceLemTea IceTea, CrepSuzet'),
(007, 'F2-23 F8-02, D6-02 D6-04, K4-01', 1640, '2 2, 2 2, 2', '2020-10-06 14:26:43', 'MiniPorkRibs FeshLasaSala, FrutShakYogh PassFash, Sakoo'),
(008, 'F6-03, D3-06', 550, '1, 1, null', '2020-07-03 12:31:44', 'SimpGrilSeaBass, PineAppJuce'),
(009, 'F7-07, D4-05, K3-03', 1960, '3, 2, 1', '2020-06-14 11:26:16', 'TonsCrabMeatRice, CherSodaFlot, SaltCaraChocVaniCake'),
(010, 'F7-02 F7-09, K4-03', 605, '1 1, null, 1', '2020-07-13 18:56:33', 'KaoPlaTu FriSalmBasilRice, ChowKuay'),
(011, 'F1-01 F1-05, D2-02 D2-03, K5-01', 770, '3 1, 2 1, 1', '2020-05-11 15:55:55', 'GardVegeSoup FenchOnionSoup, HotCoco HotLem, ChumCham'),
(012, 'F4-06, K5-03', 780, '2, null, 2', '2020-11-04 19:24:33', 'FermPorkRigto, ChocLover'),
(013, 'F2-14 F3-04, D1-09 D2-17', 945, '1 1, 2 1, null', '2020-01-31 14:48:20', 'PomelSala SupElvBurg, IceCoco PepMintTea'),
(014, 'F3-02 F3-04, D1-01', 900, '1 1, 2, null', '2020-02-19 11:31:07', 'PitaPizzItalSaus SupElvBurg, IceLemTea'),
(015, 'F3-03 F4-02, D1-01', 780, '2 1, 2, null', '2020-07-07 17:07:54', 'BuffBurg SpagiVongo, IceLemTea'),
(016, 'D1-10, K3-05 K3-07', 500, 'null, 2, 1 1', '2020-03-21 10:32:17', 'FrostChoc, ChocBanaCrepCake WanutBlon'),
(017, 'F1-09 F1-12, D1-13 D2-21, K1-01 K2-01', 1470, '1 1, 2 1, 1 2', '2020-04-30 16:20:21', 'FillStekSala FishmanSala, MochFrap JapGrenTea, HapToast CrepSuzetIceCream'),
(018, 'F2-20, D1-01', 300, '1, 1, null', '2020-10-11 13:14:15', 'SomTumSalaBlackCrabJapSoyb, IceLemTea'),
(019, 'F3-04 F3-02, D1-01, K1-01 K3-01', 2570, '4 1, 4, 1 1', '2020-01-02 12:07:37', 'SupElvBurg PitaPizzItalSaus, IceLemTea, HapToast CrepMixFrut'),
(020, 'F5-03 F5-05, D1-01, K5-02', 950, '2 1, 2, 1', '2020-05-09 19:27:18', 'TokyoSoba PhadThaiFeshShrim, IceLemTea, TempFair'),
(021, 'F2-06, D1-06', 400, '1, 1, null', '2020-08-26 15:39:54', 'BakeSpinCheePorkSaus, IceAmericano'),
(022, 'F2-03 F3-01, D1-05, K1-01', 1180, '2 1, 2, 1', '2020-06-28 21:18:09', 'TartDip HamCheeGril, IceLatte, HapToast'),
(023, 'F4-04, K4-04', 700, '2, null, 1', '2020-09-26 17:51:12', 'FetuShrimMushCreamSauce, LodChongSGP'),
(024, 'F2-04 F2-07, D1-03 D1-09', 830, '1 1, 1 1, null', '2020-02-27 11:19:31', 'OceaGang CrispRaviSalsa ,IceTeaMilk IceCoco'),
(025, 'K3-03', 690, 'null, null, 3', '2020-05-31 19:24:39', 'SaltCaraChocVaniCake'),
(026, 'F1-04 F2-01, D1-02, K1-01', 680, '1 1, 2, 1', '2020-06-19 13:27:10', 'MushroomCreamSoup CalaFrit, IceTea, HapToast'),
(027, 'F3-04 F4-01, D1-01 D1-02', 1380, '2 1, 1 1, null', '2020-07-05 18:05:19', 'SupElvBurg CrabCanel, IceLemTea IceTea'),
(028, 'F2-16, D1-08', 600, '2, 2, null', '2020-08-16 20:39:47', 'FeshVietSpringRoll, FrostCapu'),
(029, 'F2-08, K2-03', 240, '1, null, 1', '2020-09-19 11:37:15', 'FrenFriAioliDip, CrepMixFrutIceCream'),
(030, 'D4-02 D6-03, K3-09 K5-05', 610, 'null, 1 1, 1 1', '2020-10-15 18:20:58', 'BubSour InnoVoyag, YoungCoconutCrepCake BanaChoc'),
(031, 'F1-12 F2-09, D3-10', 1140, '2 1, 2, null', '2020-02-05 14:21:35', 'FishmanSala ThaiStekSpicyThaiHotSauce, MixFrutPuncShake'),
(032, 'F2-12, D1-04, K2-03', 610, '1, 1, 1', '2020-05-15 13:42:11', 'SteetStylGrilLambSkew, FrostLemTea, CrepMixFrutIceCream'),
(033, 'F3-03 F4-14, K3-07', 1400, '1 3, null, 2', '2020-03-26 18:31:45', 'BuffBurg SpagiOlioBacon, WalnutBlon'),
(034, 'F5-13, D6-01 D6-02, K4-03', 750, '2, 1 1, 2', '2020-08-27 19:30:30', 'PorkSalaNood, PickYouUp FrutShakYogh, ChowKuay'),
(035, 'F1-14, D2-02, K1-01', 680, '1, 2, 2', '2020-03-16 10:47:52', 'GrilPumpTofuSala, HotCoco, HapToast'),
(036, 'F4-13, D1-09', 1090, '3, 4, null', '2020-04-16 20:48:01', 'SpagiThaiAncho, IceCoco'),
(037, 'F3-05, D2-18', 535, '1, 3, null', '2020-01-30 21:11:12', 'ElvBurg, EarlGreyTea'),
(038, 'F4-15, K3-08', 720, '2, null, 1', '2020-07-04 21:23:46', 'SpagiCornBeefFeshChil, Banoffee'),
(039, 'F1-04 F1-08, D1-05 D1-11, K3-05', 950, '1 1, 1 1, 2', '2020-09-02 14:17:26', 'MushroomCreamSoup FeshLasagSala, IceLatte EspesFrap, ChocBanaCrepCake'),
(040, 'F7-05, D2-16 D2-17, K2-01 K2-02', 790, '2, 1 1, 1 1', '2020-02-06 18:25:38', 'EggBaconRice, ChamoTea PepMintTea, CrepSuzet CrepeSuzetIceCream'),
(041, 'F3-04 F3-02, D5-02 D5-01', 1900, '3 1, 2 1, null', '2020-11-02 16:42:59', 'SupElvBurg PitaPizzItalSaus, YokLorGran ThaiTeaGran'),
(042, 'F5-09, D2-22, K4-04', 580, '1, 2, 2', '2020-03-14 12:42:13', 'MissSaigon, JapGreenTeaRoastRice, LodChongSGP'),
(043, 'F2-11 F2-14, D3-01, K5-05', 1250, '2 2, 3, 1', '2020-10-29 11:32:41', 'GreyhoundFamoFriChicWing PomelSala, LycheShake, BanaChoc'),
(044, 'F1-03, K3-02', 760, '2, null, 2', '2020-04-16 17:02:48', 'PrawBisqFeshCream, FeshMadeAppleCrumbIceCream'),
(045, 'F4-07 F2-02', 650, '1 1, null, null', '2020-11-14 11:21:09', 'FetuSearScalAspaLightPestoCreamSauce HomePateCognFeshGreenPepp'),
(046, 'F1-14, D1-01', 640, '1, 4, null', '2020-03-08 11:08:09', 'GrilPumpTofuSala, IceLemTea'),
(047, 'D1-05 D1-06 D1-07', 380, 'null, 1 1 1, null', '2020-05-31 19:54:12', 'IceLatte IceAmericano IceCapu'),
(048, 'F4-06, K5-06', 1040, '3, null, 2', '2020-07-21 16:21:47', 'FermPorkRigtoni, StikRiceMango'),
(049, 'F6-02 F5-01, D2-01 D2-02, K3-01', 1180, '2 1, 1 1, 1', '2020-05-09 12:13:14', 'GrilSalmStekGreenBed CompNood, HotMilk HotCoco, CrepMixFrut'),
(050, 'F4-05, D2-01, K3-06', 820, '2, 2, 2', '2020-03-29 15:47:56', 'FetuGrilVegePestoSauce, HotMilk, BlueberryCheeCake'),
(051, 'D1-11, K2-02', 540, 'null, 2, 2', '2020-08-04 20:45:31', 'EspesFrap, CrepSuzetIceCream'),
(052, 'F5-07 F5-08, D2-11, K3-07', 575, '1 1, 1, 1', '2020-02-28 17:59:45', 'NoodBraiBeefDry NoodBraiBeefSoup, DecafMacchiato, WalnutBlon'),
(053, 'D1-13, K3-04', 340, 'null, 1, 1', '2020-03-02 13:58:16', 'MochFrap, MixBerryCrepCake'),
(054, 'F2-14, D2-11 D2-05, K2-03', 790, '2, 1 1, 1', '2020-06-08 11:43:52', 'PomelSala, DecafMacchiato DecafAmericano, CrepMixFrut'),
(055, 'F4-02, D2-07', 875, '3, 1, null', '2020-07-19 14:27:51', 'SpagiVongo, DecafCafeLatte'),
(056, 'F6-02 F4-01, K1-01', 940, '1 1, null, 2', '2020-08-16 11:40:42', 'GrilSalmStekGreenBed CrabCann, HapToast'),
(057, 'F3-05, D2-18', 645, '2, 1, null', '2020-03-30 13:17:18', 'ElvBurg, EarlGreyTea'),
(058, 'F5-11, D1-10 D2-20 D2-05', 1350, '4, 2 1 1, null', '2020-09-20 18:58:12', 'FriNoodSeaBass, FrostChoc EngBreakfastTea DecafAmericano'),
(059, 'F6-03, K3-07', 1020, '2, null, 1', '2020-10-14 11:14:54', 'SimpGrilSeaBass, WalnutBlon'),
(060, 'F4-07, D1-02', 550, '1, 1, null', '2020-04-13 16:45:46', 'FetuSearScalAspaLightPestoCreamSauce, IceTea');

--
-- Dumping data for table `Credit_card`
--

INSERT INTO Credit_card (`Pay_id`, `Card_number`, `CCV`, `Expired_date`) VALUES
(0031, 4555966302537280, 993, '07/22'),
(0032, 4093039207021815, 931, '09/21'),
(0033, 4222433544255489, 586, '10/24'),
(0034, 4222439463224588, 364, '08/25'),
(0035, 4075242825357171, 909, '08/22'),
(0036, 4157657923306518, 645, '05/24'),
(0037, 4283731924323736, 693, '02/26'),
(0038, 4157659712318993, 138, '11/26'),
(0039, 4543254247021495, 795, '11/23'),
(0040, 4555964476651664, 134, '09/23'),
(0041, 4543251712284855, 825, '10/24'),
(0042, 4075242755073459, 735, '09/26'),
(0043, 4157659279148270, 816, '12/23'),
(0044, 4157656955034949, 818, '04/23'),
(0045, 4386798763294035, 239, '04/24'),
(0046, 4555961564479388, 673, '11/25'),
(0047, 4222433367839229, 555, '01/22'),
(0048, 4093038931286520, 385, '10/21'),
(0049, 4093031172264702, 864, '06/26'),
(0050, 4093036540079195, 408, '05/21'),
(0051, 4075247880933881, 307, '12/25'),
(0052, 4075246859575772, 173, '04/22'),
(0053, 4555961699928150, 681, '11/26'),
(0054, 4283738367349292, 581, '02/26'),
(0055, 4157659879091409, 690, '05/23'),
(0056, 4386799682774297, 524, '08/24'),
(0057, 4283739117492986, 451, '11/24'),
(0058, 4093033039170825, 463, '10/21'),
(0059, 4386795185623247, 353, '02/22'),
(0060, 4075249224996293, 779, '02/24');

--
-- Dumping data for table `Cash`
--

INSERT INTO Cash (`Pay_id`, `Cost`, `Final_Cost`, `Changes`, `Currency`) VALUES
(0001, 1920, 1920, 0, 'Baht'),
(0002, 800, 300, 500, 'Baht'),
(0003, 1190, 1190, 0, 'Baht'),
(0004, 680, 680, 0, 'Baht'),
(0005, 680, 680, 0, 'Baht'),
(0006, 1010, 710, 300, 'Baht'),
(0007, 1640, 1640, 0, 'Baht'),
(0008, 550, 550, 0, 'Baht'),
(0009, 1960, 960, 1000, 'Baht'),
(0010, 605, 205, 400, 'Baht'),
(0011, 770, 270, 500, 'Baht'),
(0012, 780, 780, 0, 'Baht'),
(0013, 945, 645, 300, 'Baht'),
(0014, 900, 900, 0, 'Baht'),
(0015, 780, 680, 100, 'Baht'),
(0016, 500, 500, 0, 'Baht'),
(0017, 1470, 1470, 0, 'Baht'),
(0018, 300, 100, 200, 'Baht'),
(0019, 2570, 2570, 0, 'Baht'),
(0020, 950, 750, 200, 'Baht'),
(0021, 400, 400, 0, 'Baht'),
(0022, 1180, 880, 300, 'Baht'),
(0023, 700, 600, 100, 'Baht'),
(0024, 830, 830, 0, 'Baht'),
(0025, 690, 190, 500, 'Baht'),
(0026, 680, 680, 0, 'Baht'),
(0027, 1380, 1380, 0, 'Baht'),
(0028, 600, 600, 0, 'Baht'),
(0029, 240, 240, 0, 'Baht'),
(0030, 610, 610, 0, 'Baht'),
(0031, 1140, 1140, 0, 'Baht'),
(0032, 610, 610, 0, 'Baht'),
(0033, 1400, 1400, 0, 'Baht'),
(0034, 750, 750, 0, 'Baht'),
(0035, 680, 680, 0, 'Baht'),
(0036, 1090, 1090, 0, 'Baht'),
(0037, 535, 535, 0, 'Baht'),
(0038, 720, 720, 0, 'Baht'),
(0039, 950, 950, 0, 'Baht'),
(0040, 790, 790, 0, 'Baht'),
(0041, 1900, 1900, 0, 'Baht'),
(0042, 580, 580, 0, 'Baht'),
(0043, 1250, 1250, 0, 'Baht'),
(0044, 760, 760, 0, 'Baht'),
(0045, 650, 650, 0, 'Baht'),
(0046, 640, 640, 0, 'Baht'),
(0047, 380, 380, 0, 'Baht'),
(0048, 1040, 1040, 0, 'Baht'),
(0049, 1180, 1180, 0, 'Baht'),
(0050, 820, 820, 0, 'Baht'),
(0051, 540, 540, 0, 'Baht'),
(0052, 575, 575, 0, 'Baht'),
(0053, 340, 340, 0, 'Baht'),
(0054, 790, 790, 0, 'Baht'),
(0055, 875, 875, 0, 'Baht'),
(0056, 940, 940, 0, 'Baht'),
(0057, 645, 645, 0, 'Baht'),
(0058, 1350, 1350, 0, 'Baht'),
(0059, 1020, 1020, 0, 'Baht'),
(0060, 550, 550, 0, 'Baht');

--
-- Dumping data for table `Onsite`
--

INSERT INTO Onsite (`Order_id`, `Table_No`, `WhenOrder`, `Statuss`, `No_of_people`, `Booking_Schedule`, `Reserved`) VALUES
(001, 1, '2020-06-02 17:03:07', 'available', 4, '2020-06-03 12:00:00', 6),
(002, 2, '2020-11-07 10:30:13', 'unavailable', 2, null, null),
(003, 3, '2020-10-19 21:14:43', 'available', 3, '2020-10-20 16:00:00', 2),
(004, 4, '2020-11-24 20:50:36', 'unavailable', 2, null, null),
(005, 5, '2020-02-07 11:49:15', 'unavailable', 2, null, null),
(006, 6, '2020-11-22 10:00:33', 'available', 2, '2020-11-22 16:00:00', 4),
(007, 7, '2020-10-06 14:26:43', 'unavailable', 4, null, null),
(008, 8, '2020-07-03 12:31:44', 'available', 1, '2020-07-06 20:00:00', 2),
(009, 9, '2020-06-14 11:26:16', 'available', 2, '2020-06-17 16:00:00', 3),
(010, 10, '2020-07-13 18:56:33', 'available', 1, '2020-07-13 20:00:00', 2),
(011, 1, '2020-05-11 15:55:55', 'unavailable', 3, null, null),
(012, 2, '2020-11-04 19:24:33', 'available', 2, '2020-11-05 16:00:00', 2),
(013, 3, '2020-01-31 14:48:20', 'unavailable', 2, null, null),
(014, 4, '2020-02-19 11:31:07', 'unavailable', 2, null, null),
(015, 5, '2020-07-07 17:07:54', 'unavailable', 3, null, null),
(016, 6, '2020-03-21 10:32:17', 'unavailable', 2, null, null),
(017, 7, '2020-04-30 16:20:21', 'unavailable', 2, null, null),
(018, 8, '2020-10-11 13:14:15', 'available', 1, '2020-10-12 16:00:00', 2),
(019, 9, '2020-01-02 12:07:37', 'unavailable', 4, null, null),
(020, 10, '2020-05-09 19:27:18', 'available', 2, '2020-05-10 20:00:00', 2),
(021, 1, '2020-08-26 15:39:54', 'unavailable', 1, null, null),
(022, 2, '2020-06-28 21:18:09', 'available', 2, '2020-06-29 12:00:00', 5),
(023, 3, '2020-09-26 17:51:12', 'unavailable', 2, null, null),
(024, 4, '2020-02-27 11:19:31', 'available', 2, '2020-02-28 16:00:00', 2),
(025, 5, '2020-05-31 19:24:39', 'unavailable', 3, null, null),
(026, 6, '2020-06-19 13:27:10', 'unavailable', 2, null, null),
(027, 7, '2020-07-05 18:05:19', 'available', 2, '2020-07-05 20:00:00', 2),
(028, 8, '2020-08-16 20:39:47', 'available', 2, '2020-08-17 16:00:00', 4),
(029, 9, '2020-09-19 11:37:15', 'unavailable', 1, null, null),
(030, 10, '2020-10-15 18:20:58', 'available', 2, '2020-10-16 16:00:00', 2);

--
-- Dumping data for table `Onlines`
--

INSERT INTO Onlines (`Order_id`, `Tax_invoice`, `Delivery_status`, `Date_of_ordering`, `Location`, `Account`, `Cus_id`) VALUES
(031, 1140, 'On the route', '2020-02-05 14:21:35', 'Konohagakure', 'Naruto', 4288001),
(032, 610, 'Ordering', '2020-05-15 13:42:11', 'Konohagakure', 'Sasuke', 4288002),
(033, 1400, 'Order confirmation', '2020-03-26 18:31:45', 'Konohagakure', 'Sakura', 4288003),
(034, 750, 'Order confirmation', '2020-08-27 19:30:30', 'Konohagakure', 'Shikamaru', 4288004),
(035, 680, 'Done', '2020-03-16 10:47:52', 'Konohagakure', 'Choji', 4288005),
(036, 1090, 'On the route', '2020-04-16 20:48:01', 'Konohagakure', 'Ino', 4288006),
(037, 535, 'Done', '2020-01-30 21:11:12', 'Konohagakure', 'Kiba', 4288007),
(038, 720, 'Ordering', '2020-07-04 21:23:46', 'Konohagakure', 'Shino', 4288008),
(039, 950, 'Order confirmation', '2020-09-02 14:17:26', 'Konohagakure', 'Hinata', 4288009),
(040, 790, 'On the route', '2020-02-06 18:25:38', 'Konohagakure', 'Neji', 4288010),
(041, 1900, 'Ordering', '2020-11-02 16:42:59', 'Konohagakure', 'Lee', 4288011),
(042, 580, 'Done', '2020-03-14 12:42:13', 'Konohagakure', 'Tenten', 4288012),
(043, 1250, 'On the route', '2020-10-29 11:32:41', 'Sunagakure', 'Gaara', 4288013),
(044, 760, 'Done', '2020-04-16 17:02:48', 'Sunagakure', 'Kankuro', 4288014),
(045, 650, 'Done', '2020-11-14 11:21:09', 'Sunagakure', 'Temari', 4288015),
(046, 640, 'On the route', '2020-03-08 11:08:09', 'Konohagakure', 'Kakashi', 4288016),
(047, 380, 'Order confirmation', '2020-05-31 19:54:12', 'Konohagakure', 'Asuma', 4288017),
(048, 1040, 'Order confirmation', '2020-07-21 16:21:47', 'Konohagakure', 'Kurenai', 4288018),
(049, 1180, 'Ordering', '2020-05-09 12:13:14', 'Konohagakure', 'MightGuy', 4288019),
(050, 820, 'On the route', '2020-03-29 15:47:56', 'Konohagakure', 'Hashirama', 4288020),
(051, 540, 'Done', '2020-08-04 20:45:31', 'Konohagakure', 'Tobirama', 4288021),
(052, 575, 'Ordering', '2020-02-28 17:59:45', 'Konohagakure', 'Hiruzen', 4288022),
(053, 340, 'Done', '2020-03-02 13:58:16', 'Konohagakure', 'Minato', 4288023),
(054, 790, 'Order confirmation', '2020-06-08 11:43:52', 'Konohagakure', 'Tsunade', 4288024),
(055, 875, 'Ordering', '2020-07-19 14:27:51', 'Konohagakure', 'Jiraiya', 4288025),
(056, 940, 'Order confirmation', '2020-08-16 11:40:42', 'Otogakure', 'Orochimaru', 4288026),
(057, 645, 'On the route', '2020-03-30 13:17:18', 'Konohagakure', 'Itachi', 4288027),
(058, 1350, 'On the route', '2020-09-20 18:58:12', 'Konohagakure', 'Obito', 4288028),
(059, 1020, 'Order confirmation', '2020-10-14 11:14:54', 'Konohagakure', 'Madara', 4288029),
(060, 550, 'Done', '2020-04-13 16:45:46', 'Konohagakure', 'Shisui', 4288030);

SELECT * FROM LoginInformation WHERE username = 'JumpKM' AND password = '6288160'
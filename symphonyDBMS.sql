-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 22, 2021 at 07:48 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `symphony`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_users` (IN `uname` VARCHAR(50), IN `fname` VARCHAR(50), IN `lname` VARCHAR(50), IN `email` VARCHAR(50), IN `password` VARCHAR(50), IN `profilepic` VARCHAR(500))  NO SQL
Insert into users VALUES(null,uname,fname,lname,email,password,NOW(),profilepic)$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `albums`
--

CREATE TABLE `albums` (
  `id` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `artist` int(11) NOT NULL,
  `genre` int(11) NOT NULL,
  `artworkPath` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `albums`
--

INSERT INTO `albums` (`id`, `title`, `artist`, `genre`, `artworkPath`) VALUES
(1, 'Highway to Hell', 1, 1, 'assets/images/artwork/Highway_to_Hell.jpg'),
(2, 'Meteora', 3, 1, 'assets/images/artwork/Meteora.jpg'),
(3, 'Bad', 2, 2, 'assets/images/artwork/Bad.png'),
(4, 'Don\'t Smile at Me', 4, 2, 'assets/images/artwork/Smile.png'),
(5, 'Hollywood\'s Bleeding', 5, 3, 'assets/images/artwork/Bleeding.png'),
(6, 'Kamikaze', 6, 4, 'assets/images/artwork/Kamikaze.jpg'),
(7, 'American IV', 7, 10, 'assets/images/artwork/AmericanIV.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `artists`
--

CREATE TABLE `artists` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `artists`
--

INSERT INTO `artists` (`id`, `name`) VALUES
(1, 'AC/DC'),
(2, 'Michael Jackson'),
(3, 'Linkin Park'),
(4, 'Billie Eilish'),
(5, 'Post Malone'),
(6, 'Eminem'),
(7, 'Johnny Cash');

-- --------------------------------------------------------

--
-- Table structure for table `genres`
--

CREATE TABLE `genres` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `genres`
--

INSERT INTO `genres` (`id`, `name`) VALUES
(1, 'Rock'),
(2, 'Pop'),
(3, 'Hip-hop'),
(4, 'Rap'),
(5, 'R & B'),
(6, 'Classical'),
(7, 'Techno'),
(8, 'Jazz'),
(9, 'Folk'),
(10, 'Country');

-- --------------------------------------------------------

--
-- Table structure for table `playlists`
--

CREATE TABLE `playlists` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `owner` varchar(50) NOT NULL,
  `dateCreated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `playlists`
--

INSERT INTO `playlists` (`id`, `name`, `owner`, `dateCreated`) VALUES
(2, 'me', 'chandler', '2021-01-19 00:00:00'),
(3, 'yash', 'yashuu', '2021-01-20 00:00:00');

--
-- Triggers `playlists`
--
DELIMITER $$
CREATE TRIGGER `delete_songs` BEFORE DELETE ON `playlists` FOR EACH ROW DELETE FROM playlistsongs WHERE playlistsongs.playlistId = playlists.id
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `playlistsongs`
--

CREATE TABLE `playlistsongs` (
  `id` int(11) NOT NULL,
  `songId` int(11) NOT NULL,
  `playlistId` int(11) NOT NULL,
  `playlistOrder` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `songs`
--

CREATE TABLE `songs` (
  `id` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `artist` int(11) NOT NULL,
  `album` int(11) NOT NULL,
  `genre` int(11) NOT NULL,
  `duration` varchar(8) NOT NULL,
  `path` varchar(500) NOT NULL,
  `albumOrder` int(11) NOT NULL,
  `plays` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `songs`
--

INSERT INTO `songs` (`id`, `title`, `artist`, `album`, `genre`, `duration`, `path`, `albumOrder`, `plays`) VALUES
(1, 'Hurt', 7, 7, 10, '3:48', 'assets/music/Hurt.mp3', 1, 12),
(2, 'Faint', 3, 2, 1, '2:47', 'assets/music/Faint.mp3', 2, 8),
(3, 'Numb', 3, 2, 1, '3:06', 'assets/music/Numb.mp3', 3, 13),
(4, 'Breaking The Habit', 3, 2, 1, '3:18', 'assets/music/Breaking_The_Habit.mp3', 4, 15),
(5, 'Bad', 2, 3, 2, '4:19', 'assets/music/Bad.mp3', 5, 20),
(6, 'Back in black', 1, 1, 1, '4:17', 'assets/music/Back_in_black.mp3', 1, 35),
(7, 'Highway to Hell', 1, 1, 1, '3:27', 'assets/music/Highway_to_Hell.mp3', 2, 15),
(8, 'Venom', 6, 6, 4, '4:55', 'assets/music/Venom.mp3', 2, 30),
(9, 'Rap God', 6, 6, 4, '6:09', 'assets/music/Rap_God.mp3', 3, 30),
(10, 'Beat It', 2, 3, 2, '4:18', 'assets/music/Beat_It.mp3', 3, 20),
(11, 'Dirty Diana', 2, 3, 2, '4:40', 'assets/music/Dirty_Diana.mp3', 4, 23),
(12, 'Bellyache', 4, 4, 2, '3:30', 'assets/music/Bellyache.mp3', 5, 32),
(13, 'Ocean Eyes', 4, 4, 2, '3:20', 'assets/music/Ocean_Eyes.mp3', 5, 14),
(14, 'Sunflower', 5, 5, 3, '2:41', 'assets/music/Sunflower.mp3', 4, 12),
(15, 'Circles', 5, 5, 3, '3:46', 'assets/music/Circles.mp3', 3, 11),
(16, 'Thunderstruck', 1, 1, 1, '4:52', 'assets/music/Thunderstruck.mp3', 0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(25) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(32) NOT NULL,
  `signUpDate` datetime NOT NULL,
  `profilePic` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `firstName`, `lastName`, `email`, `password`, `signUpDate`, `profilePic`) VALUES
(1, 'chandler', 'Chandler', 'Bing', 'Chandler1@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '2021-01-14 00:00:00', 'assets/images/profile-pics/head_1.png'),
(2, 'Mickey', 'Mickey', 'Mouse', 'Mickey@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '2021-01-14 00:00:00', 'assets/images/profile-pics/head_2.png'),
(3, 'Micky', 'Mickey', 'Mouse', 'Mickey1@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '2021-01-14 00:00:00', 'assets/images/profile-pics/head_2.png'),
(4, 'monica', 'Monica', 'Geller', 'Monica@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '2021-01-20 00:00:00', 'assets/images/profile-pics/head_emerald.png'),
(5, 'shreya', 'shreya', 'G S', 'shr@gmail.com', '1234', '0000-00-00 00:00:00', 'djshjhjd'),
(6, 'skandu', 'skandana', 'k', 'abba@gmail.com', '125', '2021-01-20 14:37:27', 'asadsd'),
(7, 'yashuu', 'Yashaswini', 'Ravi', 'Yash@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '2021-01-20 14:42:45', 'assets/images/profile-pics/head_emerald.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `albums`
--
ALTER TABLE `albums`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `artists`
--
ALTER TABLE `artists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `playlists`
--
ALTER TABLE `playlists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `playlistsongs`
--
ALTER TABLE `playlistsongs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `songs`
--
ALTER TABLE `songs`
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
-- AUTO_INCREMENT for table `albums`
--
ALTER TABLE `albums`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `artists`
--
ALTER TABLE `artists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `genres`
--
ALTER TABLE `genres`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `playlists`
--
ALTER TABLE `playlists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `playlistsongs`
--
ALTER TABLE `playlistsongs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `songs`
--
ALTER TABLE `songs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

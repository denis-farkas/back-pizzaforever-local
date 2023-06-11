-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Hôte : db.3wa.io
-- Généré le : dim. 11 juin 2023 à 09:02
-- Version du serveur :  5.7.33-0ubuntu0.18.04.1-log
-- Version de PHP : 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `louisalphand_3`
--
CREATE DATABASE IF NOT EXISTS `pizz` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `pizz`;

-- --------------------------------------------------------

--
-- Structure de la table `orderdetails`
--

CREATE TABLE `orderdetails` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `pizza_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `orderdetails`
--

INSERT INTO `orderdetails` (`id`, `order_id`, `pizza_id`, `quantity`, `total`) VALUES
(32, 37, 2, 2, 50),
(33, 37, 4, 1, 15),
(34, 37, 32, 1, 1),
(35, 38, 2, 1, 25),
(36, 38, 5, 1, 20),
(37, 39, 2, 1, 25),
(38, 39, 5, 1, 20),
(39, 39, 4, 1, 15),
(40, 40, 2, 1, 25),
(41, 40, 5, 1, 20),
(42, 40, 4, 1, 15),
(43, 41, 2, 2, 50),
(44, 41, 32, 1, 1),
(45, 42, 32, 1, 1),
(46, 43, 2, 3, 75),
(47, 43, 4, 1, 15),
(48, 43, 30, 1, 12),
(49, 44, 30, 1, 12),
(50, 45, 30, 1, 12),
(51, 46, 4, 40, 600),
(52, 47, 4, 3, 45),
(53, 47, 5, 1, 20),
(54, 48, 30, 23, 276),
(55, 49, 2, 1, 25),
(56, 49, 5, 3, 60),
(57, 50, 4, 4, 60),
(58, 50, 5, 2, 40),
(59, 51, 4, 4, 60),
(60, 52, 2, 3, 75),
(61, 52, 32, 2, 2),
(62, 53, 2, 3, 75),
(63, 53, 32, 2, 2),
(64, 54, 2, 3, 75),
(65, 54, 32, 2, 2),
(66, 55, 2, 3, 75),
(67, 60, 2, 1, 25),
(68, 61, 2, 1, 25),
(69, 62, 4, 8, 80),
(70, 63, 4, 4, 40),
(71, 64, 4, 4, 40),
(72, 65, 4, 4, 40),
(73, 66, 4, 4, 40),
(74, 67, 4, 4, 40),
(75, 68, 4, 4, 40),
(76, 69, 4, 4, 40),
(77, 70, 4, 4, 40),
(78, 71, 4, 4, 40),
(79, 72, 4, 12, 120),
(80, 73, 4, 4, 40),
(81, 74, 4, 4, 40),
(82, 75, 4, 4, 40),
(83, 76, 4, 4, 40),
(84, 77, 4, 8, 80),
(85, 78, 4, 4, 40),
(86, 79, 35, 5, 60),
(87, 80, 4, 4, 40),
(88, 81, 4, 2, 20),
(89, 82, 4, 4, 40),
(90, 83, 4, 8, 80),
(91, 84, 4, 4, 40),
(92, 85, 4, 4, 40),
(93, 86, 4, 4, 40),
(94, 87, 2, 4, 48),
(95, 88, 2, 4, 48),
(96, 89, 2, 4, 48),
(97, 90, 2, 4, 48),
(98, 91, 2, 4, 48),
(99, 92, 2, 4, 48),
(100, 93, 30, 2, 24),
(101, 94, 4, 1, 10),
(102, 95, 4, 4, 40),
(103, 96, 4, 4, 40),
(104, 96, 2, 1, 12),
(105, 97, 4, 4, 40),
(106, 98, 30, 8, 96),
(107, 99, 4, 8, 80),
(108, 99, 2, 8, 96),
(109, 100, 4, 4, 40);

-- --------------------------------------------------------

--
-- Structure de la table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `totalAmount` double NOT NULL,
  `creationTimestamp` datetime NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `totalAmount`, `creationTimestamp`, `status`) VALUES
(37, 1, 66, '2020-06-25 09:57:03', 'not payed'),
(38, 1, 45, '2020-06-25 10:38:42', 'not payed'),
(39, 1, 60, '2020-06-25 14:15:59', 'not payed'),
(40, 1, 60, '2020-06-25 14:20:23', 'payed'),
(41, 1, 51, '2020-06-25 15:01:50', 'not payed'),
(42, 1, 1, '2020-06-25 15:05:59', 'not payed'),
(43, 1, 102, '2020-06-26 10:13:17', 'payed'),
(44, 1, 12, '2020-06-26 10:28:35', 'payed'),
(45, 1, 12, '2020-06-26 10:32:37', 'payed'),
(46, 1, 600, '2020-06-26 10:37:02', 'payed'),
(47, 1, 65, '2020-11-05 11:24:55', 'payed'),
(48, 1, 276, '2020-11-05 11:26:51', 'payed'),
(49, 11, 85, '2021-02-24 14:35:25', 'not payed'),
(50, 11, 100, '2021-11-17 10:02:29', 'payed'),
(51, 11, 60, '2021-11-17 12:39:52', 'payed'),
(52, 11, 77, '2021-11-23 12:35:25', 'not payed'),
(53, 11, 77, '2021-11-23 12:38:04', 'payed'),
(54, 11, 77, '2021-11-23 12:54:21', 'payed'),
(55, 11, 75, '2021-11-23 12:56:14', 'payed'),
(56, 1, 0, '2022-01-26 16:48:15', 'not payed'),
(57, 1, 0, '2022-01-26 16:48:36', 'not payed'),
(58, 1, 0, '2022-01-26 16:53:10', 'not payed'),
(59, 1, 0, '2022-01-26 16:54:09', 'not payed'),
(60, 1, 25, '2022-01-26 16:55:07', 'not payed'),
(61, 1, 25, '2022-01-26 16:55:25', 'not payed'),
(62, 18, 80, '2022-04-16 11:59:11', 'not payed'),
(63, 18, 40, '2022-04-16 12:05:47', 'not payed'),
(64, 18, 40, '2022-04-16 12:27:10', 'not payed'),
(65, 18, 40, '2022-04-16 12:28:06', 'not payed'),
(66, 16, 40, '2022-04-17 10:05:30', 'not payed'),
(67, 16, 40, '2022-04-17 10:21:44', 'not payed'),
(68, 16, 40, '2022-04-17 10:22:02', 'not payed'),
(69, 16, 40, '2022-04-17 10:23:37', 'not payed'),
(70, 16, 40, '2022-04-17 11:04:28', 'not payed'),
(71, 16, 40, '2022-04-17 11:05:22', 'not payed'),
(72, 16, 120, '2022-04-17 11:35:29', 'not payed'),
(73, 23, 40, '2022-04-17 11:50:44', 'payed'),
(74, 23, 40, '2022-04-17 12:07:37', 'payed'),
(75, 23, 40, '2022-04-17 12:22:33', 'payed'),
(76, 23, 40, '2022-04-17 12:27:55', 'not payed'),
(77, 23, 80, '2022-04-17 12:38:22', 'payed'),
(78, 16, 40, '2022-04-17 18:28:11', 'not payed'),
(79, 11, 60, '2022-04-18 20:42:58', 'payed'),
(80, 16, 40, '2022-04-18 20:50:27', 'not payed'),
(81, 11, 20, '2022-04-18 20:51:54', 'not payed'),
(82, 16, 40, '2022-04-18 20:52:41', 'not payed'),
(83, 16, 80, '2022-04-18 20:53:15', 'not payed'),
(84, 23, 40, '2022-04-18 20:53:58', 'not payed'),
(85, 16, 40, '2022-04-20 10:08:44', 'not payed'),
(86, 16, 40, '2022-04-20 10:30:03', 'not payed'),
(87, 16, 48, '2022-04-20 12:08:35', 'not payed'),
(88, 16, 48, '2022-04-20 14:41:38', 'payed'),
(89, 16, 48, '2022-04-20 14:43:20', 'payed'),
(90, 16, 48, '2022-04-20 14:44:42', 'payed'),
(91, 16, 48, '2022-04-21 06:54:33', 'not payed'),
(92, 16, 48, '2022-04-21 06:55:58', 'not payed'),
(93, 16, 24, '2022-05-19 07:18:47', 'not payed'),
(94, 16, 10, '2022-05-19 09:51:30', 'payed'),
(95, 16, 40, '2022-05-19 10:07:20', 'payed'),
(96, 16, 52, '2023-03-18 15:33:50', 'payed'),
(97, 16, 40, '2023-03-18 15:37:36', 'not payed'),
(98, 16, 96, '2023-03-18 15:41:29', 'payed'),
(99, 16, 176, '2023-03-18 16:12:10', 'payed'),
(100, 26, 40, '2023-03-18 17:49:15', 'payed');

-- --------------------------------------------------------

--
-- Structure de la table `pizzas`
--

CREATE TABLE `pizzas` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `ingredient` text NOT NULL,
  `price` int(5) NOT NULL,
  `photo` varchar(90) NOT NULL,
  `quantity` int(11) NOT NULL,
  `creationTimestamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `pizzas`
--

INSERT INTO `pizzas` (`id`, `name`, `ingredient`, `price`, `photo`, `quantity`, `creationTimestamp`) VALUES
(2, 'Pizza au Poulet', 'Rotisserie poulet, pâte à pizza, sauce barbecue, fromage cheddar fumé, fromage mozzarella.', 12, 'Pizza-au-Poulet.jpg', 100, '2020-06-17 17:28:07'),
(4, 'Pizza au Fromage', 'Pâte à pizza, sauce à pizza, fromage de provolone, mozzarella.', 10, 'Pizza-au-Fromage.jpg', 100, '2020-06-17 17:28:07'),
(5, 'Pepperoni', 'Pepperoni, Churizo, Fromage Mozzarella, Sucre.', 12, 'Pepperoni.jpg', 100, '2020-06-17 17:28:07'),
(6, 'Pizza Rustique', 'Jambon, pepperoni, mozzarella, croûte, oeufs.', 12, 'Pizza-Rustique.jpg', 100, '2020-06-17 17:28:07'),
(30, 'Margherita', 'Pâte à pizza, sauce tomate, mozzarella fraîche, huile d\'olive, feuilles de basilic.', 12, 'Margherita.jpg', 100, '2020-06-24 12:49:24'),
(33, 'Pizza à la Tomate', 'Pâte à pizza, San Marzano, flocons de poivron rouge, pierre de pizza, huile d\'olive.', 12, 'Pizza-à-la-Tomate.jpg', 100, '2020-06-24 12:49:24');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `firstName` varchar(60) NOT NULL,
  `lastName` varchar(60) NOT NULL,
  `email` varchar(90) NOT NULL,
  `password` varchar(120) NOT NULL,
  `role` varchar(15) NOT NULL,
  `address` varchar(60) NOT NULL,
  `zip` int(5) NOT NULL,
  `city` varchar(40) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `creationTimestamp` datetime NOT NULL,
  `connexionTimestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `firstName`, `lastName`, `email`, `password`, `role`, `address`, `zip`, `city`, `phone`, `creationTimestamp`, `connexionTimestamp`) VALUES
(1, 'Thib', 'Mones', 'thib@gmail.com', '$2b$10$MQOxj3vTDSPko5I86DbTceOb5t2/DWmwd0PJZ0xMOWA/nrKpKctwO', 'user', '32 rue de la paix', 75011, 'Paris', '0909090998', '2020-06-23 10:58:49', '2020-06-23 10:58:49'),
(2, 'Bernard', 'Malas', 'nanard@gmail.com', '$2b$10$aaBkd7do.Nwk8bKt/ISjd.zPuQzhGw4NCUXT/6rWsYWFr0lQQCw.W', 'user', '10 rue de la paix', 75008, 'Paris', '0651508656', '2020-06-23 11:43:24', '2020-06-23 11:43:24'),
(3, 'Gerard', 'gege@gmail.com', '', '$2b$10$2XYSWL9VEpT51UzpG/loh.Voptt4gEy001sMlAScLG6vVdEUnriRa', 'user', '30 rue du port', 13002, 'Marseille', '0606060809', '2020-06-23 11:44:17', '2020-06-23 11:44:17'),
(4, 'test', 'test@test.fr', '', '$2b$10$vghxfvnVEsn9Cjslm22dEelD.N1udJBJJtzIBmofsZnhkM0MJvkXO', 'user', '5 rue de la rep', 75011, 'Paris', '09087886', '2020-06-23 11:45:58', '2020-06-23 11:45:58'),
(5, 'Bernard', 'Majax', 'majax@gmail.com', '$2b$10$hh7rGocblfXEQbYXdeQ2W.gBYVqP3/Jy48rj9gNaE9M8pk5onDNc2', 'user', '10 rue de la paix', 75010, 'Paris', '090937453', '2020-06-23 12:32:43', '2020-06-23 12:32:43'),
(7, 'Kevin', 'tatane', 'keke@gmail.com', '$2b$10$srwO91L1nC.br/95AzkmMuc3iSj6Zzv1sN.zIETd.kBvu6pgPIczi', 'user', '12 place de la poste', 59000, 'Roubaix', '0909986676', '2020-06-23 15:39:26', '2020-06-23 15:39:26'),
(8, 't', 't', 'test@test.fr', '$2b$10$rrxDGI.OBpvuK1mV9E2VvuGAEBYzCJxXYUl8XpnTmVJYDx12P8c4S', 'user', '5 rue de la rep', 75011, 'Paris', '0978865446', '2020-06-23 15:41:35', '2020-06-23 15:41:35'),
(9, 'jean', 'valjean', 'jeje@gmail.com', '$2b$10$dElNDj5NEmctmnAnp7.qu.763zC5nOZEyZri9CpLdE0X4zPHP381a', 'user', '12 rue de la paix', 92100, 'paris', '8282882', '2020-06-23 16:03:46', '2020-06-23 16:03:46'),
(11, 'antoine', 'monesma', 'blabla@gmail.com', '$2b$10$bIMt9tljcwiPpa6NpaeKCuJk66H9/c9ZzLuMGzCOYA4wRShcvgAwS', 'admin', '8-10 rue kurwa', 75000, 'Kurwacity', '0214563258', '2020-06-26 15:52:53', '2020-06-26 15:52:53'),
(12, 'christophe', 'cgt du code', 'pasdemongodb@gmail.com', '$2b$10$3vYooe83JoVaUt0eov/f8.MX88tewt87QXoyfXcFH2yamzyCpgR4e', 'user', 'rue du sql', 59000, 'Lille', '0102030405', '2021-11-18 11:56:29', '2021-11-18 11:56:29'),
(13, 'makaveli', 'makaveli', 'mak@gmail.com', '$2b$10$4zh64EHAFkT507PZO6ulAO96eL0Hxc9YztS1qHb893KTh1CVmq6h2', 'user', 'rue des pommiers', 92260, 'Fontenay-aux-Roses', '0123456789', '2021-11-22 09:40:47', '2021-11-22 09:40:47'),
(14, 'Mike', 'Mike', 'mike@gmail.com', '$2b$10$vw6R8RFfp/wseD6PqmaKn.iMu3Tgzk18OGjRjlUruUo31wOmRfuuW', 'user', 'rue du renard', 75000, 'PAris', '0123456789', '2021-11-22 09:42:43', '2021-11-22 09:42:43'),
(15, 'jean', 'lassalle', 'paysan@gmail.com', '$2b$10$CaForRcbhyzzFDPeZpkUV.ld9Xr305CBVlYlhJ9syM4o0Y2BWe/P6', 'user', 'rue du champ', 1887, 'payoucity', '0102030405', '2021-11-22 11:20:46', '2021-11-22 11:20:46'),
(16, 'Louis', 'Alphand', 'alphandlouisofficiel@gmail.com', '$2b$10$ygHXKccEipzYeEooy6n/rOgNxb6n4whlCl9LjJCUZzOD35FNN6x0G', 'admin', '123456', 123456, 'Marseille', '0102030405', '2022-04-10 12:16:46', '2022-04-10 12:16:46'),
(23, 'Az', 'Az', 'az@gmail.com', '$2b$10$VggVYqvchra2Kdd8HDHfBOir0edJrPjTdsyfQetTziHlPfyMUKkHO', 'user', '123456', 123456, 'Marseille', '0102030405', '2022-04-17 11:49:30', '2022-04-17 11:49:30'),
(24, 'antoine', 'monesma', 'blabla@gmail.com', '$2b$10$BAxnxhJyMjLEV6.6Dz8mtOiQMuEolRIS0ZffUeeNn2vjFkW6W6sT2', 'admin', '10 rue de la castagne', 92170, 'Vanves', '0607080900', '2022-04-18 18:03:06', '2022-04-18 18:03:06'),
(25, 'Louis', 'Alphand', 'alphandlouisofficiel@gmail.com', '$2b$10$gY/5vtfwZESJYnj.D.grsOzeuktphZKeSwcewKTJBvmp3VgdMaSX2', 'user', '123456', 123456, 'Guéret ', '0784644094', '2023-03-18 14:46:30', '2023-03-18 14:46:30'),
(26, 'azerty', 'azerty', 'azerty@gmail.com', '$2b$10$rZDwHAFI/cjPnEhearePv.fQZuoUcZyvXGrMK3PoCpvfeqJHOmsPK', 'user', '123', 123, '123', '0102030405', '2023-03-18 15:19:30', '2023-03-18 15:19:30'),
(27, 'Louis', 'Alphand', 'alphandlouisofficiel@gmail.com', '$2b$10$gV53HPnFyH7YIBXbMgY7cO0IA0xQ.a8hv92Hypf5ne6J0Gw3bemiG', 'user', '123', 123, 'Guéret ', '0784644094', '2023-03-18 17:45:07', '2023-03-18 17:45:07'),
(28, 'qsdf', 'qsdf', 'qsdf@gmail.com', '$2b$10$cmiAgD6N5SEMSU9MgZEFKu7/5cmwDsvZF38Q.Vaf0R9.GUnxyOlIa', 'user', 'qsdf', 123, 'qsdf', '0102030405', '2023-03-18 17:46:48', '2023-03-18 17:46:48');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `pizzas`
--
ALTER TABLE `pizzas`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `orderdetails`
--
ALTER TABLE `orderdetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT pour la table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT pour la table `pizzas`
--
ALTER TABLE `pizzas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

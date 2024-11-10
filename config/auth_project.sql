-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : dim. 10 nov. 2024 à 17:58
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `auth_project`
--

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `email` varchar(30) NOT NULL,
  `phone` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `created_at`, `email`, `phone`) VALUES
(4, 'testuser', '$2b$10$64mONWnc7iuQtTI7Aqe2UOp9EwzumagiCd9Kwwm678ac4Mgz.lOtq', '2024-11-10 14:15:56', '', 0),
(6, 'ayari', '$2b$10$QJzMTlom4CMUeFSG/1a.zOJCOpYuvdvpYD4ZGyjPAp8ATSMrpbmcO', '2024-11-10 16:03:55', 'Ayarii@gmail.com', 298875444),
(7, 'ay', '$2b$10$Ucnso.EZ7IenfvU7iH7rqeHm4vvBQDwJdeG9ki6nAWyc5RO37aFZm', '2024-11-10 16:08:49', 'ayy', 2009987),
(8, 't', '$2b$10$lK5hLIZHWa3yoltTyIwcOek.TK4RE74Rt6fuYHrNaxgfU0VTqQ0Cq', '2024-11-10 16:40:07', 'tt', 2333);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

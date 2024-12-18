-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mer. 18 déc. 2024 à 17:44
-- Version du serveur : 9.1.0
-- Version de PHP : 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `db_geststudent`
--

-- --------------------------------------------------------

--
-- Structure de la table `cours`
--

DROP TABLE IF EXISTS `cours`;
CREATE TABLE IF NOT EXISTS `cours` (
  `id` bigint NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `reference` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `cours`
--

INSERT INTO `cours` (`id`, `nom`, `reference`) VALUES
(2, 'HISTOIRE', 'HIS2533'),
(3, 'EPS', 'EP2533'),
(4, 'PHYSIQUE', 'PHY2533'),
(5, 'PHILOSOPHIE', 'PHIL2533');

-- --------------------------------------------------------

--
-- Structure de la table `cours_seq`
--

DROP TABLE IF EXISTS `cours_seq`;
CREATE TABLE IF NOT EXISTS `cours_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `cours_seq`
--

INSERT INTO `cours_seq` (`next_val`) VALUES
(101);

-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

DROP TABLE IF EXISTS `etudiant`;
CREATE TABLE IF NOT EXISTS `etudiant` (
  `id` bigint NOT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `date_naissance` date DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `matricule` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `sexe` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `etudiant`
--

INSERT INTO `etudiant` (`id`, `adresse`, `date_naissance`, `email`, `matricule`, `nom`, `prenom`, `sexe`, `telephone`) VALUES
(52, 'Bingerville', '2001-01-22', 'elyseelohourou@gmailcom', '0070133', 'Lohourou', 'elisee', 'Masculin', '01 50 16 18 47'),
(53, 'Bingerville', '2003-04-12', 'kolochristian@gmailcom', '0070138', 'Toure', 'christian,', 'Masculin', '07 58 50 85 64');

-- --------------------------------------------------------

--
-- Structure de la table `etudiant_cours`
--

DROP TABLE IF EXISTS `etudiant_cours`;
CREATE TABLE IF NOT EXISTS `etudiant_cours` (
  `etudiant_id` bigint NOT NULL,
  `cours_id` bigint NOT NULL,
  PRIMARY KEY (`etudiant_id`,`cours_id`),
  KEY `FK8xoxpcrl5quoan1pdgv8mvrdi` (`cours_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `etudiant_seq`
--

DROP TABLE IF EXISTS `etudiant_seq`;
CREATE TABLE IF NOT EXISTS `etudiant_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `etudiant_seq`
--

INSERT INTO `etudiant_seq` (`next_val`) VALUES
(151);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `etudiant_cours`
--
ALTER TABLE `etudiant_cours`
  ADD CONSTRAINT `FK8xoxpcrl5quoan1pdgv8mvrdi` FOREIGN KEY (`cours_id`) REFERENCES `cours` (`id`),
  ADD CONSTRAINT `FKqtsuuvn21mdkme0gwu7cp0dyd` FOREIGN KEY (`etudiant_id`) REFERENCES `etudiant` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

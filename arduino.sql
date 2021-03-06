-- phpMyAdmin SQL Dump
-- version 4.5.4.1
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Ven 05 Octobre 2018 à 13:42
-- Version du serveur :  5.7.11
-- Version de PHP :  5.6.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `arduino`
--

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `ID` int(11) NOT NULL,
  `NOM` varchar(20) NOT NULL,
  `DESCRIPTION` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `categorie`
--

INSERT INTO `categorie` (`ID`, `NOM`, `DESCRIPTION`) VALUES
(1, 'BOARDS', ''),
(2, 'MODULES', ''),
(3, 'SHIELDS', ''),
(4, 'KITS', ''),
(5, 'ACCESORRIES', '');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `ID` int(11) NOT NULL,
  `ID_UTILISATEUR` int(11) NOT NULL,
  `DATE` date DEFAULT NULL,
  `LIVRAISON` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `commande`
--

INSERT INTO `commande` (`ID`, `ID_UTILISATEUR`, `DATE`, `LIVRAISON`) VALUES
(1, 1, '2018-09-26', ''),
(2, 1, '2018-09-25', ''),
(3, 1, '2018-10-05', 'gratuit'),
(4, 1, '2018-10-05', 'gratuit'),
(5, 1, '2018-10-05', 'gratuit');

-- --------------------------------------------------------

--
-- Structure de la table `ligne`
--

CREATE TABLE `ligne` (
  `ID` int(11) NOT NULL,
  `ID_COMMANDE` int(11) NOT NULL,
  `ID_PRODUIT` int(11) NOT NULL,
  `QUANTITE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `ligne`
--

INSERT INTO `ligne` (`ID`, `ID_COMMANDE`, `ID_PRODUIT`, `QUANTITE`) VALUES
(1, 1, 1000067, 1),
(2, 1, 1000057, 2),
(3, 2, 9000007, 1),
(12, 3, 1000015, 1),
(13, 3, 3, 2),
(14, 3, 1000005, 1),
(15, 4, 1000015, 3),
(16, 4, 3, 1),
(17, 4, 1000053, 1),
(18, 5, 1000015, 3),
(19, 5, 3, 1),
(20, 5, 1000053, 1);

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `ID` int(11) NOT NULL,
  `NOM` varchar(20) NOT NULL,
  `PRIX` decimal(10,0) NOT NULL,
  `DESCRIPTION` varchar(512) NOT NULL,
  `CATEGORIE` int(11) NOT NULL,
  `IMAGE` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `produit`
--

INSERT INTO `produit` (`ID`, `NOM`, `PRIX`, `DESCRIPTION`, `CATEGORIE`, `IMAGE`) VALUES
(3, 'Arduino Zero', '42', 'Arduino Zero is a simple and powerful 32-bit extension of the platform established by the UNO. This board aims to provide a platform for innovative projects in smart IoT devices, wearable technology, high-tech automation, crazy robotics, and much more.', 1, '00003_Ard_ZERO_featured_2.jpg'),
(1000005, 'Arduino Nano', '22', 'The Arduino Nano is a compact board similar to the UNO.', 2, '1000005_featured_2.jpg'),
(1000015, 'Arduino Mini USB', '13', 'Connect to your Arduino Mini or other breadboard projects easily with the Arduino Mini USB Adapter.', 5, '1000015_iso.jpg'),
(1000053, 'Arduino Micro', '20', 'Arduino Micro is the smallest board of the family, easy to integrate it in everyday objects to make them interactive.\r\nThe Micro is based on the ATmega32U4 microcontroller featuring a built-in USB which makes the Micro recognisable as a mouse or keyboard.', 2, '1000053_back_3_2.jpg'),
(1000057, 'Arduino Leonardo', '20', 'Similar to an Arduino UNO, can be recognized by computer as a mouse or keyboard.', 1, '1000057_featured_2.jpg'),
(1000066, 'Arduino Uno Rev3', '22', 'The UNO is the best board to get started with electronics and coding. If this is your first experience tinkering with the platform, the UNO is the most robust board you can start playing with. The UNO is the most used and documented board of the whole Arduino family.', 1, '1000066_front_3.jpg'),
(1000067, 'Arduino Mega 2560', '35', 'The MEGA 2560 is designed for more complex projects. With 54 digital I/O pins, 16 analog inputs and a larger space for your sketch it is the recommended board for 3D printers and robotics projects. This gives your projects plenty of room and opportunities.', 1, '1000067_featured_1_.jpg'),
(1000079, 'Arduino Motor Shield', '22', 'The Arduino Motor Shield allows your arduino to drive DC and stepper motors, relays and solenoids.', 3, '1000079_featured_2.jpg'),
(1000087, 'Arduino Mini 05', '20', 'The Arduino Mini is a very compact version of the Arduino Nano without an on-board USB to Serial connection', 2, '1000087_featured_2'),
(9000007, 'Arduino Starter Kit', '87', 'The Starter Kit is a great way to get started with Arduino, coding and electronics! The Starter Kit includes the components you need to make 15 fun projects following the step-by-step tutorials on the Project Book.', 4, '9000007_featured_.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `ID` int(11) NOT NULL,
  `COURRIEL` varchar(30) NOT NULL,
  `MOTDEPASSE` varchar(12) NOT NULL,
  `NOM` varchar(50) NOT NULL,
  `PRENOM` varchar(30) NOT NULL,
  `TELEPHONE` varchar(10) NOT NULL,
  `ADRESSE` varchar(50) NOT NULL,
  `VILLE` varchar(50) NOT NULL,
  `CODEPOSTAL` varchar(6) NOT NULL,
  `PROVINCE` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `utilisateur`
--

INSERT INTO `utilisateur` (`ID`, `COURRIEL`, `MOTDEPASSE`, `NOM`, `PRENOM`, `TELEPHONE`, `ADRESSE`, `VILLE`, `CODEPOSTAL`, `PROVINCE`) VALUES
(1, 'n.dzhingarova@gmail.com', 'niki123', 'desmeules', 'niki', '5467657788', '7777', 'laval', 'H7P2K1', 'Ã?le-du-Prince-Ã?douard'),
(2, 'd@d.com', 'darryl', 'darryl', 'desmeules', '5147019401', '3154', 'rue fernand', 'H7P2K1', 'QuÃ©bec');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_UTILISATEUR` (`ID_UTILISATEUR`);

--
-- Index pour la table `ligne`
--
ALTER TABLE `ligne`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_COMMANDE` (`ID_COMMANDE`),
  ADD KEY `ID_PRODUIT` (`ID_PRODUIT`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `CATEGORIE` (`CATEGORIE`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `COURRIEL` (`COURRIEL`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `commande`
--
ALTER TABLE `commande`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `ligne`
--
ALTER TABLE `ligne`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `commande_ibfk_1` FOREIGN KEY (`ID_UTILISATEUR`) REFERENCES `utilisateur` (`ID`) ON UPDATE CASCADE;

--
-- Contraintes pour la table `ligne`
--
ALTER TABLE `ligne`
  ADD CONSTRAINT `ligne_ibfk_2` FOREIGN KEY (`ID_PRODUIT`) REFERENCES `produit` (`ID`),
  ADD CONSTRAINT `ligne_ibfk_3` FOREIGN KEY (`ID_COMMANDE`) REFERENCES `commande` (`ID`);

--
-- Contraintes pour la table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `produit_ibfk_1` FOREIGN KEY (`CATEGORIE`) REFERENCES `categorie` (`ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

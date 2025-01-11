-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2025. Jan 11. 19:35
-- Kiszolgáló verziója: 10.4.27-MariaDB
-- PHP verzió: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `gazdanaplo`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `cms_news`
--

CREATE TABLE `cms_news` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `alias` varchar(32) DEFAULT NULL,
  `ordering` tinyint(3) UNSIGNED NOT NULL,
  `nav_name` varchar(32) NOT NULL,
  `content` text NOT NULL,
  `img` varchar(255) NOT NULL,
  `creation` datetime NOT NULL,
  `updating` datetime DEFAULT NULL,
  `description` text DEFAULT NULL,
  `keywords` text DEFAULT NULL,
  `states` tinyint(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `colors`
--

CREATE TABLE `colors` (
  `id` int(11) NOT NULL,
  `black` varchar(255) DEFAULT NULL,
  `brown` varchar(255) DEFAULT NULL,
  `white` varchar(255) DEFAULT NULL,
  `spotted` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `colors`
--

INSERT INTO `colors` (`id`, `black`, `brown`, `white`, `spotted`) VALUES
(1, 'Black', NULL, NULL, NULL),
(2, NULL, 'Brown', NULL, NULL),
(3, NULL, NULL, 'White', NULL),
(4, NULL, NULL, NULL, 'Spotted');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `cows`
--

CREATE TABLE `cows` (
  `id` int(11) NOT NULL,
  `ear_tag` varchar(255) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `mother_ear_tag` varchar(255) DEFAULT NULL,
  `father_ear_tag` varchar(255) DEFAULT NULL,
  `color_id` int(11) DEFAULT NULL,
  `vaccination_id` int(11) DEFAULT NULL,
  `birth_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `cows`
--

INSERT INTO `cows` (`id`, `ear_tag`, `gender`, `mother_ear_tag`, `father_ear_tag`, `color_id`, `vaccination_id`, `birth_date`) VALUES
(1, 'HU123460', 'M', 'HU123457', 'HU123458', 2, NULL, '2023-10-01'),
(2, 'HU123461', 'F', 'HU123459', 'HU123458', 1, NULL, '2023-11-01'),
(3, 'HU123462', 'M', 'HU123456', 'HU123457', 2, NULL, '2023-12-01'),
(4, 'HU123463', 'F', 'HU123459', 'HU123456', 1, NULL, '2024-01-01');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `death`
--

CREATE TABLE `death` (
  `id` int(11) NOT NULL,
  `cows_id` int(11) DEFAULT NULL,
  `death_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `sales`
--

CREATE TABLE `sales` (
  `id` int(11) NOT NULL,
  `cow_id` int(11) DEFAULT NULL,
  `sellers_id` int(11) DEFAULT NULL,
  `sale_date` date DEFAULT NULL,
  `price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `sellers`
--

CREATE TABLE `sellers` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `contact_info` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `user`
--

CREATE TABLE `user` (
  `id` tinyint(10) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `date_time` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `user`
--

INSERT INTO `user` (`id`, `email`, `password`, `date_time`) VALUES
(1, 'gyula@gmail.com', '$2y$10$v2VbZPJ2xzFWiO2j8I8X5ek.afUOSh1AhAdp1mBalQatuuxptNTJ.', '2025-01-11');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `vaccination_types`
--

CREATE TABLE `vaccination_types` (
  `id` int(11) NOT NULL,
  `cows_id` int(11) DEFAULT NULL,
  `vaccination_name` varchar(255) DEFAULT NULL,
  `vaccination_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `cms_news`
--
ALTER TABLE `cms_news`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `cows`
--
ALTER TABLE `cows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `color_id` (`color_id`);

--
-- A tábla indexei `death`
--
ALTER TABLE `death`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cows_id` (`cows_id`);

--
-- A tábla indexei `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cow_id` (`cow_id`),
  ADD KEY `sellers_id` (`sellers_id`);

--
-- A tábla indexei `sellers`
--
ALTER TABLE `sellers`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `vaccination_types`
--
ALTER TABLE `vaccination_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cows_id` (`cows_id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `cms_news`
--
ALTER TABLE `cms_news`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `colors`
--
ALTER TABLE `colors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT a táblához `cows`
--
ALTER TABLE `cows`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT a táblához `death`
--
ALTER TABLE `death`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `sellers`
--
ALTER TABLE `sellers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `user`
--
ALTER TABLE `user`
  MODIFY `id` tinyint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT a táblához `vaccination_types`
--
ALTER TABLE `vaccination_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `cows`
--
ALTER TABLE `cows`
  ADD CONSTRAINT `cows_ibfk_1` FOREIGN KEY (`color_id`) REFERENCES `colors` (`id`);

--
-- Megkötések a táblához `death`
--
ALTER TABLE `death`
  ADD CONSTRAINT `death_ibfk_1` FOREIGN KEY (`cows_id`) REFERENCES `cows` (`id`);

--
-- Megkötések a táblához `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`cow_id`) REFERENCES `cows` (`id`),
  ADD CONSTRAINT `sales_ibfk_2` FOREIGN KEY (`sellers_id`) REFERENCES `sellers` (`id`);

--
-- Megkötések a táblához `vaccination_types`
--
ALTER TABLE `vaccination_types`
  ADD CONSTRAINT `vaccination_types_ibfk_1` FOREIGN KEY (`cows_id`) REFERENCES `cows` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

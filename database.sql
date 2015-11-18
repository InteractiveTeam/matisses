-- phpMyAdmin SQL Dump
-- version 3.4.11.1deb2
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 17-11-2015 a las 21:18:16
-- Versión del servidor: 5.5.37
-- Versión de PHP: 5.4.4-14+deb7u11

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `prestashop_matisses16014`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_access`
--

CREATE TABLE IF NOT EXISTS `ps_access` (
  `id_profile` int(10) unsigned NOT NULL,
  `id_tab` int(10) unsigned NOT NULL,
  `view` int(11) NOT NULL,
  `add` int(11) NOT NULL,
  `edit` int(11) NOT NULL,
  `delete` int(11) NOT NULL,
  PRIMARY KEY (`id_profile`,`id_tab`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ps_access`
--

INSERT INTO `ps_access` (`id_profile`, `id_tab`, `view`, `add`, `edit`, `delete`) VALUES
(1, 0, 1, 1, 1, 1),
(1, 1, 1, 1, 1, 1),
(1, 2, 0, 0, 0, 0),
(1, 3, 0, 0, 0, 0),
(1, 4, 0, 0, 0, 0),
(1, 5, 1, 1, 1, 1),
(1, 6, 0, 0, 0, 0),
(1, 7, 1, 1, 1, 1),
(1, 8, 0, 0, 0, 0),
(1, 9, 1, 1, 1, 1),
(1, 10, 1, 1, 1, 1),
(1, 11, 1, 1, 1, 1),
(1, 12, 0, 0, 0, 0),
(1, 13, 1, 1, 1, 1),
(1, 14, 1, 1, 1, 1),
(1, 15, 1, 1, 1, 1),
(1, 16, 1, 1, 1, 1),
(1, 17, 0, 0, 0, 0),
(1, 18, 0, 0, 0, 0),
(1, 19, 1, 1, 1, 1),
(1, 20, 1, 1, 1, 1),
(1, 21, 1, 1, 1, 1),
(1, 22, 1, 1, 1, 1),
(1, 23, 1, 1, 1, 1),
(1, 24, 1, 1, 1, 1),
(1, 25, 1, 1, 1, 1),
(1, 26, 1, 1, 1, 1),
(1, 27, 1, 1, 1, 1),
(1, 28, 1, 1, 1, 1),
(1, 29, 1, 1, 1, 1),
(1, 30, 0, 0, 0, 0),
(1, 31, 1, 1, 1, 1),
(1, 32, 1, 1, 1, 1),
(1, 33, 1, 1, 1, 1),
(1, 34, 1, 1, 1, 1),
(1, 35, 1, 1, 1, 1),
(1, 36, 1, 1, 1, 1),
(1, 37, 0, 0, 0, 0),
(1, 38, 1, 1, 1, 1),
(1, 39, 1, 1, 1, 1),
(1, 40, 1, 1, 1, 1),
(1, 41, 1, 1, 1, 1),
(1, 42, 1, 1, 1, 1),
(1, 43, 0, 0, 0, 0),
(1, 44, 1, 1, 1, 1),
(1, 45, 1, 1, 1, 1),
(1, 46, 0, 0, 0, 0),
(1, 47, 0, 0, 0, 0),
(1, 48, 1, 1, 1, 1),
(1, 49, 0, 0, 0, 0),
(1, 50, 1, 1, 1, 1),
(1, 51, 0, 0, 0, 0),
(1, 52, 1, 1, 1, 1),
(1, 53, 1, 1, 1, 1),
(1, 54, 1, 1, 1, 1),
(1, 55, 1, 1, 1, 1),
(1, 56, 1, 1, 1, 1),
(1, 57, 1, 1, 1, 1),
(1, 58, 1, 1, 1, 1),
(1, 59, 1, 1, 1, 1),
(1, 60, 0, 0, 0, 0),
(1, 61, 1, 1, 1, 1),
(1, 62, 1, 1, 1, 1),
(1, 63, 1, 1, 1, 1),
(1, 64, 0, 0, 0, 0),
(1, 65, 0, 0, 0, 0),
(1, 66, 1, 1, 1, 1),
(1, 67, 1, 1, 1, 1),
(1, 68, 1, 1, 1, 1),
(1, 69, 1, 1, 1, 1),
(1, 70, 1, 1, 1, 1),
(1, 71, 1, 1, 1, 1),
(1, 72, 0, 0, 0, 0),
(1, 73, 1, 1, 1, 1),
(1, 74, 1, 1, 1, 1),
(1, 75, 1, 1, 1, 1),
(1, 76, 1, 1, 1, 1),
(1, 77, 1, 1, 1, 1),
(1, 78, 1, 1, 1, 1),
(1, 79, 0, 0, 0, 0),
(1, 80, 1, 1, 1, 1),
(1, 81, 1, 1, 1, 1),
(1, 82, 1, 1, 1, 1),
(1, 83, 1, 1, 1, 1),
(1, 84, 1, 1, 1, 1),
(1, 85, 0, 0, 0, 0),
(1, 86, 1, 1, 1, 1),
(1, 87, 1, 1, 1, 1),
(1, 88, 1, 1, 1, 1),
(1, 89, 1, 1, 1, 1),
(1, 90, 0, 0, 0, 0),
(1, 91, 0, 0, 0, 0),
(1, 92, 1, 1, 1, 1),
(1, 93, 1, 1, 1, 1),
(1, 94, 1, 1, 1, 1),
(1, 95, 1, 1, 1, 1),
(1, 96, 1, 1, 1, 1),
(1, 97, 0, 0, 0, 0),
(1, 98, 0, 0, 0, 0),
(1, 99, 1, 1, 1, 1),
(1, 100, 1, 1, 1, 1),
(1, 101, 1, 1, 1, 1),
(1, 102, 1, 1, 1, 1),
(1, 103, 1, 1, 1, 1),
(1, 104, 1, 1, 1, 1),
(1, 105, 1, 1, 1, 1),
(1, 106, 1, 1, 1, 1),
(2, 0, 1, 1, 1, 1),
(2, 1, 0, 0, 0, 0),
(2, 2, 0, 0, 0, 0),
(2, 3, 0, 0, 0, 0),
(2, 4, 0, 0, 0, 0),
(2, 5, 0, 0, 0, 0),
(2, 6, 0, 0, 0, 0),
(2, 7, 0, 0, 0, 0),
(2, 8, 0, 0, 0, 0),
(2, 9, 1, 1, 1, 1),
(2, 10, 1, 1, 1, 1),
(2, 11, 1, 1, 1, 1),
(2, 12, 0, 0, 0, 0),
(2, 13, 1, 0, 1, 0),
(2, 14, 1, 1, 1, 1),
(2, 15, 0, 0, 0, 0),
(2, 16, 0, 0, 0, 0),
(2, 17, 0, 0, 0, 0),
(2, 18, 0, 0, 0, 0),
(2, 19, 0, 0, 0, 0),
(2, 20, 1, 1, 1, 1),
(2, 21, 1, 1, 1, 1),
(2, 22, 1, 1, 1, 1),
(2, 23, 1, 1, 1, 1),
(2, 24, 0, 0, 0, 0),
(2, 25, 0, 0, 0, 0),
(2, 26, 0, 0, 0, 0),
(2, 27, 1, 1, 1, 1),
(2, 28, 0, 0, 0, 0),
(2, 29, 0, 0, 0, 0),
(2, 30, 1, 1, 1, 1),
(2, 31, 1, 1, 1, 1),
(2, 32, 1, 1, 1, 1),
(2, 33, 1, 1, 1, 1),
(2, 34, 1, 1, 1, 1),
(2, 35, 1, 1, 1, 1),
(2, 36, 0, 0, 0, 0),
(2, 37, 1, 1, 1, 1),
(2, 38, 1, 1, 1, 1),
(2, 39, 0, 0, 0, 0),
(2, 40, 0, 0, 0, 0),
(2, 41, 0, 0, 0, 0),
(2, 42, 0, 0, 0, 0),
(2, 43, 0, 0, 0, 0),
(2, 44, 0, 0, 0, 0),
(2, 45, 0, 0, 0, 0),
(2, 46, 0, 0, 0, 0),
(2, 47, 0, 0, 0, 0),
(2, 48, 1, 1, 1, 1),
(2, 49, 1, 1, 1, 1),
(2, 50, 0, 0, 0, 0),
(2, 51, 0, 0, 0, 0),
(2, 52, 0, 0, 0, 0),
(2, 53, 0, 0, 0, 0),
(2, 54, 0, 0, 0, 0),
(2, 55, 0, 0, 0, 0),
(2, 56, 0, 0, 0, 0),
(2, 57, 0, 0, 0, 0),
(2, 58, 0, 0, 0, 0),
(2, 59, 0, 0, 0, 0),
(2, 60, 1, 0, 1, 0),
(2, 61, 0, 0, 0, 0),
(2, 62, 0, 0, 0, 0),
(2, 63, 0, 0, 0, 0),
(2, 64, 0, 0, 0, 0),
(2, 65, 0, 0, 0, 0),
(2, 66, 0, 0, 0, 0),
(2, 67, 0, 0, 0, 0),
(2, 68, 0, 0, 0, 0),
(2, 69, 0, 0, 0, 0),
(2, 70, 0, 0, 0, 0),
(2, 71, 0, 0, 0, 0),
(2, 72, 0, 0, 0, 0),
(2, 73, 0, 0, 0, 0),
(2, 74, 0, 0, 0, 0),
(2, 75, 0, 0, 0, 0),
(2, 76, 0, 0, 0, 0),
(2, 77, 0, 0, 0, 0),
(2, 78, 0, 0, 0, 0),
(2, 79, 0, 0, 0, 0),
(2, 80, 0, 0, 0, 0),
(2, 81, 0, 0, 0, 0),
(2, 82, 0, 0, 0, 0),
(2, 83, 0, 0, 0, 0),
(2, 84, 0, 0, 0, 0),
(2, 85, 0, 0, 0, 0),
(2, 86, 0, 0, 0, 0),
(2, 87, 0, 0, 0, 0),
(2, 88, 0, 0, 0, 0),
(2, 89, 0, 0, 0, 0),
(2, 90, 0, 0, 0, 0),
(2, 91, 0, 0, 0, 0),
(2, 92, 0, 0, 0, 0),
(2, 93, 0, 0, 0, 0),
(2, 94, 1, 1, 1, 1),
(2, 95, 1, 1, 1, 1),
(2, 96, 1, 1, 1, 1),
(2, 97, 0, 0, 0, 0),
(2, 98, 0, 0, 0, 0),
(2, 99, 1, 1, 1, 1),
(2, 100, 1, 1, 1, 1),
(2, 101, 0, 0, 0, 0),
(2, 102, 0, 0, 0, 0),
(2, 103, 0, 0, 0, 0),
(2, 104, 0, 0, 0, 0),
(2, 105, 0, 0, 0, 0),
(2, 106, 0, 0, 0, 0),
(3, 0, 1, 1, 1, 1),
(3, 1, 0, 0, 0, 0),
(3, 2, 0, 0, 0, 0),
(3, 3, 0, 0, 0, 0),
(3, 4, 0, 0, 0, 0),
(3, 5, 1, 0, 0, 0),
(3, 6, 0, 0, 0, 0),
(3, 7, 0, 0, 0, 0),
(3, 8, 0, 0, 0, 0),
(3, 9, 1, 1, 1, 1),
(3, 10, 0, 0, 0, 0),
(3, 11, 0, 0, 0, 0),
(3, 12, 0, 0, 0, 0),
(3, 13, 0, 0, 0, 0),
(3, 14, 0, 0, 0, 0),
(3, 15, 1, 0, 0, 0),
(3, 16, 1, 0, 0, 0),
(3, 17, 0, 0, 0, 0),
(3, 18, 0, 0, 0, 0),
(3, 19, 0, 0, 0, 0),
(3, 20, 0, 0, 0, 0),
(3, 21, 1, 1, 1, 1),
(3, 22, 1, 1, 1, 1),
(3, 23, 0, 0, 0, 0),
(3, 24, 0, 0, 0, 0),
(3, 25, 0, 0, 0, 0),
(3, 26, 0, 0, 0, 0),
(3, 27, 0, 0, 0, 0),
(3, 28, 0, 0, 0, 0),
(3, 29, 0, 0, 0, 0),
(3, 30, 0, 0, 0, 0),
(3, 31, 0, 0, 0, 0),
(3, 32, 0, 0, 0, 0),
(3, 33, 0, 0, 0, 0),
(3, 34, 0, 0, 0, 0),
(3, 35, 0, 0, 0, 0),
(3, 36, 0, 0, 0, 0),
(3, 37, 0, 0, 0, 0),
(3, 38, 0, 0, 0, 0),
(3, 39, 0, 0, 0, 0),
(3, 40, 0, 0, 0, 0),
(3, 41, 0, 0, 0, 0),
(3, 42, 0, 0, 0, 0),
(3, 43, 0, 0, 0, 0),
(3, 44, 0, 0, 0, 0),
(3, 45, 0, 0, 0, 0),
(3, 46, 0, 0, 0, 0),
(3, 47, 0, 0, 0, 0),
(3, 48, 0, 0, 0, 0),
(3, 49, 0, 0, 0, 0),
(3, 50, 0, 0, 0, 0),
(3, 51, 0, 0, 0, 0),
(3, 52, 0, 0, 0, 0),
(3, 53, 0, 0, 0, 0),
(3, 54, 0, 0, 0, 0),
(3, 55, 0, 0, 0, 0),
(3, 56, 0, 0, 0, 0),
(3, 57, 0, 0, 0, 0),
(3, 58, 0, 0, 0, 0),
(3, 59, 1, 1, 1, 1),
(3, 60, 0, 0, 0, 0),
(3, 61, 0, 0, 0, 0),
(3, 62, 0, 0, 0, 0),
(3, 63, 0, 0, 0, 0),
(3, 64, 0, 0, 0, 0),
(3, 65, 0, 0, 0, 0),
(3, 66, 0, 0, 0, 0),
(3, 67, 0, 0, 0, 0),
(3, 68, 0, 0, 0, 0),
(3, 69, 0, 0, 0, 0),
(3, 70, 1, 1, 1, 1),
(3, 71, 0, 0, 0, 0),
(3, 72, 0, 0, 0, 0),
(3, 73, 0, 0, 0, 0),
(3, 74, 0, 0, 0, 0),
(3, 75, 0, 0, 0, 0),
(3, 76, 0, 0, 0, 0),
(3, 77, 0, 0, 0, 0),
(3, 78, 0, 0, 0, 0),
(3, 79, 0, 0, 0, 0),
(3, 80, 0, 0, 0, 0),
(3, 81, 0, 0, 0, 0),
(3, 82, 0, 0, 0, 0),
(3, 83, 0, 0, 0, 0),
(3, 84, 0, 0, 0, 0),
(3, 85, 0, 0, 0, 0),
(3, 86, 0, 0, 0, 0),
(3, 87, 0, 0, 0, 0),
(3, 88, 0, 0, 0, 0),
(3, 89, 0, 0, 0, 0),
(3, 90, 0, 0, 0, 0),
(3, 91, 0, 0, 0, 0),
(3, 92, 0, 0, 0, 0),
(3, 93, 0, 0, 0, 0),
(3, 94, 0, 0, 0, 0),
(3, 95, 0, 0, 0, 0),
(3, 96, 0, 0, 0, 0),
(3, 97, 0, 0, 0, 0),
(3, 98, 0, 0, 0, 0),
(3, 99, 0, 0, 0, 0),
(3, 100, 0, 0, 0, 0),
(3, 101, 0, 0, 0, 0),
(3, 102, 0, 0, 0, 0),
(3, 103, 0, 0, 0, 0),
(3, 104, 0, 0, 0, 0),
(3, 105, 0, 0, 0, 0),
(3, 106, 0, 0, 0, 0),
(4, 0, 1, 1, 1, 1),
(4, 1, 0, 0, 0, 0),
(4, 2, 0, 0, 0, 0),
(4, 3, 0, 0, 0, 0),
(4, 4, 0, 0, 0, 0),
(4, 5, 1, 0, 0, 0),
(4, 6, 0, 0, 0, 0),
(4, 7, 0, 0, 0, 0),
(4, 8, 0, 0, 0, 0),
(4, 9, 1, 1, 1, 1),
(4, 10, 1, 1, 1, 1),
(4, 11, 1, 1, 1, 1),
(4, 12, 0, 0, 0, 0),
(4, 13, 1, 0, 1, 0),
(4, 14, 0, 0, 0, 0),
(4, 15, 0, 0, 0, 0),
(4, 16, 0, 0, 0, 0),
(4, 17, 0, 0, 0, 0),
(4, 18, 0, 0, 0, 0),
(4, 19, 1, 1, 1, 1),
(4, 20, 1, 0, 0, 0),
(4, 21, 1, 1, 1, 1),
(4, 22, 1, 1, 1, 1),
(4, 23, 0, 0, 0, 0),
(4, 24, 0, 0, 0, 0),
(4, 25, 0, 0, 0, 0),
(4, 26, 1, 0, 0, 0),
(4, 27, 0, 0, 0, 0),
(4, 28, 0, 0, 0, 0),
(4, 29, 0, 0, 0, 0),
(4, 30, 1, 1, 1, 1),
(4, 31, 1, 1, 1, 1),
(4, 32, 0, 0, 0, 0),
(4, 33, 0, 0, 0, 0),
(4, 34, 1, 1, 1, 1),
(4, 35, 0, 0, 0, 0),
(4, 36, 1, 1, 1, 1),
(4, 37, 1, 1, 1, 1),
(4, 38, 1, 1, 1, 1),
(4, 39, 1, 1, 1, 1),
(4, 40, 1, 1, 1, 1),
(4, 41, 0, 0, 0, 0),
(4, 42, 0, 0, 0, 0),
(4, 43, 0, 0, 0, 0),
(4, 44, 0, 0, 0, 0),
(4, 45, 0, 0, 0, 0),
(4, 46, 0, 0, 0, 0),
(4, 47, 0, 0, 0, 0),
(4, 48, 0, 0, 0, 0),
(4, 49, 0, 0, 0, 0),
(4, 50, 0, 0, 0, 0),
(4, 51, 0, 0, 0, 0),
(4, 52, 0, 0, 0, 0),
(4, 53, 0, 0, 0, 0),
(4, 54, 0, 0, 0, 0),
(4, 55, 0, 0, 0, 0),
(4, 56, 0, 0, 0, 0),
(4, 57, 0, 0, 0, 0),
(4, 58, 0, 0, 0, 0),
(4, 59, 0, 0, 0, 0),
(4, 60, 1, 0, 1, 0),
(4, 61, 0, 0, 0, 0),
(4, 62, 0, 0, 0, 0),
(4, 63, 0, 0, 0, 0),
(4, 64, 0, 0, 0, 0),
(4, 65, 0, 0, 0, 0),
(4, 66, 0, 0, 0, 0),
(4, 67, 0, 0, 0, 0),
(4, 68, 0, 0, 0, 0),
(4, 69, 0, 0, 0, 0),
(4, 70, 0, 0, 0, 0),
(4, 71, 0, 0, 0, 0),
(4, 72, 0, 0, 0, 0),
(4, 73, 0, 0, 0, 0),
(4, 74, 0, 0, 0, 0),
(4, 75, 0, 0, 0, 0),
(4, 76, 0, 0, 0, 0),
(4, 77, 0, 0, 0, 0),
(4, 78, 0, 0, 0, 0),
(4, 79, 0, 0, 0, 0),
(4, 80, 0, 0, 0, 0),
(4, 81, 0, 0, 0, 0),
(4, 82, 0, 0, 0, 0),
(4, 83, 0, 0, 0, 0),
(4, 84, 1, 1, 1, 1),
(4, 85, 0, 0, 0, 0),
(4, 86, 0, 0, 0, 0),
(4, 87, 0, 0, 0, 0),
(4, 88, 0, 0, 0, 0),
(4, 89, 0, 0, 0, 0),
(4, 90, 0, 0, 0, 0),
(4, 91, 1, 1, 1, 1),
(4, 92, 0, 0, 0, 0),
(4, 93, 1, 1, 1, 1),
(4, 94, 0, 0, 0, 0),
(4, 95, 0, 0, 0, 0),
(4, 96, 0, 0, 0, 0),
(4, 97, 0, 0, 0, 0),
(4, 98, 0, 0, 0, 0),
(4, 99, 1, 0, 0, 0),
(4, 100, 0, 0, 0, 0),
(4, 101, 0, 0, 0, 0),
(4, 102, 0, 0, 0, 0),
(4, 103, 0, 0, 0, 0),
(4, 104, 0, 0, 0, 0),
(4, 105, 0, 0, 0, 0),
(4, 106, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_accessory`
--

CREATE TABLE IF NOT EXISTS `ps_accessory` (
  `id_product_1` int(10) unsigned NOT NULL,
  `id_product_2` int(10) unsigned NOT NULL,
  KEY `accessory_product` (`id_product_1`,`id_product_2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_address`
--

CREATE TABLE IF NOT EXISTS `ps_address` (
  `id_address` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_country` int(10) unsigned NOT NULL,
  `id_state` int(10) unsigned DEFAULT NULL,
  `id_customer` int(10) unsigned NOT NULL DEFAULT '0',
  `id_manufacturer` int(10) unsigned NOT NULL DEFAULT '0',
  `id_supplier` int(10) unsigned NOT NULL DEFAULT '0',
  `id_warehouse` int(10) unsigned NOT NULL DEFAULT '0',
  `alias` varchar(32) NOT NULL,
  `company` varchar(64) DEFAULT NULL,
  `lastname` varchar(32) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `address1` varchar(128) NOT NULL,
  `address2` varchar(128) DEFAULT NULL,
  `postcode` varchar(12) DEFAULT NULL,
  `city` varchar(64) NOT NULL,
  `other` text,
  `phone` varchar(32) DEFAULT NULL,
  `phone_mobile` varchar(32) DEFAULT NULL,
  `vat_number` varchar(32) DEFAULT NULL,
  `dni` varchar(16) DEFAULT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  `active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_address`),
  KEY `address_customer` (`id_customer`),
  KEY `id_country` (`id_country`),
  KEY `id_state` (`id_state`),
  KEY `id_manufacturer` (`id_manufacturer`),
  KEY `id_supplier` (`id_supplier`),
  KEY `id_warehouse` (`id_warehouse`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `ps_address`
--

INSERT INTO `ps_address` (`id_address`, `id_country`, `id_state`, `id_customer`, `id_manufacturer`, `id_supplier`, `id_warehouse`, `alias`, `company`, `lastname`, `firstname`, `address1`, `address2`, `postcode`, `city`, `other`, `phone`, `phone_mobile`, `vat_number`, `dni`, `date_add`, `date_upd`, `active`, `deleted`) VALUES
(1, 8, 0, 1, 0, 0, 0, 'Mon adresse', 'My Company', 'DOE', 'John', '16, Main street', '2nd floor', '75002', 'Paris ', '', '0102030405', '', '', '', '2015-06-22 10:29:14', '2015-06-22 10:29:14', 1, 0),
(2, 21, 32, 0, 0, 1, 0, 'supplier', 'Fashion', 'supplier', 'supplier', '767 Fifth Ave.', '', '10153', 'New York', '', '(212) 336-1440', '', '', '', '2015-06-22 10:29:14', '2015-06-22 10:29:14', 1, 0),
(3, 21, 32, 0, 1, 0, 0, 'manufacturer', 'Fashion', 'manufacturer', 'manufacturer', '767 Fifth Ave.', '', '10154', 'New York', '', '(212) 336-1666', '', '', '', '2015-06-22 10:29:14', '2015-06-22 10:29:14', 1, 0),
(4, 21, 9, 1, 0, 0, 0, 'My address', 'My Company', 'DOE', 'John', '16, Main street', '2nd floor', '33133', 'Miami', '', '0102030405', '', '', '', '2015-06-22 10:29:14', '2015-06-22 10:29:14', 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_address_format`
--

CREATE TABLE IF NOT EXISTS `ps_address_format` (
  `id_country` int(10) unsigned NOT NULL,
  `format` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_country`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ps_address_format`
--

INSERT INTO `ps_address_format` (`id_country`, `format`) VALUES
(1, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(2, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(3, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(4, 'firstname lastname\ncompany\naddress1\naddress2\ncity State:name postcode\nCountry:name\nphone\nphone_mobile'),
(5, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(6, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(7, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(8, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(9, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(10, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nState:name\nCountry:name\nphone\nphone_mobile'),
(11, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nState:name\nCountry:name\nphone\nphone_mobile'),
(12, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(13, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(14, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(15, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(16, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(17, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\ncity\npostcode\nCountry:name\nphone\nphone_mobile'),
(18, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(19, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(20, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(21, 'firstname lastname\ncompany\naddress1 address2\ncity, State:name postcode\nCountry:name\nphone\nphone_mobile'),
(22, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(23, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(24, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(25, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(26, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(27, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(28, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(29, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(30, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(31, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(32, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(33, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(34, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(35, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(36, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(37, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(38, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(39, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(40, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(41, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(42, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(43, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(44, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nState:name\nCountry:name\nphone\nphone_mobile'),
(45, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(46, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(47, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(48, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(49, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(50, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(51, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(52, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(53, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(54, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(55, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(56, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(57, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(58, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(59, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(60, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(61, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(62, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(63, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(64, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(65, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(66, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(67, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(68, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(69, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(70, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(71, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(72, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(73, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(74, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(75, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(76, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(77, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(78, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(79, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(80, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(81, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(82, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(83, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(84, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(85, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(86, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(87, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(88, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(89, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(90, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(91, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(92, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(93, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(94, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(95, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(96, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(97, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(98, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(99, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(100, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(101, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(102, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(103, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(104, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(105, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(106, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(107, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(108, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(109, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(110, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(111, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nState:name\nCountry:name\nphone\nphone_mobile'),
(112, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(113, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(114, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(115, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(116, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(117, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(118, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(119, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(120, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(121, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(122, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(123, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(124, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(125, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(126, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(127, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(128, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(129, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(130, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(131, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(132, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(133, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(134, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(135, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(136, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(137, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(138, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(139, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(140, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(141, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(142, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(143, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(144, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(145, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nState:name\nCountry:name\nphone\nphone_mobile'),
(146, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(147, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(148, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(149, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(150, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(151, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(152, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(153, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(154, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(155, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(156, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(157, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(158, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(159, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(160, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(161, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(162, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(163, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(164, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(165, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(166, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(167, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(168, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(169, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(170, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(171, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(172, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(173, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(174, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(175, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(176, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(177, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(178, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(179, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(180, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(181, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(182, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(183, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(184, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(185, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(186, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(187, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(188, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(189, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(190, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(191, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(192, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(193, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(194, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(195, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(196, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(197, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(198, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(199, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(200, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(201, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(202, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(203, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(204, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(205, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(206, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(207, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(208, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(209, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(210, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(211, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(212, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(213, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(214, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(215, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(216, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(217, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(218, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(219, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(220, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(221, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(222, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(223, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(224, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(225, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(226, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(227, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(228, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(229, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(230, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(231, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(232, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(233, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(234, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(235, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(236, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(237, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(238, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(239, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(240, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(241, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(242, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(243, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(244, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_advice`
--

CREATE TABLE IF NOT EXISTS `ps_advice` (
  `id_advice` int(11) NOT NULL AUTO_INCREMENT,
  `id_ps_advice` int(11) NOT NULL,
  `id_tab` int(11) NOT NULL,
  `ids_tab` text,
  `validated` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `hide` tinyint(1) NOT NULL DEFAULT '0',
  `location` enum('after','before') NOT NULL,
  `selector` varchar(255) DEFAULT NULL,
  `start_day` int(11) NOT NULL DEFAULT '0',
  `stop_day` int(11) NOT NULL DEFAULT '0',
  `weight` int(11) DEFAULT '1',
  PRIMARY KEY (`id_advice`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=141 ;

--
-- Volcado de datos para la tabla `ps_advice`
--

INSERT INTO `ps_advice` (`id_advice`, `id_ps_advice`, `id_tab`, `ids_tab`, `validated`, `hide`, `location`, `selector`, `start_day`, `stop_day`, `weight`) VALUES
(121, 324, 31, NULL, 0, 0, 'before', '.toolbar-placeholder:eq(0), form#invoice_date_form, form#product,  form#form-product, form#store,  form#form-store, form#category,  form#form-category', 0, 0, 1),
(122, 353, 59, NULL, 1, 0, 'before', '#typeTranslationForm', 0, 0, 1),
(123, 354, 1, NULL, 1, 0, 'before', 'addons', 0, 0, 1),
(124, 389, 0, NULL, 1, 0, 'before', '#upgradeButtonBlock', 0, 0, 1),
(125, 479, 21, NULL, 1, 0, 'before', '.toolbar-placeholder:eq(0), form#product, form#form-product', 0, 0, 1),
(126, 520, 1, NULL, 1, 0, 'after', '.dash_news', 0, 0, 1),
(127, 527, 1, NULL, 0, 0, 'after', '#dashtrends', 0, 0, 1),
(128, 532, 41, NULL, 1, 0, 'before', '.leadin:first', 0, 0, 1),
(129, 540, 30, NULL, 0, 0, 'after', '.leadin:first', 0, 0, 1),
(130, 548, 21, NULL, 0, 0, 'after', '.leadin:first', 0, 0, 1),
(131, 555, 1, NULL, 1, 0, 'after', '.dash_news', 0, 0, 1),
(132, 556, 1, NULL, 1, 0, 'after', '.dash_news', 0, 0, 1),
(133, 570, 1, NULL, 1, 0, 'after', '.dash_news', 0, 0, 1),
(134, 571, 9, NULL, 0, 0, 'before', '.leadin:first', 0, 0, 1),
(135, 581, 38, NULL, 1, 0, 'before', '.leadin:first', 0, 0, 1),
(136, 582, 38, NULL, 1, 0, 'before', '.leadin:first', 0, 0, 1),
(137, 659, 1, NULL, 1, 0, 'after', '#dashtrends', 0, 0, 1),
(138, 660, 1, NULL, 1, 0, 'after', '#dashtrends', 0, 0, 1),
(139, 666, 1, NULL, 1, 0, 'after', '#dashtrends', 0, 0, 1),
(140, 669, 1, NULL, 1, 0, 'after', '#dashtrends', 0, 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_advice_lang`
--

CREATE TABLE IF NOT EXISTS `ps_advice_lang` (
  `id_advice` int(11) NOT NULL,
  `id_lang` int(11) NOT NULL,
  `html` text,
  PRIMARY KEY (`id_advice`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ps_advice_lang`
--

INSERT INTO `ps_advice_lang` (`id_advice`, `id_lang`, `html`) VALUES
(121, 1, '<div id="wrap_id_advice_324" ><style>\r\n.hide{display:none}.text-right{text-align:right}.text-left{text-align:left}.text-center{text-align:center}hr.clear{visibility:hidden;margin-bottom:20px}.gamification-tip{width:100%;height:40px;margin:0 0 20px 0;position:relative;line-height:43px;background-color:#f8f8f8;border-bottom:solid 5px #d2d2d2}.gamification-tip div.gamification-tip-title{position:absolute;top:0;left:0;height:40px;width:90px;padding:0 0 0 40px;background:url("https://gamification.prestashop.com/images/interface/gamification-lightbulb.png") 10px 5px no-repeat;color:#556e26;font-size:14px;font-weight:bold}.gamification-tip div.gamification-tip-description-container{height:40px;padding:0 130px 0 130px;display:table-cell;vertical-align:middle;font-size:13px;color:#666666;background:url("https://gamification.prestashop.com/images/interface/gamification-tip-bg.png") 100px top no-repeat}.gamification-tip div.gamification-tip-description-container span.gamification-tip-description{display:inline-block;line-height:15px;max-height:30px;overflow:hidden}.gamification-tip span.gamification-tip-cta{position:absolute;line-height:43px;height:40px;width:70px;top:0;right:0;padding:0 10px 0 30px;border-bottom:solid 5px #739334;background:url("https://gamification.prestashop.com/images/interface/gamification-cta-bg.png") left top no-repeat #a6c964}.gamification-tip span.gamification-tip-cta a{display:inline-block;width:100%;font-size:14px;text-transform:uppercase;font-weight:bold;text-shadow:rgba(255, 255, 255, 0.5) 0 1px 0;color:#556e26;background:url("https://gamification.prestashop.com/images/interface/gamification-popin.png") right 10px no-repeat}.gamification-tip-infobox{padding:0 20px 20px 20px;position:relative}.gamification-tip-infobox .gamification-tip-infobox-title{display:inline-block;margin:0 0 20px -20px;width:100%;padding:10px 20px 5px;border-bottom:solid 3px #739334;font:800 18px/20px arial;text-transform:uppercase;color:#556e26;background-color:#e7f0d6}.gamification-tip-infobox .gamification-tip-infobox-title span.gamification-tip-infobox-title-prefix{display:inline-block;height:40px;padding-left:30px;line-height:40px;text-transform:none;font-size:16px;font-weight:500;margin-right:10px;background:url("https://gamification.prestashop.com/images/interface/gamification-lightbulb.png") left top no-repeat}.gamification-tip-infobox .gamification-tip-infobox-content{display:block;width:100%}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-image{float:left;width:170px;height:200px;background:url("https://gamification.prestashop.com/images/interface/gamification-infobox-separator.png") no-repeat right center}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-description{float:left;width:370px;padding:0 0 25px 25px}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-description p{line-height:20px}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-description ul li{padding:0 0 0 20px;line-height:25px;background:url("https://gamification.prestashop.com/images/interface/gamification-bullet-check.png") left center no-repeat}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-controls{padding:20px 0 0 0}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-controls a.button{display:inline-block;height:30px;padding:0 20px;margin-right:10px;border:none;border-bottom:solid 3px #ababab;line-height:33px;text-transform:uppercase;font-weight:bold;color:#929292;text-shadow:rgba(255, 255, 255, 0.5) 0 1px 0;border-radius:3px;background:#d2d2d2}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-controls a.button.success{color:#384819;background:#a6c964;border-color:#739334;text-shadow:rgba(255, 255, 255, 0.5) 0 1px 0}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-controls a.button:hover{color:#f8f8f8;background:#5f5f5f;border-color:#2c2c2c;text-shadow:rgba(0, 0, 0, 0.5) 0 1px 0}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-controls a.button:active{color:white;background:#2c2c2c;border-color:black;text-shadow:rgba(0, 0, 0, 0.5) 0 1px 0}.gamification-tip-infobox a.infobox-close{display:inline-block;width:14px;height:14px;position:absolute;top:20px;right:20px;text-indent:-9999px;background:url("https://gamification.prestashop.com/images/interface/gamification-infobox-close.png") no-repeat}\r\n</style>\r\n<hr class="clear"/>\r\n<div class="gamification-tip">\r\n	<div class="gamification-tip-title">Astucia</div>\r\n	<span class="gamification-tip-cta"><a class="gamification_fancybox"  id="324" href="#advice_content_324">Màs</a></span>\r\n\r\n	<div class="gamification-tip-description-container">\r\n		<span class="gamification-tip-description">\r\n			¿Necesitas ayuda? Aprende a usar el Back Office y crear tu tienda online de forma rápida y sin moverte, siguiendo nuestra formación usuario en línea!\r\n		</span>\r\n	</div>\r\n	<div class="hide">\r\n		<div id="advice_content_324" class="gamification-tip-infobox">\r\n			<div class="gamification-tip-infobox-title">\r\n				<span class="gamification-tip-infobox-title-prefix"> </span>\r\n				 Formación Usuario en línea\r\n			</div>\r\n			<div class="gamification-tip-infobox-content">\r\n				<div class="gamification-tip-infobox-content-image">\r\n					<img src="https://gamification.prestashop.com/api/getAdviceImg/324.png" alt="logo">\r\n				</div>\r\n				<div class="gamification-tip-infobox-content-description">\r\n					<p>Eres un nuevo comerciante y quieres aprender a usar el Back Office, descubrir las funcionalidades principales de PrestaShop para lanzar tu tienda en línea rápidamente! No pierde tiempo, participa en la formación en línea completa de Usuario animada por nuestro formador-experto PrestaShop, sin salir de tu casa!</p>\r\n					<div class="gamification-tip-infobox-content-controls right">\r\n						<a href="javascript:$.fancybox.close();" class="button">Cerca</a>\r\n						<a href="https://gamification.prestashop.com/get_advice_link.php?id_advice=324&url=http%3A%2F%2Fwww.prestashop.com%2Fes%2Fformacion-prestashop%3Futm_source%3Dback-office%26utm_medium%3Dtraining%26utm_campaign%3Dback-office-ES%23training_11"  class="button success" target="_blank">Saber màs</a>\r\n					</div>\r\n				</div>\r\n			</div>\r\n		</div>\r\n	</div>\r\n</div>\r\n\r\n<script>\r\n	$(document).ready( function () {\r\n		$(''.gamification_fancybox'').bind(''click'', function () {\r\n			id_advice = 324;			\r\n			popin_url = ''https://gamification.prestashop.com/get_advice_link.php?id_advice=''+id_advice+''&url='';\r\n			$(''.gamification-tip-infobox'').after(''<img style="display:none" src="https://gamification.prestashop.com/api/getAdvicePopinImg/''+id_advice+''.png" />'');\r\n		});\r\n	});\r\n</script>\r\n</div>'),
(122, 1, '<div id="wrap_id_advice_353" ><style>\r\n.hide{display:none}.text-right{text-align:right}.text-left{text-align:left}.text-center{text-align:center}hr.clear{visibility:hidden;margin-bottom:20px}.gamification-tip{width:100%;height:40px;margin:0 0 20px 0;position:relative;line-height:43px;background-color:#f8f8f8;border-bottom:solid 5px #d2d2d2}.gamification-tip div.gamification-tip-title{position:absolute;top:0;left:0;height:40px;width:90px;padding:0 0 0 40px;background:url("https://gamification.prestashop.com/images/interface/gamification-lightbulb.png") 10px 5px no-repeat;color:#556e26;font-size:14px;font-weight:bold}.gamification-tip div.gamification-tip-description-container{height:40px;padding:0 130px 0 130px;display:table-cell;vertical-align:middle;font-size:13px;color:#666666;background:url("https://gamification.prestashop.com/images/interface/gamification-tip-bg.png") 100px top no-repeat}.gamification-tip div.gamification-tip-description-container span.gamification-tip-description{display:inline-block;line-height:15px;max-height:30px;overflow:hidden}.gamification-tip span.gamification-tip-cta{position:absolute;line-height:43px;height:40px;width:70px;top:0;right:0;padding:0 10px 0 30px;border-bottom:solid 5px #739334;background:url("https://gamification.prestashop.com/images/interface/gamification-cta-bg.png") left top no-repeat #a6c964}.gamification-tip span.gamification-tip-cta a{display:inline-block;width:100%;font-size:14px;text-transform:uppercase;font-weight:bold;text-shadow:rgba(255, 255, 255, 0.5) 0 1px 0;color:#556e26;background:url("https://gamification.prestashop.com/images/interface/gamification-popin.png") right 10px no-repeat}.gamification-tip-infobox{padding:0 20px 20px 20px;position:relative}.gamification-tip-infobox .gamification-tip-infobox-title{display:inline-block;margin:0 0 20px -20px;width:100%;padding:10px 20px 5px;border-bottom:solid 3px #739334;font:800 18px/20px arial;text-transform:uppercase;color:#556e26;background-color:#e7f0d6}.gamification-tip-infobox .gamification-tip-infobox-title span.gamification-tip-infobox-title-prefix{display:inline-block;height:40px;padding-left:30px;line-height:40px;text-transform:none;font-size:16px;font-weight:500;margin-right:10px;background:url("https://gamification.prestashop.com/images/interface/gamification-lightbulb.png") left top no-repeat}.gamification-tip-infobox .gamification-tip-infobox-content{display:block;width:100%}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-image{float:left;width:170px;height:200px;background:url("https://gamification.prestashop.com/images/interface/gamification-infobox-separator.png") no-repeat right center}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-description{float:left;width:370px;padding:0 0 25px 25px}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-description p{line-height:20px}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-description ul li{padding:0 0 0 20px;line-height:25px;background:url("https://gamification.prestashop.com/images/interface/gamification-bullet-check.png") left top no-repeat}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-controls{padding:20px 0 0 0}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-controls a.button{display:inline-block;height:30px;padding:0 20px;margin-right:10px;border:none;border-bottom:solid 3px #ababab;line-height:33px;text-transform:uppercase;font-weight:bold;color:#929292;text-shadow:rgba(255, 255, 255, 0.5) 0 1px 0;border-radius:3px;background:#d2d2d2}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-controls a.button.success{color:#384819;background:#a6c964;border-color:#739334;text-shadow:rgba(255, 255, 255, 0.5) 0 1px 0}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-controls a.button:hover{color:#f8f8f8;background:#5f5f5f;border-color:#2c2c2c;text-shadow:rgba(0, 0, 0, 0.5) 0 1px 0}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-controls a.button:active{color:white;background:#2c2c2c;border-color:black;text-shadow:rgba(0, 0, 0, 0.5) 0 1px 0}.gamification-tip-infobox a.infobox-close{display:inline-block;width:14px;height:14px;position:absolute;top:20px;right:20px;text-indent:-9999px;background:url("https://gamification.prestashop.com/images/interface/gamification-infobox-close.png") no-repeat}\r\n</style>\r\n<hr class="clear"/>\r\n<div id="advice-16">\r\n<div class="gamification-tip">\r\n	<div class="gamification-tip-title">Advice</div>\r\n	<span class="gamification-tip-cta"><a class="" href="https://gamification.prestashop.com/get_advice_link.php?id_advice=353&url=http%3A%2F%2Fcrowdin.net%2Fproject%2Fprestashop-official%2F">Join</a><a class="gamification_close" style="display:none"  id="353" href="#advice_content_353">close</a></span>\r\n	<div class="gamification-tip-description-container">\r\n		<span class="gamification-tip-description">\r\n			Help us translate PrestaShop 1.6 into your language by <a href="https://gamification.prestashop.com/get_advice_link.php?id_advice=353&url=http%3A%2F%2Fcrowdin.net%2Fproject%2Fprestashop-official%2F">joining us on Crowdin</a>!\r\n		</span>\r\n<div style="display:none"><img src="https://gamification.prestashop.com/api/getAdviceImg/353.png" /></div>\r\n	</div>\r\n</div>\r\n</div>\r\n</div>'),
(123, 1, '<div id="wrap_id_advice_354" ><style>\r\n#wrap_id_advice_354 .panel.panel-advice { position: relative; padding: 10px !important; min-height: 75px; }\r\n#wrap_id_advice_354 .panel.panel-advice a.preactivationLink { display: table; margin: 0; text-decoration: none; }\r\n#wrap_id_advice_354 .panel.panel-advice a.preactivationLink p, .panel.panel-advice a.preactivationLink img { display: table-cell; vertical-align: middle; }\r\n#wrap_id_advice_354 .panel.panel-advice a.preactivationLink p { padding: 0 20px; }\r\n#wrap_id_advice_354 .panel.panel-advice .gamification-close-confirmation { position: absolute; top: 4px; right: 5px; background: #FFF; padding: 5px 3px;}\r\n#wrap_id_advice_354 .panel.panel-advice .gamification_premium_close i { color: #00aff0; }\r\n#wrap_id_advice_354 .panel.panel-advice:hover .gamification_premium_close { display: block; }\r\n</style>\r\n<div class="col-lg-6">\r\n	<section id="" class="panel panel-advice">\r\n		<a class="preactivationLink row" rel="ebay" href="https://gamification.prestashop.com/get_advice_link.php?id_advice=321&url=http%3A%2F%2Faddons.prestashop.com">\r\n			<img src="https://gamification.prestashop.com/api/getAdviceImg/354.png" class="advice-img img-thumbnail">\r\n			<p class="advice-description">Más de 3 500 módulos y temas PrestaShop ¡para vender más desde hoy mismo!</p>\r\n		</a>\r\n	</section>\r\n</div>\r\n</div>'),
(124, 1, '<div id="wrap_id_advice_389" ><style>\n.hide{display:none}.text-right{text-align:right}.text-left{text-align:left}.text-center{text-align:center}hr.clear{visibility:hidden;margin-bottom:20px}.gamification-tip{width:100%;height:40px;margin:0 0 20px 0;position:relative;line-height:43px;background-color:#f8f8f8;border-bottom:solid 5px #d2d2d2}.gamification-tip div.gamification-tip-title{position:absolute;top:0;left:0;height:40px;width:90px;padding:0 0 0 40px;background:url("https://gamification.prestashop.com/images/interface/gamification-lightbulb.png") 10px 5px no-repeat;color:#556e26;font-size:14px;font-weight:bold}.gamification-tip div.gamification-tip-description-container{height:40px;padding:0 130px 0 130px;display:table-cell;vertical-align:middle;font-size:13px;color:#666666;background:url("https://gamification.prestashop.com/images/interface/gamification-tip-bg.png") 100px top no-repeat}.gamification-tip div.gamification-tip-description-container span.gamification-tip-description{display:inline-block;line-height:15px;max-height:30px;overflow:hidden}.gamification-tip span.gamification-tip-cta{position:absolute;line-height:43px;height:40px;width:70px;top:0;right:0;padding:0 10px 0 30px;border-bottom:solid 5px #739334;background:url("https://gamification.prestashop.com/images/interface/gamification-cta-bg.png") left top no-repeat #a6c964}.gamification-tip span.gamification-tip-cta a{display:inline-block;width:100%;font-size:14px;text-transform:uppercase;font-weight:bold;text-shadow:rgba(255, 255, 255, 0.5) 0 1px 0;color:#556e26;background:url("https://gamification.prestashop.com/images/interface/gamification-popin.png") right 10px no-repeat}.gamification-tip-infobox{padding:0 20px 20px 20px;position:relative}.gamification-tip-infobox .gamification-tip-infobox-title{display:inline-block;margin:0 0 20px -20px;width:100%;padding:10px 20px 5px;border-bottom:solid 3px #739334;font:800 18px/20px arial;text-transform:uppercase;color:#556e26;background-color:#e7f0d6}.gamification-tip-infobox .gamification-tip-infobox-title span.gamification-tip-infobox-title-prefix{display:inline-block;height:40px;padding-left:30px;line-height:40px;text-transform:none;font-size:16px;font-weight:500;margin-right:10px;background:url("https://gamification.prestashop.com/images/interface/gamification-lightbulb.png") left top no-repeat}.gamification-tip-infobox .gamification-tip-infobox-content{display:block;width:100%}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-image{float:left;width:120px;height:200px;background:url("https://gamification.prestashop.com/images/interface/gamification-infobox-separator.png") no-repeat right center}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-description{float:left;width:430px;padding:0 0 25px 25px}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-description p{line-height:20px}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-description ul li{padding:0 0 0 20px;line-height:25px;background:url("https://gamification.prestashop.com/images/interface/gamification-bullet-check.png") left center no-repeat}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-controls{padding:20px 0 0 0}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-controls a.button{display:inline-block;height:30px;padding:0 20px;margin-right:10px;border:none;border-bottom:solid 3px #ababab;line-height:33px;text-transform:uppercase;font-weight:bold;color:#929292;text-shadow:rgba(255, 255, 255, 0.5) 0 1px 0;border-radius:3px;background:#d2d2d2}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-controls a.button.success{color:#384819;background:#a6c964;border-color:#739334;text-shadow:rgba(255, 255, 255, 0.5) 0 1px 0}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-controls a.button:hover{color:#f8f8f8;background:#5f5f5f;border-color:#2c2c2c;text-shadow:rgba(0, 0, 0, 0.5) 0 1px 0}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-controls a.button:active{color:white;background:#2c2c2c;border-color:black;text-shadow:rgba(0, 0, 0, 0.5) 0 1px 0}.gamification-tip-infobox a.infobox-close{display:inline-block;width:14px;height:14px;position:absolute;top:20px;right:20px;text-indent:-9999px;background:url("https://gamification.prestashop.com/images/interface/gamification-infobox-close.png") no-repeat}\n</style>\n<hr class="clear"/>\n<div id="advice-16">\n<div class="gamification-tip">\n	<img style="display:none" src="https://gamification.prestashop.com/api/getAdviceImg/389.png" />\n	<div class="gamification-tip-title">Truco</div>\n	<span class="gamification-tip-cta"><a class="gamification_fancybox"  id="389" href="http://www.prestashop.com/club/?utm_source=back-office&utm_medium=gamification" target="_blank">Learn more</a><a class="gamification_close" style="display:none"  id="389" href="#advice_content_389">Cerrar</a></span>\n	<div class="gamification-tip-description-container">\n		<span class="gamification-tip-description">\n			About to upgrade? How about giving your opinion on future releases before anyone else?		</span>\n	</div>\n</div>\n</div></div>'),
(125, 1, '<div id="wrap_id_advice_479" ><style>\n.hide{display:none}.text-right{text-align:right}.text-left{text-align:left}.text-center{text-align:center}hr.clear{visibility:hidden;margin-bottom:20px}.gamification-tip{width:100%;height:40px;margin:0 0 20px 0;position:relative;line-height:43px;background-color:#f8f8f8;border-bottom:solid 5px #d2d2d2}.gamification-tip div.gamification-tip-title{position:absolute;top:0;left:0;height:40px;width:90px;padding:0 0 0 40px;background:url("https://gamification.prestashop.com/images/interface/gamification-lightbulb.png") 10px 5px no-repeat;color:#556e26;font-size:14px;font-weight:bold}.gamification-tip div.gamification-tip-description-container{height:40px;padding:0 130px 0 130px;display:table-cell;vertical-align:middle;font-size:13px;color:#666666;background:url("https://gamification.prestashop.com/images/interface/gamification-tip-bg.png") 100px top no-repeat}.gamification-tip div.gamification-tip-description-container span.gamification-tip-description{display:inline-block;line-height:15px;max-height:30px;overflow:hidden}.gamification-tip span.gamification-tip-cta{position:absolute;line-height:43px;height:40px;width:70px;top:0;right:0;padding:0 10px 0 30px;border-bottom:solid 5px #739334;background:url("https://gamification.prestashop.com/images/interface/gamification-cta-bg.png") left top no-repeat #a6c964}.gamification-tip span.gamification-tip-cta a{display:inline-block;width:100%;font-size:14px;text-transform:uppercase;font-weight:bold;text-shadow:rgba(255, 255, 255, 0.5) 0 1px 0;color:#556e26;background:url("https://gamification.prestashop.com/images/interface/gamification-popin.png") right 10px no-repeat}.gamification-tip-infobox{padding:0 20px 20px 20px;position:relative}.gamification-tip-infobox .gamification-tip-infobox-title{display:inline-block;margin:0 0 20px -20px;width:100%;padding:10px 20px 5px;border-bottom:solid 3px #739334;font:800 18px/20px arial;text-transform:uppercase;color:#556e26;background-color:#e7f0d6}.gamification-tip-infobox .gamification-tip-infobox-title span.gamification-tip-infobox-title-prefix{display:inline-block;height:40px;padding-left:30px;line-height:40px;text-transform:none;font-size:16px;font-weight:500;margin-right:10px;background:url("https://gamification.prestashop.com/images/interface/gamification-lightbulb.png") left top no-repeat}.gamification-tip-infobox .gamification-tip-infobox-content{display:block;width:100%}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-image{float:left;width:120px;height:200px;background:url("https://gamification.prestashop.com/images/interface/gamification-infobox-separator.png") no-repeat right center}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-description{float:left;width:430px;padding:0 0 25px 25px}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-description p{line-height:20px}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-description ul li{padding:0 0 0 20px;line-height:25px;background:url("https://gamification.prestashop.com/images/interface/gamification-bullet-check.png") left center no-repeat}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-controls{padding:20px 0 0 0}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-controls a.button{display:inline-block;height:30px;padding:0 20px;margin-right:10px;border:none;border-bottom:solid 3px #ababab;line-height:33px;text-transform:uppercase;font-weight:bold;color:#929292;text-shadow:rgba(255, 255, 255, 0.5) 0 1px 0;border-radius:3px;background:#d2d2d2}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-controls a.button.success{color:#384819;background:#a6c964;border-color:#739334;text-shadow:rgba(255, 255, 255, 0.5) 0 1px 0}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-controls a.button:hover{color:#f8f8f8;background:#5f5f5f;border-color:#2c2c2c;text-shadow:rgba(0, 0, 0, 0.5) 0 1px 0}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-controls a.button:active{color:white;background:#2c2c2c;border-color:black;text-shadow:rgba(0, 0, 0, 0.5) 0 1px 0}.gamification-tip-infobox a.infobox-close{display:inline-block;width:14px;height:14px;position:absolute;top:20px;right:20px;text-indent:-9999px;background:url("https://gamification.prestashop.com/images/interface/gamification-infobox-close.png") no-repeat}\n</style>\n<hr class="clear"/>\n<div id="advice-16">\n<div class="gamification-tip">\n	<img style="display:none" src="https://gamification.prestashop.com/api/getAdviceImg/479.png" />\n	<div class="gamification-tip-title">Truco</div>\n	<span class="gamification-tip-cta"><a class="gamification_fancybox"  id="479" href="http://addons.prestashop.com/en/administration-tools-prestashop-modules/2937-store-manager-for-prestashop.html" target="_blank">Leer</a><a class="gamification_close" style="display:none"  id="479" href="#advice_content_479">Cerrar</a></span>\n	<div class="gamification-tip-description-container">\n		<span class="gamification-tip-description">\n			Un 9% de ejecutivos están satisfechos con cómo utilizan su tiempo en su trabajo.		</span>\n	</div>\n</div>\n</div></div>'),
(126, 1, '<div id="wrap_id_advice_520" >\n		<section id="0_sendinblue" class="panel " style="display:none">\n			<header class="panel-heading">\n				<span class="icon-lightbulb"></span> Consejo del día</header>\n			<div class="panel-body" style="padding:0">\n				<img class="img-responsive" src="https://api.prestashop.com/partner/tipsoftheday/img/logo-sendinblue.png" style="float:right; margin-left: 5px;">\n				<img src="https://gamification.prestashop.com/api/getAdviceImg/520.png"/>\n				<p><b>¿Sabías que fidelizar a un cliente cuesta cinco veces menos que conseguir otro?</b></p>\n				<p>¿Quieres mantener a tus clientes informados de las novedades y ofertas de una forma eficaz y asequible? Envíales emails y SMS con SendinBlue. ¡Pruébalo gratis!</p>\n				<span class="text-right" style="float:right">\n					<a class="btn btn-default" target="_blank" href="https://gamification.prestashop.com/get_advice_link.php?id_advice=520&url=http%3A%2F%2Faddons.prestashop.com%2Fes%2Fpublicidad-marketing-newsletter-modulos%2F8300-mailinblue.html%3Futm_source%3Dback-office%26utm_medium%3Dtipoftheday%26utm_campaign%3Dpartenariats%26utm_content%3Dsendinblue">¿Quieres saber más?</a>\n				</span>\n			</div>\n		</section>\n			<script>\n			$(document).ready( function () {\n				$(''#''+rand(0)+''_sendinblue'').show();\n			});\n\n			function rand(nbr){\n			   return Math.floor(Math.random()*(nbr+1));\n			}\n			</script>\n			</div>'),
(127, 1, '<div id="wrap_id_advice_527" >\n	<div class="col-lg-6">\n		<section id="" class="panel panel-advice">\n			<a href="#" id="527" class="close_link gamification_premium_close">\n				<i class="icon-remove"></i>\n			</a>\n			<span class="gamification-close-confirmation hide">\n				¿Está seguro?\n				<button class="btn btn-default btn-sm" data-advice="delete"><i class="icon-trash"></i> Eliminar</button>\n				<button class="btn btn-default btn-sm" data-advice="cancel">Cancelar</button>\n			</span>\n			<a class="preactivationLink row" rel="payulatam" href="{link}AdminModules{/link}&install=payulatam&module_name=payulatam&redirectconfig">\n				<img src="https://api.prestashop.com/partner/premium/images/payulatam.png" class="advice-img img-thumbnail">\n				<img src="https://gamification.prestashop.com/api/getAdviceImg/527.png"/ class="hide">\n				<p class="advice-description">La solución más fácil para recibir pagos en línea en América Latina<br/></p>\n			</a>\n		</section>\n	</div></div>'),
(128, 1, '<div id="wrap_id_advice_532" ><style>\n.hide{display:none}.text-right{text-align:right}.text-left{text-align:left}.text-center{text-align:center}hr.clear{visibility:hidden;margin-bottom:20px}.gamification-tip{width:100%;height:40px;margin:0 0 20px 0;position:relative;line-height:43px;background-color:#f8f8f8;border-bottom:solid 5px #d2d2d2}.gamification-tip div.gamification-tip-title{position:absolute;top:0;left:0;height:40px;width:90px;padding:0 0 0 40px;background:url("https://gamification.prestashop.com/images/interface/gamification-lightbulb.png") 10px 5px no-repeat;color:#556e26;font-size:14px;font-weight:bold}.gamification-tip div.gamification-tip-description-container{height:40px;padding:0 130px 0 130px;display:table-cell;vertical-align:middle;font-size:13px;color:#666666;background:url("https://gamification.prestashop.com/images/interface/gamification-tip-bg.png") 100px top no-repeat}.gamification-tip div.gamification-tip-description-container span.gamification-tip-description{display:inline-block;line-height:15px;max-height:30px;overflow:hidden}.gamification-tip span.gamification-tip-cta{position:absolute;line-height:43px;height:40px;width:70px;top:0;right:0;padding:0 10px 0 30px;border-bottom:solid 5px #739334;background:url("https://gamification.prestashop.com/images/interface/gamification-cta-bg.png") left top no-repeat #a6c964}.gamification-tip span.gamification-tip-cta a{display:inline-block;width:100%;font-size:14px;text-transform:uppercase;font-weight:bold;text-shadow:rgba(255, 255, 255, 0.5) 0 1px 0;color:#556e26;background:url("https://gamification.prestashop.com/images/interface/gamification-popin.png") right 10px no-repeat}.gamification-tip-infobox{padding:0 20px 20px 20px;position:relative}.gamification-tip-infobox .gamification-tip-infobox-title{display:inline-block;margin:0 0 20px -20px;width:100%;padding:10px 20px 5px;border-bottom:solid 3px #739334;font:800 18px/20px arial;text-transform:uppercase;color:#556e26;background-color:#e7f0d6}.gamification-tip-infobox .gamification-tip-infobox-title span.gamification-tip-infobox-title-prefix{display:inline-block;height:40px;padding-left:30px;line-height:40px;text-transform:none;font-size:16px;font-weight:500;margin-right:10px;background:url("https://gamification.prestashop.com/images/interface/gamification-lightbulb.png") left top no-repeat}.gamification-tip-infobox .gamification-tip-infobox-content{display:block;width:100%}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-image{float:left;width:120px;height:200px;background:url("https://gamification.prestashop.com/images/interface/gamification-infobox-separator.png") no-repeat right center}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-description{float:left;width:430px;padding:0 0 25px 25px}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-description p{line-height:20px}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-description ul li{padding:0 0 0 20px;line-height:25px;background:url("https://gamification.prestashop.com/images/interface/gamification-bullet-check.png") left center no-repeat}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-controls{padding:20px 0 0 0}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-controls a.button{display:inline-block;height:30px;padding:0 20px;margin-right:10px;border:none;border-bottom:solid 3px #ababab;line-height:33px;text-transform:uppercase;font-weight:bold;color:#929292;text-shadow:rgba(255, 255, 255, 0.5) 0 1px 0;border-radius:3px;background:#d2d2d2}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-controls a.button.success{color:#384819;background:#a6c964;border-color:#739334;text-shadow:rgba(255, 255, 255, 0.5) 0 1px 0}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-controls a.button:hover{color:#f8f8f8;background:#5f5f5f;border-color:#2c2c2c;text-shadow:rgba(0, 0, 0, 0.5) 0 1px 0}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-controls a.button:active{color:white;background:#2c2c2c;border-color:black;text-shadow:rgba(0, 0, 0, 0.5) 0 1px 0}.gamification-tip-infobox a.infobox-close{display:inline-block;width:14px;height:14px;position:absolute;top:20px;right:20px;text-indent:-9999px;background:url("https://gamification.prestashop.com/images/interface/gamification-infobox-close.png") no-repeat}\n</style>\n<hr class="clear"/>\n<div id="advice-16">\n<div class="gamification-tip">\n	<div class="gamification-tip-title">Truco</div>\n	<span class="gamification-tip-cta"><a class="gamification_fancybox"  id="532" href="#advice_content_532">Leer</a><a class="gamification_close" style="display:none"  id="532" href="#advice_content_532">Cerrar</a></span>\n\n	<div class="gamification-tip-description-container">\n		<span class="gamification-tip-description">\n			Mejorar la fidelidad un 5 % aumenta los beneficios en un 25-55 %: fideliza a tus clientes con campañas de email y SMS eficaces		</span>\n	</div>\n	<div class="hide">\n		<div id="advice_content_532" class="gamification-tip-infobox">\n			<div class="gamification-tip-infobox-title">\n				<span class="gamification-tip-infobox-title-prefix">Truco</span>\n				SendinBlue			</div>\n			<div class="gamification-tip-infobox-content">\n				<div class="gamification-tip-infobox-content-image">\n					<img src="https://gamification.prestashop.com/api/getAdviceImg/532.png" alt="logo" style="max-width: 85%">\n				</div>\n				<div class="gamification-tip-infobox-content-description">\n					<p>SendinBlue es una innovadora solución de envío de correos electrónicos y SMS que te permite:</p>\r\n<p>-Sincronizar automáticamente tus contactos (suscritos y bajas) entre tu sitio web y tu cuentaSendinBlue</p>\r\n<p>-Crear correos estupendos sin conocimientos de HTML</p>\r\n<p>-Seleccionar a tus destinatarios gracias a una potente herramienta de segmentación</p>\r\n<p>-Controlar eficazmente tus correos transaccionales (confirmación de pedidos, envío de paquetes, etc.)</p>\r\n<p>-Optimizar la entregabilidad de tus correos electrónicos</p>\r\n<p>-Realizar un seguimiento de los resultados</p>\r\n<p><span style="color: #222222; font-family: arial, sans-serif; font-size: small;"> </span></p>					<div class="gamification-tip-infobox-content-controls right">\n						<a href="javascript:$.fancybox.close();" class="button">Anular</a>\n						<a href="{link}AdminModules{/link}&install=sendinblue&module_name=sendinblue" class="button success">Descubre el modulo </a>\n					</div>\n				</div>\n			</div>\n		</div>\n	</div>\n</div>\n</div>\n<script>\n	$(document).ready( function () {\n		$(''.gamification_fancybox'').bind(''click'', function () {\n			id_advice = 532;\n			popin_url = ''https://gamification.prestashop.com/get_advice_link.php?id_advice=''+id_advice+''&url='';\n			url = window.location.origin+window.location.pathname.replace(''index.php'', '''')+$(''.gamification-tip-infobox-content-controls a.success'').attr(''href'');\n			$(''.gamification-tip-infobox-content-controls a.success'').attr(''href'', popin_url+encodeURIComponent(url));\n			\n			$(''.gamification-tip-infobox'').after(''<img style="display:none" src="https://gamification.prestashop.com/api/getAdvicePopinImg/''+id_advice+''.png" />'');\n			\n		});\n	});\n</script></div>'),
(129, 1, '<div id="wrap_id_advice_540" ><style>\n.hide{display:none}.text-right{text-align:right}.text-left{text-align:left}.text-center{text-align:center}hr.clear{visibility:hidden;margin-bottom:20px}.gamification-tip{width:100%;height:40px;margin:0 0 20px 0;position:relative;line-height:43px;background-color:#f8f8f8;border-bottom:solid 5px #d2d2d2}.gamification-tip div.gamification-tip-title{position:absolute;top:0;left:0;height:40px;width:90px;padding:0 0 0 40px;background:url("https://gamification.prestashop.com/images/interface/gamification-lightbulb.png") 10px 5px no-repeat;color:#556e26;font-size:14px;font-weight:bold}.gamification-tip div.gamification-tip-description-container{height:40px;padding:0 130px 0 130px;display:table-cell;vertical-align:middle;font-size:13px;color:#666666;background:url("https://gamification.prestashop.com/images/interface/gamification-tip-bg.png") 100px top no-repeat}.gamification-tip div.gamification-tip-description-container span.gamification-tip-description{display:inline-block;line-height:15px;max-height:30px;overflow:hidden}.gamification-tip span.gamification-tip-cta{position:absolute;line-height:43px;height:40px;width:70px;top:0;right:0;padding:0 10px 0 30px;border-bottom:solid 5px #739334;background:url("https://gamification.prestashop.com/images/interface/gamification-cta-bg.png") left top no-repeat #a6c964}.gamification-tip span.gamification-tip-cta a{display:inline-block;width:100%;font-size:14px;text-transform:uppercase;font-weight:bold;text-shadow:rgba(255, 255, 255, 0.5) 0 1px 0;color:#556e26;background:url("https://gamification.prestashop.com/images/interface/gamification-popin.png") right 10px no-repeat}.gamification-tip-infobox{padding:0 20px 20px 20px;position:relative}.gamification-tip-infobox .gamification-tip-infobox-title{display:inline-block;margin:0 0 20px -20px;width:100%;padding:10px 20px 5px;border-bottom:solid 3px #739334;font:800 18px/20px arial;text-transform:uppercase;color:#556e26;background-color:#e7f0d6}.gamification-tip-infobox .gamification-tip-infobox-title span.gamification-tip-infobox-title-prefix{display:inline-block;height:40px;padding-left:30px;line-height:40px;text-transform:none;font-size:16px;font-weight:500;margin-right:10px;background:url("https://gamification.prestashop.com/images/interface/gamification-lightbulb.png") left top no-repeat}.gamification-tip-infobox .gamification-tip-infobox-content{display:block;width:100%}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-image{float:left;width:120px;height:200px;background:url("https://gamification.prestashop.com/images/interface/gamification-infobox-separator.png") no-repeat right center}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-description{float:left;width:430px;padding:0 0 25px 25px}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-description p{line-height:20px}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-description ul li{padding:0 0 0 20px;line-height:25px;background:url("https://gamification.prestashop.com/images/interface/gamification-bullet-check.png") left center no-repeat}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-controls{padding:20px 0 0 0}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-controls a.button{display:inline-block;height:30px;padding:0 20px;margin-right:10px;border:none;border-bottom:solid 3px #ababab;line-height:33px;text-transform:uppercase;font-weight:bold;color:#929292;text-shadow:rgba(255, 255, 255, 0.5) 0 1px 0;border-radius:3px;background:#d2d2d2}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-controls a.button.success{color:#384819;background:#a6c964;border-color:#739334;text-shadow:rgba(255, 255, 255, 0.5) 0 1px 0}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-controls a.button:hover{color:#f8f8f8;background:#5f5f5f;border-color:#2c2c2c;text-shadow:rgba(0, 0, 0, 0.5) 0 1px 0}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-controls a.button:active{color:white;background:#2c2c2c;border-color:black;text-shadow:rgba(0, 0, 0, 0.5) 0 1px 0}.gamification-tip-infobox a.infobox-close{display:inline-block;width:14px;height:14px;position:absolute;top:20px;right:20px;text-indent:-9999px;background:url("https://gamification.prestashop.com/images/interface/gamification-infobox-close.png") no-repeat}\n</style>\n<hr class="clear"/>\n<div id="advice-16">\n<div class="gamification-tip">\n	<div class="gamification-tip-title">Truco</div>\n	<span class="gamification-tip-cta"><a class="gamification_fancybox"  id="540" href="#advice_content_540">Leer</a><a class="gamification_close" style="display:none"  id="540" href="#advice_content_540">Cerrar</a></span>\n\n	<div class="gamification-tip-description-container">\n		<span class="gamification-tip-description">\n			Ofrecer recomendaciones personalizadas a tus clientes puede aumentar tu tasa de conversión en un 65 %		</span>\n	</div>\n	<div class="hide">\n		<div id="advice_content_540" class="gamification-tip-infobox">\n			<div class="gamification-tip-infobox-title">\n				<span class="gamification-tip-infobox-title-prefix">Truco</span>\n				Nosto - Personalización para PrestaShop			</div>\n			<div class="gamification-tip-infobox-content">\n				<div class="gamification-tip-infobox-content-image">\n					<img src="https://gamification.prestashop.com/api/getAdviceImg/540.png" alt="logo" style="max-width: 85%">\n				</div>\n				<div class="gamification-tip-infobox-content-description">\n					<p>¿Sabías que la personalización es una de las formas más eficaces de incrementar las ventas online mediante la conversión? Si personalizas tu tienda online podrás dirigirte a cada cliente individualmente y ofrecerle los productos que más puedan interesarle en cada momento. ¡El valor medio de tu pedido puede subir un 25 % y la tasa de conversión, un 65 %!</p>\r\n<p>Con Nosto podrás:</p>\r\n<ul>\r\n<li>Incrementar el valor medio del pedido con recomendaciones de productos complementarios y productos de gama más alta</li>\r\n<li>Impulsar la tasa de conversión con recomendaciones de productos pertinentes</li>\r\n<li>Aumentar la fidelidad con recomendaciones personalizadas</li>\r\n<li>Aprender más sobre tus clientes mediante un panel de control que ofrece visibilidad en tiempo real</li>\r\n<li>Reducir las tasas de rebote con listas prioritarias</li>\r\n<li>Trabajar con un sistema de configuración sin riesgos y rápido, en el que no pagas si no vendes y sin permanencias</li>\r\n</ul>					<div class="gamification-tip-infobox-content-controls right">\n						<a href="javascript:$.fancybox.close();" class="button"></a>\n						<a href="{link}AdminModules{/link}&install=nostotagging&module_name=nostotagging" class="button success"></a>\n					</div>\n				</div>\n			</div>\n		</div>\n	</div>\n</div>\n</div>\n<script>\n	$(document).ready( function () {\n		$(''.gamification_fancybox'').bind(''click'', function () {\n			id_advice = 540;\n			popin_url = ''https://gamification.prestashop.com/get_advice_link.php?id_advice=''+id_advice+''&url='';\n			url = window.location.origin+window.location.pathname.replace(''index.php'', '''')+$(''.gamification-tip-infobox-content-controls a.success'').attr(''href'');\n			$(''.gamification-tip-infobox-content-controls a.success'').attr(''href'', popin_url+encodeURIComponent(url));\n			\n			$(''.gamification-tip-infobox'').after(''<img style="display:none" src="https://gamification.prestashop.com/api/getAdvicePopinImg/''+id_advice+''.png" />'');\n			\n		});\n	});\n</script></div>'),
(130, 1, '<div id="wrap_id_advice_548" ><style>\n.hide{display:none}.text-right{text-align:right}.text-left{text-align:left}.text-center{text-align:center}hr.clear{visibility:hidden;margin-bottom:20px}.gamification-tip{width:100%;height:40px;margin:0 0 20px 0;position:relative;line-height:43px;background-color:#f8f8f8;border-bottom:solid 5px #d2d2d2}.gamification-tip div.gamification-tip-title{position:absolute;top:0;left:0;height:40px;width:90px;padding:0 0 0 40px;background:url("https://gamification.prestashop.com/images/interface/gamification-lightbulb.png") 10px 5px no-repeat;color:#556e26;font-size:14px;font-weight:bold}.gamification-tip div.gamification-tip-description-container{height:40px;padding:0 130px 0 130px;display:table-cell;vertical-align:middle;font-size:13px;color:#666666;background:url("https://gamification.prestashop.com/images/interface/gamification-tip-bg.png") 100px top no-repeat}.gamification-tip div.gamification-tip-description-container span.gamification-tip-description{display:inline-block;line-height:15px;max-height:30px;overflow:hidden}.gamification-tip span.gamification-tip-cta{position:absolute;line-height:43px;height:40px;width:70px;top:0;right:0;padding:0 10px 0 30px;border-bottom:solid 5px #739334;background:url("https://gamification.prestashop.com/images/interface/gamification-cta-bg.png") left top no-repeat #a6c964}.gamification-tip span.gamification-tip-cta a{display:inline-block;width:100%;font-size:14px;text-transform:uppercase;font-weight:bold;text-shadow:rgba(255, 255, 255, 0.5) 0 1px 0;color:#556e26;background:url("https://gamification.prestashop.com/images/interface/gamification-popin.png") right 10px no-repeat}.gamification-tip-infobox{padding:0 20px 20px 20px;position:relative}.gamification-tip-infobox .gamification-tip-infobox-title{display:inline-block;margin:0 0 20px -20px;width:100%;padding:10px 20px 5px;border-bottom:solid 3px #739334;font:800 18px/20px arial;text-transform:uppercase;color:#556e26;background-color:#e7f0d6}.gamification-tip-infobox .gamification-tip-infobox-title span.gamification-tip-infobox-title-prefix{display:inline-block;height:40px;padding-left:30px;line-height:40px;text-transform:none;font-size:16px;font-weight:500;margin-right:10px;background:url("https://gamification.prestashop.com/images/interface/gamification-lightbulb.png") left top no-repeat}.gamification-tip-infobox .gamification-tip-infobox-content{display:block;width:100%}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-image{float:left;width:120px;height:200px;background:url("https://gamification.prestashop.com/images/interface/gamification-infobox-separator.png") no-repeat right center}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-description{float:left;width:430px;padding:0 0 25px 25px}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-description p{line-height:20px}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-description ul li{padding:0 0 0 20px;line-height:25px;background:url("https://gamification.prestashop.com/images/interface/gamification-bullet-check.png") left center no-repeat}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-controls{padding:20px 0 0 0}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-controls a.button{display:inline-block;height:30px;padding:0 20px;margin-right:10px;border:none;border-bottom:solid 3px #ababab;line-height:33px;text-transform:uppercase;font-weight:bold;color:#929292;text-shadow:rgba(255, 255, 255, 0.5) 0 1px 0;border-radius:3px;background:#d2d2d2}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-controls a.button.success{color:#384819;background:#a6c964;border-color:#739334;text-shadow:rgba(255, 255, 255, 0.5) 0 1px 0}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-controls a.button:hover{color:#f8f8f8;background:#5f5f5f;border-color:#2c2c2c;text-shadow:rgba(0, 0, 0, 0.5) 0 1px 0}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-controls a.button:active{color:white;background:#2c2c2c;border-color:black;text-shadow:rgba(0, 0, 0, 0.5) 0 1px 0}.gamification-tip-infobox a.infobox-close{display:inline-block;width:14px;height:14px;position:absolute;top:20px;right:20px;text-indent:-9999px;background:url("https://gamification.prestashop.com/images/interface/gamification-infobox-close.png") no-repeat}\n</style>\n<hr class="clear"/>\n<div id="advice-16">\n<div class="gamification-tip">\n	<div class="gamification-tip-title">Truco</div>\n	<span class="gamification-tip-cta"><a class="gamification_fancybox"  id="548" href="#advice_content_548">Leer</a><a class="gamification_close" style="display:none"  id="548" href="#advice_content_548">Cerrar</a></span>\n\n	<div class="gamification-tip-description-container">\n		<span class="gamification-tip-description">\n			Sube un 25 % el valor medio de los pedidos con recomendaciones de productos complementarios y de gamas más altas		</span>\n	</div>\n	<div class="hide">\n		<div id="advice_content_548" class="gamification-tip-infobox">\n			<div class="gamification-tip-infobox-title">\n				<span class="gamification-tip-infobox-title-prefix">Truco</span>\n				Nosto - Personalización para PrestaShop			</div>\n			<div class="gamification-tip-infobox-content">\n				<div class="gamification-tip-infobox-content-image">\n					<img src="https://gamification.prestashop.com/api/getAdviceImg/548.png" alt="logo" style="max-width: 85%">\n				</div>\n				<div class="gamification-tip-infobox-content-description">\n					<p><span style="font-size: 10pt;">Nosto te permite mostrar recomendaciones basadas en el comportamiento individual de cada cliente: ¡crea experiencias de compra personalizadas, mejora la conversión y el valor medio del pedido e incrementa la fidelidad del cliente!</span></p>					<div class="gamification-tip-infobox-content-controls right">\n						<a href="javascript:$.fancybox.close();" class="button"></a>\n						<a href="{link}AdminModules{/link}&install=nostotagging&module_name=nostotagging" class="button success"></a>\n					</div>\n				</div>\n			</div>\n		</div>\n	</div>\n</div>\n</div>\n<script>\n	$(document).ready( function () {\n		$(''.gamification_fancybox'').bind(''click'', function () {\n			id_advice = 548;\n			popin_url = ''https://gamification.prestashop.com/get_advice_link.php?id_advice=''+id_advice+''&url='';\n			url = window.location.origin+window.location.pathname.replace(''index.php'', '''')+$(''.gamification-tip-infobox-content-controls a.success'').attr(''href'');\n			$(''.gamification-tip-infobox-content-controls a.success'').attr(''href'', popin_url+encodeURIComponent(url));\n			\n			$(''.gamification-tip-infobox'').after(''<img style="display:none" src="https://gamification.prestashop.com/api/getAdvicePopinImg/''+id_advice+''.png" />'');\n			\n		});\n	});\n</script></div>');
INSERT INTO `ps_advice_lang` (`id_advice`, `id_lang`, `html`) VALUES
(131, 1, '<div id="wrap_id_advice_555" >\n		<section id="0_googleapps" class="panel " style="display:none">\n			<header class="panel-heading">\n				<span class="icon-lightbulb"></span> Consejo del día</header>\n			<div class="panel-body" style="padding:0">\n				<img class="img-responsive" src="https://api.prestashop.com/partner/tipsoftheday/img/logo-googleapps.png" style="float:right; margin-left: 5px;">\n				<img src="https://gamification.prestashop.com/api/getAdviceImg/555.png"/>\n				<p><b>No más quebraderos de cabeza para gestionar archivos!</b></p>\n				<p>Ahorra tiempo colaborando con tu equipo en tiempo real: usa un sistema de comunicación unificado para gestionar los documentos empresariales.</b></p>\n				<span class="text-right" style="float:right">\n					<a class="btn btn-default" target="_blank" href="https://gamification.prestashop.com/get_advice_link.php?id_advice=555&url=https%3A%2F%2Fwww.google.com%2Fintl%2Fes_ALL%2Fwork%2Fapps%2Fbusiness%2Flanding%2Fpartners%2Freferral%2Ftrial.html%3Futm_source%3Dsign-up%26utm_medium%3Dreferral%26utm_campaign%3Dapps-referral-program%26utm_content%3D8H5VXVU">Empieza ahora</a>\n				</span>\n			</div>\n		</section>\n		<section id="1_googleapps" class="panel " style="display:none">\n			<header class="panel-heading">\n				<span class="icon-lightbulb"></span> Consejo del día</header>\n			<div class="panel-body" style="padding:0">\n				<img class="img-responsive" src="https://api.prestashop.com/partner/tipsoftheday/img/logo-googleapps.png" style="float:right; margin-left: 5px;">\n				<img src="https://gamification.prestashop.com/api/getAdviceImg/555.png"/>\n				<p><b>Toma decisiones basándote en datos.</b></p>\n				<p>Exporta los datos de tu tienda, crea gráficos y tablas y compártelo todo con tu equipo en segundos.</p>\n				<span class="text-right" style="float:right">\n					<a class="btn btn-default" target="_blank" href="https://gamification.prestashop.com/get_advice_link.php?id_advice=555&url=https%3A%2F%2Fwww.google.com%2Fintl%2Fes_ALL%2Fwork%2Fapps%2Fbusiness%2Flanding%2Fpartners%2Freferral%2Ftrial.html%3Futm_source%3Dsign-up%26utm_medium%3Dreferral%26utm_campaign%3Dapps-referral-program%26utm_content%3D8H5VXVU">Empieza ahora</a>\n				</span>\n			</div>\n		</section>\n		<section id="2_googleapps" class="panel " style="display:none">\n			<header class="panel-heading">\n				<span class="icon-lightbulb"></span> Consejo del día</header>\n			<div class="panel-body" style="padding:0">\n				<img class="img-responsive" src="https://api.prestashop.com/partner/tipsoftheday/img/logo-googleapps.png" style="float:right; margin-left: 5px;">\n				<img src="https://gamification.prestashop.com/api/getAdviceImg/555.png"/>\n				<p><b>¡Escucha lo que tus clientes tienen que decir!</b></p>\n				<p>Recoge y analiza las opiniones de tus socios y clientes de un modo sencillo con los formularios de Google: ¡no hace falta que seas un experto en datos!</p>\n				<span class="text-right" style="float:right">\n					<a class="btn btn-default" target="_blank" href="https://gamification.prestashop.com/get_advice_link.php?id_advice=555&url=https%3A%2F%2Fwww.google.com%2Fintl%2Fes_ALL%2Fwork%2Fapps%2Fbusiness%2Flanding%2Fpartners%2Freferral%2Ftrial.html%3Futm_source%3Dsign-up%26utm_medium%3Dreferral%26utm_campaign%3Dapps-referral-program%26utm_content%3D8H5VXVU">Empieza ahora</a>\n				</span>\n			</div>\n		</section>\n			<script>\n			$(document).ready( function () {\n				$(''#''+rand(2)+''_googleapps'').show();\n			});\n\n			function rand(nbr){\n			   return Math.floor(Math.random()*(nbr+1));\n			}\n			</script>\n			</div>'),
(132, 1, '<div id="wrap_id_advice_556" >\n		<section id="0_nosto" class="panel " style="display:none">\n			<header class="panel-heading">\n				<span class="icon-lightbulb"></span> Consejo del día</header>\n			<div class="panel-body" style="padding:0">\n				<img class="img-responsive" src="https://api.prestashop.com/partner/tipsoftheday/img/logo-nosto.png" style="float:right; margin-left: 5px;">\n				<img src="https://gamification.prestashop.com/api/getAdviceImg/556.png"/>\n				<p><b>¿Sabías que Amazon consigue el 30 % de sus ventas gracias a recomendaciones?</b></p>\n				<p>¿Aumenta tus ventas online mediante la conversión: personaliza tu tienda para sugerir a cada cliente los artículos que más puedan atraerle en cada momento.</p>\n				<span class="text-right" style="float:right">\n					<a class="btn btn-default" target="_blank" href="https://gamification.prestashop.com/get_advice_link.php?id_advice=556&url=http%3A%2F%2Faddons.prestashop.com%2Fes%2Fpublicidad-marketing-newsletter-modulos%2F18349-nostotagging.html%3Futm_source%3Dback-office%26utm_medium%3Dtipoftheday%26utm_campaign%3Dpartenariats%26utm_content%3Dnosto">¿A qué esperas?</a>\n				</span>\n			</div>\n		</section>\n			<script>\n			$(document).ready( function () {\n				$(''#''+rand(0)+''_nosto'').show();\n			});\n\n			function rand(nbr){\n			   return Math.floor(Math.random()*(nbr+1));\n			}\n			</script>\n			</div>'),
(133, 1, '<div id="wrap_id_advice_570" >\n		<section id="0_storemanager" class="panel " style="display:none">\n			<header class="panel-heading">\n				<span class="icon-lightbulb"></span> Consejo del día</header>\n			<div class="panel-body" style="padding:0">\n				<img class="img-responsive" src="https://api.prestashop.com/partner/tipsoftheday/img/logo-storemanager.png" style="float:right; margin-left: 5px;">\n				<img src="https://gamification.prestashop.com/api/getAdviceImg/570.png"/>\n				<p><b>Encontrar el producto ideal es el primer paso para comprar</b></p>\n				<p>Ayuda a tus clientes a encontrar lo que buscan y asegúrate de que llegan a la categoría adecuada: con el editor de atributos en bloque Store Manager es coser y cantar.</p>\n				<span class="text-right" style="float:right">\n					<a class="btn btn-default" target="_blank" href="https://gamification.prestashop.com/get_advice_link.php?id_advice=570&url=http%3A%2F%2Faddons.prestashop.com%2Fes%2Fadministracion-prestashop-modulo%2F2937-store-manager-para-prestashop.html%3Futm_source%3Dback-office%26utm_medium%3Dtipoftheday%26utm_campaign%3Dpartenariats%26utm_content%3Dstoremanager">¡Empieza ahora!</a>\n				</span>\n			</div>\n		</section>\n		<section id="1_storemanager" class="panel " style="display:none">\n			<header class="panel-heading">\n				<span class="icon-lightbulb"></span> Consejo del día</header>\n			<div class="panel-body" style="padding:0">\n				<img class="img-responsive" src="https://api.prestashop.com/partner/tipsoftheday/img/logo-storemanager.png" style="float:right; margin-left: 5px;">\n				<img src="https://gamification.prestashop.com/api/getAdviceImg/570.png"/>\n				<p><b>¡Invierte una hora y gana un día!</b></p>\n				<p>Actualiza en bloque los productos, las categorías y las imágenes de tu tienda. Invertirás unas horas en gestionar para dedicarle más tiempo a lo que más importa: vender.</p>\n				<span class="text-right" style="float:right">\n					<a class="btn btn-default" target="_blank" href="https://gamification.prestashop.com/get_advice_link.php?id_advice=570&url=http%3A%2F%2Faddons.prestashop.com%2Fes%2Fadministracion-prestashop-modulo%2F2937-store-manager-para-prestashop.html%3Futm_source%3Dback-office%26utm_medium%3Dtipoftheday%26utm_campaign%3Dpartenariats%26utm_content%3Dstoremanager">¡Empieza ahora!</a>\n				</span>\n			</div>\n		</section>\n		<section id="2_storemanager" class="panel " style="display:none">\n			<header class="panel-heading">\n				<span class="icon-lightbulb"></span> Consejo del día</header>\n			<div class="panel-body" style="padding:0">\n				<img class="img-responsive" src="https://api.prestashop.com/partner/tipsoftheday/img/logo-storemanager.png" style="float:right; margin-left: 5px;">\n				<img src="https://gamification.prestashop.com/api/getAdviceImg/570.png"/>\n				<p><b>Una buena organización financiera es la base del éxito</b></p>\n				<p>Sincroniza facturas, gastos y otros datos financieros con las soluciones de contabilidad integradas de Store Manager.</p>\n				<span class="text-right" style="float:right">\n					<a class="btn btn-default" target="_blank" href="https://gamification.prestashop.com/get_advice_link.php?id_advice=570&url=http%3A%2F%2Faddons.prestashop.com%2Fes%2Fadministracion-prestashop-modulo%2F2937-store-manager-para-prestashop.html%3Futm_source%3Dback-office%26utm_medium%3Dtipoftheday%26utm_campaign%3Dpartenariats%26utm_content%3Dstoremanager">¡Empieza ahora!</a>\n				</span>\n			</div>\n		</section>\n		<section id="3_storemanager" class="panel " style="display:none">\n			<header class="panel-heading">\n				<span class="icon-lightbulb"></span> Consejo del día</header>\n			<div class="panel-body" style="padding:0">\n				<img class="img-responsive" src="https://api.prestashop.com/partner/tipsoftheday/img/logo-storemanager.png" style="float:right; margin-left: 5px;">\n				<img src="https://gamification.prestashop.com/api/getAdviceImg/570.png"/>\n				<p><b>Los precios psicológicos como 9,99 aumentan las conversiones</b></p>\n				<p>No pierdas tiempo: cuando hagas rebajas o promociones, modifica en bloque los precios de los artículos.</p>\n				<span class="text-right" style="float:right">\n					<a class="btn btn-default" target="_blank" href="https://gamification.prestashop.com/get_advice_link.php?id_advice=570&url=http%3A%2F%2Faddons.prestashop.com%2Fes%2Fadministracion-prestashop-modulo%2F2937-store-manager-para-prestashop.html%3Futm_source%3Dback-office%26utm_medium%3Dtipoftheday%26utm_campaign%3Dpartenariats%26utm_content%3Dstoremanager">¡Empieza ahora!</a>\n				</span>\n			</div>\n		</section>\n			<script>\n			$(document).ready( function () {\n				$(''#''+rand(3)+''_storemanager'').show();\n			});\n\n			function rand(nbr){\n			   return Math.floor(Math.random()*(nbr+1));\n			}\n			</script>\n			</div>'),
(134, 1, '<div id="wrap_id_advice_571" ><style>\n.hide{display:none}.text-right{text-align:right}.text-left{text-align:left}.text-center{text-align:center}hr.clear{visibility:hidden;margin-bottom:20px}.gamification-tip{width:100%;height:40px;margin:0 0 20px 0;position:relative;line-height:43px;background-color:#f8f8f8;border-bottom:solid 5px #d2d2d2}.gamification-tip div.gamification-tip-title{position:absolute;top:0;left:0;height:40px;width:90px;padding:0 0 0 40px;background:url("https://gamification.prestashop.com/images/interface/gamification-lightbulb.png") 10px 5px no-repeat;color:#556e26;font-size:14px;font-weight:bold}.gamification-tip div.gamification-tip-description-container{height:40px;padding:0 130px 0 130px;display:table-cell;vertical-align:middle;font-size:13px;color:#666666;background:url("https://gamification.prestashop.com/images/interface/gamification-tip-bg.png") 100px top no-repeat}.gamification-tip div.gamification-tip-description-container span.gamification-tip-description{display:inline-block;line-height:15px;max-height:30px;overflow:hidden}.gamification-tip span.gamification-tip-cta{position:absolute;line-height:43px;height:40px;width:70px;top:0;right:0;padding:0 10px 0 30px;border-bottom:solid 5px #739334;background:url("https://gamification.prestashop.com/images/interface/gamification-cta-bg.png") left top no-repeat #a6c964}.gamification-tip span.gamification-tip-cta a{display:inline-block;width:100%;font-size:14px;text-transform:uppercase;font-weight:bold;text-shadow:rgba(255, 255, 255, 0.5) 0 1px 0;color:#556e26;background:url("https://gamification.prestashop.com/images/interface/gamification-popin.png") right 10px no-repeat}.gamification-tip-infobox{padding:0 20px 20px 20px;position:relative}.gamification-tip-infobox .gamification-tip-infobox-title{display:inline-block;margin:0 0 20px -20px;width:100%;padding:10px 20px 5px;border-bottom:solid 3px #739334;font:800 18px/20px arial;text-transform:uppercase;color:#556e26;background-color:#e7f0d6}.gamification-tip-infobox .gamification-tip-infobox-title span.gamification-tip-infobox-title-prefix{display:inline-block;height:40px;padding-left:30px;line-height:40px;text-transform:none;font-size:16px;font-weight:500;margin-right:10px;background:url("https://gamification.prestashop.com/images/interface/gamification-lightbulb.png") left top no-repeat}.gamification-tip-infobox .gamification-tip-infobox-content{display:block;width:100%}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-image{float:left;width:120px;height:200px;background:url("https://gamification.prestashop.com/images/interface/gamification-infobox-separator.png") no-repeat right center}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-description{float:left;width:430px;padding:0 0 25px 25px}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-description p{line-height:20px}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-description ul li{padding:0 0 0 20px;line-height:25px;background:url("https://gamification.prestashop.com/images/interface/gamification-bullet-check.png") left center no-repeat}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-controls{padding:20px 0 0 0}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-controls a.button{display:inline-block;height:30px;padding:0 20px;margin-right:10px;border:none;border-bottom:solid 3px #ababab;line-height:33px;text-transform:uppercase;font-weight:bold;color:#929292;text-shadow:rgba(255, 255, 255, 0.5) 0 1px 0;border-radius:3px;background:#d2d2d2}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-controls a.button.success{color:#384819;background:#a6c964;border-color:#739334;text-shadow:rgba(255, 255, 255, 0.5) 0 1px 0}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-controls a.button:hover{color:#f8f8f8;background:#5f5f5f;border-color:#2c2c2c;text-shadow:rgba(0, 0, 0, 0.5) 0 1px 0}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-controls a.button:active{color:white;background:#2c2c2c;border-color:black;text-shadow:rgba(0, 0, 0, 0.5) 0 1px 0}.gamification-tip-infobox a.infobox-close{display:inline-block;width:14px;height:14px;position:absolute;top:20px;right:20px;text-indent:-9999px;background:url("https://gamification.prestashop.com/images/interface/gamification-infobox-close.png") no-repeat}\n</style>\n<hr class="clear"/>\n<div id="advice-16">\n<div class="gamification-tip">\n	<div class="gamification-tip-title">Truco</div>\n	<span class="gamification-tip-cta"><a class="gamification_fancybox"  id="571" href="#advice_content_571">Leer</a><a class="gamification_close" style="display:none"  id="571" href="#advice_content_571">Cerrar</a></span>\n\n	<div class="gamification-tip-description-container">\n		<span class="gamification-tip-description">\n			Ofrecer recomendaciones personalizadas a tus clientes puede aumentar tu tasa de conversión hasta un 65%		</span>\n	</div>\n	<div class="hide">\n		<div id="advice_content_571" class="gamification-tip-infobox">\n			<div class="gamification-tip-infobox-title">\n				<span class="gamification-tip-infobox-title-prefix">Truco</span>\n				Nosto - Personalización para PrestaShop			</div>\n			<div class="gamification-tip-infobox-content">\n				<div class="gamification-tip-infobox-content-image">\n					<img src="https://gamification.prestashop.com/api/getAdviceImg/571.png" alt="logo" style="max-width: 85%">\n				</div>\n				<div class="gamification-tip-infobox-content-description">\n					<p>¿Sabías que personalizar es una de las mejores formas de aumentar las ventas online a través de la conversión? Personaliza tu tienda online y ofrece a cada cliente los artículos que más le apetezca comprar en cada momento: ¡incrementarás el valor medio de los pedidos en un 25% y la tasa de conversión en un 65%!</p>\r\n<p> </p>\r\n<p>Con Nosto podrás:</p>\r\n<p> </p>\r\n<ul>\r\n<li>Incrementar el valor medio del pedido recomendando productos complementarios o de gama más alta</li>\r\n<li>Fomentar las conversiones con recomendaciones pertinentes</li>\r\n<li>Fidelizar gracias a las sugerencias personalizadas</li>\r\n<li>Aprender más sobre tus clientes mediante un panel de control en tiempo real</li>\r\n<li>Reducir la tasa de rebote mediante listas de favoritos</li>\r\n<li>Empezar a trabajar sin riesgos y en dos minutos, con un contrato de "facturación según ventas" y sin permanencias obligatorias.</li>\r\n</ul>					<div class="gamification-tip-infobox-content-controls right">\n						<a href="javascript:$.fancybox.close();" class="button"></a>\n						<a href="{link}AdminModules{/link}&install=nostotagging&module_name=nostotagging" class="button success"></a>\n					</div>\n				</div>\n			</div>\n		</div>\n	</div>\n</div>\n</div>\n<script>\n	$(document).ready( function () {\n		$(''.gamification_fancybox'').bind(''click'', function () {\n			id_advice = 571;\n			popin_url = ''https://gamification.prestashop.com/get_advice_link.php?id_advice=''+id_advice+''&url='';\n			url = window.location.origin+window.location.pathname.replace(''index.php'', '''')+$(''.gamification-tip-infobox-content-controls a.success'').attr(''href'');\n			$(''.gamification-tip-infobox-content-controls a.success'').attr(''href'', popin_url+encodeURIComponent(url));\n			\n			$(''.gamification-tip-infobox'').after(''<img style="display:none" src="https://gamification.prestashop.com/api/getAdvicePopinImg/''+id_advice+''.png" />'');\n			\n		});\n	});\n</script></div>'),
(135, 1, '<div id="wrap_id_advice_581" ><style>\n.hide{display:none}.text-right{text-align:right}.text-left{text-align:left}.text-center{text-align:center}hr.clear{visibility:hidden;margin-bottom:20px}.gamification-tip{width:100%;height:40px;margin:0 0 20px 0;position:relative;line-height:43px;background-color:#f8f8f8;border-bottom:solid 5px #d2d2d2}.gamification-tip div.gamification-tip-title{position:absolute;top:0;left:0;height:40px;width:90px;padding:0 0 0 40px;background:url("https://gamification.prestashop.com/images/interface/gamification-lightbulb.png") 10px 5px no-repeat;color:#556e26;font-size:14px;font-weight:bold}.gamification-tip div.gamification-tip-description-container{height:40px;padding:0 130px 0 130px;display:table-cell;vertical-align:middle;font-size:13px;color:#666666;background:url("https://gamification.prestashop.com/images/interface/gamification-tip-bg.png") 100px top no-repeat}.gamification-tip div.gamification-tip-description-container span.gamification-tip-description{display:inline-block;line-height:15px;max-height:30px;overflow:hidden}.gamification-tip span.gamification-tip-cta{position:absolute;line-height:43px;height:40px;width:70px;top:0;right:0;padding:0 10px 0 30px;border-bottom:solid 5px #739334;background:url("https://gamification.prestashop.com/images/interface/gamification-cta-bg.png") left top no-repeat #a6c964}.gamification-tip span.gamification-tip-cta a{display:inline-block;width:100%;font-size:14px;text-transform:uppercase;font-weight:bold;text-shadow:rgba(255, 255, 255, 0.5) 0 1px 0;color:#556e26;background:url("https://gamification.prestashop.com/images/interface/gamification-popin.png") right 10px no-repeat}.gamification-tip-infobox{padding:0 20px 20px 20px;position:relative}.gamification-tip-infobox .gamification-tip-infobox-title{display:inline-block;margin:0 0 20px -20px;width:100%;padding:10px 20px 5px;border-bottom:solid 3px #739334;font:800 18px/20px arial;text-transform:uppercase;color:#556e26;background-color:#e7f0d6}.gamification-tip-infobox .gamification-tip-infobox-title span.gamification-tip-infobox-title-prefix{display:inline-block;height:40px;padding-left:30px;line-height:40px;text-transform:none;font-size:16px;font-weight:500;margin-right:10px;background:url("https://gamification.prestashop.com/images/interface/gamification-lightbulb.png") left top no-repeat}.gamification-tip-infobox .gamification-tip-infobox-content{display:block;width:100%}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-image{float:left;width:120px;height:200px;background:url("https://gamification.prestashop.com/images/interface/gamification-infobox-separator.png") no-repeat right center}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-description{float:left;width:430px;padding:0 0 25px 25px}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-description p{line-height:20px}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-description ul li{padding:0 0 0 20px;line-height:25px;background:url("https://gamification.prestashop.com/images/interface/gamification-bullet-check.png") left center no-repeat}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-controls{padding:20px 0 0 0}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-controls a.button{display:inline-block;height:30px;padding:0 20px;margin-right:10px;border:none;border-bottom:solid 3px #ababab;line-height:33px;text-transform:uppercase;font-weight:bold;color:#929292;text-shadow:rgba(255, 255, 255, 0.5) 0 1px 0;border-radius:3px;background:#d2d2d2}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-controls a.button.success{color:#384819;background:#a6c964;border-color:#739334;text-shadow:rgba(255, 255, 255, 0.5) 0 1px 0}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-controls a.button:hover{color:#f8f8f8;background:#5f5f5f;border-color:#2c2c2c;text-shadow:rgba(0, 0, 0, 0.5) 0 1px 0}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-controls a.button:active{color:white;background:#2c2c2c;border-color:black;text-shadow:rgba(0, 0, 0, 0.5) 0 1px 0}.gamification-tip-infobox a.infobox-close{display:inline-block;width:14px;height:14px;position:absolute;top:20px;right:20px;text-indent:-9999px;background:url("https://gamification.prestashop.com/images/interface/gamification-infobox-close.png") no-repeat}\n</style>\n<hr class="clear"/>\n<div id="advice-16">\n<div class="gamification-tip">\n	<div class="gamification-tip-title">Truco</div>\n	<span class="gamification-tip-cta"><a class="gamification_fancybox"  id="581" href="#advice_content_581">Leer</a><a class="gamification_close" style="display:none"  id="581" href="#advice_content_581">Cerrar</a></span>\n\n	<div class="gamification-tip-description-container">\n		<span class="gamification-tip-description">\n			El 40% de los correos se abren y generan clics durante las tres horas posteriores al envío: ¡evalúa tus resultados!		</span>\n	</div>\n	<div class="hide">\n		<div id="advice_content_581" class="gamification-tip-infobox">\n			<div class="gamification-tip-infobox-title">\n				<span class="gamification-tip-infobox-title-prefix">Truco</span>\n				Mailify			</div>\n			<div class="gamification-tip-infobox-content">\n				<div class="gamification-tip-infobox-content-image">\n					<img src="https://gamification.prestashop.com/api/getAdviceImg/581.png" alt="logo" style="max-width: 85%">\n				</div>\n				<div class="gamification-tip-infobox-content-description">\n					<p>Seis consejos para garantizar el éxito de tu campaña de correo:</p>\r\n<p>- Optimiza tu base de datos de destinatarios</p>\r\n<p>- Utiliza una dirección de envío válida</p>\r\n<p>- Evalúa la tasa de inscripciones y controla los clics</p>\r\n<p>- Integra un vídeo en tu boletín</p>\r\n<p>- Aumenta la tasa de apertura</p>\r\n<p>- Mejora el contenido de tus campañas de email</p>\r\n<p> </p>\r\n<p>Mailify es el programa de referencia para crear, enviar y evaluar tus boletines.</p>					<div class="gamification-tip-infobox-content-controls right">\n						<a href="javascript:$.fancybox.close();" class="button"></a>\n						<a href="{link}AdminModules{/link}&install=sarbacanedesktop&module_name=sarbacanedesktop" class="button success"></a>\n					</div>\n				</div>\n			</div>\n		</div>\n	</div>\n</div>\n</div>\n<script>\n	$(document).ready( function () {\n		$(''.gamification_fancybox'').bind(''click'', function () {\n			id_advice = 581;\n			popin_url = ''https://gamification.prestashop.com/get_advice_link.php?id_advice=''+id_advice+''&url='';\n			url = window.location.origin+window.location.pathname.replace(''index.php'', '''')+$(''.gamification-tip-infobox-content-controls a.success'').attr(''href'');\n			$(''.gamification-tip-infobox-content-controls a.success'').attr(''href'', popin_url+encodeURIComponent(url));\n			\n			$(''.gamification-tip-infobox'').after(''<img style="display:none" src="https://gamification.prestashop.com/api/getAdvicePopinImg/''+id_advice+''.png" />'');\n			\n		});\n	});\n</script></div>'),
(136, 1, '<div id="wrap_id_advice_582" ><style>\n.hide{display:none}.text-right{text-align:right}.text-left{text-align:left}.text-center{text-align:center}hr.clear{visibility:hidden;margin-bottom:20px}.gamification-tip{width:100%;height:40px;margin:0 0 20px 0;position:relative;line-height:43px;background-color:#f8f8f8;border-bottom:solid 5px #d2d2d2}.gamification-tip div.gamification-tip-title{position:absolute;top:0;left:0;height:40px;width:90px;padding:0 0 0 40px;background:url("https://gamification.prestashop.com/images/interface/gamification-lightbulb.png") 10px 5px no-repeat;color:#556e26;font-size:14px;font-weight:bold}.gamification-tip div.gamification-tip-description-container{height:40px;padding:0 130px 0 130px;display:table-cell;vertical-align:middle;font-size:13px;color:#666666;background:url("https://gamification.prestashop.com/images/interface/gamification-tip-bg.png") 100px top no-repeat}.gamification-tip div.gamification-tip-description-container span.gamification-tip-description{display:inline-block;line-height:15px;max-height:30px;overflow:hidden}.gamification-tip span.gamification-tip-cta{position:absolute;line-height:43px;height:40px;width:70px;top:0;right:0;padding:0 10px 0 30px;border-bottom:solid 5px #739334;background:url("https://gamification.prestashop.com/images/interface/gamification-cta-bg.png") left top no-repeat #a6c964}.gamification-tip span.gamification-tip-cta a{display:inline-block;width:100%;font-size:14px;text-transform:uppercase;font-weight:bold;text-shadow:rgba(255, 255, 255, 0.5) 0 1px 0;color:#556e26;background:url("https://gamification.prestashop.com/images/interface/gamification-popin.png") right 10px no-repeat}.gamification-tip-infobox{padding:0 20px 20px 20px;position:relative}.gamification-tip-infobox .gamification-tip-infobox-title{display:inline-block;margin:0 0 20px -20px;width:100%;padding:10px 20px 5px;border-bottom:solid 3px #739334;font:800 18px/20px arial;text-transform:uppercase;color:#556e26;background-color:#e7f0d6}.gamification-tip-infobox .gamification-tip-infobox-title span.gamification-tip-infobox-title-prefix{display:inline-block;height:40px;padding-left:30px;line-height:40px;text-transform:none;font-size:16px;font-weight:500;margin-right:10px;background:url("https://gamification.prestashop.com/images/interface/gamification-lightbulb.png") left top no-repeat}.gamification-tip-infobox .gamification-tip-infobox-content{display:block;width:100%}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-image{float:left;width:120px;height:200px;background:url("https://gamification.prestashop.com/images/interface/gamification-infobox-separator.png") no-repeat right center}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-description{float:left;width:430px;padding:0 0 25px 25px}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-description p{line-height:20px}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-description ul li{padding:0 0 0 20px;line-height:25px;background:url("https://gamification.prestashop.com/images/interface/gamification-bullet-check.png") left center no-repeat}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-controls{padding:20px 0 0 0}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-controls a.button{display:inline-block;height:30px;padding:0 20px;margin-right:10px;border:none;border-bottom:solid 3px #ababab;line-height:33px;text-transform:uppercase;font-weight:bold;color:#929292;text-shadow:rgba(255, 255, 255, 0.5) 0 1px 0;border-radius:3px;background:#d2d2d2}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-controls a.button.success{color:#384819;background:#a6c964;border-color:#739334;text-shadow:rgba(255, 255, 255, 0.5) 0 1px 0}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-controls a.button:hover{color:#f8f8f8;background:#5f5f5f;border-color:#2c2c2c;text-shadow:rgba(0, 0, 0, 0.5) 0 1px 0}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-controls a.button:active{color:white;background:#2c2c2c;border-color:black;text-shadow:rgba(0, 0, 0, 0.5) 0 1px 0}.gamification-tip-infobox a.infobox-close{display:inline-block;width:14px;height:14px;position:absolute;top:20px;right:20px;text-indent:-9999px;background:url("https://gamification.prestashop.com/images/interface/gamification-infobox-close.png") no-repeat}\n</style>\n<hr class="clear"/>\n<div id="advice-16">\n<div class="gamification-tip">\n	<div class="gamification-tip-title">Truco</div>\n	<span class="gamification-tip-cta"><a class="gamification_fancybox"  id="582" href="#advice_content_582">Leer</a><a class="gamification_close" style="display:none"  id="582" href="#advice_content_582">Cerrar</a></span>\n\n	<div class="gamification-tip-description-container">\n		<span class="gamification-tip-description">\n			La tasa de apertura de los correos de fidelización es un 20% superior a los de adquisición: ¡juega la baza de la fidelidad!		</span>\n	</div>\n	<div class="hide">\n		<div id="advice_content_582" class="gamification-tip-infobox">\n			<div class="gamification-tip-infobox-title">\n				<span class="gamification-tip-infobox-title-prefix">Truco</span>\n				Mailify			</div>\n			<div class="gamification-tip-infobox-content">\n				<div class="gamification-tip-infobox-content-image">\n					<img src="https://gamification.prestashop.com/api/getAdviceImg/582.png" alt="logo" style="max-width: 85%">\n				</div>\n				<div class="gamification-tip-infobox-content-description">\n					<p>Seis consejos para garantizar el éxito de tu campaña de correo:</p>\r\n<p>- Optimiza tu base de datos de destinatarios</p>\r\n<p>- Utiliza una dirección de envío válida</p>\r\n<p>- Evalúa la tasa de inscripciones y controla los clics</p>\r\n<p>- Integra un vídeo en tu boletín</p>\r\n<p>- Aumenta la tasa de apertura</p>\r\n<p>- Mejora el contenido de tus campañas de email</p>\r\n<p> </p>\r\n<p>Mailify es el programa de referencia para crear, enviar y evaluar tus boletines.</p>					<div class="gamification-tip-infobox-content-controls right">\n						<a href="javascript:$.fancybox.close();" class="button"></a>\n						<a href="{link}AdminModules{/link}&install=sarbacanedesktop&module_name=sarbacanedesktop" class="button success"></a>\n					</div>\n				</div>\n			</div>\n		</div>\n	</div>\n</div>\n</div>\n<script>\n	$(document).ready( function () {\n		$(''.gamification_fancybox'').bind(''click'', function () {\n			id_advice = 582;\n			popin_url = ''https://gamification.prestashop.com/get_advice_link.php?id_advice=''+id_advice+''&url='';\n			url = window.location.origin+window.location.pathname.replace(''index.php'', '''')+$(''.gamification-tip-infobox-content-controls a.success'').attr(''href'');\n			$(''.gamification-tip-infobox-content-controls a.success'').attr(''href'', popin_url+encodeURIComponent(url));\n			\n			$(''.gamification-tip-infobox'').after(''<img style="display:none" src="https://gamification.prestashop.com/api/getAdvicePopinImg/''+id_advice+''.png" />'');\n			\n		});\n	});\n</script></div>'),
(137, 1, '<div id="wrap_id_advice_659" >\n	<div class="col-lg-6">\n		<section id="" class="panel panel-advice">\n			<a href="#" id="659" class="close_link gamification_premium_close">\n				<i class="icon-remove"></i>\n			</a>\n			<span class="gamification-close-confirmation hide">\n				¿Está seguro?\n				<button class="btn btn-default btn-sm" data-advice="delete"><i class="icon-trash"></i> Eliminar</button>\n				<button class="btn btn-default btn-sm" data-advice="cancel">Cancelar</button>\n			</span>\n			<a class="preactivationLink row" rel="authorizeaim" href="{link}AdminModules{/link}&install=authorizeaim&module_name=authorizeaim&redirectconfig">\n				<img src="https://api.prestashop.com/partner/premium/images/authorizeaim.png" class="advice-img img-thumbnail">\n				<img src="https://gamification.prestashop.com/api/getAdviceImg/659.png"/ class="hide">\n				<p class="advice-description">Únete a los 400k comerciantes que confían en Authorize.Net para recibir pagos en linea<br/></p>\n			</a>\n		</section>\n	</div></div>'),
(138, 1, '<div id="wrap_id_advice_660" >\n	<div class="col-lg-6">\n		<section id="" class="panel panel-advice">\n			<a href="#" id="660" class="close_link gamification_premium_close">\n				<i class="icon-remove"></i>\n			</a>\n			<span class="gamification-close-confirmation hide">\n				¿Está seguro?\n				<button class="btn btn-default btn-sm" data-advice="delete"><i class="icon-trash"></i> Eliminar</button>\n				<button class="btn btn-default btn-sm" data-advice="cancel">Cancelar</button>\n			</span>\n			<a class="preactivationLink row" rel="liveperson" href="{link}AdminModules{/link}&install=liveperson&module_name=liveperson&redirectconfig">\n				<img src="https://api.prestashop.com/partner/premium/images/liveperson.png" class="advice-img img-thumbnail">\n				<img src="https://gamification.prestashop.com/api/getAdviceImg/660.png"/ class="hide">\n				<p class="advice-description">Quedate conectado con tus clientes, donde seas, en cualquier momento<br/></p>\n			</a>\n		</section>\n	</div></div>'),
(139, 1, '<div id="wrap_id_advice_666" >\n	<div class="col-lg-6">\n		<section id="" class="panel panel-advice">\n			<a href="#" id="666" class="close_link gamification_premium_close">\n				<i class="icon-remove"></i>\n			</a>\n			<span class="gamification-close-confirmation hide">\n				¿Está seguro?\n				<button class="btn btn-default btn-sm" data-advice="delete"><i class="icon-trash"></i> Eliminar</button>\n				<button class="btn btn-default btn-sm" data-advice="cancel">Cancelar</button>\n			</span>\n			<a class="preactivationLink row" rel="mailjet" href="{link}AdminModules{/link}&install=mailjet&module_name=mailjet&redirectconfig">\n				<img src="https://api.prestashop.com/partner/premium/images/mailjet.png" class="advice-img img-thumbnail">\n				<img src="https://gamification.prestashop.com/api/getAdviceImg/666.png"/ class="hide">\n				<p class="advice-description">Envía correos electronicos personalisados y sigue los resultados<br/></p>\n			</a>\n		</section>\n	</div></div>'),
(140, 1, '<div id="wrap_id_advice_669" >\n	<div class="col-lg-6">\n		<section id="" class="panel panel-advice">\n			<a href="#" id="669" class="close_link gamification_premium_close">\n				<i class="icon-remove"></i>\n			</a>\n			<span class="gamification-close-confirmation hide">\n				¿Está seguro?\n				<button class="btn btn-default btn-sm" data-advice="delete"><i class="icon-trash"></i> Eliminar</button>\n				<button class="btn btn-default btn-sm" data-advice="cancel">Cancelar</button>\n			</span>\n			<a class="preactivationLink row" rel="sarbacanedesktop" href="{link}AdminModules{/link}&install=sarbacanedesktop&module_name=sarbacanedesktop&redirectconfig">\n				<img src="https://api.prestashop.com/partner/premium/images/mailify.png" class="advice-img img-thumbnail">\n				<img src="https://gamification.prestashop.com/api/getAdviceImg/669.png"/ class="hide">\n				<p class="advice-description">Email marketing de forma fácil<br/></p>\n			</a>\n		</section>\n	</div></div>');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_alias`
--

CREATE TABLE IF NOT EXISTS `ps_alias` (
  `id_alias` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `alias` varchar(255) NOT NULL,
  `search` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_alias`),
  UNIQUE KEY `alias` (`alias`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `ps_alias`
--

INSERT INTO `ps_alias` (`id_alias`, `alias`, `search`, `active`) VALUES
(1, 'bloose', 'blouse', 1),
(2, 'blues', 'blouse', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_attachment`
--

CREATE TABLE IF NOT EXISTS `ps_attachment` (
  `id_attachment` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `file` varchar(40) NOT NULL,
  `file_name` varchar(128) NOT NULL,
  `file_size` bigint(10) unsigned NOT NULL DEFAULT '0',
  `mime` varchar(128) NOT NULL,
  PRIMARY KEY (`id_attachment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_attachment_lang`
--

CREATE TABLE IF NOT EXISTS `ps_attachment_lang` (
  `id_attachment` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id_attachment`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_attribute`
--

CREATE TABLE IF NOT EXISTS `ps_attribute` (
  `id_attribute` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_attribute_group` int(10) unsigned NOT NULL,
  `color` varchar(32) DEFAULT NULL,
  `position` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_attribute`),
  KEY `attribute_group` (`id_attribute_group`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=25 ;

--
-- Volcado de datos para la tabla `ps_attribute`
--

INSERT INTO `ps_attribute` (`id_attribute`, `id_attribute_group`, `color`, `position`) VALUES
(1, 1, '', 0),
(2, 1, '', 1),
(3, 1, '', 2),
(4, 1, '', 3),
(5, 3, '#AAB2BD', 0),
(6, 3, '#CFC4A6', 1),
(7, 3, '#f5f5dc', 2),
(8, 3, '#ffffff', 3),
(9, 3, '#faebd7', 4),
(10, 3, '#E84C3D', 5),
(11, 3, '#434A54', 6),
(12, 3, '#C19A6B', 7),
(13, 3, '#F39C11', 8),
(14, 3, '#5D9CEC', 9),
(15, 3, '#A0D468', 10),
(16, 3, '#F1C40F', 11),
(17, 3, '#964B00', 12),
(18, 2, '', 0),
(19, 2, '', 1),
(20, 2, '', 2),
(21, 2, '', 3),
(22, 2, '', 4),
(23, 2, '', 5),
(24, 3, '#FCCACD', 13);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_attribute_group`
--

CREATE TABLE IF NOT EXISTS `ps_attribute_group` (
  `id_attribute_group` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `is_color_group` tinyint(1) NOT NULL DEFAULT '0',
  `group_type` enum('select','radio','color') NOT NULL DEFAULT 'select',
  `position` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_attribute_group`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `ps_attribute_group`
--

INSERT INTO `ps_attribute_group` (`id_attribute_group`, `is_color_group`, `group_type`, `position`) VALUES
(1, 0, 'select', 0),
(2, 0, 'select', 1),
(3, 1, 'color', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_attribute_group_lang`
--

CREATE TABLE IF NOT EXISTS `ps_attribute_group_lang` (
  `id_attribute_group` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(128) NOT NULL,
  `public_name` varchar(64) NOT NULL,
  PRIMARY KEY (`id_attribute_group`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ps_attribute_group_lang`
--

INSERT INTO `ps_attribute_group_lang` (`id_attribute_group`, `id_lang`, `name`, `public_name`) VALUES
(1, 1, 'Size', 'Size'),
(2, 1, 'Shoes Size', 'Size'),
(3, 1, 'Color', 'Color');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_attribute_group_shop`
--

CREATE TABLE IF NOT EXISTS `ps_attribute_group_shop` (
  `id_attribute_group` int(11) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_attribute_group`,`id_shop`),
  KEY `id_shop` (`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ps_attribute_group_shop`
--

INSERT INTO `ps_attribute_group_shop` (`id_attribute_group`, `id_shop`) VALUES
(1, 1),
(2, 1),
(3, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_attribute_impact`
--

CREATE TABLE IF NOT EXISTS `ps_attribute_impact` (
  `id_attribute_impact` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_product` int(11) unsigned NOT NULL,
  `id_attribute` int(11) unsigned NOT NULL,
  `weight` decimal(20,6) NOT NULL,
  `price` decimal(17,2) NOT NULL,
  PRIMARY KEY (`id_attribute_impact`),
  UNIQUE KEY `id_product` (`id_product`,`id_attribute`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_attribute_lang`
--

CREATE TABLE IF NOT EXISTS `ps_attribute_lang` (
  `id_attribute` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id_attribute`,`id_lang`),
  KEY `id_lang` (`id_lang`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ps_attribute_lang`
--

INSERT INTO `ps_attribute_lang` (`id_attribute`, `id_lang`, `name`) VALUES
(18, 1, '35'),
(19, 1, '36'),
(20, 1, '37'),
(21, 1, '38'),
(22, 1, '39'),
(23, 1, '40'),
(16, 1, 'Amarillo'),
(14, 1, 'Azul'),
(7, 1, 'Beige'),
(8, 1, 'Blanco'),
(9, 1, 'Blanco roto'),
(12, 1, 'Camel'),
(5, 1, 'Gris'),
(6, 1, 'Gris pardo'),
(3, 1, 'L'),
(2, 1, 'M'),
(17, 1, 'Marrón'),
(13, 1, 'Naranja'),
(11, 1, 'Negro'),
(10, 1, 'Rojo'),
(24, 1, 'Rosa'),
(1, 1, 'S'),
(4, 1, 'Talla única'),
(15, 1, 'Verde');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_attribute_shop`
--

CREATE TABLE IF NOT EXISTS `ps_attribute_shop` (
  `id_attribute` int(11) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_attribute`,`id_shop`),
  KEY `id_shop` (`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ps_attribute_shop`
--

INSERT INTO `ps_attribute_shop` (`id_attribute`, `id_shop`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_badge`
--

CREATE TABLE IF NOT EXISTS `ps_badge` (
  `id_badge` int(11) NOT NULL AUTO_INCREMENT,
  `id_ps_badge` int(11) NOT NULL,
  `type` varchar(32) NOT NULL,
  `id_group` int(11) NOT NULL,
  `group_position` int(11) NOT NULL,
  `scoring` int(11) NOT NULL,
  `awb` int(11) DEFAULT '0',
  `validated` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_badge`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=226 ;

--
-- Volcado de datos para la tabla `ps_badge`
--

INSERT INTO `ps_badge` (`id_badge`, `id_ps_badge`, `type`, `id_group`, `group_position`, `scoring`, `awb`, `validated`) VALUES
(1, 159, 'feature', 41, 1, 5, 1, 0),
(2, 160, 'feature', 41, 2, 10, 1, 0),
(3, 161, 'feature', 41, 3, 15, 1, 0),
(4, 162, 'feature', 41, 4, 20, 1, 0),
(5, 163, 'feature', 41, 1, 5, 1, 0),
(6, 164, 'feature', 41, 2, 10, 1, 0),
(7, 165, 'feature', 41, 3, 15, 1, 0),
(8, 166, 'feature', 41, 4, 20, 1, 0),
(9, 233, 'feature', 41, 1, 5, 1, 0),
(10, 234, 'feature', 41, 2, 10, 1, 0),
(11, 235, 'feature', 41, 3, 15, 1, 0),
(12, 236, 'feature', 41, 4, 20, 1, 0),
(13, 249, 'feature', 41, 1, 5, 1, 0),
(14, 250, 'feature', 41, 2, 10, 1, 0),
(15, 251, 'feature', 41, 3, 15, 1, 0),
(16, 252, 'feature', 41, 4, 20, 1, 0),
(17, 253, 'feature', 41, 1, 5, 1, 0),
(18, 254, 'feature', 41, 2, 10, 1, 0),
(19, 255, 'feature', 41, 3, 15, 1, 0),
(20, 256, 'feature', 41, 4, 20, 1, 0),
(21, 261, 'feature', 41, 1, 5, 1, 0),
(22, 262, 'feature', 41, 2, 10, 1, 0),
(23, 269, 'feature', 41, 1, 5, 1, 0),
(24, 270, 'feature', 41, 2, 10, 1, 0),
(25, 271, 'feature', 41, 3, 15, 1, 0),
(26, 272, 'feature', 41, 4, 20, 1, 0),
(27, 273, 'feature', 41, 1, 5, 1, 0),
(28, 274, 'feature', 41, 2, 10, 1, 0),
(29, 275, 'feature', 41, 3, 15, 1, 0),
(30, 276, 'feature', 41, 4, 20, 1, 0),
(31, 277, 'feature', 41, 1, 5, 1, 0),
(32, 278, 'feature', 41, 2, 10, 1, 0),
(33, 279, 'feature', 41, 3, 15, 1, 0),
(34, 280, 'feature', 41, 4, 20, 1, 0),
(35, 281, 'feature', 41, 1, 5, 1, 0),
(36, 282, 'feature', 41, 2, 10, 1, 0),
(37, 283, 'feature', 41, 3, 15, 1, 0),
(38, 284, 'feature', 41, 4, 20, 1, 0),
(39, 285, 'feature', 41, 1, 5, 1, 0),
(40, 286, 'feature', 41, 2, 10, 1, 0),
(41, 287, 'feature', 41, 3, 15, 1, 0),
(42, 288, 'feature', 41, 4, 20, 1, 0),
(43, 289, 'feature', 41, 1, 5, 1, 0),
(44, 290, 'feature', 41, 2, 10, 1, 0),
(45, 291, 'feature', 41, 3, 15, 1, 0),
(46, 292, 'feature', 41, 4, 20, 1, 0),
(47, 293, 'feature', 41, 1, 5, 1, 0),
(48, 294, 'feature', 41, 2, 10, 1, 0),
(49, 295, 'feature', 41, 3, 15, 1, 0),
(50, 296, 'feature', 41, 4, 20, 1, 0),
(51, 297, 'feature', 41, 1, 5, 1, 0),
(52, 298, 'feature', 41, 2, 10, 1, 0),
(53, 299, 'feature', 41, 3, 15, 1, 0),
(54, 300, 'feature', 41, 4, 20, 1, 0),
(55, 301, 'feature', 41, 1, 5, 1, 0),
(56, 302, 'feature', 41, 2, 10, 1, 0),
(57, 303, 'feature', 41, 3, 15, 1, 0),
(58, 304, 'feature', 41, 4, 20, 1, 0),
(59, 305, 'feature', 41, 1, 5, 1, 0),
(60, 306, 'feature', 41, 2, 10, 1, 0),
(61, 307, 'feature', 41, 3, 15, 1, 0),
(62, 308, 'feature', 41, 4, 20, 1, 0),
(63, 309, 'feature', 41, 1, 5, 1, 0),
(64, 310, 'feature', 41, 2, 10, 1, 0),
(65, 311, 'feature', 41, 3, 15, 1, 0),
(66, 312, 'feature', 41, 4, 20, 1, 0),
(67, 313, 'feature', 41, 1, 5, 1, 0),
(68, 314, 'feature', 41, 2, 10, 1, 0),
(69, 315, 'feature', 41, 3, 15, 1, 0),
(70, 316, 'feature', 41, 4, 20, 1, 0),
(71, 317, 'feature', 41, 1, 5, 1, 0),
(72, 318, 'feature', 41, 2, 10, 1, 0),
(73, 319, 'feature', 41, 3, 15, 1, 0),
(74, 320, 'feature', 41, 4, 20, 1, 0),
(75, 321, 'feature', 41, 1, 5, 1, 0),
(76, 322, 'feature', 41, 2, 10, 1, 0),
(77, 323, 'feature', 41, 3, 15, 1, 0),
(78, 324, 'feature', 41, 4, 20, 1, 0),
(79, 325, 'feature', 41, 1, 5, 1, 0),
(80, 326, 'feature', 41, 2, 10, 1, 0),
(81, 327, 'feature', 41, 3, 15, 1, 0),
(82, 328, 'feature', 41, 4, 20, 1, 0),
(83, 329, 'feature', 41, 1, 5, 1, 0),
(84, 330, 'feature', 41, 2, 10, 1, 0),
(85, 331, 'feature', 41, 3, 15, 1, 0),
(86, 332, 'feature', 41, 4, 20, 1, 0),
(87, 333, 'feature', 41, 1, 5, 1, 0),
(88, 334, 'feature', 41, 2, 10, 1, 0),
(89, 335, 'feature', 41, 3, 15, 1, 0),
(90, 336, 'feature', 41, 4, 20, 1, 0),
(91, 337, 'feature', 41, 1, 5, 1, 0),
(92, 338, 'feature', 41, 2, 10, 1, 0),
(93, 339, 'feature', 41, 3, 15, 1, 0),
(94, 340, 'feature', 41, 4, 20, 1, 0),
(95, 341, 'feature', 41, 1, 5, 1, 0),
(96, 342, 'feature', 41, 2, 10, 1, 0),
(97, 343, 'feature', 41, 3, 15, 1, 0),
(98, 344, 'feature', 41, 4, 20, 1, 0),
(99, 345, 'feature', 41, 1, 5, 1, 0),
(100, 346, 'feature', 41, 2, 10, 1, 0),
(101, 347, 'feature', 41, 3, 15, 1, 0),
(102, 348, 'feature', 41, 4, 20, 1, 0),
(103, 349, 'feature', 41, 1, 5, 1, 0),
(104, 350, 'feature', 41, 2, 10, 1, 0),
(105, 351, 'feature', 41, 3, 15, 1, 0),
(106, 352, 'feature', 41, 4, 20, 1, 0),
(107, 353, 'feature', 41, 1, 5, 1, 0),
(108, 354, 'feature', 41, 2, 10, 1, 0),
(109, 355, 'feature', 41, 3, 15, 1, 0),
(110, 356, 'feature', 41, 4, 20, 1, 0),
(111, 357, 'feature', 41, 1, 5, 1, 0),
(112, 358, 'feature', 41, 2, 10, 1, 0),
(113, 359, 'feature', 41, 3, 15, 1, 0),
(114, 360, 'feature', 41, 4, 20, 1, 0),
(115, 1, 'feature', 1, 1, 10, 0, 1),
(116, 2, 'feature', 2, 1, 10, 0, 0),
(117, 3, 'feature', 2, 2, 15, 0, 0),
(118, 4, 'feature', 3, 1, 15, 0, 1),
(119, 5, 'feature', 3, 2, 15, 0, 0),
(120, 6, 'feature', 4, 1, 15, 0, 0),
(121, 7, 'feature', 4, 2, 15, 0, 0),
(122, 8, 'feature', 5, 1, 5, 0, 0),
(123, 9, 'feature', 5, 2, 10, 0, 0),
(124, 10, 'feature', 6, 1, 15, 0, 0),
(125, 11, 'feature', 6, 2, 10, 0, 0),
(126, 12, 'feature', 6, 3, 10, 0, 0),
(127, 13, 'feature', 5, 3, 10, 0, 0),
(128, 14, 'feature', 5, 4, 15, 0, 0),
(129, 15, 'feature', 5, 5, 20, 0, 0),
(130, 16, 'feature', 5, 6, 20, 0, 0),
(131, 17, 'achievement', 7, 1, 5, 0, 1),
(132, 18, 'achievement', 7, 2, 10, 0, 1),
(133, 19, 'feature', 8, 1, 15, 0, 0),
(134, 20, 'feature', 8, 2, 15, 0, 0),
(135, 21, 'feature', 9, 1, 15, 0, 0),
(136, 22, 'feature', 10, 1, 10, 0, 0),
(137, 23, 'feature', 10, 2, 10, 0, 0),
(138, 24, 'feature', 10, 3, 10, 0, 0),
(139, 25, 'feature', 10, 4, 10, 0, 0),
(140, 26, 'feature', 10, 5, 10, 0, 0),
(141, 27, 'feature', 4, 3, 10, 0, 0),
(142, 28, 'feature', 3, 3, 10, 0, 0),
(143, 29, 'achievement', 11, 1, 5, 0, 0),
(144, 30, 'achievement', 11, 2, 10, 0, 0),
(145, 31, 'achievement', 11, 3, 15, 0, 0),
(146, 32, 'achievement', 11, 4, 20, 0, 0),
(147, 33, 'achievement', 11, 5, 25, 0, 0),
(148, 34, 'achievement', 11, 6, 30, 0, 0),
(149, 35, 'achievement', 7, 3, 15, 0, 1),
(150, 36, 'achievement', 7, 4, 20, 0, 0),
(151, 37, 'achievement', 7, 5, 25, 0, 0),
(152, 38, 'achievement', 7, 6, 30, 0, 0),
(153, 39, 'achievement', 12, 1, 5, 0, 1),
(154, 40, 'achievement', 12, 2, 10, 0, 0),
(155, 41, 'achievement', 12, 3, 15, 0, 0),
(156, 42, 'achievement', 12, 4, 20, 0, 0),
(157, 43, 'achievement', 12, 5, 25, 0, 0),
(158, 44, 'achievement', 12, 6, 30, 0, 0),
(159, 45, 'achievement', 13, 1, 5, 0, 0),
(160, 46, 'achievement', 13, 2, 10, 0, 0),
(161, 47, 'achievement', 13, 3, 15, 0, 0),
(162, 48, 'achievement', 13, 4, 20, 0, 0),
(163, 49, 'achievement', 13, 5, 25, 0, 0),
(164, 50, 'achievement', 13, 6, 30, 0, 0),
(165, 51, 'achievement', 14, 1, 5, 0, 0),
(166, 52, 'achievement', 14, 2, 10, 0, 0),
(167, 53, 'achievement', 14, 3, 15, 0, 0),
(168, 54, 'achievement', 14, 4, 20, 0, 0),
(169, 55, 'achievement', 14, 5, 25, 0, 0),
(170, 56, 'achievement', 14, 6, 30, 0, 0),
(171, 57, 'achievement', 15, 1, 5, 0, 0),
(172, 58, 'achievement', 15, 2, 10, 0, 0),
(173, 59, 'achievement', 15, 3, 15, 0, 0),
(174, 60, 'achievement', 15, 4, 20, 0, 0),
(175, 61, 'achievement', 15, 5, 25, 0, 0),
(176, 62, 'achievement', 15, 6, 30, 0, 0),
(177, 63, 'achievement', 16, 1, 5, 0, 0),
(178, 64, 'achievement', 16, 2, 10, 0, 0),
(179, 65, 'achievement', 16, 3, 15, 0, 0),
(180, 66, 'achievement', 16, 4, 20, 0, 0),
(181, 67, 'achievement', 16, 5, 25, 0, 0),
(182, 68, 'achievement', 16, 6, 30, 0, 0),
(183, 74, 'international', 22, 1, 10, 0, 0),
(184, 75, 'international', 23, 1, 10, 0, 0),
(185, 76, 'international', 24, 1, 10, 0, 0),
(186, 77, 'international', 25, 1, 10, 0, 0),
(187, 83, 'international', 31, 1, 10, 0, 0),
(188, 85, 'international', 32, 1, 10, 0, 0),
(189, 86, 'international', 33, 1, 10, 0, 0),
(190, 87, 'international', 34, 1, 10, 0, 0),
(191, 88, 'feature', 35, 1, 5, 0, 0),
(192, 89, 'feature', 35, 2, 10, 0, 0),
(193, 90, 'feature', 35, 3, 10, 0, 0),
(194, 91, 'feature', 35, 4, 10, 0, 0),
(195, 92, 'feature', 35, 5, 10, 0, 0),
(196, 93, 'feature', 35, 6, 10, 0, 0),
(197, 94, 'feature', 36, 1, 5, 0, 1),
(198, 95, 'feature', 36, 2, 5, 0, 0),
(199, 96, 'feature', 36, 3, 10, 0, 0),
(200, 97, 'feature', 36, 4, 10, 0, 0),
(201, 98, 'feature', 36, 5, 20, 0, 0),
(202, 99, 'feature', 36, 6, 20, 0, 0),
(203, 100, 'feature', 8, 3, 15, 0, 1),
(204, 101, 'achievement', 37, 1, 5, 0, 0),
(205, 102, 'achievement', 37, 2, 5, 0, 0),
(206, 103, 'achievement', 37, 3, 10, 0, 0),
(207, 104, 'achievement', 37, 4, 10, 0, 0),
(208, 105, 'achievement', 37, 5, 15, 0, 0),
(209, 106, 'achievement', 37, 6, 15, 0, 0),
(210, 107, 'achievement', 38, 1, 10, 0, 0),
(211, 108, 'achievement', 38, 2, 10, 0, 0),
(212, 109, 'achievement', 38, 3, 15, 0, 0),
(213, 110, 'achievement', 38, 4, 20, 0, 0),
(214, 111, 'achievement', 38, 5, 25, 0, 0),
(215, 112, 'achievement', 38, 6, 30, 0, 0),
(216, 113, 'achievement', 39, 1, 10, 0, 0),
(217, 114, 'achievement', 39, 2, 20, 0, 0),
(218, 115, 'achievement', 39, 3, 30, 0, 0),
(219, 116, 'achievement', 39, 4, 40, 0, 0),
(220, 117, 'achievement', 39, 5, 50, 0, 0),
(221, 118, 'achievement', 39, 6, 50, 0, 0),
(222, 119, 'feature', 40, 1, 10, 0, 0),
(223, 120, 'feature', 40, 2, 15, 0, 0),
(224, 121, 'feature', 40, 3, 20, 0, 0),
(225, 122, 'feature', 40, 4, 25, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_badge_lang`
--

CREATE TABLE IF NOT EXISTS `ps_badge_lang` (
  `id_badge` int(11) NOT NULL,
  `id_lang` int(11) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `group_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_badge`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ps_badge_lang`
--

INSERT INTO `ps_badge_lang` (`id_badge`, `id_lang`, `name`, `description`, `group_name`) VALUES
(1, 1, 'Shopgate installed', 'You have installed the Shopgate module', 'Partners'),
(2, 1, 'Shopgate configured', 'You have configured the Shopgate module', 'Partners'),
(3, 1, 'Shopgate active', 'Your Shopgate module is active', 'Partners'),
(4, 1, 'Shopgate very active', 'Your Shopgate module is very active', 'Partners'),
(5, 1, 'Skrill installed', 'You have installed the Skrill module', 'Partners'),
(6, 1, 'Skrill configured', 'You have configured the Skrill module', 'Partners'),
(7, 1, 'Skrill active', 'Your Skrill module is active', 'Partners'),
(8, 1, 'Skrill very active', 'Your Skrill module is very active', 'Partners'),
(9, 1, 'Authorize Aim installed', 'You have installed the Authorize Aim module', 'Partners'),
(10, 1, 'Authorize Aim configured', 'You have configured the Authorize Aim module', 'Partners'),
(11, 1, 'Authorize Aim active', 'Your Authorize Aim module is active', 'Partners'),
(12, 1, 'Authorize Aim very active', 'Your Authorize Aim module is very active', 'Partners'),
(13, 1, 'Ebay installed', 'You have installed the Ebay module', 'Partners'),
(14, 1, 'Ebay configured', 'You have configured the Ebay module', 'Partners'),
(15, 1, 'Ebay active', 'Your Ebay module is active', 'Partners'),
(16, 1, 'Ebay very active', 'Your Ebay module is very active', 'Partners'),
(17, 1, 'PayPlug installed', 'You have installed the PayPlug module', 'Partners'),
(18, 1, 'PayPlug configured', 'You have configured the PayPlug module', 'Partners'),
(19, 1, 'PayPlug active', 'Your PayPlug module is active', 'Partners'),
(20, 1, 'PayPlug very active', 'Your PayPlug module is very active', 'Partners'),
(21, 1, 'Affinity Items installed', 'You have installed the Affinity Items module', 'Partners'),
(22, 1, 'Affinity Items configured', 'You have configured the Affinity Items module', 'Partners'),
(23, 1, 'DPD Poland installed', 'You have installed the DPD Poland module', 'Partners'),
(24, 1, 'DPD Poland configured', 'You have configured the DPD Poland module', 'Partners'),
(25, 1, 'DPD Poland active', 'Your DPD Poland module is active', 'Partners'),
(26, 1, 'DPD Poland very active', 'Your DPD Poland module is very active', 'Partners'),
(27, 1, 'Envoimoinscher installed', 'You have installed the Envoimoinscher module', 'Partners'),
(28, 1, 'Envoimoinscher configured', 'You have configured the Envoimoinscher module', 'Partners'),
(29, 1, 'Envoimoinscher active', 'Your Envoimoinscher module is active', 'Partners'),
(30, 1, 'Envoimoinscher very active', 'Your Envoimoinscher module is very active', 'Partners'),
(31, 1, 'Klik&Pay installed', 'You have installed the Klik&Pay module', 'Partners'),
(32, 1, 'Klik&Pay configured', 'You have configured the Klik&Pay module', 'Partners'),
(33, 1, 'Klik&Pay active', 'Your Klik&Pay module is active', 'Partners'),
(34, 1, 'Klik&Pay very active', 'Your Klik&Pay module is very active', 'Partners'),
(35, 1, 'Clickline installed', 'You have installed the Clickline module', 'Partners'),
(36, 1, 'Clickline configured', 'You have configured the Clickline module', 'Partners'),
(37, 1, 'Clickline active', 'Your Clickline module is active', 'Partners'),
(38, 1, 'Clickline very active', 'Your Clickline module is very active', 'Partners'),
(39, 1, 'CDiscount installed', 'You have installed the CDiscount module', 'Partners'),
(40, 1, 'CDiscount configured', 'You have configured the CDiscount module', 'Partners'),
(41, 1, 'CDiscount active', 'Your CDiscount module is active', 'Partners'),
(42, 1, 'CDiscount very active', 'Your CDiscount module is very active', 'Partners'),
(43, 1, 'illicoPresta installed', 'You have installed the illicoPresta module', 'Partners'),
(44, 1, 'illicoPresta configured', 'You have configured the illicoPresta module', 'Partners'),
(45, 1, 'illicoPresta active', 'Your illicoPresta module is active', 'Partners'),
(46, 1, 'illicoPresta very active', 'Your illicoPresta module is very active', 'Partners'),
(47, 1, 'NetReviews installed', 'You have installed the NetReviews module', 'Partners'),
(48, 1, 'NetReviews configured', 'You have configured the NetReviews module', 'Partners'),
(49, 1, 'NetReviews active', 'Your NetReviews module is active', 'Partners'),
(50, 1, 'NetReviews very active', 'Your NetReviews module is very active', 'Partners'),
(51, 1, 'Bluesnap installed', 'You have installed the Bluesnap module', 'Partners'),
(52, 1, 'Bluesnap configured', 'You have configured the Bluesnap module', 'Partners'),
(53, 1, 'Bluesnap active', 'Your Bluesnap module is active', 'Partners'),
(54, 1, 'Bluesnap very active', 'Your Bluesnap module is very active', 'Partners'),
(55, 1, 'Desjardins installed', 'You have installed the Desjardins module', 'Partners'),
(56, 1, 'Desjardins configured', 'You have configured the Desjardins module', 'Partners'),
(57, 1, 'Desjardins active', 'Your Desjardins module is active', 'Partners'),
(58, 1, 'Desjardins very active', 'Your Desjardins module is very active', 'Partners'),
(59, 1, 'First Data installed', 'You have installed the First Data module', 'Partners'),
(60, 1, 'First Data configured', 'You have configured the First Data module', 'Partners'),
(61, 1, 'First Data active', 'Your First Data module is active', 'Partners'),
(62, 1, 'First Data very active', 'Your First Data module is very active', 'Partners'),
(63, 1, 'Give.it installed', 'You have installed the Give.it module', 'Partners'),
(64, 1, 'Give.it configured', 'You have configured the Give.it module', 'Partners'),
(65, 1, 'Give.it active', 'Your Give.it module is active', 'Partners'),
(66, 1, 'Give.it very active', 'Your Give.it module is very active', 'Partners'),
(67, 1, 'Google Analytics installed', 'You have installed the Google Analytics module', 'Partners'),
(68, 1, 'Google Analytics configured', 'You have configured the Google Analytics module', 'Partners'),
(69, 1, 'Google Analytics active', 'Your Google Analytics module is active', 'Partners'),
(70, 1, 'Google Analytics very active', 'Your Google Analytics module is very active', 'Partners'),
(71, 1, 'PagSeguro installed', 'You have installed the PagSeguro module', 'Partners'),
(72, 1, 'PagSeguro configured', 'You have configured the PagSeguro module', 'Partners'),
(73, 1, 'PagSeguro active', 'Your PagSeguro module is active', 'Partners'),
(74, 1, 'PagSeguro very active', 'Your PagSeguro module is very active', 'Partners'),
(75, 1, 'Paypal MX installed', 'You have installed the Paypal MX module', 'Partners'),
(76, 1, 'Paypal MX configured', 'You have configured the Paypal MX module', 'Partners'),
(77, 1, 'Paypal MX active', 'Your Paypal MX module is active', 'Partners'),
(78, 1, 'Paypal MX very active', 'Your Paypal MX module is very active', 'Partners'),
(79, 1, 'Paypal USA installed', 'You have installed the Paypal USA module', 'Partners'),
(80, 1, 'Paypal USA configured', 'You have configured the Paypal USA module', 'Partners'),
(81, 1, 'Paypal USA active', 'Your Paypal USA module is active', 'Partners'),
(82, 1, 'Paypal USA very active', 'Your Paypal USA module is very active', 'Partners'),
(83, 1, 'PayULatam installed', 'You have installed the PayULatam module', 'Partners'),
(84, 1, 'PayULatam configured', 'You have configured the PayULatam module', 'Partners'),
(85, 1, 'PayULatam active', 'Your PayULatam module is active', 'Partners'),
(86, 1, 'PayULatam very active', 'Your PayULatam module is very active', 'Partners'),
(87, 1, 'PrestaStats installed', 'You have installed the PrestaStats module', 'Partners'),
(88, 1, 'PrestaStats configured', 'You have configured the PrestaStats module', 'Partners'),
(89, 1, 'PrestaStats active', 'Your PrestaStats module is active', 'Partners'),
(90, 1, 'PrestaStats very active', 'Your PrestaStats module is very active', 'Partners'),
(91, 1, 'Riskified installed', 'You have installed the Riskified module', 'Partners'),
(92, 1, 'Riskified configured', 'You have configured the Riskified module', 'Partners'),
(93, 1, 'Riskified active', 'Your Riskified module is active', 'Partners'),
(94, 1, 'Riskified very active', 'Your Riskified module is very active', 'Partners'),
(95, 1, 'Simplify installed', 'You have installed the Simplify module', 'Partners'),
(96, 1, 'Simplify configured', 'You have configured the Simplify module', 'Partners'),
(97, 1, 'Simplify active', 'Your Simplify module is active', 'Partners'),
(98, 1, 'Simplify very active', 'Your Simplify module is very active', 'Partners'),
(99, 1, 'VTPayment installed', 'You have installed the VTPayment module', 'Partners'),
(100, 1, 'VTPayment configured', 'You have configured the VTPayment module', 'Partners'),
(101, 1, 'VTPayment active', 'Your VTPayment module is active', 'Partners'),
(102, 1, 'VTPayment very active', 'Your VTPayment module is very active', 'Partners'),
(103, 1, 'Yotpo installed', 'You have installed the Yotpo module', 'Partners'),
(104, 1, 'Yotpo configured', 'You have configured the Yotpo module', 'Partners'),
(105, 1, 'Yotpo active', 'Your Yotpo module is active', 'Partners'),
(106, 1, 'Yotpo very active', 'Your Yotpo module is very active', 'Partners'),
(107, 1, 'Youstice installed', 'You have installed the Youstice module', 'Partners'),
(108, 1, 'Youstice configured', 'You have configured the Youstice module', 'Partners'),
(109, 1, 'Youstice active', 'Your Youstice module is active', 'Partners'),
(110, 1, 'Youstice very active', 'Your Youstice module is very active', 'Partners'),
(111, 1, 'Loyalty Lion installed', 'You have installed the Loyalty Lion module', 'Partners'),
(112, 1, 'Loyalty Lion configured', 'You have configured the Loyalty Lion module', 'Partners'),
(113, 1, 'Loyalty Lion active', 'Your Loyalty Lion module is active', 'Partners'),
(114, 1, 'Loyalty Lion very active', 'Your Loyalty Lion module is very active', 'Partners'),
(115, 1, 'SEO', 'You enabled the URL rewriting through the tab "Preferences > SEO and URLs".', 'SEO'),
(116, 1, 'Site Performance', 'You enabled CCC (Combine, Compress and Cache), Rijndael and Smarty through the tab \r\nAdvanced Parameters > Performance.', 'Site Performance'),
(117, 1, 'Site Performance', 'You enabled media servers through the tab "Advanced parameters > Performance".', 'Site Performance'),
(118, 1, 'Payment', 'You configured a payment solution on your shop.', 'Payment'),
(119, 1, 'Payment', 'You offer two different payment methods to your customers.', 'Payment'),
(120, 1, 'Shipping', 'You configured a carrier on your shop.', 'Shipping'),
(121, 1, 'Shipping', 'You offer two shipping solutions (carriers) to your customers.', 'Shipping'),
(122, 1, 'Catalog Size', 'You added your first product to your catalog!', 'Catalog Size'),
(123, 1, 'Catalog Size', 'You have 10 products within your catalog.', 'Catalog Size'),
(124, 1, 'Contact information', 'You configured your phone number so your customers can reach you!', 'Contact information'),
(125, 1, 'Contact information', 'You added a third email address to your contact form.', 'Contact information'),
(126, 1, 'Contact information', 'You suggest a total of 5 departments to be reached by your customers via your contact form.', 'Contact information'),
(127, 1, 'Catalog Size', 'You have 100 products within your catalog.', 'Catalog Size'),
(128, 1, 'Catalog Size', 'You have 1,000 products within your catalog.', 'Catalog Size'),
(129, 1, 'Catalog Size', 'You have 10,000 products within your catalog.', 'Catalog Size'),
(130, 1, 'Catalog Size', 'You have 100,000 products within your catalog.', 'Catalog Size'),
(131, 1, 'Days of Experience', 'You just installed PrestaShop!', 'Days of Experience'),
(132, 1, 'Days of Experience', 'You installed PrestaShop a week ago!', 'Days of Experience'),
(133, 1, 'Customization', 'You uploaded your own logo.', 'Customization'),
(134, 1, 'Customization', 'You installed a new template.', 'Customization'),
(135, 1, 'Addons', 'You connected your back-office to the Addons platform using your PrestaShop Addons account.', 'Addons'),
(136, 1, 'Multistores', 'You enabled the Multistores feature.', 'Multistores'),
(137, 1, 'Multistores', 'You manage two shops with the Multistores feature.', 'Multistores'),
(138, 1, 'Multistores', 'You manage two different groups of shops using the Multistores feature.', 'Multistores'),
(139, 1, 'Multistores', 'You manage five shops with the Multistores feature.', 'Multistores'),
(140, 1, 'Multistores', 'You manage five different groups of shops using the Multistores feature.', 'Multistores'),
(141, 1, 'Shipping', 'You offer three different shipping solutions (carriers) to your customers.', 'Shipping'),
(142, 1, 'Payment', 'You offer three different payment methods to your customers.', 'Payment'),
(143, 1, 'Revenue', 'You get this badge when you reach 300000 COP in sales.', 'Revenue'),
(144, 1, 'Revenue', 'You get this badge when you reach 100000 COP in sales.', 'Revenue'),
(145, 1, 'Revenue', 'You get this badge when you reach 30000 COP in sales.', 'Revenue'),
(146, 1, 'Revenue', 'You get this badge when you reach 300000 COP in sales.', 'Revenue'),
(147, 1, 'Revenue', 'You get this badge when you reach 100000 COP in sales.', 'Revenue'),
(148, 1, 'Revenue', 'You get this badge when you reach 30000 COP in sales.', 'Revenue'),
(149, 1, 'Days of Experience', 'You installed PrestaShop a month ago!', 'Days of Experience'),
(150, 1, 'Days of Experience', 'You installed PrestaShop six months ago!', 'Days of Experience'),
(151, 1, 'Days of Experience', 'You installed PrestaShop a year ago!', 'Days of Experience'),
(152, 1, 'Days of Experience', 'You installed PrestaShop two years ago!', 'Days of Experience'),
(153, 1, 'Visitors', 'You reached 10 visitors!', 'Visitors'),
(154, 1, 'Visitors', 'You reached 100 visitors!', 'Visitors'),
(155, 1, 'Visitors', 'You reached 1,000 visitors!', 'Visitors'),
(156, 1, 'Visitors', 'You reached 10,000 visitors!', 'Visitors'),
(157, 1, 'Visitors', 'You reached 100,000 visitors!', 'Visitors'),
(158, 1, 'Visitors', 'You reached 1,000,000 visitors!', 'Visitors'),
(159, 1, 'Customer Carts', 'Two carts have been created by visitors', 'Customer Carts'),
(160, 1, 'Customer Carts', 'Ten carts have been created by visitors.', 'Customer Carts'),
(161, 1, 'Customer Carts', 'A hundred carts have been created by visitors on your shop.', 'Customer Carts'),
(162, 1, 'Customer Carts', 'A thousand carts have been created by visitors on your shop.', 'Customer Carts'),
(163, 1, 'Customer Carts', '10,000 carts have been created by visitors.', 'Customer Carts'),
(164, 1, 'Customer Carts', '100,000 carts have been created by visitors.', 'Customer Carts'),
(165, 1, 'Orders', 'You received your first order.', 'Orders'),
(166, 1, 'Orders', '10 orders have been placed through your online shop.', 'Orders'),
(167, 1, 'Orders', 'You received 100 orders through your online shop!', 'Orders'),
(168, 1, 'Orders', 'You received 1,000 orders through your online shop, congrats!', 'Orders'),
(169, 1, 'Orders', 'You received 10,000 orders through your online shop, cheers!', 'Orders'),
(170, 1, 'Orders', 'You received 100,000 orders through your online shop!', 'Orders'),
(171, 1, 'Customer Service Threads', 'You received  your first customer''s message.', 'Customer Service Threads'),
(172, 1, 'Customer Service Threads', 'You received 10 messages from your customers.', 'Customer Service Threads'),
(173, 1, 'Customer Service Threads', 'You received 100 messages from your customers.', 'Customer Service Threads'),
(174, 1, 'Customer Service Threads', 'You received 1,000 messages from your customers.', 'Customer Service Threads'),
(175, 1, 'Customer Service Threads', 'You received 10,000 messages from your customers.', 'Customer Service Threads'),
(176, 1, 'Customer Service Threads', 'You received 100,000 messages from your customers.', 'Customer Service Threads'),
(177, 1, 'Customers', 'You got the first customer registered on your shop!', 'Customers'),
(178, 1, 'Customers', 'You have over 10 customers registered on your shop.', 'Customers'),
(179, 1, 'Customers', 'You have over 100 customers registered on your shop.', 'Customers'),
(180, 1, 'Customers', 'You have over 1,000 customers registered on your shop.', 'Customers'),
(181, 1, 'Customers', 'You have over 10,000 customers registered on your shop.', 'Customers'),
(182, 1, 'Customers', 'You have over 100,000 customers registered on your shop.', 'Customers'),
(183, 1, 'North America', 'You got your first sale in North America', 'North America'),
(184, 1, 'Oceania', 'You got your first sale in Oceania', 'Oceania'),
(185, 1, 'Central America', 'You got your first sale in Central America', 'Central America'),
(186, 1, 'South America', 'You got your first sale in South America', 'South America'),
(187, 1, 'Asia', 'You got your first sale in Asia', 'Asia'),
(188, 1, 'Europe', 'You got your first sale in  Europe!', 'Europe'),
(189, 1, 'Africa', 'You got your first sale in Africa', 'Africa'),
(190, 1, 'Maghreb', 'You got your first sale in Maghreb', 'Maghreb'),
(191, 1, 'Your Team''s Employees', 'First employee account added to your shop', 'Your Team''s Employees'),
(192, 1, 'Your Team''s Employees', '3 employee accounts added to your shop', 'Your Team''s Employees'),
(193, 1, 'Your Team''s Employees', '5 employee accounts added to your shop', 'Your Team''s Employees'),
(194, 1, 'Your Team''s Employees', '10 employee accounts added to your shop', 'Your Team''s Employees'),
(195, 1, 'Your Team''s Employees', '20 employee accounts added to your shop', 'Your Team''s Employees'),
(196, 1, 'Your Team''s Employees', '40 employee accounts added to your shop', 'Your Team''s Employees'),
(197, 1, 'Product Pictures', 'First photo added to your catalog', 'Product Pictures'),
(198, 1, 'Product Pictures', '50 photos added to your catalog', 'Product Pictures'),
(199, 1, 'Product Pictures', '100 photos added to your catalog', 'Product Pictures'),
(200, 1, 'Product Pictures', '1,000 photos added to your catalog', 'Product Pictures'),
(201, 1, 'Product Pictures', '10,000 photos added to your catalog', 'Product Pictures'),
(202, 1, 'Product Pictures', '50,000 photos added to your catalog', 'Product Pictures'),
(203, 1, 'Customization', 'First CMS page added to your catalog', 'Customization'),
(204, 1, 'Cart Rules', 'First cart rules configured on your shop', 'Cart Rules'),
(205, 1, 'Cart Rules', 'You have 10 cart rules configured on your shop', 'Cart Rules'),
(206, 1, 'Cart Rules', 'You have 100 cart rules configured on your shop', 'Cart Rules'),
(207, 1, 'Cart Rules', 'You have 500 cart rules configured on your shop', 'Cart Rules'),
(208, 1, 'Cart Rules', 'You have 1,000 cart rules configured on your shop', 'Cart Rules'),
(209, 1, 'Cart Rules', 'You have 5,000 cart rules configured on your shop', 'Cart Rules'),
(210, 1, 'International Orders', 'First international order placed on your shop.', 'International Orders'),
(211, 1, 'International Orders', '10 international orders placed on your shop.', 'International Orders'),
(212, 1, 'International Orders', '100 international orders placed on your shop!', 'International Orders'),
(213, 1, 'International Orders', '1,000 international orders placed on your shop!', 'International Orders'),
(214, 1, 'International Orders', '5,000 international orders placed on your shop!', 'International Orders'),
(215, 1, 'International Orders', '10,000 international orders placed on your shop!', 'International Orders'),
(216, 1, 'Store', 'First store configured on your shop!', 'Store'),
(217, 1, 'Store', 'You have 2 stores configured on your shop', 'Store'),
(218, 1, 'Store', 'You have 5 stores configured on your shop', 'Store'),
(219, 1, 'Store', 'You have 10 stores configured on your shop', 'Store'),
(220, 1, 'Store', 'You have 20 stores configured on your shop', 'Store'),
(221, 1, 'Store', 'You have 50 stores configured on your shop', 'Store'),
(222, 1, 'Webservice x1', 'First webservice account added to your shop', 'WebService'),
(223, 1, 'Webservice x2', '2 webservice accounts added to your shop', 'WebService'),
(224, 1, 'Webservice x3', '3 webservice accounts added to your shop', 'WebService'),
(225, 1, 'Webservice x4', '4 webservice accounts added to your shop', 'WebService');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_carrier`
--

CREATE TABLE IF NOT EXISTS `ps_carrier` (
  `id_carrier` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_reference` int(10) unsigned NOT NULL,
  `id_tax_rules_group` int(10) unsigned DEFAULT '0',
  `name` varchar(64) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `shipping_handling` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `range_behavior` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_module` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_free` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `shipping_external` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `need_range` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `external_module_name` varchar(64) DEFAULT NULL,
  `shipping_method` int(2) NOT NULL DEFAULT '0',
  `position` int(10) unsigned NOT NULL DEFAULT '0',
  `max_width` int(10) DEFAULT '0',
  `max_height` int(10) DEFAULT '0',
  `max_depth` int(10) DEFAULT '0',
  `max_weight` decimal(20,6) DEFAULT '0.000000',
  `grade` int(10) DEFAULT '0',
  PRIMARY KEY (`id_carrier`),
  KEY `deleted` (`deleted`,`active`),
  KEY `id_tax_rules_group` (`id_tax_rules_group`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `ps_carrier`
--

INSERT INTO `ps_carrier` (`id_carrier`, `id_reference`, `id_tax_rules_group`, `name`, `url`, `active`, `deleted`, `shipping_handling`, `range_behavior`, `is_module`, `is_free`, `shipping_external`, `need_range`, `external_module_name`, `shipping_method`, `position`, `max_width`, `max_height`, `max_depth`, `max_weight`, `grade`) VALUES
(1, 1, 0, '0', '', 1, 0, 0, 0, 0, 1, 0, 0, '', 0, 0, 0, 0, 0, 0.000000, 0),
(2, 2, 0, 'My carrier', '', 1, 0, 1, 0, 0, 0, 0, 0, '', 0, 1, 0, 0, 0, 0.000000, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_carrier_group`
--

CREATE TABLE IF NOT EXISTS `ps_carrier_group` (
  `id_carrier` int(10) unsigned NOT NULL,
  `id_group` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_carrier`,`id_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ps_carrier_group`
--

INSERT INTO `ps_carrier_group` (`id_carrier`, `id_group`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 2),
(2, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_carrier_lang`
--

CREATE TABLE IF NOT EXISTS `ps_carrier_lang` (
  `id_carrier` int(10) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL DEFAULT '1',
  `id_lang` int(10) unsigned NOT NULL,
  `delay` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id_lang`,`id_shop`,`id_carrier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ps_carrier_lang`
--

INSERT INTO `ps_carrier_lang` (`id_carrier`, `id_shop`, `id_lang`, `delay`) VALUES
(1, 1, 1, 'Recoger en tienda'),
(2, 1, 1, '¡Envío en 24h!');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_carrier_shop`
--

CREATE TABLE IF NOT EXISTS `ps_carrier_shop` (
  `id_carrier` int(11) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_carrier`,`id_shop`),
  KEY `id_shop` (`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ps_carrier_shop`
--

INSERT INTO `ps_carrier_shop` (`id_carrier`, `id_shop`) VALUES
(1, 1),
(2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_carrier_tax_rules_group_shop`
--

CREATE TABLE IF NOT EXISTS `ps_carrier_tax_rules_group_shop` (
  `id_carrier` int(11) unsigned NOT NULL,
  `id_tax_rules_group` int(11) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_carrier`,`id_tax_rules_group`,`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ps_carrier_tax_rules_group_shop`
--

INSERT INTO `ps_carrier_tax_rules_group_shop` (`id_carrier`, `id_tax_rules_group`, `id_shop`) VALUES
(1, 1, 1),
(2, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_carrier_zone`
--

CREATE TABLE IF NOT EXISTS `ps_carrier_zone` (
  `id_carrier` int(10) unsigned NOT NULL,
  `id_zone` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_carrier`,`id_zone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ps_carrier_zone`
--

INSERT INTO `ps_carrier_zone` (`id_carrier`, `id_zone`) VALUES
(1, 1),
(2, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_cart`
--

CREATE TABLE IF NOT EXISTS `ps_cart` (
  `id_cart` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_shop_group` int(11) unsigned NOT NULL DEFAULT '1',
  `id_shop` int(11) unsigned NOT NULL DEFAULT '1',
  `id_carrier` int(10) unsigned NOT NULL,
  `delivery_option` text NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `id_address_delivery` int(10) unsigned NOT NULL,
  `id_address_invoice` int(10) unsigned NOT NULL,
  `id_currency` int(10) unsigned NOT NULL,
  `id_customer` int(10) unsigned NOT NULL,
  `id_guest` int(10) unsigned NOT NULL,
  `secure_key` varchar(32) NOT NULL DEFAULT '-1',
  `recyclable` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `gift` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `gift_message` text,
  `mobile_theme` tinyint(1) NOT NULL DEFAULT '0',
  `allow_seperated_package` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_cart`),
  KEY `cart_customer` (`id_customer`),
  KEY `id_address_delivery` (`id_address_delivery`),
  KEY `id_address_invoice` (`id_address_invoice`),
  KEY `id_carrier` (`id_carrier`),
  KEY `id_lang` (`id_lang`),
  KEY `id_currency` (`id_currency`),
  KEY `id_guest` (`id_guest`),
  KEY `id_shop_group` (`id_shop_group`),
  KEY `id_shop` (`id_shop`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `ps_cart`
--

INSERT INTO `ps_cart` (`id_cart`, `id_shop_group`, `id_shop`, `id_carrier`, `delivery_option`, `id_lang`, `id_address_delivery`, `id_address_invoice`, `id_currency`, `id_customer`, `id_guest`, `secure_key`, `recyclable`, `gift`, `gift_message`, `mobile_theme`, `allow_seperated_package`, `date_add`, `date_upd`) VALUES
(1, 1, 1, 2, 'a:1:{i:3;s:2:"2,";}', 1, 4, 4, 1, 1, 2, 'b44a6d9efd7a0076a0fbce6b15eaf3b1', 0, 0, '', 0, 0, '2015-06-22 10:29:14', '2015-06-22 10:29:14'),
(2, 1, 1, 2, 'a:1:{i:3;s:2:"2,";}', 1, 4, 4, 1, 1, 1, 'b44a6d9efd7a0076a0fbce6b15eaf3b1', 0, 0, '', 0, 0, '2015-06-22 10:29:14', '2015-06-22 10:29:14'),
(3, 1, 1, 2, 'a:1:{i:3;s:2:"2,";}', 1, 4, 4, 1, 1, 1, 'b44a6d9efd7a0076a0fbce6b15eaf3b1', 0, 0, '', 0, 0, '2015-06-22 10:29:14', '2015-06-22 10:29:14'),
(4, 1, 1, 2, 'a:1:{i:3;s:2:"2,";}', 1, 4, 4, 1, 1, 1, 'b44a6d9efd7a0076a0fbce6b15eaf3b1', 0, 0, '', 0, 0, '2015-06-22 10:29:14', '2015-06-22 10:29:14'),
(5, 1, 1, 2, 'a:1:{i:3;s:2:"2,";}', 1, 4, 4, 1, 1, 1, 'b44a6d9efd7a0076a0fbce6b15eaf3b1', 0, 0, '', 0, 0, '2015-06-22 10:29:14', '2015-06-22 10:29:14'),
(6, 1, 1, 0, '', 1, 0, 0, 1, 0, 6, '', 0, 0, '', 0, 0, '2015-10-18 17:53:32', '2015-10-18 17:54:33');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_cart_cart_rule`
--

CREATE TABLE IF NOT EXISTS `ps_cart_cart_rule` (
  `id_cart` int(10) unsigned NOT NULL,
  `id_cart_rule` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_cart`,`id_cart_rule`),
  KEY `id_cart_rule` (`id_cart_rule`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_cart_product`
--

CREATE TABLE IF NOT EXISTS `ps_cart_product` (
  `id_cart` int(10) unsigned NOT NULL,
  `id_product` int(10) unsigned NOT NULL,
  `id_address_delivery` int(10) unsigned DEFAULT '0',
  `id_shop` int(10) unsigned NOT NULL DEFAULT '1',
  `id_product_attribute` int(10) unsigned DEFAULT NULL,
  `quantity` int(10) unsigned NOT NULL DEFAULT '0',
  `date_add` datetime NOT NULL,
  KEY `cart_product_index` (`id_cart`,`id_product`),
  KEY `id_product_attribute` (`id_product_attribute`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ps_cart_product`
--

INSERT INTO `ps_cart_product` (`id_cart`, `id_product`, `id_address_delivery`, `id_shop`, `id_product_attribute`, `quantity`, `date_add`) VALUES
(1, 2, 3, 1, 10, 1, '0000-00-00 00:00:00'),
(1, 3, 3, 1, 13, 1, '0000-00-00 00:00:00'),
(2, 2, 3, 1, 10, 1, '0000-00-00 00:00:00'),
(2, 6, 3, 1, 32, 1, '0000-00-00 00:00:00'),
(2, 7, 3, 1, 34, 1, '0000-00-00 00:00:00'),
(3, 2, 3, 1, 10, 1, '0000-00-00 00:00:00'),
(3, 6, 3, 1, 32, 1, '0000-00-00 00:00:00'),
(3, 1, 3, 1, 1, 1, '0000-00-00 00:00:00'),
(4, 1, 3, 1, 1, 1, '0000-00-00 00:00:00'),
(4, 3, 3, 1, 13, 1, '0000-00-00 00:00:00'),
(4, 7, 3, 1, 34, 1, '0000-00-00 00:00:00'),
(4, 5, 3, 1, 19, 1, '0000-00-00 00:00:00'),
(5, 1, 3, 1, 1, 1, '0000-00-00 00:00:00'),
(5, 2, 3, 1, 7, 1, '0000-00-00 00:00:00'),
(5, 3, 3, 1, 13, 1, '0000-00-00 00:00:00'),
(6, 5, 0, 1, 19, 3, '2015-10-18 17:54:33'),
(6, 7, 0, 1, 34, 1, '2015-10-18 17:53:39');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_cart_rule`
--

CREATE TABLE IF NOT EXISTS `ps_cart_rule` (
  `id_cart_rule` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_customer` int(10) unsigned NOT NULL DEFAULT '0',
  `date_from` datetime NOT NULL,
  `date_to` datetime NOT NULL,
  `description` text,
  `quantity` int(10) unsigned NOT NULL DEFAULT '0',
  `quantity_per_user` int(10) unsigned NOT NULL DEFAULT '0',
  `priority` int(10) unsigned NOT NULL DEFAULT '1',
  `partial_use` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `code` varchar(254) NOT NULL,
  `minimum_amount` decimal(17,2) NOT NULL DEFAULT '0.00',
  `minimum_amount_tax` tinyint(1) NOT NULL DEFAULT '0',
  `minimum_amount_currency` int(10) unsigned NOT NULL DEFAULT '0',
  `minimum_amount_shipping` tinyint(1) NOT NULL DEFAULT '0',
  `country_restriction` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `carrier_restriction` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `group_restriction` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `cart_rule_restriction` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `product_restriction` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `shop_restriction` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `free_shipping` tinyint(1) NOT NULL DEFAULT '0',
  `reduction_percent` decimal(5,2) NOT NULL DEFAULT '0.00',
  `reduction_amount` decimal(17,2) NOT NULL DEFAULT '0.00',
  `reduction_tax` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `reduction_currency` int(10) unsigned NOT NULL DEFAULT '0',
  `reduction_product` int(10) NOT NULL DEFAULT '0',
  `gift_product` int(10) unsigned NOT NULL DEFAULT '0',
  `gift_product_attribute` int(10) unsigned NOT NULL DEFAULT '0',
  `highlight` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_cart_rule`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_cart_rule_carrier`
--

CREATE TABLE IF NOT EXISTS `ps_cart_rule_carrier` (
  `id_cart_rule` int(10) unsigned NOT NULL,
  `id_carrier` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_cart_rule`,`id_carrier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_cart_rule_combination`
--

CREATE TABLE IF NOT EXISTS `ps_cart_rule_combination` (
  `id_cart_rule_1` int(10) unsigned NOT NULL,
  `id_cart_rule_2` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_cart_rule_1`,`id_cart_rule_2`),
  KEY `id_cart_rule_1` (`id_cart_rule_1`),
  KEY `id_cart_rule_2` (`id_cart_rule_2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_cart_rule_country`
--

CREATE TABLE IF NOT EXISTS `ps_cart_rule_country` (
  `id_cart_rule` int(10) unsigned NOT NULL,
  `id_country` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_cart_rule`,`id_country`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_cart_rule_group`
--

CREATE TABLE IF NOT EXISTS `ps_cart_rule_group` (
  `id_cart_rule` int(10) unsigned NOT NULL,
  `id_group` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_cart_rule`,`id_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_cart_rule_lang`
--

CREATE TABLE IF NOT EXISTS `ps_cart_rule_lang` (
  `id_cart_rule` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(254) NOT NULL,
  PRIMARY KEY (`id_cart_rule`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_cart_rule_product_rule`
--

CREATE TABLE IF NOT EXISTS `ps_cart_rule_product_rule` (
  `id_product_rule` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_product_rule_group` int(10) unsigned NOT NULL,
  `type` enum('products','categories','attributes','manufacturers','suppliers') NOT NULL,
  PRIMARY KEY (`id_product_rule`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_cart_rule_product_rule_group`
--

CREATE TABLE IF NOT EXISTS `ps_cart_rule_product_rule_group` (
  `id_product_rule_group` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_cart_rule` int(10) unsigned NOT NULL,
  `quantity` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_product_rule_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_cart_rule_product_rule_value`
--

CREATE TABLE IF NOT EXISTS `ps_cart_rule_product_rule_value` (
  `id_product_rule` int(10) unsigned NOT NULL,
  `id_item` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_product_rule`,`id_item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_cart_rule_shop`
--

CREATE TABLE IF NOT EXISTS `ps_cart_rule_shop` (
  `id_cart_rule` int(10) unsigned NOT NULL,
  `id_shop` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_cart_rule`,`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_category`
--

CREATE TABLE IF NOT EXISTS `ps_category` (
  `id_category` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_parent` int(10) unsigned NOT NULL,
  `id_shop_default` int(10) unsigned NOT NULL DEFAULT '1',
  `level_depth` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `nleft` int(10) unsigned NOT NULL DEFAULT '0',
  `nright` int(10) unsigned NOT NULL DEFAULT '0',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  `position` int(10) unsigned NOT NULL DEFAULT '0',
  `is_root_category` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_category`),
  KEY `category_parent` (`id_parent`),
  KEY `nleftright` (`nleft`,`nright`),
  KEY `nleftrightactive` (`nleft`,`nright`,`active`),
  KEY `level_depth` (`level_depth`),
  KEY `nright` (`nright`),
  KEY `nleft` (`nleft`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Volcado de datos para la tabla `ps_category`
--

INSERT INTO `ps_category` (`id_category`, `id_parent`, `id_shop_default`, `level_depth`, `nleft`, `nright`, `active`, `date_add`, `date_upd`, `position`, `is_root_category`) VALUES
(1, 0, 1, 0, 1, 22, 1, '2015-06-22 10:29:04', '2015-06-22 10:29:04', 0, 0),
(2, 1, 1, 1, 2, 21, 1, '2015-06-22 10:29:04', '2015-06-22 10:29:04', 0, 1),
(3, 2, 1, 2, 3, 20, 1, '2015-06-22 10:29:13', '2015-06-22 10:29:13', 0, 0),
(4, 3, 1, 3, 4, 11, 1, '2015-06-22 10:29:13', '2015-06-22 10:29:13', 0, 0),
(5, 4, 1, 4, 5, 6, 1, '2015-06-22 10:29:13', '2015-06-22 10:29:13', 0, 0),
(6, 4, 1, 4, 7, 8, 0, '2015-06-22 10:29:13', '2015-06-22 10:29:13', 0, 0),
(7, 4, 1, 4, 9, 10, 1, '2015-06-22 10:29:13', '2015-06-22 10:29:13', 0, 0),
(8, 3, 1, 3, 12, 19, 1, '2015-06-22 10:29:13', '2015-06-22 10:29:13', 0, 0),
(9, 8, 1, 4, 13, 14, 1, '2015-06-22 10:29:13', '2015-06-22 10:29:13', 0, 0),
(10, 8, 1, 4, 15, 16, 1, '2015-06-22 10:29:13', '2015-06-22 10:29:13', 0, 0),
(11, 8, 1, 4, 17, 18, 1, '2015-06-22 10:29:13', '2015-06-22 10:29:13', 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_category_group`
--

CREATE TABLE IF NOT EXISTS `ps_category_group` (
  `id_category` int(10) unsigned NOT NULL,
  `id_group` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_category`,`id_group`),
  KEY `id_category` (`id_category`),
  KEY `id_group` (`id_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ps_category_group`
--

INSERT INTO `ps_category_group` (`id_category`, `id_group`) VALUES
(2, 0),
(2, 1),
(2, 2),
(2, 3),
(3, 1),
(3, 2),
(3, 3),
(4, 1),
(4, 2),
(4, 3),
(5, 1),
(5, 2),
(5, 3),
(6, 1),
(6, 2),
(6, 3),
(7, 1),
(7, 2),
(7, 3),
(8, 1),
(8, 2),
(8, 3),
(9, 1),
(9, 2),
(9, 3),
(10, 1),
(10, 2),
(10, 3),
(11, 1),
(11, 2),
(11, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_category_lang`
--

CREATE TABLE IF NOT EXISTS `ps_category_lang` (
  `id_category` int(10) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL DEFAULT '1',
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(128) NOT NULL,
  `description` text,
  `link_rewrite` varchar(128) NOT NULL,
  `meta_title` varchar(128) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_category`,`id_shop`,`id_lang`),
  KEY `category_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ps_category_lang`
--

INSERT INTO `ps_category_lang` (`id_category`, `id_shop`, `id_lang`, `name`, `description`, `link_rewrite`, `meta_title`, `meta_keywords`, `meta_description`) VALUES
(1, 1, 1, 'Raíz', '', 'raiz', '', '', ''),
(2, 1, 1, 'Inicio', '', 'inicio', '', '', ''),
(3, 1, 1, 'Mujer', '<p><strong>Aquí encontrarás todas las colecciones de moda de mujer.</strong></p>\n<p>Esta categoría incluye todos los básicos de tu armario y mucho más:</p>\n<p>¡zapatos, complementos, camisetas estampadas, vestidos muy femeninos y vaqueros para mujer!</p>', 'mujer', '', '', ''),
(4, 1, 1, 'Tops', '<p>Aquí encontrarás camisetas, tops, blusas, camisetas de manga corta, de manga larga, sin mangas, de media manga y mucho más.</p>\n<p>¡Encuentra el corte que mejor te quede!</p>', 'tops', '', '', ''),
(5, 1, 1, 'Camisetas', '<p>Los must have de tu armario; ¡échale un vistazo a los diferentes colores,</p>\n<p>formas y estilos de nuestra colección!</p>', 'camisetas', '', '', ''),
(6, 1, 1, 'Tops', 'Te ofrecemos una amplia variedad de tops para que puedas escoger el que mejor te quede.', 'top', '', '', ''),
(7, 1, 1, 'Blusas', 'Combina tus blusas preferidas con los accesorios perfectos para un look deslumbrante.', 'blusas', '', '', ''),
(8, 1, 1, 'Vestidos', '<p>¡Encuentra tus vestidos favoritos entre nuestra amplia colección de vestidos de noche, vestidos informales y vestidos veraniegos!</p>\n<p>Te ofrecemos vestidos para todos los días, para cualquier estilo y cualquier ocasión.</p>', 'vestidos', '', '', ''),
(9, 1, 1, 'Vestidos informales', '<p>¿Estás buscando un vestido para todos los días? Échale un vistazo a</p>\n<p>nuestra selección para encontrar el vestido perfecto.</p>', 'vestidos-informales', '', '', ''),
(10, 1, 1, 'Vestidos de noche', '¡Descubre nuestra colección y encuentra el vestido perfecto para una velada inolvidable!', 'vestidos-noche', '', '', ''),
(11, 1, 1, 'Vestidos de verano', 'Cortos, largos, de seda, estampados... aquí encontrarás el vestido perfecto para el verano.', 'vestidos-verano', '', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_category_product`
--

CREATE TABLE IF NOT EXISTS `ps_category_product` (
  `id_category` int(10) unsigned NOT NULL,
  `id_product` int(10) unsigned NOT NULL,
  `position` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_category`,`id_product`),
  KEY `id_product` (`id_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ps_category_product`
--

INSERT INTO `ps_category_product` (`id_category`, `id_product`, `position`) VALUES
(2, 1, 0),
(2, 2, 1),
(2, 3, 2),
(2, 4, 3),
(2, 5, 4),
(2, 6, 5),
(2, 7, 6),
(3, 1, 0),
(3, 2, 1),
(3, 3, 2),
(3, 4, 3),
(3, 5, 4),
(3, 6, 5),
(3, 7, 6),
(4, 1, 0),
(4, 2, 1),
(5, 1, 0),
(7, 2, 0),
(8, 3, 0),
(8, 4, 1),
(8, 5, 2),
(8, 6, 3),
(8, 7, 4),
(9, 3, 0),
(10, 4, 0),
(11, 5, 0),
(11, 6, 1),
(11, 7, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_category_shop`
--

CREATE TABLE IF NOT EXISTS `ps_category_shop` (
  `id_category` int(11) NOT NULL,
  `id_shop` int(11) NOT NULL,
  `position` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_category`,`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ps_category_shop`
--

INSERT INTO `ps_category_shop` (`id_category`, `id_shop`, `position`) VALUES
(1, 1, 1),
(2, 1, 1),
(3, 1, 1),
(4, 1, 1),
(5, 1, 1),
(6, 1, 2),
(7, 1, 3),
(8, 1, 2),
(9, 1, 1),
(10, 1, 2),
(11, 1, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_cb_hook_settings`
--

CREATE TABLE IF NOT EXISTS `ps_cb_hook_settings` (
  `hook_name` varchar(64) NOT NULL,
  `id_shop` int(10) unsigned NOT NULL,
  `carousel` text NOT NULL,
  PRIMARY KEY (`hook_name`,`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ps_cb_hook_settings`
--

INSERT INTO `ps_cb_hook_settings` (`hook_name`, `id_shop`, `carousel`) VALUES
('displayTopColumn', 1, '{"p":"0","n":"1","n_hover":"0","a":"1","s":"250","m":"1","i":"1","i_1200":"1","i_992":"1","i_768":"1","i_480":"1"}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_cms`
--

CREATE TABLE IF NOT EXISTS `ps_cms` (
  `id_cms` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_cms_category` int(10) unsigned NOT NULL,
  `position` int(10) unsigned NOT NULL DEFAULT '0',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `indexation` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_cms`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Volcado de datos para la tabla `ps_cms`
--

INSERT INTO `ps_cms` (`id_cms`, `id_cms_category`, `position`, `active`, `indexation`) VALUES
(1, 1, 0, 1, 0),
(2, 1, 1, 1, 0),
(3, 1, 2, 1, 0),
(4, 1, 3, 1, 0),
(5, 1, 4, 1, 0),
(6, 2, 0, 1, 1),
(7, 2, 1, 1, 1),
(8, 2, 2, 1, 1),
(9, 2, 3, 1, 1),
(10, 2, 4, 1, 1),
(11, 1, 5, 1, 1),
(12, 1, 6, 1, 1),
(13, 1, 7, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_cms_block`
--

CREATE TABLE IF NOT EXISTS `ps_cms_block` (
  `id_cms_block` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_cms_category` int(10) unsigned NOT NULL,
  `location` tinyint(1) unsigned NOT NULL,
  `position` int(10) unsigned NOT NULL DEFAULT '0',
  `display_store` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_cms_block`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `ps_cms_block`
--

INSERT INTO `ps_cms_block` (`id_cms_block`, `id_cms_category`, `location`, `position`, `display_store`) VALUES
(1, 1, 0, 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_cms_block_lang`
--

CREATE TABLE IF NOT EXISTS `ps_cms_block_lang` (
  `id_cms_block` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(40) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_cms_block`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ps_cms_block_lang`
--

INSERT INTO `ps_cms_block_lang` (`id_cms_block`, `id_lang`, `name`) VALUES
(1, 1, 'Información');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_cms_block_page`
--

CREATE TABLE IF NOT EXISTS `ps_cms_block_page` (
  `id_cms_block_page` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_cms_block` int(10) unsigned NOT NULL,
  `id_cms` int(10) unsigned NOT NULL,
  `is_category` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id_cms_block_page`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `ps_cms_block_page`
--

INSERT INTO `ps_cms_block_page` (`id_cms_block_page`, `id_cms_block`, `id_cms`, `is_category`) VALUES
(1, 1, 1, 0),
(2, 1, 2, 0),
(3, 1, 3, 0),
(4, 1, 4, 0),
(5, 1, 5, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_cms_block_shop`
--

CREATE TABLE IF NOT EXISTS `ps_cms_block_shop` (
  `id_cms_block` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_shop` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_cms_block`,`id_shop`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `ps_cms_block_shop`
--

INSERT INTO `ps_cms_block_shop` (`id_cms_block`, `id_shop`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_cms_category`
--

CREATE TABLE IF NOT EXISTS `ps_cms_category` (
  `id_cms_category` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_parent` int(10) unsigned NOT NULL,
  `level_depth` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  `position` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_cms_category`),
  KEY `category_parent` (`id_parent`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `ps_cms_category`
--

INSERT INTO `ps_cms_category` (`id_cms_category`, `id_parent`, `level_depth`, `active`, `date_add`, `date_upd`, `position`) VALUES
(1, 0, 1, 1, '2015-06-22 10:29:04', '2015-06-22 10:29:04', 0),
(2, 1, 2, 1, '2015-10-19 18:37:07', '2015-10-19 18:37:07', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_cms_category_lang`
--

CREATE TABLE IF NOT EXISTS `ps_cms_category_lang` (
  `id_cms_category` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `id_shop` int(10) unsigned NOT NULL DEFAULT '1',
  `name` varchar(128) NOT NULL,
  `description` text,
  `link_rewrite` varchar(128) NOT NULL,
  `meta_title` varchar(128) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_cms_category`,`id_shop`,`id_lang`),
  KEY `category_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ps_cms_category_lang`
--

INSERT INTO `ps_cms_category_lang` (`id_cms_category`, `id_lang`, `id_shop`, `name`, `description`, `link_rewrite`, `meta_title`, `meta_keywords`, `meta_description`) VALUES
(1, 1, 1, 'Inicio', '', 'inicio', '', '', ''),
(2, 1, 1, 'Footer', '', 'footer', '', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_cms_category_shop`
--

CREATE TABLE IF NOT EXISTS `ps_cms_category_shop` (
  `id_cms_category` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_shop` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_cms_category`,`id_shop`),
  KEY `id_shop` (`id_shop`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `ps_cms_category_shop`
--

INSERT INTO `ps_cms_category_shop` (`id_cms_category`, `id_shop`) VALUES
(1, 1),
(2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_cms_lang`
--

CREATE TABLE IF NOT EXISTS `ps_cms_lang` (
  `id_cms` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `id_shop` int(10) unsigned NOT NULL DEFAULT '1',
  `meta_title` varchar(128) NOT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `content` longtext,
  `link_rewrite` varchar(128) NOT NULL,
  PRIMARY KEY (`id_cms`,`id_shop`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ps_cms_lang`
--

INSERT INTO `ps_cms_lang` (`id_cms`, `id_lang`, `id_shop`, `meta_title`, `meta_description`, `meta_keywords`, `content`, `link_rewrite`) VALUES
(1, 1, 1, 'Envío', 'Nuestros términos y condiciones de envío', 'condiciones, entrega, plazo, envío, paquete', '<h2>Envíos y devoluciones</h2><h3>Envío del paquete</h3><p>Como norma general, los paquetes se envían dentro de las 48 horas siguientes a la recepción del pago, través de UPS con número de seguimiento y entrega sin firma. Si prefieres el envío certificado mediante UPS Extra, se aplicará un cargo adicional. Ponte en contacto con nosotros antes de solicitar esta opción. Sea cual sea la forma de envío que elijas, te proporcionaremos un enlace para que puedas seguir tu pedido en línea.</p><p>Los gastos de envío incluyen los gastos de manipulación y empaquetado, así como los gastos postales. Los gastos de manipulación tienen un precio fijo, mientras que los gastos de transporte pueden variar según el peso total del paquete. Te aconsejamos que agrupes todos tus artículos en un mismo pedido. No podemos combinar dos pedidos diferentes, y los gastos de envío se aplicarán para cada uno de manera individual. No nos hacemos responsables de los daños que pueda sufrir tu paquete tras el envío, pero hacemos todo lo posible para proteger todos los artículos frágiles.<br /><br />Las cajas son grandes y tus artículos estarán bien protegidos.</p>', 'entrega'),
(2, 1, 1, 'Aviso legal', 'Aviso legal', 'aviso, legal, créditos', '<h2>Legal</h2><h3>Créditos</h3><p>Concepto y producción:</p><p>Esta tienda online fue creada utilizando el <a href="http://www.prestashop.com">Software Prestashop Shopping Cart</a>. No olvides echarle un vistazo al <a href="http://www.prestashop.com/blog/en/">blog de comercio electrónico</a> de PrestaShop para estar al día y leer todos los consejos sobre la venta online y sobre cómo gestionar tu web de comercio electrónico.</p>', 'aviso-legal'),
(3, 1, 1, 'Términos y condiciones', 'Nuestros términos y condiciones', 'condiciones, términos, uso, venta', '<h1 class="page-heading">Términos y condiciones</h1>\n<h3 class="page-subheading">Norma 1</h3>\n<p class="bottom-indent">Lorem ipsum dolor sit amet conse ctetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\n<h3 class="page-subheading">Norma 2</h3>\n<p class="bottom-indent">Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet conse ctetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam&#1102;</p>\n<h3 class="page-subheading">Norma 3</h3>\n<p class="bottom-indent">Tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet conse ctetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam&#1102;</p>', 'terminos-y-condiciones-de-uso'),
(4, 1, 1, 'Sobre nosotros', 'Averigüe más sobre nosotros', 'sobre nosotros, información', '<h1 class="page-heading bottom-indent">Sobre nosotros</h1>\n<div class="row">\n<div class="col-xs-12 col-sm-4">\n<div class="cms-block">\n<h3 class="page-subheading">Nuestra empresa</h3>\n<p><strong class="dark">Lorem ipsum dolor sit amet conse ctetur adipisicing elit, sed do eiusmod tempor incididun.</strong></p>\n<p>Lorem ipsum dolor sit amet conse ctetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam. Lorem ipsum dolor sit amet conse ctetur adipisicing elit.</p>\n<ul class="list-1">\n<li><em class="icon-ok"></em>Productos de alta calidad</li>\n<li><em class="icon-ok"></em>El mejor servicio de atención al cliente</li>\n<li><em class="icon-ok"></em>Garantía de devolución en 30 días</li>\n</ul>\n</div>\n</div>\n<div class="col-xs-12 col-sm-4">\n<div class="cms-box">\n<h3 class="page-subheading">Nuestro equipo</h3>\n<img title="cms-img" src="../img/cms/cms-img.jpg" alt="cms-img" width="370" height="192" />\n<p><strong class="dark">Lorem set sint occaecat cupidatat non </strong></p>\n<p>Eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo.</p>\n</div>\n</div>\n<div class="col-xs-12 col-sm-4">\n<div class="cms-box">\n<h3 class="page-subheading">Opiniones</h3>\n<div class="testimonials">\n<div class="inner"><span class="before">“</span>Lorem ipsum dolor sit amet conse ctetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim.<span class="after">”</span></div>\n</div>\n<p><strong class="dark">Lorem ipsum dolor sit</strong></p>\n<div class="testimonials">\n<div class="inner"><span class="before">“</span>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet conse ctetur adipisicing elit. Lorem ipsum dolor sit amet conse ctetur adipisicing elit, sed do eiusmod.<span class="after">”</span></div>\n</div>\n<p><strong class="dark">Ipsum dolor sit</strong></p>\n</div>\n</div>\n</div>', 'sobre-nosotros'),
(5, 1, 1, 'Pago seguro', 'Nuestra forma de pago segura', 'pago seguro, ssl, visa, mastercard, paypal', '<h2>Pago seguro</h2>\n<h3>Nuestro pago seguro</h3><p>Con SSL</p>\n<h3>Utilizando Visa/Mastercard/Paypal</h3><p>Sobre este servicio</p>', 'pago-seguro'),
(6, 1, 1, 'Matisses', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque eget molestie metus. Mauris tristique hendrerit dui, quis tristique nibh. Fusce rutrum vel quam non feugiat. Morbi rhoncus elit ut metus semper porttitor. Pellentesque gravida mauris nibh, a lacinia ipsum ornare ac. Nunc porttitor, massa eget elementum suscipit, nisi ligula facilisis sapien, vitae blandit neque sapien eu sem. Cras vel commodo lacus. Nulla vel diam at dolor dapibus faucibus ut sit amet libero. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. In vel tempor felis, id tincidunt quam. Nullam a nisi facilisis, varius massa sed, volutpat quam. Vestibulum tempor eu purus nec pellentesque. Pellentesque mollis non ipsum vel pharetra. Donec odio massa, euismod ut ipsum a, laoreet laoreet urna. Duis id ante nec dolor tincidunt porta eget ut enim. Ut mollis augue nec massa tincidunt ullamcorper.</p>\n<p>Cras aliquet condimentum mauris pretium venenatis. Vivamus at congue elit. Nullam ut tempus est, a posuere dolor. Mauris luctus ultricies ornare. Fusce congue nulla ut sem placerat, at eleifend ex faucibus. Aliquam malesuada in tellus ut egestas. Nullam posuere magna nec ex molestie, a lacinia massa pulvinar. Vivamus magna ante, viverra ac nisl id, sodales condimentum justo.</p>\n<p>Donec iaculis nisi non aliquam euismod. Donec feugiat feugiat feugiat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer pulvinar elit tortor, vel fringilla lorem hendrerit feugiat. Mauris et tortor tempor, maximus augue ac, consectetur nunc. Nulla vel mauris nec leo scelerisque facilisis vel eu nisl. Fusce dapibus vitae leo at dictum. Ut mollis, sapien sed posuere mattis, orci leo pellentesque mauris, sed commodo velit quam id lacus. Maecenas laoreet metus nec porta bibendum. Aliquam dui orci, finibus vitae bibendum et, laoreet et libero. Mauris fermentum metus in condimentum sollicitudin. Phasellus erat mi, laoreet eu iaculis at, sollicitudin eleifend leo.</p>\n<p>Morbi faucibus vel purus non pulvinar. Mauris luctus pellentesque purus, sed dictum massa gravida non. Etiam in sollicitudin ante. Proin mattis pretium enim, quis posuere elit vestibulum ac. Nunc gravida erat at sapien vehicula, nec blandit felis lobortis. Nullam mollis interdum neque, vitae mattis felis eleifend eu. Nulla finibus leo metus, vitae elementum nisi facilisis eget. Aenean posuere, lorem dignissim pellentesque mollis, velit lacus dapibus dui, cursus blandit tortor magna ac nibh. Maecenas consequat volutpat eros quis dictum. Etiam neque justo, consequat a nisl ut, molestie vulputate est.</p>\n<p>Fusce blandit, tellus et porttitor dapibus, magna nulla blandit orci, nec semper tortor risus at est. Curabitur auctor, sem id porttitor semper, sem neque consequat erat, consequat lobortis urna diam ac mi. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Suspendisse a accumsan augue. Etiam tempor lorem ipsum, sed accumsan nunc porta at. Aliquam vulputate a ipsum non euismod. Duis facilisis ipsum nulla, quis euismod est maximus eu. Phasellus in ligula sodales, bibendum mauris a, vehicula orci. Quisque tristique ligula quis magna elementum, quis pellentesque augue sollicitudin. Aliquam non erat non dolor volutpat faucibus in eu magna. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', 'matisses'),
(7, 1, 1, 'trabaja con nosotros', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque eget molestie metus. Mauris tristique hendrerit dui, quis tristique nibh. Fusce rutrum vel quam non feugiat. Morbi rhoncus elit ut metus semper porttitor. Pellentesque gravida mauris nibh, a lacinia ipsum ornare ac. Nunc porttitor, massa eget elementum suscipit, nisi ligula facilisis sapien, vitae blandit neque sapien eu sem. Cras vel commodo lacus. Nulla vel diam at dolor dapibus faucibus ut sit amet libero. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. In vel tempor felis, id tincidunt quam. Nullam a nisi facilisis, varius massa sed, volutpat quam. Vestibulum tempor eu purus nec pellentesque. Pellentesque mollis non ipsum vel pharetra. Donec odio massa, euismod ut ipsum a, laoreet laoreet urna. Duis id ante nec dolor tincidunt porta eget ut enim. Ut mollis augue nec massa tincidunt ullamcorper.</p>\n<p>Cras aliquet condimentum mauris pretium venenatis. Vivamus at congue elit. Nullam ut tempus est, a posuere dolor. Mauris luctus ultricies ornare. Fusce congue nulla ut sem placerat, at eleifend ex faucibus. Aliquam malesuada in tellus ut egestas. Nullam posuere magna nec ex molestie, a lacinia massa pulvinar. Vivamus magna ante, viverra ac nisl id, sodales condimentum justo.</p>\n<p>Donec iaculis nisi non aliquam euismod. Donec feugiat feugiat feugiat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer pulvinar elit tortor, vel fringilla lorem hendrerit feugiat. Mauris et tortor tempor, maximus augue ac, consectetur nunc. Nulla vel mauris nec leo scelerisque facilisis vel eu nisl. Fusce dapibus vitae leo at dictum. Ut mollis, sapien sed posuere mattis, orci leo pellentesque mauris, sed commodo velit quam id lacus. Maecenas laoreet metus nec porta bibendum. Aliquam dui orci, finibus vitae bibendum et, laoreet et libero. Mauris fermentum metus in condimentum sollicitudin. Phasellus erat mi, laoreet eu iaculis at, sollicitudin eleifend leo.</p>\n<p>Morbi faucibus vel purus non pulvinar. Mauris luctus pellentesque purus, sed dictum massa gravida non. Etiam in sollicitudin ante. Proin mattis pretium enim, quis posuere elit vestibulum ac. Nunc gravida erat at sapien vehicula, nec blandit felis lobortis. Nullam mollis interdum neque, vitae mattis felis eleifend eu. Nulla finibus leo metus, vitae elementum nisi facilisis eget. Aenean posuere, lorem dignissim pellentesque mollis, velit lacus dapibus dui, cursus blandit tortor magna ac nibh. Maecenas consequat volutpat eros quis dictum. Etiam neque justo, consequat a nisl ut, molestie vulputate est.</p>\n<p>Fusce blandit, tellus et porttitor dapibus, magna nulla blandit orci, nec semper tortor risus at est. Curabitur auctor, sem id porttitor semper, sem neque consequat erat, consequat lobortis urna diam ac mi. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Suspendisse a accumsan augue. Etiam tempor lorem ipsum, sed accumsan nunc porta at. Aliquam vulputate a ipsum non euismod. Duis facilisis ipsum nulla, quis euismod est maximus eu. Phasellus in ligula sodales, bibendum mauris a, vehicula orci. Quisque tristique ligula quis magna elementum, quis pellentesque augue sollicitudin. Aliquam non erat non dolor volutpat faucibus in eu magna. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', 'trabaja-con-nosotros'),
(8, 1, 1, 'financiacion', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque eget molestie metus. Mauris tristique hendrerit dui, quis tristique nibh. Fusce rutrum vel quam non feugiat. Morbi rhoncus elit ut metus semper porttitor. Pellentesque gravida mauris nibh, a lacinia ipsum ornare ac. Nunc porttitor, massa eget elementum suscipit, nisi ligula facilisis sapien, vitae blandit neque sapien eu sem. Cras vel commodo lacus. Nulla vel diam at dolor dapibus faucibus ut sit amet libero. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. In vel tempor felis, id tincidunt quam. Nullam a nisi facilisis, varius massa sed, volutpat quam. Vestibulum tempor eu purus nec pellentesque. Pellentesque mollis non ipsum vel pharetra. Donec odio massa, euismod ut ipsum a, laoreet laoreet urna. Duis id ante nec dolor tincidunt porta eget ut enim. Ut mollis augue nec massa tincidunt ullamcorper.</p>\n<p>Cras aliquet condimentum mauris pretium venenatis. Vivamus at congue elit. Nullam ut tempus est, a posuere dolor. Mauris luctus ultricies ornare. Fusce congue nulla ut sem placerat, at eleifend ex faucibus. Aliquam malesuada in tellus ut egestas. Nullam posuere magna nec ex molestie, a lacinia massa pulvinar. Vivamus magna ante, viverra ac nisl id, sodales condimentum justo.</p>\n<p>Donec iaculis nisi non aliquam euismod. Donec feugiat feugiat feugiat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer pulvinar elit tortor, vel fringilla lorem hendrerit feugiat. Mauris et tortor tempor, maximus augue ac, consectetur nunc. Nulla vel mauris nec leo scelerisque facilisis vel eu nisl. Fusce dapibus vitae leo at dictum. Ut mollis, sapien sed posuere mattis, orci leo pellentesque mauris, sed commodo velit quam id lacus. Maecenas laoreet metus nec porta bibendum. Aliquam dui orci, finibus vitae bibendum et, laoreet et libero. Mauris fermentum metus in condimentum sollicitudin. Phasellus erat mi, laoreet eu iaculis at, sollicitudin eleifend leo.</p>\n<p>Morbi faucibus vel purus non pulvinar. Mauris luctus pellentesque purus, sed dictum massa gravida non. Etiam in sollicitudin ante. Proin mattis pretium enim, quis posuere elit vestibulum ac. Nunc gravida erat at sapien vehicula, nec blandit felis lobortis. Nullam mollis interdum neque, vitae mattis felis eleifend eu. Nulla finibus leo metus, vitae elementum nisi facilisis eget. Aenean posuere, lorem dignissim pellentesque mollis, velit lacus dapibus dui, cursus blandit tortor magna ac nibh. Maecenas consequat volutpat eros quis dictum. Etiam neque justo, consequat a nisl ut, molestie vulputate est.</p>\n<p>Fusce blandit, tellus et porttitor dapibus, magna nulla blandit orci, nec semper tortor risus at est. Curabitur auctor, sem id porttitor semper, sem neque consequat erat, consequat lobortis urna diam ac mi. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Suspendisse a accumsan augue. Etiam tempor lorem ipsum, sed accumsan nunc porta at. Aliquam vulputate a ipsum non euismod. Duis facilisis ipsum nulla, quis euismod est maximus eu. Phasellus in ligula sodales, bibendum mauris a, vehicula orci. Quisque tristique ligula quis magna elementum, quis pellentesque augue sollicitudin. Aliquam non erat non dolor volutpat faucibus in eu magna. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', 'financiacion'),
(9, 1, 1, 'metodos de envio', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque eget molestie metus. Mauris tristique hendrerit dui, quis tristique nibh. Fusce rutrum vel quam non feugiat. Morbi rhoncus elit ut metus semper porttitor. Pellentesque gravida mauris nibh, a lacinia ipsum ornare ac. Nunc porttitor, massa eget elementum suscipit, nisi ligula facilisis sapien, vitae blandit neque sapien eu sem. Cras vel commodo lacus. Nulla vel diam at dolor dapibus faucibus ut sit amet libero. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. In vel tempor felis, id tincidunt quam. Nullam a nisi facilisis, varius massa sed, volutpat quam. Vestibulum tempor eu purus nec pellentesque. Pellentesque mollis non ipsum vel pharetra. Donec odio massa, euismod ut ipsum a, laoreet laoreet urna. Duis id ante nec dolor tincidunt porta eget ut enim. Ut mollis augue nec massa tincidunt ullamcorper.</p>\n<p>Cras aliquet condimentum mauris pretium venenatis. Vivamus at congue elit. Nullam ut tempus est, a posuere dolor. Mauris luctus ultricies ornare. Fusce congue nulla ut sem placerat, at eleifend ex faucibus. Aliquam malesuada in tellus ut egestas. Nullam posuere magna nec ex molestie, a lacinia massa pulvinar. Vivamus magna ante, viverra ac nisl id, sodales condimentum justo.</p>\n<p>Donec iaculis nisi non aliquam euismod. Donec feugiat feugiat feugiat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer pulvinar elit tortor, vel fringilla lorem hendrerit feugiat. Mauris et tortor tempor, maximus augue ac, consectetur nunc. Nulla vel mauris nec leo scelerisque facilisis vel eu nisl. Fusce dapibus vitae leo at dictum. Ut mollis, sapien sed posuere mattis, orci leo pellentesque mauris, sed commodo velit quam id lacus. Maecenas laoreet metus nec porta bibendum. Aliquam dui orci, finibus vitae bibendum et, laoreet et libero. Mauris fermentum metus in condimentum sollicitudin. Phasellus erat mi, laoreet eu iaculis at, sollicitudin eleifend leo.</p>\n<p>Morbi faucibus vel purus non pulvinar. Mauris luctus pellentesque purus, sed dictum massa gravida non. Etiam in sollicitudin ante. Proin mattis pretium enim, quis posuere elit vestibulum ac. Nunc gravida erat at sapien vehicula, nec blandit felis lobortis. Nullam mollis interdum neque, vitae mattis felis eleifend eu. Nulla finibus leo metus, vitae elementum nisi facilisis eget. Aenean posuere, lorem dignissim pellentesque mollis, velit lacus dapibus dui, cursus blandit tortor magna ac nibh. Maecenas consequat volutpat eros quis dictum. Etiam neque justo, consequat a nisl ut, molestie vulputate est.</p>\n<p>Fusce blandit, tellus et porttitor dapibus, magna nulla blandit orci, nec semper tortor risus at est. Curabitur auctor, sem id porttitor semper, sem neque consequat erat, consequat lobortis urna diam ac mi. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Suspendisse a accumsan augue. Etiam tempor lorem ipsum, sed accumsan nunc porta at. Aliquam vulputate a ipsum non euismod. Duis facilisis ipsum nulla, quis euismod est maximus eu. Phasellus in ligula sodales, bibendum mauris a, vehicula orci. Quisque tristique ligula quis magna elementum, quis pellentesque augue sollicitudin. Aliquam non erat non dolor volutpat faucibus in eu magna. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', 'metodos-de-envio'),
(10, 1, 1, 'preguntas frecuentes', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque eget molestie metus. Mauris tristique hendrerit dui, quis tristique nibh. Fusce rutrum vel quam non feugiat. Morbi rhoncus elit ut metus semper porttitor. Pellentesque gravida mauris nibh, a lacinia ipsum ornare ac. Nunc porttitor, massa eget elementum suscipit, nisi ligula facilisis sapien, vitae blandit neque sapien eu sem. Cras vel commodo lacus. Nulla vel diam at dolor dapibus faucibus ut sit amet libero. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. In vel tempor felis, id tincidunt quam. Nullam a nisi facilisis, varius massa sed, volutpat quam. Vestibulum tempor eu purus nec pellentesque. Pellentesque mollis non ipsum vel pharetra. Donec odio massa, euismod ut ipsum a, laoreet laoreet urna. Duis id ante nec dolor tincidunt porta eget ut enim. Ut mollis augue nec massa tincidunt ullamcorper.</p>\n<p>Cras aliquet condimentum mauris pretium venenatis. Vivamus at congue elit. Nullam ut tempus est, a posuere dolor. Mauris luctus ultricies ornare. Fusce congue nulla ut sem placerat, at eleifend ex faucibus. Aliquam malesuada in tellus ut egestas. Nullam posuere magna nec ex molestie, a lacinia massa pulvinar. Vivamus magna ante, viverra ac nisl id, sodales condimentum justo.</p>\n<p>Donec iaculis nisi non aliquam euismod. Donec feugiat feugiat feugiat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer pulvinar elit tortor, vel fringilla lorem hendrerit feugiat. Mauris et tortor tempor, maximus augue ac, consectetur nunc. Nulla vel mauris nec leo scelerisque facilisis vel eu nisl. Fusce dapibus vitae leo at dictum. Ut mollis, sapien sed posuere mattis, orci leo pellentesque mauris, sed commodo velit quam id lacus. Maecenas laoreet metus nec porta bibendum. Aliquam dui orci, finibus vitae bibendum et, laoreet et libero. Mauris fermentum metus in condimentum sollicitudin. Phasellus erat mi, laoreet eu iaculis at, sollicitudin eleifend leo.</p>\n<p>Morbi faucibus vel purus non pulvinar. Mauris luctus pellentesque purus, sed dictum massa gravida non. Etiam in sollicitudin ante. Proin mattis pretium enim, quis posuere elit vestibulum ac. Nunc gravida erat at sapien vehicula, nec blandit felis lobortis. Nullam mollis interdum neque, vitae mattis felis eleifend eu. Nulla finibus leo metus, vitae elementum nisi facilisis eget. Aenean posuere, lorem dignissim pellentesque mollis, velit lacus dapibus dui, cursus blandit tortor magna ac nibh. Maecenas consequat volutpat eros quis dictum. Etiam neque justo, consequat a nisl ut, molestie vulputate est.</p>\n<p>Fusce blandit, tellus et porttitor dapibus, magna nulla blandit orci, nec semper tortor risus at est. Curabitur auctor, sem id porttitor semper, sem neque consequat erat, consequat lobortis urna diam ac mi. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Suspendisse a accumsan augue. Etiam tempor lorem ipsum, sed accumsan nunc porta at. Aliquam vulputate a ipsum non euismod. Duis facilisis ipsum nulla, quis euismod est maximus eu. Phasellus in ligula sodales, bibendum mauris a, vehicula orci. Quisque tristique ligula quis magna elementum, quis pellentesque augue sollicitudin. Aliquam non erat non dolor volutpat faucibus in eu magna. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', 'preguntas-frecuentes'),
(11, 1, 1, 'Términos y condiciones', '', '', '', 'terminos-y-condiciones'),
(12, 1, 1, 'Política de manejo de datos', '', '', '', 'politica-de-manejo-de-datos'),
(13, 1, 1, 'Política de privacidad', '', '', '', 'politica-de-privacidad');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_cms_shop`
--

CREATE TABLE IF NOT EXISTS `ps_cms_shop` (
  `id_cms` int(11) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_cms`,`id_shop`),
  KEY `id_shop` (`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ps_cms_shop`
--

INSERT INTO `ps_cms_shop` (`id_cms`, `id_shop`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_compare`
--

CREATE TABLE IF NOT EXISTS `ps_compare` (
  `id_compare` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_customer` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_compare`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_compare_product`
--

CREATE TABLE IF NOT EXISTS `ps_compare_product` (
  `id_compare` int(10) unsigned NOT NULL,
  `id_product` int(10) unsigned NOT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_compare`,`id_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_condition`
--

CREATE TABLE IF NOT EXISTS `ps_condition` (
  `id_condition` int(11) NOT NULL AUTO_INCREMENT,
  `id_ps_condition` int(11) NOT NULL,
  `type` enum('configuration','install','sql') NOT NULL,
  `request` text,
  `operator` varchar(32) DEFAULT NULL,
  `value` varchar(64) DEFAULT NULL,
  `result` varchar(64) DEFAULT NULL,
  `calculation_type` enum('hook','time') DEFAULT NULL,
  `calculation_detail` varchar(64) DEFAULT NULL,
  `validated` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_condition`,`id_ps_condition`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=231 ;

--
-- Volcado de datos para la tabla `ps_condition`
--

INSERT INTO `ps_condition` (`id_condition`, `id_ps_condition`, `type`, `request`, `operator`, `value`, `result`, `calculation_type`, `calculation_detail`, `validated`, `date_add`, `date_upd`) VALUES
(1, 159, 'install', '', '<=', '90', '', 'time', '2', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(2, 158, 'install', '', '>=', '90', '1', 'time', '2', 1, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(3, 19, 'install', '', '>', '0', '1', 'time', '1', 1, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(4, 40, 'install', '', '>=', '730', '', 'time', '2', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(5, 509, 'sql', 'SELECT COUNT( id_module ) FROM PREFIX_module WHERE `name` like "%payulatam%"', '==', '1', '0', 'hook', 'actionModuleInstallAfter', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(6, 55, 'sql', 'SELECT COUNT(*) FROM ps_orders WHERE reference NOT IN ("XKBKNABJK", "OHSATSERP", "FFATNOMMJ", "UOYEVOLI", "KHWLILZLL")', '>=', '100', '0', 'hook', 'actionObjectOrderAddAfter', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(7, 12, 'sql', 'SELECT COUNT(*) FROM PREFIX_product WHERE reference NOT LIKE "demo_%"', '>', '99', '0', 'hook', 'actionObjectProductAddAfter', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(8, 39, 'install', '', '>=', '365', '', 'time', '2', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(9, 428, 'sql', 'SELECT COUNT( id_module ) FROM PREFIX_module WHERE `name` like "%authorizeaim%"', '>=', '1', '0', 'hook', 'actionModuleInstallAfter', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(10, 278, 'sql', 'SELECT COUNT( id_module ) FROM PREFIX_module WHERE `name` like "%mailjet%" ', '>=', '1', '0', 'hook', 'actionModuleInstallAfter', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(11, 1, 'configuration', 'PS_REWRITING_SETTINGS', '==', '1', '1', 'hook', 'actionAdminMetaControllerUpdate_optionsAfter', 1, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(12, 2, 'configuration', 'PS_SMARTY_FORCE_COMPILE', '!=', '2', '1', 'hook', 'actionAdminPerformanceControllerSaveAfter', 1, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(13, 3, 'configuration', 'PS_CSS_THEME_CACHE', '==', '1', '', 'hook', 'actionAdminPerformanceControllerSaveAfter', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(14, 4, 'configuration', 'PS_CIPHER_ALGORITHM', '==', '1', '1', 'hook', 'actionAdminPerformanceControllerSaveAfter', 1, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(15, 5, 'configuration', 'PS_MEDIA_SERVERS', '==', '1', '', 'hook', 'actionAdminPerformanceControllerSaveAfter', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(16, 6, 'sql', 'SELECT COUNT(distinct m.id_module) FROM PREFIX_hook h LEFT JOIN PREFIX_hook_module hm ON h.id_hook = hm.id_hook LEFT JOIN PREFIX_module m ON hm.id_module = m.id_module\r\nWHERE (h.name = "displayPayment" OR h.name = "payment") AND m.name NOT IN ("bankwire", "cheque", "cashondelivery")', '>', '0', '1', 'hook', 'actionModuleInstallAfter', 1, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(17, 7, 'sql', 'SELECT COUNT(distinct m.id_module) FROM PREFIX_hook h LEFT JOIN PREFIX_hook_module hm ON h.id_hook = hm.id_hook LEFT JOIN PREFIX_module m ON hm.id_module = m.id_module\r\nWHERE (h.name = "displayPayment" OR h.name = "payment") AND m.name NOT IN ("bankwire", "cheque", "cashondelivery")', '>', '1', '1', 'hook', 'actionModuleInstallAfter', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(18, 8, 'sql', 'SELECT COUNT(*) FROM PREFIX_carrier WHERE name NOT IN ("0", "My carrier")', '>', '0', '0', 'hook', 'actionObjectCarrierAddAfter', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(19, 9, 'sql', 'SELECT COUNT(*) FROM PREFIX_carrier WHERE name NOT IN ("0", "My carrier")', '>', '1', '0', 'hook', 'actionObjectCarrierAddAfter', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(20, 10, 'sql', 'SELECT COUNT(*) FROM PREFIX_product WHERE reference NOT LIKE "demo_%"', '>', '0', '0', 'hook', 'actionObjectProductAddAfter', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(21, 11, 'sql', 'SELECT COUNT(*) FROM PREFIX_product WHERE reference NOT LIKE "demo_%"', '>', '9', '0', 'hook', 'actionObjectProductAddAfter', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(22, 16, 'configuration', 'PS_SHOP_PHONE', '!=', '0', '', 'hook', 'actionAdminStoresControllerUpdate_optionsAfter', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(23, 17, 'sql', 'SELECT COUNT(*) FROM PREFIX_contact', '>', '2', '2', 'hook', 'actionObjectContactAddAfter', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(24, 18, 'sql', 'SELECT COUNT(*) FROM PREFIX_contact', '>', '4', '2', 'hook', 'actionObjectContactAddAfter', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(25, 13, 'sql', 'SELECT COUNT(*) FROM PREFIX_product WHERE reference NOT LIKE "demo_%"', '>', '999', '0', 'hook', 'actionObjectProductAddAfter', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(26, 14, 'sql', 'SELECT COUNT(*) FROM PREFIX_product WHERE reference NOT LIKE "demo_%"', '>', '9999', '0', 'hook', 'actionObjectProductAddAfter', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(27, 15, 'sql', 'SELECT COUNT(*) FROM PREFIX_product WHERE reference NOT LIKE "demo_%"', '>', '99999', '0', 'hook', 'actionObjectProductAddAfter', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(28, 20, 'install', '', '>=', '7', '1', 'time', '1', 1, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(29, 21, 'configuration', 'PS_LOGO', '!=', 'logo.jpg', '', 'hook', 'actionAdminThemesControllerUpdate_optionsAfter', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(30, 22, 'sql', 'SELECT COUNT(*) FROM PREFIX_theme WHERE directory != "default" AND directory != "prestashop" AND directory ! "default-bootstrap"', '>', '0', '0', 'hook', 'actionObjectShopUpdateAfter', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(31, 23, 'configuration', 'PS_LOGGED_ON_ADDONS', '==', '1', '', 'time', '1', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(32, 24, 'configuration', 'PS_MULTISHOP_FEATURE_ACTIVE', '==', '1', '', 'hook', 'actionAdminPreferencesControllerUpdate_optionsAfter', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(33, 25, 'sql', 'SELECT COUNT(*) FROM PREFIX_shop', '>', '1', '1', 'hook', 'actionObjectShopAddAfter', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(34, 28, 'sql', 'SELECT COUNT(*) FROM PREFIX_shop_group', '>', '1', '1', 'hook', 'actionObjectShopGroupAddAfter', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(35, 26, 'sql', 'SELECT COUNT(*) FROM PREFIX_shop', '>', '4', '1', 'hook', 'actionObjectShopAddAfter', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(36, 27, 'sql', 'SELECT COUNT(*) FROM PREFIX_shop_group', '>', '5', '1', 'hook', 'actionObjectShopGroupAddAfter 	', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(37, 30, 'sql', 'SELECT COUNT(*) FROM PREFIX_carrier WHERE name NOT IN ("0", "My carrier")', '>', '2', '0', 'hook', 'actionObjectCarrierAddAfter', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(38, 29, 'sql', 'SELECT COUNT(distinct m.id_module) FROM PREFIX_hook h LEFT JOIN PREFIX_hook_module hm ON h.id_hook = hm.id_hook LEFT JOIN PREFIX_module m ON hm.id_module = m.id_module\r\nWHERE (h.name = "displayPayment" OR h.name = "payment") AND m.name NOT IN ("bankwire", "cheque", "cashondelivery")', '>', '2', '1', 'hook', 'actionModuleInstallAfter', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(39, 31, 'sql', 'SELECT SUM(total_paid_tax_excl / c.conversion_rate)\r\nFROM PREFIX_orders o INNER JOIN PREFIX_currency c ON c.id_currency = o.id_currency WHERE valid = 1 AND reference != "XKBKNABJK"', '>=', '300000', '0', 'hook', 'actionOrderStatusUpdate', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(40, 32, 'sql', ' 	SELECT SUM(total_paid_tax_excl / c.conversion_rate) FROM PREFIX_orders o INNER JOIN PREFIX_currency c ON c.id_currency = o.id_currency WHERE valid = 1 AND reference != "XKBKNABJK"', '>=', '3000000', '0', 'hook', 'actionOrderStatusUpdate', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(41, 33, 'sql', ' 	SELECT SUM(total_paid_tax_excl / c.conversion_rate) FROM PREFIX_orders o INNER JOIN PREFIX_currency c ON c.id_currency = o.id_currency WHERE valid = 1 AND reference != "XKBKNABJK"', '>=', '30000000', '0', 'time', '1', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(42, 34, 'sql', ' 	SELECT SUM(total_paid_tax_excl / c.conversion_rate) FROM PREFIX_orders o INNER JOIN PREFIX_currency c ON c.id_currency = o.id_currency WHERE valid = 1', '>=', '300000000', '0', 'time', '7', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(43, 35, 'sql', ' 	SELECT SUM(total_paid_tax_excl / c.conversion_rate) FROM PREFIX_orders o INNER JOIN PREFIX_currency c ON c.id_currency = o.id_currency WHERE valid = 1', '>=', '3000000000', '0', 'time', '7', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(44, 36, 'sql', ' 	SELECT SUM(total_paid_tax_excl / c.conversion_rate) FROM PREFIX_orders o INNER JOIN PREFIX_currency c ON c.id_currency = o.id_currency WHERE valid = 1', '>=', '30000000000', '0', 'time', '7', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(45, 37, 'install', '', '>=', '30', '1', 'time', '1', 1, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(46, 38, 'install', '', '>=', '182', '', 'time', '2', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(47, 41, 'sql', 'SELECT COUNT(*) FROM PREFIX_guest', '>=', '10', '11', 'time', '1', 1, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(48, 42, 'sql', 'SELECT COUNT(*) FROM PREFIX_guest', '>=', '100', '11', 'time', '1', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(49, 43, 'sql', 'SELECT COUNT(*) FROM PREFIX_guest', '>=', '1000', '11', 'time', '1', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(50, 44, 'sql', 'SELECT COUNT(*) FROM PREFIX_guest', '>=', '10000', '6', 'time', '2', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(51, 45, 'sql', 'SELECT COUNT(*) FROM PREFIX_guest', '>=', '100000', '6', 'time', '3', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(52, 46, 'sql', 'SELECT COUNT(*) FROM PREFIX_guest', '>=', '1000000', '6', 'time', '4', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(53, 47, 'sql', 'SELECT COUNT(*) FROM PREFIX_cart WHERE secure_key != "b44a6d9efd7a0076a0fbce6b15eaf3b1"', '>=', '2', '1', 'hook', 'actionObjectCartAddAfter', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(54, 48, 'sql', 'SELECT COUNT(*) FROM PREFIX_cart WHERE secure_key != "b44a6d9efd7a0076a0fbce6b15eaf3b1"', '>=', '10', '1', 'hook', 'actionObjectCartAddAfter', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(55, 49, 'sql', 'SELECT COUNT(*) FROM PREFIX_cart WHERE secure_key != "b44a6d9efd7a0076a0fbce6b15eaf3b1"', '>=', '100', '1', 'hook', 'actionObjectCartAddAfter', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(56, 50, 'sql', 'SELECT COUNT(*) FROM PREFIX_cart WHERE secure_key != "b44a6d9efd7a0076a0fbce6b15eaf3b1"', '>=', '1000', '1', 'time', '1', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(57, 51, 'sql', 'SELECT COUNT(*) FROM PREFIX_cart WHERE secure_key != "b44a6d9efd7a0076a0fbce6b15eaf3b1"', '>=', '10000', '0', 'time', '4', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(58, 52, 'sql', 'SELECT COUNT(*) FROM PREFIX_cart WHERE secure_key != "b44a6d9efd7a0076a0fbce6b15eaf3b1"', '>=', '100000', '0', 'time', '8', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(59, 53, 'sql', 'SELECT COUNT(*) FROM ps_orders WHERE reference NOT IN ("XKBKNABJK", "OHSATSERP", "FFATNOMMJ", "UOYEVOLI", "KHWLILZLL")', '>=', '1', '0', 'hook', 'actionObjectOrderAddAfter', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(60, 54, 'sql', 'SELECT COUNT(*) FROM ps_orders WHERE reference NOT IN ("XKBKNABJK", "OHSATSERP", "FFATNOMMJ", "UOYEVOLI", "KHWLILZLL")', '>=', '10', '0', 'hook', 'actionObjectOrderAddAfter', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(61, 56, 'sql', 'SELECT COUNT(*) FROM ps_orders WHERE reference NOT IN ("XKBKNABJK", "OHSATSERP", "FFATNOMMJ", "UOYEVOLI", "KHWLILZLL")', '>=', '1000', '0', 'time', '2', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(62, 57, 'sql', 'SELECT COUNT(*) FROM ps_orders WHERE reference NOT IN ("XKBKNABJK", "OHSATSERP", "FFATNOMMJ", "UOYEVOLI", "KHWLILZLL")', '>=', '10000', '0', 'time', '4', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(63, 58, 'sql', 'SELECT COUNT(*) FROM ps_orders WHERE reference NOT IN ("XKBKNABJK", "OHSATSERP", "FFATNOMMJ", "UOYEVOLI", "KHWLILZLL")', '>=', '100000', '0', 'time', '8', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(64, 65, 'sql', 'SELECT COUNT(*) FROM PREFIX_customer_thread', '>=', '1', '0', 'hook', 'actionObjectCustomerThreadAddAfter', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(65, 66, 'sql', 'SELECT COUNT(*) FROM PREFIX_customer_thread', '>=', '10', '0', 'hook', 'actionObjectCustomerThreadAddAfter', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(66, 67, 'sql', 'SELECT COUNT(*) FROM PREFIX_customer_thread', '>=', '100', '0', 'hook', 'actionObjectCustomerThreadAddAfter', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(67, 68, 'sql', 'SELECT COUNT(*) FROM PREFIX_customer_thread', '>=', '1000', '0', 'time', '2', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(68, 69, 'sql', 'SELECT COUNT(*) FROM PREFIX_customer_thread', '>=', '10000', '0', 'time', '4', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(69, 70, 'sql', 'SELECT COUNT(*) FROM PREFIX_customer_thread', '>=', '100000', '0', 'time', '8', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(70, 59, 'sql', 'SELECT COUNT(*) FROM PREFIX_customer WHERE email != "pub@prestashop.com"', '>=', '1', '0', 'hook', 'actionObjectCustomerAddAfter', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(71, 60, 'sql', 'SELECT COUNT(*) FROM PREFIX_customer WHERE email != "pub@prestashop.com"', '>=', '10', '0', 'hook', 'actionObjectCustomerAddAfter', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(72, 61, 'sql', 'SELECT COUNT(*) FROM PREFIX_customer WHERE email != "pub@prestashop.com"', '>=', '100', '0', 'hook', 'actionObjectCustomerAddAfter', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(73, 62, 'sql', 'SELECT COUNT(*) FROM PREFIX_customer WHERE email != "pub@prestashop.com"', '>=', '1000', '0', 'time', '1', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(74, 63, 'sql', 'SELECT COUNT(*) FROM PREFIX_customer WHERE email != "pub@prestashop.com"', '>=', '10000', '0', 'time', '2', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(75, 64, 'sql', 'SELECT COUNT(*) FROM PREFIX_customer WHERE email != "pub@prestashop.com"', '>=', '100000', '0', 'time', '4', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(76, 76, 'sql', 'SELECT IFNULL(id_order, 0) FROM PREFIX_orders o LEFT JOIN PREFIX_address a ON o.id_address_delivery = a.id_address LEFT JOIN PREFIX_country c ON c.id_country = a.id_country WHERE o.valid = 1 AND a.id_country != "{config}PS_COUNTRY_DEFAULT{/config}" AND c.iso_code IN (\r\n"CA",\r\n"GL",\r\n"PM",\r\n"US"\r\n)', '!=', '0', '0', 'hook', 'actionOrderStatusUpdate', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(77, 79, 'sql', 'SELECT IFNULL(id_order, 0) FROM PREFIX_orders o LEFT JOIN PREFIX_address a ON o.id_address_delivery = a.id_address LEFT JOIN PREFIX_country c ON c.id_country = a.id_country WHERE o.valid = 1 AND a.id_country != "{config}PS_COUNTRY_DEFAULT{/config}" AND c.iso_code IN (\r\n"UM",\r\n"AS",\r\n"AU",\r\n"CK",\r\n"FJ",\r\n"FM",\r\n"GU",\r\n"KI",\r\n"MH,"\r\n"MP",\r\n"NC",\r\n"NF",\r\n"NR",\r\n"NU",\r\n"NZ",\r\n"PF",\r\n"PG",\r\n"PN",\r\n"PW",\r\n"SB",\r\n"TK",\r\n"TO",\r\n"TV",\r\n"VU",\r\n"WF",\r\n"WS"\r\n)', '!=', '0', '0', 'hook', 'actionOrderStatusUpdate', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(78, 77, 'sql', 'SELECT IFNULL(id_order, 0) FROM PREFIX_orders o LEFT JOIN PREFIX_address a ON o.id_address_delivery = a.id_address LEFT JOIN PREFIX_country c ON c.id_country = a.id_country WHERE o.valid = 1 AND a.id_country != "{config}PS_COUNTRY_DEFAULT{/config}" AND c.iso_code IN (\r\n"BZ",\r\n"CR",\r\n"GT",\r\n"HN",\r\n"MX",\r\n"NI",\r\n"PA",\r\n"SV",\r\n"AG",\r\n"AI",\r\n"AN",\r\n"AW",\r\n"BB",\r\n"BM",\r\n"BS",\r\n"CU",\r\n"DM",\r\n"DO",\r\n"GD",\r\n"GP",\r\n"HT",\r\n"JM",\r\n"KN",\r\n"KY",\r\n"LC",\r\n"MQ",\r\n"MS",\r\n"PR",\r\n"TC",\r\n"TT",\r\n"VC",\r\n"VG",\r\n"VI"\r\n)', '!=', '0', '0', 'hook', 'actionOrderStatusUpdate', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(79, 78, 'sql', 'SELECT IFNULL(id_order, 0) FROM PREFIX_orders o LEFT JOIN PREFIX_address a ON o.id_address_delivery = a.id_address LEFT JOIN PREFIX_country c ON c.id_country = a.id_country WHERE o.valid = 1 AND a.id_country != "{config}PS_COUNTRY_DEFAULT{/config}" AND c.iso_code IN (\r\n"AR",\r\n"BO",\r\n"BR",\r\n"CL",\r\n"CO",\r\n"EC",\r\n"FK",\r\n"GF",\r\n"GY",\r\n"PE",\r\n"PY",\r\n"SR",\r\n"UY",\r\n"VE"\r\n)', '!=', '0', '0', 'hook', 'actionOrderStatusUpdate', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(80, 85, 'sql', 'SELECT IFNULL(id_order, 0) FROM PREFIX_orders o LEFT JOIN PREFIX_address a ON o.id_address_delivery = a.id_address LEFT JOIN PREFIX_country c ON c.id_country = a.id_country WHERE o.valid = 1 AND a.id_country != "{config}PS_COUNTRY_DEFAULT{/config}" AND c.iso_code IN (\r\n"KG",\r\n"KZ",\r\n"TJ",\r\n"TM",\r\n"UZ",\r\n"AE",\r\n"AM",\r\n"AZ",\r\n"BH",\r\n"CY",\r\n"GE",\r\n"IL",\r\n"IQ",\r\n"IR",\r\n"JO",\r\n"KW",\r\n"LB",\r\n"OM",\r\n"QA",\r\n"SA",\r\n"SY",\r\n"TR",\r\n"YE",\r\n"AF",\r\n"BD",\r\n"BT",\r\n"IN",\r\n"IO",\r\n"LK",\r\n"MV",\r\n"NP",\r\n"PK",\r\n"CN",\r\n"HK",\r\n"JP",\r\n"KP",\r\n"KR",\r\n"MO",\r\n"TW",\r\n"MN",\r\n"BN",\r\n"CC",\r\n"CX",\r\n"ID",\r\n"KH",\r\n"LA",\r\n"MM",\r\n"MY",\r\n"PH",\r\n"SG",\r\n"TH",\r\n"TP",\r\n"VN"\r\n)', '!=', '0', '0', 'hook', 'actionOrderStatusUpdate', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(81, 87, 'sql', 'SELECT IFNULL(id_order, 0) FROM PREFIX_orders o LEFT JOIN PREFIX_address a ON o.id_address_delivery = a.id_address LEFT JOIN PREFIX_country c ON c.id_country = a.id_country WHERE o.valid = 1 AND a.id_country != "{config}PS_COUNTRY_DEFAULT{/config}" AND c.iso_code IN (\r\n"BE",\r\n"DE",\r\n"FR",\r\n"FX",\r\n"GB",\r\n"IE",\r\n"LU",\r\n"MC",\r\n"NL",\r\n"IT",\r\n"MT",\r\n"SM",\r\n"VA",\r\n"AD",\r\n"ES",\r\n"GI",\r\n"PT",\r\n"BY",\r\n"EE",\r\n"LT",\r\n"LV",\r\n"MD",\r\n"PL",\r\n"UA",\r\n"AL",\r\n"BA",\r\n"BG",\r\n"GR",\r\n"HR",\r\n"MK",\r\n"RO",\r\n"SI",\r\n"YU",\r\n"RU",\r\n"AT",\r\n"CH",\r\n"CZ",\r\n"HU",\r\n"LI",\r\n"SK",\r\n"DK",\r\n"FI",\r\n"FO",\r\n"IS",\r\n"NO",\r\n"SE",\r\n"SJ"\r\n)', '!=', '0', '0', 'hook', 'actionOrderStatusUpdate', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(82, 88, 'sql', 'SELECT IFNULL(id_order, 0) FROM PREFIX_orders o LEFT JOIN PREFIX_address a ON o.id_address_delivery = a.id_address LEFT JOIN PREFIX_country c ON c.id_country = a.id_country WHERE o.valid = 1 AND a.id_country != "{config}PS_COUNTRY_DEFAULT{/config}" AND c.iso_code IN (\r\n"BI",\r\n"CF",\r\n"CG",\r\n"RW",\r\n"TD",\r\n"ZR",\r\n"DJ",\r\n"ER",\r\n"ET",\r\n"KE",\r\n"SO",\r\n"TZ",\r\n"UG",\r\n"KM",\r\n"MG",\r\n"MU",\r\n"RE",\r\n"SC",\r\n"YT",\r\n"AO",\r\n"BW",\r\n"LS",\r\n"MW",\r\n"MZ",\r\n"NA",\r\n"SZ",\r\n"ZA",\r\n"ZM",\r\n"ZW",\r\n"BF",\r\n"BJ",\r\n"CI",\r\n"CM",\r\n"CV",\r\n"GA",\r\n"GH",\r\n"GM",\r\n"GN",\r\n"GQ",\r\n"GW",\r\n"LR",\r\n"ML",\r\n"MR",\r\n"NE",\r\n"NG",\r\n"SL",\r\n"SN",\r\n"ST",\r\n"TG"\r\n)', '!=', '0', '0', 'hook', 'actionOrderStatusUpdate', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(83, 89, 'sql', 'SELECT IFNULL(id_order, 0) FROM PREFIX_orders o LEFT JOIN PREFIX_address a ON o.id_address_delivery = a.id_address LEFT JOIN PREFIX_country c ON c.id_country = a.id_country WHERE o.valid = 1 AND a.id_country != "{config}PS_COUNTRY_DEFAULT{/config}" AND c.iso_code IN (\r\n"DZ",\r\n"EG",\r\n"EH",\r\n"LY",\r\n"MA",\r\n"SD",\r\n"TN"\r\n)', '!=', '0', '0', 'hook', 'actionOrderStatusUpdate', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(84, 90, 'sql', 'SELECT COUNT(*) FROM PREFIX_employee', '>=', '2', '1', 'hook', 'actionObjectEmployeeAddAfter', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(85, 91, 'sql', 'SELECT COUNT(*) FROM PREFIX_employee', '>=', '3', '1', 'hook', 'actionObjectEmployeeAddAfter', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(86, 92, 'sql', 'SELECT COUNT(*) FROM PREFIX_employee', '>=', '5', '1', 'hook', 'actionObjectEmployeeAddAfter', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(87, 93, 'sql', 'SELECT COUNT(*) FROM PREFIX_employee', '>=', '10', '1', 'hook', 'actionObjectEmployeeAddAfter', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(88, 94, 'sql', 'SELECT COUNT(*) FROM PREFIX_employee', '>=', '20', '1', 'hook', 'actionObjectEmployeeAddAfter', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(89, 95, 'sql', 'SELECT COUNT(*) FROM PREFIX_employee', '>=', '40', '1', 'hook', 'actionObjectEmployeeAddAfter', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(90, 96, 'sql', 'SELECT id_image FROM PREFIX_image WHERE id_image > 26', '>', '0', '27', 'hook', 'actionObjectImageAddAfter', 1, '2015-11-17 10:35:40', '2015-11-17 17:10:12'),
(91, 97, 'sql', 'SELECT COUNT(*) FROM PREFIX_image', '>=', '50', '26', 'hook', 'actionObjectImageAddAfter', 0, '2015-11-17 10:35:40', '2015-11-17 17:43:33'),
(92, 98, 'sql', 'SELECT COUNT(*) FROM PREFIX_image', '>=', '100', '26', 'hook', 'actionObjectImageAddAfter', 0, '2015-11-17 10:35:40', '2015-11-17 17:43:33'),
(93, 99, 'sql', 'SELECT COUNT(*) FROM PREFIX_image', '>=', '1000', '23', 'time', '2', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(94, 100, 'sql', 'SELECT COUNT(*) FROM PREFIX_image', '>=', '10000', '23', 'time', '4', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(95, 101, 'sql', 'SELECT COUNT(*) FROM PREFIX_image', '>=', '50000', '23', 'time', '8', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(96, 102, 'sql', 'SELECT id_cms FROM PREFIX_cms WHERE id_cms > 5', '>', '0', '6', 'hook', 'actionObjectCMSAddAfter', 1, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(97, 103, 'sql', 'SELECT COUNT(*) FROM PREFIX_cart_rule', '>=', '1', '0', 'hook', 'actionObjectCartRuleAddAfter 	', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(98, 104, 'sql', 'SELECT COUNT(*) FROM PREFIX_cart_rule', '>=', '10', '0', 'hook', 'actionObjectCartRuleAddAfter 	', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(99, 105, 'sql', 'SELECT COUNT(*) FROM PREFIX_cart_rule', '>=', '100', '0', 'hook', 'actionObjectCartRuleAddAfter 	', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(100, 107, 'sql', 'SELECT COUNT(*) FROM PREFIX_cart_rule', '>=', '500', '0', 'hook', 'actionObjectCartRuleAddAfter 	', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(101, 106, 'sql', 'SELECT COUNT(*) FROM PREFIX_cart_rule', '>=', '1000', '0', 'hook', 'actionObjectCartRuleAddAfter 	', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(102, 108, 'sql', 'SELECT COUNT(*) FROM PREFIX_cart_rule', '>=', '5000', '0', 'hook', 'actionObjectCartRuleAddAfter 	', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(103, 109, 'sql', 'SELECT COUNT(*) FROM PREFIX_orders o INNER JOIN PREFIX_address a ON a.id_address = o.id_address_delivery\r\nWHERE reference NOT IN ("XKBKNABJK", "OHSATSERP", "FFATNOMMJ", "UOYEVOLI", "KHWLILZLL") AND a.id_country != "{config}PS_COUNTRY_DEFAULT{/config}"', '>=', '1', '0', 'hook', 'newOrder', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(104, 110, 'sql', 'SELECT COUNT(*) FROM PREFIX_orders o INNER JOIN PREFIX_address a ON a.id_address = o.id_address_delivery\r\nWHERE reference NOT IN ("XKBKNABJK", "OHSATSERP", "FFATNOMMJ", "UOYEVOLI", "KHWLILZLL") AND a.id_country != "{config}PS_COUNTRY_DEFAULT{/config}"', '>=', '10', '0', 'hook', 'actionOrderStatusUpdate', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(105, 111, 'sql', 'SELECT COUNT(*) FROM PREFIX_orders o INNER JOIN PREFIX_address a ON a.id_address = o.id_address_delivery\r\nWHERE reference NOT IN ("XKBKNABJK", "OHSATSERP", "FFATNOMMJ", "UOYEVOLI", "KHWLILZLL") AND a.id_country != "{config}PS_COUNTRY_DEFAULT{/config}"', '>=', '100', '0', 'hook', 'actionOrderStatusUpdate', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(106, 113, 'sql', 'SELECT COUNT(*) FROM PREFIX_orders o INNER JOIN PREFIX_address a ON a.id_address = o.id_address_delivery\r\nWHERE reference NOT IN ("XKBKNABJK", "OHSATSERP", "FFATNOMMJ", "UOYEVOLI", "KHWLILZLL") AND a.id_country != "{config}PS_COUNTRY_DEFAULT{/config}"', '>=', '1000', '0', 'hook', 'actionOrderStatusUpdate', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(107, 114, 'sql', 'SELECT COUNT(*) FROM PREFIX_orders o INNER JOIN PREFIX_address a ON a.id_address = o.id_address_delivery\r\nWHERE reference NOT IN ("XKBKNABJK", "OHSATSERP", "FFATNOMMJ", "UOYEVOLI", "KHWLILZLL") AND a.id_country != "{config}PS_COUNTRY_DEFAULT{/config}"', '>=', '5000', '0', 'hook', 'actionOrderStatusUpdate', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(108, 112, 'sql', 'SELECT COUNT(*) FROM PREFIX_orders o INNER JOIN PREFIX_address a ON a.id_address = o.id_address_delivery\r\nWHERE reference NOT IN ("XKBKNABJK", "OHSATSERP", "FFATNOMMJ", "UOYEVOLI", "KHWLILZLL") AND a.id_country != "{config}PS_COUNTRY_DEFAULT{/config}"', '>=', '10000', '0', 'hook', 'actionOrderStatusUpdate', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(109, 165, 'sql', 'SELECT COUNT(s.`id_store`) FROM PREFIX_store s WHERE `latitude` NOT IN (''25.76500500'', ''26.13793600'', ''26.00998700'', ''25.73629600'', ''25.88674000'') AND `longitude` NOT IN (''-80.24379700'', ''-80.13943500'', ''-80.29447200'', ''-80.24479700'', ''-80.16329200'')', '>', '0', '0', 'hook', 'actionAdminStoresControllerSaveAfter', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(110, 166, 'sql', 'SELECT COUNT(s.`id_store`) FROM PREFIX_store s WHERE `latitude` NOT IN (''25.76500500'', ''26.13793600'', ''26.00998700'', ''25.73629600'', ''25.88674000'') AND `longitude` NOT IN (''-80.24379700'', ''-80.13943500'', ''-80.29447200'', ''-80.24479700'', ''-80.16329200'')', '>', '1', '0', 'hook', 'actionAdminStoresControllerSaveAfter', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(111, 167, 'sql', 'SELECT COUNT(s.`id_store`) FROM PREFIX_store s WHERE `latitude` NOT IN (''25.76500500'', ''26.13793600'', ''26.00998700'', ''25.73629600'', ''25.88674000'') AND `longitude` NOT IN (''-80.24379700'', ''-80.13943500'', ''-80.29447200'', ''-80.24479700'', ''-80.16329200'')', '>', '4', '0', 'hook', 'actionAdminStoresControllerSaveAfter', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(112, 168, 'sql', 'SELECT COUNT(s.`id_store`) FROM PREFIX_store s WHERE `latitude` NOT IN (''25.76500500'', ''26.13793600'', ''26.00998700'', ''25.73629600'', ''25.88674000'') AND `longitude` NOT IN (''-80.24379700'', ''-80.13943500'', ''-80.29447200'', ''-80.24479700'', ''-80.16329200'')', '>', '9', '0', 'hook', 'actionAdminStoresControllerSaveAfter', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(113, 169, 'sql', 'SELECT COUNT(s.`id_store`) FROM PREFIX_store s WHERE `latitude` NOT IN (''25.76500500'', ''26.13793600'', ''26.00998700'', ''25.73629600'', ''25.88674000'') AND `longitude` NOT IN (''-80.24379700'', ''-80.13943500'', ''-80.29447200'', ''-80.24479700'', ''-80.16329200'')', '>', '19', '0', 'hook', 'actionAdminStoresControllerSaveAfter', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(114, 170, 'sql', 'SELECT COUNT(s.`id_store`) FROM PREFIX_store s WHERE `latitude` NOT IN (''25.76500500'', ''26.13793600'', ''26.00998700'', ''25.73629600'', ''25.88674000'') AND `longitude` NOT IN (''-80.24379700'', ''-80.13943500'', ''-80.29447200'', ''-80.24479700'', ''-80.16329200'')', '>', '49', '0', 'hook', 'actionAdminStoresControllerSaveAfter', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(115, 171, 'sql', 'SELECT COUNT(*) FROM PREFIX_webservice_account', '>=', '1', '0', 'hook', 'actionAdminWebserviceControllerSaveAfter', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(116, 172, 'sql', 'SELECT COUNT(*) FROM PREFIX_webservice_account', '>=', '2', '0', 'hook', 'actionAdminWebserviceControllerSaveAfter', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(117, 173, 'sql', 'SELECT COUNT(*) FROM PREFIX_webservice_account', '>=', '3', '0', 'hook', 'actionAdminWebserviceControllerSaveAfter', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(118, 174, 'sql', 'SELECT COUNT(*) FROM PREFIX_webservice_account', '>=', '4', '0', 'hook', 'actionAdminWebserviceControllerSaveAfter', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(119, 320, 'sql', 'SELECT COUNT( id_module ) FROM PREFIX_module WHERE `name` like "%shopgate%" ', '>=', '1', '0', 'hook', 'actionModuleInstallAfter', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(120, 322, 'configuration', 'SHOPGATE_CONFIGURATION_OK', '==', '1', '', 'time', '1', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(121, 375, 'sql', 'SELECT COUNT(*) FROM PREFIX_orders o LEFT JOIN PREFIX_order_state os ON os.id_order_state = o.current_state WHERE o.module like "%shopgate%" AND os.logable = 1 AND o.date_add > DATE_SUB(NOW(), INTERVAL 90 DAY)', '>=', '1', '0', 'time', '1', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(122, 376, 'sql', 'SELECT COUNT(*) FROM PREFIX_orders o LEFT JOIN PREFIX_order_state os ON os.id_order_state = o.current_state WHERE o.module like "%shopgate%" AND os.logable = 1 AND o.date_add > DATE_SUB(NOW(), INTERVAL 90 DAY)', '>=', '30', '0', 'time', '1', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(123, 140, 'sql', 'SELECT COUNT( id_module ) FROM PREFIX_module WHERE `name` like "%moneybookers%"', '>=', '1', '0', 'hook', 'actionModuleInstallAfter', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(124, 326, 'sql', 'SELECT COUNT(*) FROM PREFIX_configuration WHERE (( name LIKE ''MONEYBOOKERS_CONFIGURATION_OK'') AND ( value = ''1'')) OR (( name LIKE ''MB_PAY_TO_EMAIL '') AND ( value != ''testaccount2@moneybookers.com ''))', '==', '2', '0', 'time', '1', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(125, 377, 'sql', 'SELECT COUNT(*) FROM PREFIX_orders o LEFT JOIN PREFIX_order_state os ON os.id_order_state = o.current_state WHERE o.module like "%moneybookers%" AND os.logable = 1 AND o.date_add > DATE_SUB(NOW(), INTERVAL 90 DAY)', '>=', '1', '0', 'time', '1', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(126, 394, 'sql', 'SELECT COUNT(*) FROM PREFIX_orders o LEFT JOIN PREFIX_order_state os ON os.id_order_state = o.current_state WHERE o.module like "%sofortbanking%" AND os.logable = 1 AND o.date_add > DATE_SUB(NOW(), INTERVAL 90 DAY)', '>=', '30', '0', 'time', '1', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(127, 429, 'configuration', 'SELECT COUNT(*) FROM PREFIX_configuration WHERE (( name LIKE ''AUTHORIZEAIM_CONFIGURATION_OK'') AND ( value = ''1'')) OR (( name LIKE ''AUTHORIZE_AIM_SANDBOX'') AND ( value = ''0''))', '==', '2', '', 'time', '2', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(128, 430, 'sql', 'SELECT COUNT(*) FROM PREFIX_orders o LEFT JOIN PREFIX_order_state os ON os.id_order_state = o.current_state WHERE o.module like "%authorizeaim%" AND os.logable = 1', '>=', '1', '0', 'time', '2', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(129, 431, 'sql', 'SELECT COUNT(*) FROM PREFIX_orders o LEFT JOIN PREFIX_order_state os ON os.id_order_state = o.current_state WHERE o.module like "%authorizeaim%" AND os.logable = 1 AND o.date_add > DATE_SUB(NOW(), INTERVAL 90 DAY)', '>=', '30', '0', 'time', '7', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(130, 136, 'sql', 'SELECT COUNT( id_module ) FROM PREFIX_module WHERE `name` like "%ebay%"', '>=', '1', '0', 'hook', 'actionModuleInstallAfter', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(131, 209, 'configuration', 'EBAY_CONFIGURATION_OK', '==', '1', '', 'time', '1', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(132, 358, 'sql', 'SELECT COUNT(*) FROM PREFIX_orders o LEFT JOIN PREFIX_order_state os ON os.id_order_state = o.current_state WHERE o.module like "%ebay%" AND os.logable = 1', '>=', '1', '0', 'time', '1', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(133, 359, 'sql', 'SELECT COUNT(*) FROM PREFIX_orders o LEFT JOIN PREFIX_order_state os ON os.id_order_state = o.current_state WHERE o.module like "%ebay%" AND os.logable = 1 AND o.date_add > DATE_SUB(NOW(), INTERVAL 90 DAY)', '>=', '30', '0', 'time', '1', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(134, 438, 'sql', 'SELECT COUNT( id_module ) FROM PREFIX_module WHERE `name` like "%payplug%"', '>=', '1', '0', 'hook', 'actionModuleInstallAfter', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(135, 439, 'configuration', 'PAYPLUG_CONFIGURATION_OK', '==', '1', '', 'time', '1', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(136, 440, 'sql', 'SELECT COUNT(*) FROM PREFIX_orders o LEFT JOIN PREFIX_order_state os ON os.id_order_state = o.current_state WHERE o.module like "%payplug%" AND os.logable = 1', '>=', '1', '0', 'time', '2', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(137, 441, 'sql', 'SELECT SUM(o.total_paid) FROM PREFIX_orders o LEFT JOIN PREFIX_order_state os ON os.id_order_state = o.current_state WHERE o.module like "%payplug%" AND os.logable = 1 AND o.date_add > DATE_SUB(NOW(), INTERVAL 90 DAY)', '>=', '10000', '0', 'time', '7', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(138, 442, 'sql', 'SELECT COUNT( id_module ) FROM PREFIX_module WHERE `name` like "%affinityitems%"', '>=', '1', '0', 'hook', 'actionModuleInstallAfter', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(139, 443, 'sql', 'SELECT COUNT(*) FROM PREFIX_configuration WHERE name LIKE ''AFFINITYITEMS_CONFIGURATION_OK'' AND value = ''1''', '==', '1', '0', 'time', '1', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(140, 446, 'sql', 'SELECT COUNT( id_module ) FROM PREFIX_module WHERE `name` like "%dpdpoland%"', '>=', '1', '0', 'hook', 'actionModuleInstallAfter', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(141, 447, 'configuration', 'DPDPOLAND_CONFIGURATION_OK', '==', '1', '', 'time', '1', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(142, 448, 'sql', 'SELECT COUNT(*) FROM PREFIX_orders o LEFT JOIN PREFIX_order_state os ON os.id_order_state = o.current_state LEFT JOIN PREFIX_carrier c ON c.id_carrier = o.id_carrier WHERE c.name like "%dpdpoland%" AND os.logable = 1', '>=', '1', '0', 'time', '2', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(143, 449, 'sql', 'SELECT COUNT(*) FROM PREFIX_orders o LEFT JOIN PREFIX_order_state os ON os.id_order_state = o.current_state LEFT JOIN PREFIX_carrier c ON c.id_carrier = o.id_carrier WHERE c.name like "%dpdpoland%" AND os.logable = 1 AND o.date_add > DATE_SUB(NOW(), INTERVAL 90 DAY)', '>=', '100', '0', 'time', '7', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(144, 450, 'sql', 'SELECT COUNT( id_module ) FROM PREFIX_module WHERE `name` like "%envoimoinscher%"', '>=', '1', '0', 'hook', 'actionModuleInstallAfter', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(145, 451, 'sql', 'SELECT COUNT(*) FROM PREFIX_configuration WHERE (( name LIKE ''ENVOIMOINSCHER_CONFIGURATION_OK'') AND ( value = ''1'')) OR (( name LIKE ''EMC_ENV '') AND ( value != ''TEST''))', '==', '2', '0', 'time', '1', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(146, 452, 'sql', 'SELECT COUNT(*) FROM PREFIX_orders o LEFT JOIN PREFIX_order_state os ON os.id_order_state = o.current_state LEFT JOIN PREFIX_carrier c ON c.id_carrier = o.id_carrier WHERE c.name like "%envoimoinscher%" AND os.logable = 1', '>=', '1', '0', 'time', '2', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(147, 453, 'sql', 'SELECT COUNT(*) FROM PREFIX_orders o LEFT JOIN PREFIX_order_state os ON os.id_order_state = o.current_state LEFT JOIN PREFIX_carrier c ON c.id_carrier = o.id_carrier WHERE c.name like "%envoimoinscher%" AND os.logable = 1 AND o.date_add > DATE_SUB(NOW(), INTERVAL 90 DAY)', '>=', '100', '0', 'time', '7', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(148, 454, 'sql', 'SELECT COUNT( id_module ) FROM PREFIX_module WHERE `name` like "%klikandpay%"', '>=', '1', '0', 'hook', 'actionModuleInstallAfter', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(149, 455, 'configuration', 'KLIKANDPAY_CONFIGURATION_OK', '==', '1', '', 'time', '1', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(150, 456, 'sql', 'SELECT COUNT(*) FROM PREFIX_orders o LEFT JOIN PREFIX_order_state os ON os.id_order_state = o.current_state WHERE o.module like "%klikandpay%" AND os.logable = 1', '>=', '1', '0', 'time', '2', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(151, 457, 'sql', 'SELECT COUNT(*) FROM PREFIX_orders o LEFT JOIN PREFIX_order_state os ON os.id_order_state = o.current_state WHERE o.module like "%klikandpay%" AND os.logable = 1 AND o.date_add > DATE_SUB(NOW(), INTERVAL 90 DAY)', '>=', '30', '0', 'time', '7', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(152, 458, 'sql', 'SELECT COUNT( id_module ) FROM PREFIX_module WHERE `name` like "%clickline%"', '>=', '1', '0', 'hook', 'actionModuleInstallAfter', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(153, 459, 'configuration', 'CLICKLINE_CONFIGURATION_OK', '==', '1', '', 'time', '1', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(154, 460, 'sql', 'SELECT COUNT(*) FROM PREFIX_orders o LEFT JOIN PREFIX_order_state os ON os.id_order_state = o.current_state LEFT JOIN PREFIX_carrier c ON c.id_carrier = o.id_carrier WHERE c.name like "%clickline%" AND os.logable = 1', '>=', '1', '0', 'time', '2', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(155, 461, 'sql', 'SELECT COUNT(*) FROM PREFIX_orders o LEFT JOIN PREFIX_order_state os ON os.id_order_state = o.current_state LEFT JOIN PREFIX_carrier c ON c.id_carrier = o.id_carrier WHERE c.name like "%clickline%" AND os.logable = 1 AND o.date_add > DATE_SUB(NOW(), INTERVAL 90 DAY)', '>=', '100', '0', 'time', '7', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(156, 462, 'sql', 'SELECT COUNT( id_module ) FROM PREFIX_module WHERE `name` like "%cdiscount%"', '>=', '1', '0', 'hook', 'actionModuleInstallAfter', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(157, 463, 'sql', 'SELECT 1', '!=', '1', '1', 'time', '100', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(158, 464, 'sql', 'SELECT COUNT(*) FROM PREFIX_orders o LEFT JOIN PREFIX_order_state os ON os.id_order_state = o.current_state WHERE o.module like "%cdiscount%" AND os.logable = 1', '>=', '1', '0', 'time', '2', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(159, 465, 'sql', 'SELECT SUM(o.total_paid) FROM PREFIX_orders o LEFT JOIN PREFIX_order_state os ON os.id_order_state = o.current_state WHERE o.module like "%cdiscount%" AND os.logable = 1 AND o.date_add > DATE_SUB(NOW(), INTERVAL 365 DAY)', '>=', '500', '0', 'time', '7', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(160, 467, 'sql', 'SELECT COUNT( id_module ) FROM PREFIX_module WHERE `name` like "%erpillicopresta%"', '>=', '1', '0', 'hook', 'actionModuleInstallAfter', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(161, 468, 'configuration', 'SELECT COUNT(*) FROM PREFIX_configuration WHERE (( name LIKE ''ERPILLICOPRESTA_CONFIGURATION_OK'') AND ( value = ''1'')) OR (( name LIKE ''ERP_LICENCE_VALIDITY '') AND ( value == ''1'')) OR (( name LIKE ''ERP_MONTH_FREE_ACTIVE '') AND ( value == ''0''))', '==', '3', '', 'time', '1', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(162, 469, 'sql', 'SELECT 1', '!=', '1', '1', 'time', '100', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(163, 470, 'sql', 'SELECT 1', '!=', '1', '1', 'time', '100', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(164, 471, 'sql', 'SELECT COUNT( id_module ) FROM PREFIX_module WHERE `name` like "%netreviews%"', '>=', '1', '0', 'hook', 'actionModuleInstallAfter', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(165, 472, 'sql', 'SELECT COUNT(*) FROM PREFIX_configuration WHERE (( name LIKE ''NETREVIEWS_CONFIGURATION_OK'') AND ( value = ''1'')) OR (( name LIKE ''AVISVERIFIES_URLCERTIFICAT '') AND ( value IS NOT LIKE ''%preprod%''))', '==', '2', '0', 'time', '1', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(166, 473, 'sql', 'SELECT 1', '!=', '1', '1', 'time', '100', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(167, 474, 'sql', 'SELECT 1', '!=', '1', '1', 'time', '100', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(168, 475, 'sql', 'SELECT COUNT( id_module ) FROM PREFIX_module WHERE `name` like "%bluesnap%"', '>=', '1', '0', 'hook', 'actionModuleInstallAfter', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(169, 476, 'sql', 'SELECT COUNT(*) FROM PREFIX_configuration WHERE (( name LIKE ''BLUESNAP_CONFIGURATION_OK'') AND ( value = ''1'')) OR (( name LIKE ''BLUESNAP_SANDBOX '') AND ( value NOT LIKE ''%sandbox%''))', '==', '2', '0', 'time', '1', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(170, 477, 'sql', 'SELECT COUNT(*) FROM PREFIX_orders o LEFT JOIN PREFIX_order_state os ON os.id_order_state = o.current_state WHERE o.module like "%bluesnap%" AND os.logable = 1', '>=', '1', '0', 'time', '2', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(171, 478, 'sql', 'SELECT COUNT(*) FROM PREFIX_orders o LEFT JOIN PREFIX_order_state os ON os.id_order_state = o.current_state WHERE o.module like "%bluesnap%" AND os.logable = 1 AND o.date_add > DATE_SUB(NOW(), INTERVAL 90 DAY)', '>=', '30', '0', 'time', '7', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(172, 479, 'sql', 'SELECT COUNT( id_module ) FROM PREFIX_module WHERE `name` like "%desjardins%"', '>=', '1', '0', 'hook', 'actionModuleInstallAfter', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(173, 480, 'sql', 'SELECT COUNT(*) FROM PREFIX_configuration WHERE (( name LIKE ''DESJARDINS_CONFIGURATION_OK'') AND ( value = ''1'')) OR (( name LIKE ''DESJARDINS_MODE '') AND ( value NOT LIKE ''%test%''))', '==', '2', '0', 'time', '1', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(174, 481, 'sql', 'SELECT COUNT(*) FROM PREFIX_orders o LEFT JOIN PREFIX_order_state os ON os.id_order_state = o.current_state WHERE o.module like "%desjardins%" AND os.logable = 1', '>=', '1', '0', 'time', '2', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(175, 482, 'sql', 'SELECT COUNT(*) FROM PREFIX_orders o LEFT JOIN PREFIX_order_state os ON os.id_order_state = o.current_state WHERE o.module like "%desjardins%" AND os.logable = 1 AND o.date_add > DATE_SUB(NOW(), INTERVAL 90 DAY)', '>=', '30', '0', 'time', '7', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(176, 483, 'sql', 'SELECT COUNT( id_module ) FROM PREFIX_module WHERE `name` like "%firstdata%"', '>=', '1', '0', 'hook', 'actionModuleInstallAfter', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(177, 484, 'configuration', 'FIRSTDATA_CONFIGURATION_OK', '==', '1', '', 'time', '1', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(178, 485, 'sql', 'SELECT COUNT(*) FROM PREFIX_orders o LEFT JOIN PREFIX_order_state os ON os.id_order_state = o.current_state WHERE o.module like "%firstdata%" AND os.logable = 1', '>=', '1', '0', 'time', '2', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(179, 486, 'sql', 'SELECT COUNT(*) FROM PREFIX_orders o LEFT JOIN PREFIX_order_state os ON os.id_order_state = o.current_state WHERE o.module like "%firstdata%" AND os.logable = 1 AND o.date_add > DATE_SUB(NOW(), INTERVAL 90 DAY)', '>=', '30', '0', 'time', '7', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(180, 487, 'sql', 'SELECT COUNT( id_module ) FROM PREFIX_module WHERE `name` like "%giveit%"', '>=', '1', '0', 'hook', 'actionModuleInstallAfter', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(181, 488, 'sql', 'GIVEIT_CONFIGURATION_OK', '>=', '1', '0', 'time', '1', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(182, 489, 'sql', 'SELECT 1', '!=', '1', '1', 'time', '365', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(183, 490, 'sql', 'SELECT 1', '!=', '1', '1', 'time', '365', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(184, 491, 'sql', 'SELECT COUNT( id_module ) FROM PREFIX_module WHERE `name` like "%ganalytics%"', '>=', '1', '0', 'hook', 'actionModuleInstallAfter', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(185, 492, 'configuration', 'GANALYTICS_CONFIGURATION_OK', '==', '1', '', 'time', '1', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(186, 493, 'sql', 'SELECT 1', '!=', '1', '1', 'time', '1', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(187, 494, 'sql', 'SELECT 1', '!=', '1', '1', 'time', '365', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(188, 496, 'sql', 'SELECT COUNT( id_module ) FROM PREFIX_module WHERE `name` like "%pagseguro%"', '>=', '1', '0', 'hook', 'actionModuleInstallAfter', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(189, 497, 'configuration', 'PAGSEGURO_CONFIGURATION_OK', '==', '1', '', 'time', '1', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(190, 498, 'sql', 'SELECT COUNT(*) FROM PREFIX_orders o LEFT JOIN PREFIX_order_state os ON os.id_order_state = o.current_state WHERE o.module like "%pagseguro%" AND os.logable = 1', '>=', '1', '0', 'time', '2', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(191, 499, 'sql', 'SELECT COUNT(*) FROM PREFIX_orders o LEFT JOIN PREFIX_order_state os ON os.id_order_state = o.current_state WHERE o.module like "%pagseguro%" AND os.logable = 1 AND o.date_add > DATE_SUB(NOW(), INTERVAL 90 DAY)', '>=', '30', '0', 'time', '7', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(192, 500, 'sql', 'SELECT COUNT( id_module ) FROM PREFIX_module WHERE `name` like "%paypalmx%"', '>=', '1', '0', 'hook', 'actionModuleInstallAfter', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(193, 501, 'sql', 'SELECT COUNT(*) FROM PREFIX_configuration WHERE (( name LIKE ''PAYPALMX_CONFIGURATION_OK'') AND ( value = ''1'')) OR (( name LIKE ''PAYPAL_MX_SANDBOX'') AND ( value = ''0''))', '==', '2', '0', 'time', '1', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(194, 502, 'sql', 'SELECT COUNT(*) FROM PREFIX_orders o LEFT JOIN PREFIX_order_state os ON os.id_order_state = o.current_state WHERE o.module like "%paypalmx%" AND os.logable = 1', '>=', '1', '0', 'time', '2', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(195, 503, 'sql', 'SELECT COUNT(*) FROM PREFIX_orders o LEFT JOIN PREFIX_order_state os ON os.id_order_state = o.current_state WHERE o.module like "%paypalmx%" AND os.logable = 1 AND o.date_add > DATE_SUB(NOW(), INTERVAL 90 DAY)', '>=', '30', '0', 'time', '7', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(196, 505, 'sql', 'SELECT COUNT( id_module ) FROM PREFIX_module WHERE `name` like "%paypalusa%"', '==', '1', '0', 'hook', 'actionModuleInstallAfter', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(197, 506, 'sql', 'SELECT COUNT(*) FROM PREFIX_configuration WHERE (( name LIKE ''PAYPALUSA_CONFIGURATION_OK'') AND ( value = ''1'')) OR (( name LIKE ''PAYPAL_USA_SANDBOX'') AND ( value = ''0''))', '==', '2', '0', 'time', '1', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(198, 507, 'sql', 'SELECT COUNT(*) FROM PREFIX_orders o LEFT JOIN PREFIX_order_state os ON os.id_order_state = o.current_state WHERE o.module like "%paypalusa%" AND os.logable = 1', '>=', '1', '0', 'time', '2', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(199, 508, 'sql', 'SELECT COUNT(*) FROM PREFIX_orders o LEFT JOIN PREFIX_order_state os ON os.id_order_state = o.current_state WHERE o.module like "%paypalmx%" AND os.logable = 1 AND o.date_add > DATE_SUB(NOW(), INTERVAL 90 DAY)', '>=', '30', '0', 'time', '7', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(200, 510, 'sql', 'SELECT COUNT(*) FROM PREFIX_configuration WHERE (( name LIKE ''PAYULATAM_CONFIGURATION_OK'') AND ( value = ''1'')) OR (( name LIKE ''PAYU_LATAM_TEST'') AND ( value = ''1''))', '==', '2', '0', 'time', '1', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(201, 511, 'sql', 'SELECT COUNT(*) FROM PREFIX_orders o LEFT JOIN PREFIX_order_state os ON os.id_order_state = o.current_state WHERE o.module like "%payulatam%" AND os.logable = 1', '>=', '1', '0', 'time', '2', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(202, 512, 'sql', 'SELECT COUNT(*) FROM PREFIX_orders o LEFT JOIN PREFIX_order_state os ON os.id_order_state = o.current_state WHERE o.module like "%payulatam%" AND os.logable = 1 AND o.date_add > DATE_SUB(NOW(), INTERVAL 90 DAY)', '>=', '30', '0', 'time', '7', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(203, 513, 'sql', 'SELECT COUNT( id_module ) FROM PREFIX_module WHERE `name` like "%prestastats%"', '==', '1', '0', 'hook', 'actionModuleInstallAfter', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(204, 514, 'configuration', 'PRESTASTATS_CONFIGURATION_OK', '==', '1', '', 'time', '1', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(205, 515, 'sql', 'SELECT 1', '!=', '1', '1', 'time', '365', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(206, 516, 'sql', 'SELECT 1', '!=', '1', '1', 'time', '365', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(207, 517, 'sql', 'SELECT COUNT( id_module ) FROM PREFIX_module WHERE `name` like "%riskified%"', '==', '1', '0', 'hook', 'actionModuleInstallAfter', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(208, 518, 'sql', 'SELECT COUNT(*) FROM PREFIX_configuration WHERE (( name LIKE ''RISKIFIED_CONFIGURATION_OK'') AND ( value = ''1'')) OR (( name LIKE ''RISKIFIED_MODE'') AND ( value = ''1''))', '==', '2', '0', 'time', '1', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(209, 519, 'sql', 'SELECT COUNT(*) FROM PREFIX_orders o LEFT JOIN PREFIX_order_state os ON os.id_order_state = o.current_state WHERE o.module like "%riskified%" AND os.logable = 1', '>=', '1', '0', 'time', '2', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(210, 520, 'sql', 'SELECT COUNT(*) FROM PREFIX_orders o LEFT JOIN PREFIX_order_state os ON os.id_order_state = o.current_state WHERE o.module like "%riskified%" AND os.logable = 1 AND o.date_add > DATE_SUB(NOW(), INTERVAL 90 DAY)', '>=', '30', '0', 'time', '7', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(211, 521, 'sql', 'SELECT COUNT( id_module ) FROM PREFIX_module WHERE `name` like "%simplifycommerce%"', '==', '1', '0', 'hook', 'actionModuleInstallAfter', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(212, 522, 'sql', 'SELECT COUNT(*) FROM PREFIX_configuration WHERE (( name LIKE ''SIMPLIFY_CONFIGURATION_OK'') AND ( value = ''1'')) OR (( name LIKE ''SIMPLIFY_MODE'') AND ( value = ''1''))', '==', '2', '0', 'time', '1', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(213, 523, 'sql', 'SELECT COUNT(*) FROM PREFIX_orders o LEFT JOIN PREFIX_order_state os ON os.id_order_state = o.current_state WHERE o.module like "%simplifycommerce%" AND os.logable = 1', '>=', '1', '0', 'time', '2', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40');
INSERT INTO `ps_condition` (`id_condition`, `id_ps_condition`, `type`, `request`, `operator`, `value`, `result`, `calculation_type`, `calculation_detail`, `validated`, `date_add`, `date_upd`) VALUES
(214, 524, 'sql', 'SELECT COUNT(*) FROM PREFIX_orders o LEFT JOIN PREFIX_order_state os ON os.id_order_state = o.current_state WHERE o.module like "%simplifycommerce%" AND os.logable = 1 AND o.date_add > DATE_SUB(NOW(), INTERVAL 90 DAY)', '>=', '30', '0', 'time', '7', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(215, 525, 'sql', 'SELECT COUNT( id_module ) FROM PREFIX_module WHERE `name` like "%vtpayment%"', '==', '1', '0', 'hook', 'actionModuleInstallAfter', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(216, 526, 'configuration', 'VTPAYMENT_CONFIGURATION_OK', '==', '1', '', 'time', '1', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(217, 527, 'sql', 'SELECT COUNT(*) FROM PREFIX_orders o LEFT JOIN PREFIX_order_state os ON os.id_order_state = o.current_state WHERE o.module like "%vtpayment%" AND os.logable = 1', '>=', '1', '0', 'time', '2', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(218, 528, 'sql', 'SELECT COUNT(*) FROM PREFIX_orders o LEFT JOIN PREFIX_order_state os ON os.id_order_state = o.current_state WHERE o.module like "%vtpayment%" AND os.logable = 1 AND o.date_add > DATE_SUB(NOW(), INTERVAL 90 DAY)', '>=', '30', '0', 'time', '7', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(219, 529, 'sql', 'SELECT COUNT( id_module ) FROM PREFIX_module WHERE `name` like "%yotpo%"', '==', '1', '0', 'hook', 'actionModuleInstallAfter', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(220, 530, 'configuration', 'YOTPO_CONFIGURATION_OK', '==', '1', '', 'time', '1', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(221, 531, 'sql', 'SELECT 1', '!=', '1', '1', 'time', '365', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(222, 532, 'sql', 'SELECT 1', '!=', '1', '1', 'time', '365', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(223, 533, 'sql', 'SELECT COUNT( id_module ) FROM PREFIX_module WHERE `name` like "%yotpo%"', '==', '1', '0', 'hook', 'actionModuleInstallAfter', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(224, 534, 'sql', 'SELECT COUNT(*) FROM PREFIX_configuration WHERE (( name LIKE ''YOUSTICERESOLUTIONSYSTEM_CONF_OK'') AND ( value = ''1'')) OR (( name LIKE ''YRS_SANDBOX'') AND ( value = ''0''))', '==', '2', '0', 'time', '1', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(225, 535, 'sql', 'SELECT 1', '!=', '1', '1', 'time', '365', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(226, 536, 'sql', 'SELECT 1', '!=', '1', '1', 'time', '365', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(227, 537, 'sql', 'SELECT COUNT( id_module ) FROM PREFIX_module WHERE `name` like "%loyaltylion%"', '>=', '1', '0', 'hook', 'actionModuleInstallAfter', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(228, 538, 'configuration', 'LOYALTYLION_CONFIGURATION_OK', '==', '1', '', 'time', '1', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(229, 539, 'sql', 'SELECT 1', '!=', '1', '1', 'time', '365', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40'),
(230, 540, 'sql', 'SELECT 1', '!=', '1', '1', 'time', '365', 0, '2015-11-17 10:35:40', '2015-11-17 10:35:40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_condition_advice`
--

CREATE TABLE IF NOT EXISTS `ps_condition_advice` (
  `id_condition` int(11) NOT NULL,
  `id_advice` int(11) NOT NULL,
  `display` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_condition`,`id_advice`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ps_condition_advice`
--

INSERT INTO `ps_condition_advice` (`id_condition`, `id_advice`, `display`) VALUES
(1, 1, 1),
(1, 21, 1),
(1, 41, 1),
(1, 61, 1),
(1, 81, 1),
(1, 101, 1),
(1, 121, 1),
(2, 1, 0),
(2, 21, 0),
(2, 41, 0),
(2, 61, 0),
(2, 81, 0),
(2, 101, 0),
(2, 121, 0),
(3, 2, 1),
(3, 3, 1),
(3, 4, 1),
(3, 5, 1),
(3, 6, 1),
(3, 8, 1),
(3, 11, 1),
(3, 12, 1),
(3, 13, 1),
(3, 15, 1),
(3, 16, 1),
(3, 17, 1),
(3, 18, 1),
(3, 19, 1),
(3, 20, 1),
(3, 22, 1),
(3, 23, 1),
(3, 24, 1),
(3, 25, 1),
(3, 26, 1),
(3, 28, 1),
(3, 31, 1),
(3, 32, 1),
(3, 33, 1),
(3, 35, 1),
(3, 36, 1),
(3, 37, 1),
(3, 38, 1),
(3, 39, 1),
(3, 40, 1),
(3, 42, 1),
(3, 43, 1),
(3, 44, 1),
(3, 45, 1),
(3, 46, 1),
(3, 48, 1),
(3, 51, 1),
(3, 52, 1),
(3, 53, 1),
(3, 55, 1),
(3, 56, 1),
(3, 57, 1),
(3, 58, 1),
(3, 59, 1),
(3, 60, 1),
(3, 62, 1),
(3, 63, 1),
(3, 64, 1),
(3, 65, 1),
(3, 66, 1),
(3, 68, 1),
(3, 71, 1),
(3, 72, 1),
(3, 73, 1),
(3, 75, 1),
(3, 76, 1),
(3, 77, 1),
(3, 78, 1),
(3, 79, 1),
(3, 80, 1),
(3, 82, 1),
(3, 83, 1),
(3, 84, 1),
(3, 85, 1),
(3, 86, 1),
(3, 88, 1),
(3, 91, 1),
(3, 92, 1),
(3, 93, 1),
(3, 95, 1),
(3, 96, 1),
(3, 97, 1),
(3, 98, 1),
(3, 99, 1),
(3, 100, 1),
(3, 102, 1),
(3, 103, 1),
(3, 104, 1),
(3, 105, 1),
(3, 106, 1),
(3, 108, 1),
(3, 111, 1),
(3, 112, 1),
(3, 113, 1),
(3, 115, 1),
(3, 116, 1),
(3, 117, 1),
(3, 118, 1),
(3, 119, 1),
(3, 120, 1),
(3, 122, 1),
(3, 123, 1),
(3, 124, 1),
(3, 125, 1),
(3, 126, 1),
(3, 128, 1),
(3, 131, 1),
(3, 132, 1),
(3, 133, 1),
(3, 135, 1),
(3, 136, 1),
(3, 137, 1),
(3, 138, 1),
(3, 139, 1),
(3, 140, 1),
(4, 2, 0),
(4, 3, 0),
(4, 5, 0),
(4, 8, 0),
(4, 22, 0),
(4, 23, 0),
(4, 25, 0),
(4, 28, 0),
(4, 42, 0),
(4, 43, 0),
(4, 45, 0),
(4, 48, 0),
(4, 62, 0),
(4, 63, 0),
(4, 65, 0),
(4, 68, 0),
(4, 82, 0),
(4, 83, 0),
(4, 85, 0),
(4, 88, 0),
(4, 102, 0),
(4, 103, 0),
(4, 105, 0),
(4, 108, 0),
(4, 122, 0),
(4, 123, 0),
(4, 125, 0),
(4, 128, 0),
(5, 7, 1),
(5, 27, 1),
(5, 47, 1),
(5, 67, 1),
(5, 87, 1),
(5, 107, 1),
(5, 127, 1),
(6, 9, 1),
(6, 10, 1),
(6, 29, 1),
(6, 30, 1),
(6, 49, 1),
(6, 50, 1),
(6, 69, 1),
(6, 70, 1),
(6, 89, 1),
(6, 90, 1),
(6, 109, 1),
(6, 110, 1),
(6, 129, 1),
(6, 130, 1),
(7, 14, 1),
(7, 34, 1),
(7, 54, 1),
(7, 74, 1),
(7, 94, 1),
(7, 114, 1),
(7, 134, 1),
(8, 14, 0),
(8, 15, 0),
(8, 16, 0),
(8, 34, 0),
(8, 35, 0),
(8, 36, 0),
(8, 54, 0),
(8, 55, 0),
(8, 56, 0),
(8, 74, 0),
(8, 75, 0),
(8, 76, 0),
(8, 94, 0),
(8, 95, 0),
(8, 96, 0),
(8, 114, 0),
(8, 115, 0),
(8, 116, 0),
(8, 134, 0),
(8, 135, 0),
(8, 136, 0),
(9, 17, 0),
(9, 37, 0),
(9, 57, 0),
(9, 77, 0),
(9, 97, 0),
(9, 117, 0),
(9, 137, 0),
(10, 19, 0),
(10, 39, 0),
(10, 59, 0),
(10, 79, 0),
(10, 99, 0),
(10, 119, 0),
(10, 139, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_condition_badge`
--

CREATE TABLE IF NOT EXISTS `ps_condition_badge` (
  `id_condition` int(11) NOT NULL,
  `id_badge` int(11) NOT NULL,
  PRIMARY KEY (`id_condition`,`id_badge`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ps_condition_badge`
--

INSERT INTO `ps_condition_badge` (`id_condition`, `id_badge`) VALUES
(3, 131),
(4, 152),
(5, 83),
(6, 167),
(7, 127),
(8, 151),
(9, 9),
(11, 115),
(12, 116),
(13, 116),
(14, 116),
(15, 117),
(16, 118),
(17, 119),
(18, 120),
(19, 121),
(20, 122),
(21, 123),
(22, 124),
(23, 125),
(24, 126),
(25, 128),
(26, 129),
(27, 130),
(28, 132),
(29, 133),
(30, 134),
(31, 135),
(32, 136),
(33, 137),
(34, 138),
(35, 139),
(36, 140),
(37, 141),
(38, 142),
(39, 143),
(40, 144),
(41, 145),
(42, 146),
(43, 147),
(44, 148),
(45, 149),
(46, 150),
(47, 153),
(48, 154),
(49, 155),
(50, 156),
(51, 157),
(52, 158),
(53, 159),
(54, 160),
(55, 161),
(56, 162),
(57, 163),
(58, 164),
(59, 165),
(60, 166),
(61, 168),
(62, 169),
(63, 170),
(64, 171),
(65, 172),
(66, 173),
(67, 174),
(68, 175),
(69, 176),
(70, 177),
(71, 178),
(72, 179),
(73, 180),
(74, 181),
(75, 182),
(76, 183),
(77, 184),
(78, 185),
(79, 186),
(80, 187),
(81, 188),
(82, 189),
(83, 190),
(84, 191),
(85, 192),
(86, 193),
(87, 194),
(88, 195),
(89, 196),
(90, 197),
(91, 198),
(92, 199),
(93, 200),
(94, 201),
(95, 202),
(96, 203),
(97, 204),
(98, 205),
(99, 206),
(100, 207),
(101, 208),
(102, 209),
(103, 210),
(104, 211),
(105, 212),
(106, 213),
(107, 214),
(108, 215),
(109, 216),
(110, 217),
(111, 218),
(112, 219),
(113, 220),
(114, 221),
(115, 222),
(116, 223),
(117, 224),
(118, 225),
(119, 1),
(120, 2),
(121, 3),
(122, 4),
(123, 5),
(124, 6),
(125, 7),
(126, 8),
(127, 10),
(128, 11),
(129, 12),
(130, 13),
(131, 14),
(132, 15),
(133, 16),
(134, 17),
(135, 18),
(136, 19),
(137, 20),
(138, 21),
(139, 22),
(140, 23),
(141, 24),
(142, 25),
(143, 26),
(144, 27),
(145, 28),
(146, 29),
(147, 30),
(148, 31),
(149, 32),
(150, 33),
(151, 34),
(152, 35),
(153, 36),
(154, 37),
(155, 38),
(156, 39),
(157, 40),
(158, 41),
(159, 42),
(160, 43),
(161, 44),
(162, 45),
(163, 46),
(164, 47),
(165, 48),
(166, 49),
(167, 50),
(168, 51),
(169, 52),
(170, 53),
(171, 54),
(172, 55),
(173, 56),
(174, 57),
(175, 58),
(176, 59),
(177, 60),
(178, 61),
(179, 62),
(180, 63),
(181, 64),
(182, 65),
(183, 66),
(184, 67),
(185, 68),
(186, 69),
(187, 70),
(188, 71),
(189, 72),
(190, 73),
(191, 74),
(192, 75),
(193, 76),
(194, 77),
(195, 78),
(196, 79),
(197, 80),
(198, 81),
(199, 82),
(200, 84),
(201, 85),
(202, 86),
(203, 87),
(204, 88),
(205, 89),
(206, 90),
(207, 91),
(208, 92),
(209, 93),
(210, 94),
(211, 95),
(212, 96),
(213, 97),
(214, 98),
(215, 99),
(216, 100),
(217, 101),
(218, 102),
(219, 103),
(220, 104),
(221, 105),
(222, 106),
(223, 107),
(224, 108),
(225, 109),
(226, 110),
(227, 111),
(228, 112),
(229, 113),
(230, 114);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_configuration`
--

CREATE TABLE IF NOT EXISTS `ps_configuration` (
  `id_configuration` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_shop_group` int(11) unsigned DEFAULT NULL,
  `id_shop` int(11) unsigned DEFAULT NULL,
  `name` varchar(254) NOT NULL,
  `value` text,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_configuration`),
  KEY `name` (`name`),
  KEY `id_shop` (`id_shop`),
  KEY `id_shop_group` (`id_shop_group`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=474 ;

--
-- Volcado de datos para la tabla `ps_configuration`
--

INSERT INTO `ps_configuration` (`id_configuration`, `id_shop_group`, `id_shop`, `name`, `value`, `date_add`, `date_upd`) VALUES
(1, NULL, NULL, 'PS_LANG_DEFAULT', '1', '2015-06-22 10:29:03', '2015-06-22 10:29:03'),
(2, NULL, NULL, 'PS_VERSION_DB', '1.6.0.14', '2015-06-22 10:29:03', '2015-06-22 10:29:03'),
(3, NULL, NULL, 'PS_INSTALL_VERSION', '1.6.0.14', '2015-06-22 10:29:03', '2015-06-22 10:29:03'),
(4, NULL, NULL, 'PS_SEARCH_INDEXATION', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, NULL, NULL, 'PS_ONE_PHONE_AT_LEAST', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, NULL, NULL, 'PS_CARRIER_DEFAULT', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, NULL, NULL, 'PS_GROUP_FEATURE_ACTIVE', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, NULL, NULL, 'PS_CURRENCY_DEFAULT', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, NULL, NULL, 'PS_COUNTRY_DEFAULT', '69', '0000-00-00 00:00:00', '2015-06-22 10:29:08'),
(10, NULL, NULL, 'PS_REWRITING_SETTINGS', '1', '0000-00-00 00:00:00', '2015-06-22 10:29:08'),
(11, NULL, NULL, 'PS_ORDER_OUT_OF_STOCK', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, NULL, NULL, 'PS_LAST_QTIES', '3', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, NULL, NULL, 'PS_CART_REDIRECT', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, NULL, NULL, 'PS_CONDITIONS', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, NULL, NULL, 'PS_RECYCLABLE_PACK', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, NULL, NULL, 'PS_GIFT_WRAPPING', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, NULL, NULL, 'PS_GIFT_WRAPPING_PRICE', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, NULL, NULL, 'PS_STOCK_MANAGEMENT', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, NULL, NULL, 'PS_NAVIGATION_PIPE', '>', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, NULL, NULL, 'PS_PRODUCTS_PER_PAGE', '6', '0000-00-00 00:00:00', '2015-10-17 13:56:24'),
(21, NULL, NULL, 'PS_PURCHASE_MINIMUM', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(22, NULL, NULL, 'PS_PRODUCTS_ORDER_WAY', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, NULL, NULL, 'PS_PRODUCTS_ORDER_BY', '4', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, NULL, NULL, 'PS_DISPLAY_QTIES', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, NULL, NULL, 'PS_SHIPPING_HANDLING', '2', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(26, NULL, NULL, 'PS_SHIPPING_FREE_PRICE', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, NULL, NULL, 'PS_SHIPPING_FREE_WEIGHT', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(28, NULL, NULL, 'PS_SHIPPING_METHOD', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(29, NULL, NULL, 'PS_TAX', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(30, NULL, NULL, 'PS_SHOP_ENABLE', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(31, NULL, NULL, 'PS_NB_DAYS_NEW_PRODUCT', '200', '0000-00-00 00:00:00', '2015-10-18 20:03:50'),
(32, NULL, NULL, 'PS_SSL_ENABLED', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(33, NULL, NULL, 'PS_WEIGHT_UNIT', 'kg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(34, NULL, NULL, 'PS_BLOCK_CART_AJAX', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(35, NULL, NULL, 'PS_ORDER_RETURN', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(36, NULL, NULL, 'PS_ORDER_RETURN_NB_DAYS', '14', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(37, NULL, NULL, 'PS_MAIL_TYPE', '3', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(38, NULL, NULL, 'PS_PRODUCT_PICTURE_MAX_SIZE', '8388608', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(39, NULL, NULL, 'PS_PRODUCT_PICTURE_WIDTH', '64', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(40, NULL, NULL, 'PS_PRODUCT_PICTURE_HEIGHT', '64', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(41, NULL, NULL, 'PS_INVOICE_PREFIX', 'IN', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(42, NULL, NULL, 'PS_DELIVERY_PREFIX', 'DE', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(43, NULL, NULL, 'PS_DELIVERY_NUMBER', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(44, NULL, NULL, 'PS_INVOICE', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(45, NULL, NULL, 'PS_PASSWD_TIME_BACK', '360', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(46, NULL, NULL, 'PS_PASSWD_TIME_FRONT', '360', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(47, NULL, NULL, 'PS_DISP_UNAVAILABLE_ATTR', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(48, NULL, NULL, 'PS_SEARCH_MINWORDLEN', '3', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(49, NULL, NULL, 'PS_SEARCH_BLACKLIST', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(50, NULL, NULL, 'PS_SEARCH_WEIGHT_PNAME', '6', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(51, NULL, NULL, 'PS_SEARCH_WEIGHT_REF', '10', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(52, NULL, NULL, 'PS_SEARCH_WEIGHT_SHORTDESC', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(53, NULL, NULL, 'PS_SEARCH_WEIGHT_DESC', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(54, NULL, NULL, 'PS_SEARCH_WEIGHT_CNAME', '3', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(55, NULL, NULL, 'PS_SEARCH_WEIGHT_MNAME', '3', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(56, NULL, NULL, 'PS_SEARCH_WEIGHT_TAG', '4', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(57, NULL, NULL, 'PS_SEARCH_WEIGHT_ATTRIBUTE', '2', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(58, NULL, NULL, 'PS_SEARCH_WEIGHT_FEATURE', '2', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(59, NULL, NULL, 'PS_SEARCH_AJAX', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(60, NULL, NULL, 'PS_TIMEZONE', 'America/Bogota', '0000-00-00 00:00:00', '2015-06-22 10:29:08'),
(61, NULL, NULL, 'PS_THEME_V11', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(62, NULL, NULL, 'PRESTASTORE_LIVE', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(63, NULL, NULL, 'PS_TIN_ACTIVE', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(64, NULL, NULL, 'PS_SHOW_ALL_MODULES', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(65, NULL, NULL, 'PS_BACKUP_ALL', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(66, NULL, NULL, 'PS_1_3_UPDATE_DATE', '2011-12-27 10:20:42', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(67, NULL, NULL, 'PS_PRICE_ROUND_MODE', '2', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(68, NULL, NULL, 'PS_1_3_2_UPDATE_DATE', '2011-12-27 10:20:42', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(69, NULL, NULL, 'PS_CONDITIONS_CMS_ID', '3', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(70, NULL, NULL, 'TRACKING_DIRECT_TRAFFIC', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(71, NULL, NULL, 'PS_META_KEYWORDS', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(72, NULL, NULL, 'PS_DISPLAY_JQZOOM', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(73, NULL, NULL, 'PS_VOLUME_UNIT', 'L', '0000-00-00 00:00:00', '2015-06-22 10:29:09'),
(74, NULL, NULL, 'PS_CIPHER_ALGORITHM', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(75, NULL, NULL, 'PS_ATTRIBUTE_CATEGORY_DISPLAY', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(76, NULL, NULL, 'PS_CUSTOMER_SERVICE_FILE_UPLOAD', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(77, NULL, NULL, 'PS_CUSTOMER_SERVICE_SIGNATURE', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(78, NULL, NULL, 'PS_BLOCK_BESTSELLERS_DISPLAY', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(79, NULL, NULL, 'PS_BLOCK_NEWPRODUCTS_DISPLAY', '1', '0000-00-00 00:00:00', '2015-10-18 20:03:50'),
(80, NULL, NULL, 'PS_BLOCK_SPECIALS_DISPLAY', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(81, NULL, NULL, 'PS_STOCK_MVT_REASON_DEFAULT', '3', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(82, NULL, NULL, 'PS_COMPARATOR_MAX_ITEM', '3', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(83, NULL, NULL, 'PS_ORDER_PROCESS_TYPE', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(84, NULL, NULL, 'PS_SPECIFIC_PRICE_PRIORITIES', 'id_shop;id_currency;id_country;id_group', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(85, NULL, NULL, 'PS_TAX_DISPLAY', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(86, NULL, NULL, 'PS_SMARTY_FORCE_COMPILE', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(87, NULL, NULL, 'PS_DISTANCE_UNIT', 'km', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(88, NULL, NULL, 'PS_STORES_DISPLAY_CMS', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(89, NULL, NULL, 'PS_STORES_DISPLAY_FOOTER', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(90, NULL, NULL, 'PS_STORES_SIMPLIFIED', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(91, NULL, NULL, 'SHOP_LOGO_WIDTH', '220', '0000-00-00 00:00:00', '2015-11-12 12:24:06'),
(92, NULL, NULL, 'SHOP_LOGO_HEIGHT', '60', '0000-00-00 00:00:00', '2015-11-12 12:24:06'),
(93, NULL, NULL, 'EDITORIAL_IMAGE_WIDTH', '530', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(94, NULL, NULL, 'EDITORIAL_IMAGE_HEIGHT', '228', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(95, NULL, NULL, 'PS_STATSDATA_CUSTOMER_PAGESVIEWS', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(96, NULL, NULL, 'PS_STATSDATA_PAGESVIEWS', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(97, NULL, NULL, 'PS_STATSDATA_PLUGINS', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(98, NULL, NULL, 'PS_GEOLOCATION_ENABLED', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(99, NULL, NULL, 'PS_ALLOWED_COUNTRIES', 'AF;ZA;AX;AL;DZ;DE;AD;AO;AI;AQ;AG;AN;SA;AR;AM;AW;AU;AT;AZ;BS;BH;BD;BB;BY;BE;BZ;BJ;BM;BT;BO;BA;BW;BV;BR;BN;BG;BF;MM;BI;KY;KH;CM;CA;CV;CF;CL;CN;CX;CY;CC;CO;KM;CG;CD;CK;KR;KP;CR;CI;HR;CU;DK;DJ;DM;EG;IE;SV;AE;EC;ER;ES;EE;ET;FK;FO;FJ;FI;FR;GA;GM;GE;GS;GH;GI;GR;GD;GL;GP;GU;GT;GG;GN;GQ;GW;GY;GF;HT;HM;HN;HK;HU;IM;MU;VG;VI;IN;ID;IR;IQ;IS;IL;IT;JM;JP;JE;JO;KZ;KE;KG;KI;KW;LA;LS;LV;LB;LR;LY;LI;LT;LU;MO;MK;MG;MY;MW;MV;ML;MT;MP;MA;MH;MQ;MR;YT;MX;FM;MD;MC;MN;ME;MS;MZ;NA;NR;NP;NI;NE;NG;NU;NF;NO;NC;NZ;IO;OM;UG;UZ;PK;PW;PS;PA;PG;PY;NL;PE;PH;PN;PL;PF;PR;PT;QA;DO;CZ;RE;RO;GB;RU;RW;EH;BL;KN;SM;MF;PM;VA;VC;LC;SB;WS;AS;ST;SN;RS;SC;SL;SG;SK;SI;SO;SD;LK;SE;CH;SR;SJ;SZ;SY;TJ;TW;TZ;TD;TF;TH;TL;TG;TK;TO;TT;TN;TM;TC;TR;TV;UA;UY;US;VU;VE;VN;WF;YE;ZM;ZW', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100, NULL, NULL, 'PS_GEOLOCATION_BEHAVIOR', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(101, NULL, NULL, 'PS_LOCALE_LANGUAGE', 'es', '0000-00-00 00:00:00', '2015-06-22 10:29:08'),
(102, NULL, NULL, 'PS_LOCALE_COUNTRY', 'co', '0000-00-00 00:00:00', '2015-06-22 10:29:08'),
(103, NULL, NULL, 'PS_ATTACHMENT_MAXIMUM_SIZE', '8', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(104, NULL, NULL, 'PS_SMARTY_CACHE', '0', '0000-00-00 00:00:00', '2015-10-17 13:57:47'),
(105, NULL, NULL, 'PS_DIMENSION_UNIT', 'cm', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(106, NULL, NULL, 'PS_GUEST_CHECKOUT_ENABLED', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(107, NULL, NULL, 'PS_DISPLAY_SUPPLIERS', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(108, NULL, NULL, 'PS_DISPLAY_BEST_SELLERS', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(109, NULL, NULL, 'PS_CATALOG_MODE', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(110, NULL, NULL, 'PS_GEOLOCATION_WHITELIST', '127;209.185.108;209.185.253;209.85.238;209.85.238.11;209.85.238.4;216.239.33.96;216.239.33.97;216.239.33.98;216.239.33.99;216.239.37.98;216.239.37.99;216.239.39.98;216.239.39.99;216.239.41.96;216.239.41.97;216.239.41.98;216.239.41.99;216.239.45.4;216.239.46;216.239.51.96;216.239.51.97;216.239.51.98;216.239.51.99;216.239.53.98;216.239.53.99;216.239.57.96;91.240.109;216.239.57.97;216.239.57.98;216.239.57.99;216.239.59.98;216.239.59.99;216.33.229.163;64.233.173.193;64.233.173.194;64.233.173.195;64.233.173.196;64.233.173.197;64.233.173.198;64.233.173.199;64.233.173.200;64.233.173.201;64.233.173.202;64.233.173.203;64.233.173.204;64.233.173.205;64.233.173.206;64.233.173.207;64.233.173.208;64.233.173.209;64.233.173.210;64.233.173.211;64.233.173.212;64.233.173.213;64.233.173.214;64.233.173.215;64.233.173.216;64.233.173.217;64.233.173.218;64.233.173.219;64.233.173.220;64.233.173.221;64.233.173.222;64.233.173.223;64.233.173.224;64.233.173.225;64.233.173.226;64.233.173.227;64.233.173.228;64.233.173.229;64.233.173.230;64.233.173.231;64.233.173.232;64.233.173.233;64.233.173.234;64.233.173.235;64.233.173.236;64.233.173.237;64.233.173.238;64.233.173.239;64.233.173.240;64.233.173.241;64.233.173.242;64.233.173.243;64.233.173.244;64.233.173.245;64.233.173.246;64.233.173.247;64.233.173.248;64.233.173.249;64.233.173.250;64.233.173.251;64.233.173.252;64.233.173.253;64.233.173.254;64.233.173.255;64.68.80;64.68.81;64.68.82;64.68.83;64.68.84;64.68.85;64.68.86;64.68.87;64.68.88;64.68.89;64.68.90.1;64.68.90.10;64.68.90.11;64.68.90.12;64.68.90.129;64.68.90.13;64.68.90.130;64.68.90.131;64.68.90.132;64.68.90.133;64.68.90.134;64.68.90.135;64.68.90.136;64.68.90.137;64.68.90.138;64.68.90.139;64.68.90.14;64.68.90.140;64.68.90.141;64.68.90.142;64.68.90.143;64.68.90.144;64.68.90.145;64.68.90.146;64.68.90.147;64.68.90.148;64.68.90.149;64.68.90.15;64.68.90.150;64.68.90.151;64.68.90.152;64.68.90.153;64.68.90.154;64.68.90.155;64.68.90.156;64.68.90.157;64.68.90.158;64.68.90.159;64.68.90.16;64.68.90.160;64.68.90.161;64.68.90.162;64.68.90.163;64.68.90.164;64.68.90.165;64.68.90.166;64.68.90.167;64.68.90.168;64.68.90.169;64.68.90.17;64.68.90.170;64.68.90.171;64.68.90.172;64.68.90.173;64.68.90.174;64.68.90.175;64.68.90.176;64.68.90.177;64.68.90.178;64.68.90.179;64.68.90.18;64.68.90.180;64.68.90.181;64.68.90.182;64.68.90.183;64.68.90.184;64.68.90.185;64.68.90.186;64.68.90.187;64.68.90.188;64.68.90.189;64.68.90.19;64.68.90.190;64.68.90.191;64.68.90.192;64.68.90.193;64.68.90.194;64.68.90.195;64.68.90.196;64.68.90.197;64.68.90.198;64.68.90.199;64.68.90.2;64.68.90.20;64.68.90.200;64.68.90.201;64.68.90.202;64.68.90.203;64.68.90.204;64.68.90.205;64.68.90.206;64.68.90.207;64.68.90.208;64.68.90.21;64.68.90.22;64.68.90.23;64.68.90.24;64.68.90.25;64.68.90.26;64.68.90.27;64.68.90.28;64.68.90.29;64.68.90.3;64.68.90.30;64.68.90.31;64.68.90.32;64.68.90.33;64.68.90.34;64.68.90.35;64.68.90.36;64.68.90.37;64.68.90.38;64.68.90.39;64.68.90.4;64.68.90.40;64.68.90.41;64.68.90.42;64.68.90.43;64.68.90.44;64.68.90.45;64.68.90.46;64.68.90.47;64.68.90.48;64.68.90.49;64.68.90.5;64.68.90.50;64.68.90.51;64.68.90.52;64.68.90.53;64.68.90.54;64.68.90.55;64.68.90.56;64.68.90.57;64.68.90.58;64.68.90.59;64.68.90.6;64.68.90.60;64.68.90.61;64.68.90.62;64.68.90.63;64.68.90.64;64.68.90.65;64.68.90.66;64.68.90.67;64.68.90.68;64.68.90.69;64.68.90.7;64.68.90.70;64.68.90.71;64.68.90.72;64.68.90.73;64.68.90.74;64.68.90.75;64.68.90.76;64.68.90.77;64.68.90.78;64.68.90.79;64.68.90.8;64.68.90.80;64.68.90.9;64.68.91;64.68.92;66.249.64;66.249.65;66.249.66;66.249.67;66.249.68;66.249.69;66.249.70;66.249.71;66.249.72;66.249.73;66.249.78;66.249.79;72.14.199;8.6.48', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(111, NULL, NULL, 'PS_LOGS_BY_EMAIL', '5', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(112, NULL, NULL, 'PS_COOKIE_CHECKIP', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(113, NULL, NULL, 'PS_STORES_CENTER_LAT', '25.948969', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(114, NULL, NULL, 'PS_STORES_CENTER_LONG', '-80.226439', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(115, NULL, NULL, 'PS_USE_ECOTAX', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(116, NULL, NULL, 'PS_CANONICAL_REDIRECT', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(117, NULL, NULL, 'PS_IMG_UPDATE_TIME', '1447775150', '0000-00-00 00:00:00', '2015-11-17 10:45:50'),
(118, NULL, NULL, 'PS_BACKUP_DROP_TABLE', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(119, NULL, NULL, 'PS_OS_CHEQUE', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(120, NULL, NULL, 'PS_OS_PAYMENT', '2', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(121, NULL, NULL, 'PS_OS_PREPARATION', '3', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(122, NULL, NULL, 'PS_OS_SHIPPING', '4', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(123, NULL, NULL, 'PS_OS_DELIVERED', '5', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(124, NULL, NULL, 'PS_OS_CANCELED', '6', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(125, NULL, NULL, 'PS_OS_REFUND', '7', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(126, NULL, NULL, 'PS_OS_ERROR', '8', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(127, NULL, NULL, 'PS_OS_OUTOFSTOCK', '9', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(128, NULL, NULL, 'PS_OS_BANKWIRE', '10', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(129, NULL, NULL, 'PS_OS_PAYPAL', '11', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(130, NULL, NULL, 'PS_OS_WS_PAYMENT', '12', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(131, NULL, NULL, 'PS_OS_OUTOFSTOCK_PAID', '9', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(132, NULL, NULL, 'PS_OS_OUTOFSTOCK_UNPAID', '13', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(133, NULL, NULL, 'PS_OS_COD_VALIDATION', '14', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(134, NULL, NULL, 'PS_LEGACY_IMAGES', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(135, NULL, NULL, 'PS_IMAGE_QUALITY', 'jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(136, NULL, NULL, 'PS_PNG_QUALITY', '7', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(137, NULL, NULL, 'PS_JPEG_QUALITY', '90', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(138, NULL, NULL, 'PS_COOKIE_LIFETIME_FO', '480', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(139, NULL, NULL, 'PS_COOKIE_LIFETIME_BO', '480', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(140, NULL, NULL, 'PS_RESTRICT_DELIVERED_COUNTRIES', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(141, NULL, NULL, 'PS_SHOW_NEW_ORDERS', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(142, NULL, NULL, 'PS_SHOW_NEW_CUSTOMERS', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(143, NULL, NULL, 'PS_SHOW_NEW_MESSAGES', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(144, NULL, NULL, 'PS_FEATURE_FEATURE_ACTIVE', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(145, NULL, NULL, 'PS_COMBINATION_FEATURE_ACTIVE', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(146, NULL, NULL, 'PS_SPECIFIC_PRICE_FEATURE_ACTIVE', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(147, NULL, NULL, 'PS_SCENE_FEATURE_ACTIVE', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(148, NULL, NULL, 'PS_VIRTUAL_PROD_FEATURE_ACTIVE', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(149, NULL, NULL, 'PS_CUSTOMIZATION_FEATURE_ACTIVE', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(150, NULL, NULL, 'PS_CART_RULE_FEATURE_ACTIVE', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(151, NULL, NULL, 'PS_PACK_FEATURE_ACTIVE', NULL, '0000-00-00 00:00:00', '2015-11-17 17:44:30'),
(152, NULL, NULL, 'PS_ALIAS_FEATURE_ACTIVE', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(153, NULL, NULL, 'PS_TAX_ADDRESS_TYPE', 'id_address_delivery', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(154, NULL, NULL, 'PS_SHOP_DEFAULT', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(155, NULL, NULL, 'PS_CARRIER_DEFAULT_SORT', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(156, NULL, NULL, 'PS_STOCK_MVT_INC_REASON_DEFAULT', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(157, NULL, NULL, 'PS_STOCK_MVT_DEC_REASON_DEFAULT', '2', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(158, NULL, NULL, 'PS_ADVANCED_STOCK_MANAGEMENT', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(159, NULL, NULL, 'PS_ADMINREFRESH_NOTIFICATION', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(160, NULL, NULL, 'PS_STOCK_MVT_TRANSFER_TO', '7', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(161, NULL, NULL, 'PS_STOCK_MVT_TRANSFER_FROM', '6', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(162, NULL, NULL, 'PS_CARRIER_DEFAULT_ORDER', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(163, NULL, NULL, 'PS_STOCK_MVT_SUPPLY_ORDER', '8', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(164, NULL, NULL, 'PS_STOCK_CUSTOMER_ORDER_REASON', '3', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(165, NULL, NULL, 'PS_UNIDENTIFIED_GROUP', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(166, NULL, NULL, 'PS_GUEST_GROUP', '2', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(167, NULL, NULL, 'PS_CUSTOMER_GROUP', '3', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(168, NULL, NULL, 'PS_SMARTY_CONSOLE', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(169, NULL, NULL, 'PS_INVOICE_MODEL', 'invoice', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(170, NULL, NULL, 'PS_LIMIT_UPLOAD_IMAGE_VALUE', '2', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(171, NULL, NULL, 'PS_LIMIT_UPLOAD_FILE_VALUE', '2', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(172, NULL, NULL, 'MB_PAY_TO_EMAIL', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(173, NULL, NULL, 'MB_SECRET_WORD', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(174, NULL, NULL, 'MB_HIDE_LOGIN', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(175, NULL, NULL, 'MB_ID_LOGO', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(176, NULL, NULL, 'MB_ID_LOGO_WALLET', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(177, NULL, NULL, 'MB_PARAMETERS', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(178, NULL, NULL, 'MB_PARAMETERS_2', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(179, NULL, NULL, 'MB_DISPLAY_MODE', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(180, NULL, NULL, 'MB_CANCEL_URL', 'http://www.yoursite.com', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(181, NULL, NULL, 'MB_LOCAL_METHODS', '2', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(182, NULL, NULL, 'MB_INTER_METHODS', '5', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(183, NULL, NULL, 'BANK_WIRE_CURRENCIES', '2,1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(184, NULL, NULL, 'CHEQUE_CURRENCIES', '2,1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(185, NULL, NULL, 'PRODUCTS_VIEWED_NBR', '4', '0000-00-00 00:00:00', '2015-11-17 10:53:10'),
(186, NULL, NULL, 'BLOCK_CATEG_DHTML', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(187, NULL, NULL, 'BLOCK_CATEG_MAX_DEPTH', '4', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(188, NULL, NULL, 'MANUFACTURER_DISPLAY_FORM', '1', '0000-00-00 00:00:00', '2015-06-22 10:29:18'),
(189, NULL, NULL, 'MANUFACTURER_DISPLAY_TEXT', '1', '0000-00-00 00:00:00', '2015-06-22 10:29:18'),
(190, NULL, NULL, 'MANUFACTURER_DISPLAY_TEXT_NB', '5', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(191, NULL, NULL, 'NEW_PRODUCTS_NBR', '4', '0000-00-00 00:00:00', '2015-10-18 20:03:24'),
(192, NULL, NULL, 'PS_TOKEN_ENABLE', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(193, NULL, NULL, 'PS_STATS_RENDER', 'graphnvd3', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(194, NULL, NULL, 'PS_STATS_OLD_CONNECT_AUTO_CLEAN', 'never', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(195, NULL, NULL, 'PS_STATS_GRID_RENDER', 'gridhtml', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(196, NULL, NULL, 'BLOCKTAGS_NBR', '10', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(197, NULL, NULL, 'CHECKUP_DESCRIPTIONS_LT', '100', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(198, NULL, NULL, 'CHECKUP_DESCRIPTIONS_GT', '400', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(199, NULL, NULL, 'CHECKUP_IMAGES_LT', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(200, NULL, NULL, 'CHECKUP_IMAGES_GT', '2', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(201, NULL, NULL, 'CHECKUP_SALES_LT', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(202, NULL, NULL, 'CHECKUP_SALES_GT', '2', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(203, NULL, NULL, 'CHECKUP_STOCK_LT', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(204, NULL, NULL, 'CHECKUP_STOCK_GT', '3', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(205, NULL, NULL, 'FOOTER_CMS', '0_3|0_4', '0000-00-00 00:00:00', '2015-06-22 10:29:18'),
(206, NULL, NULL, 'FOOTER_BLOCK_ACTIVATION', '0_3|0_4', '0000-00-00 00:00:00', '2015-06-22 10:29:18'),
(207, NULL, NULL, 'FOOTER_POWEREDBY', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(208, NULL, NULL, 'BLOCKADVERT_LINK', 'http://www.prestashop.com', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(209, NULL, NULL, 'BLOCKSTORE_IMG', 'store.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(210, NULL, NULL, 'BLOCKADVERT_IMG_EXT', 'jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(216, NULL, NULL, 'BLOCKCONTACTINFOS_COMPANY', 'My Company', '0000-00-00 00:00:00', '2015-06-22 10:29:18'),
(217, NULL, NULL, 'BLOCKCONTACTINFOS_ADDRESS', '42 avenue des Champs Elysées\n75000 Paris\nFrance', '0000-00-00 00:00:00', '2015-06-22 10:29:18'),
(218, NULL, NULL, 'BLOCKCONTACTINFOS_PHONE', '0123-456-789', '0000-00-00 00:00:00', '2015-06-22 10:29:18'),
(219, NULL, NULL, 'BLOCKCONTACTINFOS_EMAIL', 'sales@yourcompany.com', '0000-00-00 00:00:00', '2015-06-22 10:29:18'),
(220, NULL, NULL, 'BLOCKCONTACT_TELNUMBER', '0123-456-789', '0000-00-00 00:00:00', '2015-06-22 10:29:18'),
(221, NULL, NULL, 'BLOCKCONTACT_EMAIL', 'sales@yourcompany.com', '0000-00-00 00:00:00', '2015-06-22 10:29:18'),
(222, NULL, NULL, 'SUPPLIER_DISPLAY_TEXT', '1', '0000-00-00 00:00:00', '2015-06-22 10:29:19'),
(223, NULL, NULL, 'SUPPLIER_DISPLAY_TEXT_NB', '5', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(224, NULL, NULL, 'SUPPLIER_DISPLAY_FORM', '1', '0000-00-00 00:00:00', '2015-06-22 10:29:19'),
(225, NULL, NULL, 'BLOCK_CATEG_NBR_COLUMN_FOOTER', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(226, NULL, NULL, 'UPGRADER_BACKUPDB_FILENAME', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(227, NULL, NULL, 'UPGRADER_BACKUPFILES_FILENAME', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(228, NULL, NULL, 'BLOCKREINSURANCE_NBBLOCKS', '5', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(233, NULL, NULL, 'PS_BASE_DISTANCE_UNIT', 'm', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(234, NULL, NULL, 'PS_SHOP_DOMAIN', 'www.matisses.co', '0000-00-00 00:00:00', '2015-06-22 10:29:08'),
(235, NULL, NULL, 'PS_SHOP_DOMAIN_SSL', 'www.matisses.co', '0000-00-00 00:00:00', '2015-06-22 10:29:08'),
(236, NULL, NULL, 'PS_SHOP_NAME', 'MATISSES', '0000-00-00 00:00:00', '2015-06-22 10:29:08'),
(237, NULL, NULL, 'PS_SHOP_EMAIL', 'sebastian.castano@arkix.com', '0000-00-00 00:00:00', '2015-06-22 10:29:12'),
(238, NULL, NULL, 'PS_MAIL_METHOD', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(239, NULL, NULL, 'PS_SHOP_ACTIVITY', '0', '0000-00-00 00:00:00', '2015-06-22 10:29:08'),
(240, NULL, NULL, 'PS_LOGO', 'logo.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(241, NULL, NULL, 'PS_FAVICON', 'favicon.ico', '0000-00-00 00:00:00', '2015-11-13 12:18:43'),
(242, NULL, NULL, 'PS_STORES_ICON', 'logo_stores.gif', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(243, NULL, NULL, 'PS_ROOT_CATEGORY', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(244, NULL, NULL, 'PS_HOME_CATEGORY', '2', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(245, NULL, NULL, 'PS_CONFIGURATION_AGREMENT', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(246, NULL, NULL, 'PS_MAIL_SERVER', 'smtp.', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(247, NULL, NULL, 'PS_MAIL_USER', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(248, NULL, NULL, 'PS_MAIL_PASSWD', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(249, NULL, NULL, 'PS_MAIL_SMTP_ENCRYPTION', 'off', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(250, NULL, NULL, 'PS_MAIL_SMTP_PORT', '25', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(251, NULL, NULL, 'PS_MAIL_COLOR', '#db3484', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(252, NULL, NULL, 'NW_SALT', 'rDydLAMK41pWbXpp', '0000-00-00 00:00:00', '2015-10-19 18:03:02'),
(253, NULL, NULL, 'PS_PAYMENT_LOGO_CMS_ID', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(254, NULL, NULL, 'HOME_FEATURED_NBR', '8', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(255, NULL, NULL, 'SEK_MIN_OCCURENCES', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(256, NULL, NULL, 'SEK_FILTER_KW', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(257, NULL, NULL, 'PS_ALLOW_MOBILE_DEVICE', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(258, NULL, NULL, 'PS_CUSTOMER_CREATION_EMAIL', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(259, NULL, NULL, 'PS_SMARTY_CONSOLE_KEY', 'SMARTY_DEBUG', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(260, NULL, NULL, 'PS_DASHBOARD_USE_PUSH', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(261, NULL, NULL, 'PS_ATTRIBUTE_ANCHOR_SEPARATOR', '-', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(262, NULL, NULL, 'CONF_AVERAGE_PRODUCT_MARGIN', '40', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(263, NULL, NULL, 'PS_DASHBOARD_SIMULATION', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(264, NULL, NULL, 'PS_QUICK_VIEW', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(265, NULL, NULL, 'PS_USE_HTMLPURIFIER', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(266, NULL, NULL, 'PS_SMARTY_CACHING_TYPE', 'filesystem', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(267, NULL, NULL, 'PS_SMARTY_CLEAR_CACHE', 'everytime', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(268, NULL, NULL, 'PS_DETECT_LANG', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(269, NULL, NULL, 'PS_DETECT_COUNTRY', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(270, NULL, NULL, 'PS_ROUND_TYPE', '2', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(271, NULL, NULL, 'PS_PRICE_DISPLAY_PRECISION', '2', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(272, NULL, NULL, 'PS_LOG_EMAILS', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(273, NULL, NULL, 'PS_CUSTOMER_NWSL', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(274, NULL, NULL, 'PS_CUSTOMER_OPTIN', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(275, NULL, NULL, 'PS_PACK_STOCK_TYPE', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(276, NULL, NULL, 'PS_SC_TWITTER', '1', '2015-06-22 10:29:17', '2015-06-22 10:29:17'),
(277, NULL, NULL, 'PS_SC_FACEBOOK', '1', '2015-06-22 10:29:17', '2015-06-22 10:29:17'),
(278, NULL, NULL, 'PS_SC_GOOGLE', '0', '2015-06-22 10:29:17', '2015-11-12 16:04:26'),
(279, NULL, NULL, 'PS_SC_PINTEREST', '1', '2015-06-22 10:29:17', '2015-06-22 10:29:17'),
(280, NULL, NULL, 'BLOCKBANNER_IMG', NULL, '2015-06-22 10:29:17', '2015-06-22 10:29:17'),
(281, NULL, NULL, 'BLOCKBANNER_LINK', NULL, '2015-06-22 10:29:17', '2015-06-22 10:29:17'),
(282, NULL, NULL, 'BLOCKBANNER_DESC', NULL, '2015-06-22 10:29:17', '2015-06-22 10:29:17'),
(283, NULL, NULL, 'CONF_BANKWIRE_FIXED', '0.2', '2015-06-22 10:29:18', '2015-06-22 10:29:18'),
(284, NULL, NULL, 'CONF_BANKWIRE_VAR', '2', '2015-06-22 10:29:18', '2015-06-22 10:29:18'),
(285, NULL, NULL, 'CONF_BANKWIRE_FIXED_FOREIGN', '0.2', '2015-06-22 10:29:18', '2015-06-22 10:29:18'),
(286, NULL, NULL, 'CONF_BANKWIRE_VAR_FOREIGN', '2', '2015-06-22 10:29:18', '2015-06-22 10:29:18'),
(287, NULL, NULL, 'PS_BLOCK_BESTSELLERS_TO_DISPLAY', '10', '2015-06-22 10:29:18', '2015-06-22 10:29:18'),
(288, NULL, NULL, 'PS_BLOCK_CART_XSELL_LIMIT', '12', '2015-06-22 10:29:18', '2015-06-22 10:29:18'),
(289, NULL, NULL, 'PS_BLOCK_CART_SHOW_CROSSSELLING', '1', '2015-06-22 10:29:18', '2015-06-22 10:29:18'),
(295, NULL, NULL, 'BLOCK_CATEG_ROOT_CATEGORY', '1', '2015-06-22 10:29:18', '2015-06-22 10:29:18'),
(296, NULL, NULL, 'blockfacebook_url', 'https://www.facebook.com/prestashop', '2015-06-22 10:29:18', '2015-06-22 10:29:18'),
(297, NULL, NULL, 'PS_LAYERED_HIDE_0_VALUES', '1', '2015-06-22 10:29:18', '2015-06-22 10:29:18'),
(298, NULL, NULL, 'PS_LAYERED_SHOW_QTIES', '1', '2015-06-22 10:29:18', '2015-06-22 10:29:18'),
(299, NULL, NULL, 'PS_LAYERED_FULL_TREE', '1', '2015-06-22 10:29:18', '2015-06-22 10:29:18'),
(300, NULL, NULL, 'PS_LAYERED_FILTER_PRICE_USETAX', '1', '2015-06-22 10:29:18', '2015-06-22 10:29:18'),
(301, NULL, NULL, 'PS_LAYERED_FILTER_CATEGORY_DEPTH', '1', '2015-06-22 10:29:18', '2015-06-22 10:29:18'),
(302, NULL, NULL, 'PS_LAYERED_FILTER_INDEX_QTY', '0', '2015-06-22 10:29:18', '2015-06-22 10:29:18'),
(303, NULL, NULL, 'PS_LAYERED_FILTER_INDEX_CDT', '0', '2015-06-22 10:29:18', '2015-06-22 10:29:18'),
(304, NULL, NULL, 'PS_LAYERED_FILTER_INDEX_MNF', '0', '2015-06-22 10:29:18', '2015-06-22 10:29:18'),
(305, NULL, NULL, 'PS_LAYERED_FILTER_INDEX_CAT', '0', '2015-06-22 10:29:18', '2015-06-22 10:29:18'),
(306, NULL, NULL, 'PS_LAYERED_INDEXED', '1', '2015-06-22 10:29:18', '2015-06-22 10:29:18'),
(307, NULL, NULL, 'FOOTER_PRICE-DROP', '1', '2015-06-22 10:29:18', '2015-06-22 10:29:18'),
(308, NULL, NULL, 'FOOTER_NEW-PRODUCTS', '1', '2015-06-22 10:29:18', '2015-06-22 10:29:18'),
(309, NULL, NULL, 'FOOTER_BEST-SALES', '1', '2015-06-22 10:29:18', '2015-06-22 10:29:18'),
(310, NULL, NULL, 'FOOTER_CONTACT', '1', '2015-06-22 10:29:18', '2015-06-22 10:29:18'),
(311, NULL, NULL, 'FOOTER_SITEMAP', '1', '2015-06-22 10:29:18', '2015-06-22 10:29:18'),
(312, NULL, NULL, 'BLOCKSPECIALS_NB_CACHES', '20', '2015-06-22 10:29:19', '2015-06-22 10:29:19'),
(313, NULL, NULL, 'BLOCKSPECIALS_SPECIALS_NBR', '5', '2015-06-22 10:29:19', '2015-06-22 10:29:19'),
(314, NULL, NULL, 'BLOCKTAGS_MAX_LEVEL', '3', '2015-06-22 10:29:19', '2015-06-22 10:29:19'),
(315, NULL, NULL, 'CONF_CHEQUE_FIXED', '0.2', '2015-06-22 10:29:19', '2015-06-22 10:29:19'),
(316, NULL, NULL, 'CONF_CHEQUE_VAR', '2', '2015-06-22 10:29:19', '2015-06-22 10:29:19'),
(317, NULL, NULL, 'CONF_CHEQUE_FIXED_FOREIGN', '0.2', '2015-06-22 10:29:19', '2015-06-22 10:29:19'),
(318, NULL, NULL, 'CONF_CHEQUE_VAR_FOREIGN', '2', '2015-06-22 10:29:19', '2015-06-22 10:29:19'),
(319, NULL, NULL, 'DASHACTIVITY_CART_ACTIVE', '30', '2015-06-22 10:29:19', '2015-06-22 10:29:19'),
(320, NULL, NULL, 'DASHACTIVITY_CART_ABANDONED_MIN', '24', '2015-06-22 10:29:19', '2015-06-22 10:29:19'),
(321, NULL, NULL, 'DASHACTIVITY_CART_ABANDONED_MAX', '48', '2015-06-22 10:29:19', '2015-06-22 10:29:19'),
(322, NULL, NULL, 'DASHACTIVITY_VISITOR_ONLINE', '30', '2015-06-22 10:29:19', '2015-06-22 10:29:19'),
(323, NULL, NULL, 'PS_DASHGOALS_CURRENT_YEAR', '2015', '2015-06-22 10:29:19', '2015-06-22 10:29:19'),
(324, NULL, NULL, 'DASHGOALS_TRAFFIC_01_2015', '600', '2015-06-22 10:29:19', '2015-06-22 10:29:19'),
(325, NULL, NULL, 'DASHGOALS_CONVERSION_01_2015', '2', '2015-06-22 10:29:19', '2015-06-22 10:29:19'),
(326, NULL, NULL, 'DASHGOALS_AVG_CART_VALUE_01_2015', '80', '2015-06-22 10:29:19', '2015-06-22 10:29:19'),
(327, NULL, NULL, 'DASHGOALS_TRAFFIC_02_2015', '600', '2015-06-22 10:29:19', '2015-06-22 10:29:19'),
(328, NULL, NULL, 'DASHGOALS_CONVERSION_02_2015', '2', '2015-06-22 10:29:19', '2015-06-22 10:29:19'),
(329, NULL, NULL, 'DASHGOALS_AVG_CART_VALUE_02_2015', '80', '2015-06-22 10:29:19', '2015-06-22 10:29:19'),
(330, NULL, NULL, 'DASHGOALS_TRAFFIC_03_2015', '600', '2015-06-22 10:29:19', '2015-06-22 10:29:19'),
(331, NULL, NULL, 'DASHGOALS_CONVERSION_03_2015', '2', '2015-06-22 10:29:19', '2015-06-22 10:29:19'),
(332, NULL, NULL, 'DASHGOALS_AVG_CART_VALUE_03_2015', '80', '2015-06-22 10:29:19', '2015-06-22 10:29:19'),
(333, NULL, NULL, 'DASHGOALS_TRAFFIC_04_2015', '600', '2015-06-22 10:29:19', '2015-06-22 10:29:19'),
(334, NULL, NULL, 'DASHGOALS_CONVERSION_04_2015', '2', '2015-06-22 10:29:19', '2015-06-22 10:29:19'),
(335, NULL, NULL, 'DASHGOALS_AVG_CART_VALUE_04_2015', '80', '2015-06-22 10:29:19', '2015-06-22 10:29:19'),
(336, NULL, NULL, 'DASHGOALS_TRAFFIC_05_2015', '600', '2015-06-22 10:29:19', '2015-06-22 10:29:19'),
(337, NULL, NULL, 'DASHGOALS_CONVERSION_05_2015', '2', '2015-06-22 10:29:19', '2015-06-22 10:29:19'),
(338, NULL, NULL, 'DASHGOALS_AVG_CART_VALUE_05_2015', '80', '2015-06-22 10:29:19', '2015-06-22 10:29:19'),
(339, NULL, NULL, 'DASHGOALS_TRAFFIC_06_2015', '600', '2015-06-22 10:29:19', '2015-06-22 10:29:19'),
(340, NULL, NULL, 'DASHGOALS_CONVERSION_06_2015', '2', '2015-06-22 10:29:19', '2015-06-22 10:29:19'),
(341, NULL, NULL, 'DASHGOALS_AVG_CART_VALUE_06_2015', '80', '2015-06-22 10:29:19', '2015-06-22 10:29:19'),
(342, NULL, NULL, 'DASHGOALS_TRAFFIC_07_2015', '600', '2015-06-22 10:29:19', '2015-06-22 10:29:19'),
(343, NULL, NULL, 'DASHGOALS_CONVERSION_07_2015', '2', '2015-06-22 10:29:19', '2015-06-22 10:29:19'),
(344, NULL, NULL, 'DASHGOALS_AVG_CART_VALUE_07_2015', '80', '2015-06-22 10:29:19', '2015-06-22 10:29:19'),
(345, NULL, NULL, 'DASHGOALS_TRAFFIC_08_2015', '600', '2015-06-22 10:29:19', '2015-06-22 10:29:19'),
(346, NULL, NULL, 'DASHGOALS_CONVERSION_08_2015', '2', '2015-06-22 10:29:19', '2015-06-22 10:29:19'),
(347, NULL, NULL, 'DASHGOALS_AVG_CART_VALUE_08_2015', '80', '2015-06-22 10:29:19', '2015-06-22 10:29:19'),
(348, NULL, NULL, 'DASHGOALS_TRAFFIC_09_2015', '600', '2015-06-22 10:29:19', '2015-06-22 10:29:19'),
(349, NULL, NULL, 'DASHGOALS_CONVERSION_09_2015', '2', '2015-06-22 10:29:19', '2015-06-22 10:29:19'),
(350, NULL, NULL, 'DASHGOALS_AVG_CART_VALUE_09_2015', '80', '2015-06-22 10:29:19', '2015-06-22 10:29:19'),
(351, NULL, NULL, 'DASHGOALS_TRAFFIC_10_2015', '600', '2015-06-22 10:29:19', '2015-06-22 10:29:19'),
(352, NULL, NULL, 'DASHGOALS_CONVERSION_10_2015', '2', '2015-06-22 10:29:19', '2015-06-22 10:29:19'),
(353, NULL, NULL, 'DASHGOALS_AVG_CART_VALUE_10_2015', '80', '2015-06-22 10:29:19', '2015-06-22 10:29:19'),
(354, NULL, NULL, 'DASHGOALS_TRAFFIC_11_2015', '600', '2015-06-22 10:29:19', '2015-06-22 10:29:19'),
(355, NULL, NULL, 'DASHGOALS_CONVERSION_11_2015', '2', '2015-06-22 10:29:19', '2015-06-22 10:29:19'),
(356, NULL, NULL, 'DASHGOALS_AVG_CART_VALUE_11_2015', '80', '2015-06-22 10:29:19', '2015-06-22 10:29:19'),
(357, NULL, NULL, 'DASHGOALS_TRAFFIC_12_2015', '600', '2015-06-22 10:29:19', '2015-06-22 10:29:19'),
(358, NULL, NULL, 'DASHGOALS_CONVERSION_12_2015', '2', '2015-06-22 10:29:19', '2015-06-22 10:29:19'),
(359, NULL, NULL, 'DASHGOALS_AVG_CART_VALUE_12_2015', '80', '2015-06-22 10:29:19', '2015-06-22 10:29:19'),
(360, NULL, NULL, 'DASHPRODUCT_NBR_SHOW_LAST_ORDER', '10', '2015-06-22 10:29:19', '2015-06-22 10:29:19'),
(361, NULL, NULL, 'DASHPRODUCT_NBR_SHOW_BEST_SELLER', '10', '2015-06-22 10:29:19', '2015-06-22 10:29:19'),
(362, NULL, NULL, 'DASHPRODUCT_NBR_SHOW_MOST_VIEWED', '10', '2015-06-22 10:29:19', '2015-06-22 10:29:19'),
(363, NULL, NULL, 'DASHPRODUCT_NBR_SHOW_TOP_SEARCH', '10', '2015-06-22 10:29:19', '2015-06-22 10:29:19'),
(364, NULL, NULL, 'HOME_FEATURED_CAT', '2', '2015-06-22 10:29:19', '2015-06-22 10:29:19'),
(365, NULL, NULL, 'PRODUCTPAYMENTLOGOS_IMG', 'payment-logo.png', '2015-06-22 10:29:19', '2015-06-22 10:29:19'),
(366, NULL, NULL, 'PRODUCTPAYMENTLOGOS_LINK', NULL, '2015-06-22 10:29:19', '2015-06-22 10:29:19'),
(367, NULL, NULL, 'PRODUCTPAYMENTLOGOS_TITLE', NULL, '2015-06-22 10:29:19', '2015-06-22 10:29:19'),
(368, NULL, NULL, 'PS_TC_THEMES', 'a:9:{i:0;s:6:"theme1";i:1;s:6:"theme2";i:2;s:6:"theme3";i:3;s:6:"theme4";i:4;s:6:"theme5";i:5;s:6:"theme6";i:6;s:6:"theme7";i:7;s:6:"theme8";i:8;s:6:"theme9";}', '2015-06-22 10:29:20', '2015-06-22 10:29:20'),
(369, NULL, NULL, 'PS_TC_FONTS', 'a:10:{s:5:"font1";s:9:"Open Sans";s:5:"font2";s:12:"Josefin Slab";s:5:"font3";s:4:"Arvo";s:5:"font4";s:4:"Lato";s:5:"font5";s:7:"Volkorn";s:5:"font6";s:13:"Abril Fatface";s:5:"font7";s:6:"Ubuntu";s:5:"font8";s:7:"PT Sans";s:5:"font9";s:15:"Old Standard TT";s:6:"font10";s:10:"Droid Sans";}', '2015-06-22 10:29:20', '2015-06-22 10:29:20'),
(370, NULL, NULL, 'PS_TC_THEME', NULL, '2015-06-22 10:29:20', '2015-06-22 10:29:20'),
(371, NULL, NULL, 'PS_TC_FONT', NULL, '2015-06-22 10:29:20', '2015-06-22 10:29:20'),
(372, NULL, NULL, 'PS_TC_ACTIVE', '1', '2015-06-22 10:29:20', '2015-06-22 10:29:20'),
(373, NULL, NULL, 'PS_SET_DISPLAY_SUBCATEGORIES', '1', '2015-06-22 10:29:20', '2015-06-22 10:29:20'),
(374, NULL, NULL, 'GF_INSTALL_CALC', '1', '2015-06-22 10:29:34', '2015-10-17 13:29:47'),
(375, NULL, NULL, 'GF_CURRENT_LEVEL', '1', '2015-06-22 10:29:34', '2015-06-22 10:29:34'),
(376, NULL, NULL, 'GF_CURRENT_LEVEL_PERCENT', '80', '2015-06-22 10:29:34', '2015-11-17 17:10:20'),
(377, NULL, NULL, 'GF_NOTIFICATION', '2', '2015-06-22 10:29:34', '2015-11-17 17:10:20'),
(378, NULL, NULL, 'PRODUCT_COMMENTS_MINIMAL_TIME', '30', '2015-06-22 10:29:34', '2015-06-22 10:29:34'),
(379, NULL, NULL, 'PRODUCT_COMMENTS_ALLOW_GUESTS', '0', '2015-06-22 10:29:34', '2015-06-22 10:29:34'),
(380, NULL, NULL, 'PRODUCT_COMMENTS_MODERATE', '1', '2015-06-22 10:29:34', '2015-06-22 10:29:34'),
(381, NULL, NULL, 'CRONJOBS_ADMIN_DIR', '9f716a9895c8a89594d33ba535f0e73d', '2015-06-22 10:29:34', '2015-10-17 13:29:13'),
(382, NULL, NULL, 'CRONJOBS_MODE', 'webservice', '2015-06-22 10:29:34', '2015-06-22 10:29:34'),
(383, NULL, NULL, 'CRONJOBS_MODULE_VERSION', '1.2.7', '2015-06-22 10:29:34', '2015-06-22 10:29:34'),
(384, NULL, NULL, 'CRONJOBS_WEBSERVICE_ID', '0', '2015-06-22 10:29:34', '2015-06-22 10:29:34'),
(385, NULL, NULL, 'CRONJOBS_EXECUTION_TOKEN', 'cfb59a9b4baf2d4adc61a9c3bf1fa912', '2015-06-22 10:29:34', '2015-06-22 10:29:34'),
(386, NULL, NULL, 'PS_ONBOARDING_CURRENT_STEP', '0', '2015-06-22 10:29:46', '2015-06-22 10:29:46'),
(387, NULL, NULL, 'PS_ONBOARDING_LAST_VALIDATE_STEP', '0', '2015-06-22 10:29:46', '2015-06-22 10:29:46'),
(388, NULL, NULL, 'PS_ONBOARDING_STEP_1_COMPLETED', '0', '2015-06-22 10:29:46', '2015-06-22 10:29:46'),
(389, NULL, NULL, 'PS_ONBOARDING_STEP_2_COMPLETED', '0', '2015-06-22 10:29:46', '2015-06-22 10:29:46'),
(390, NULL, NULL, 'PS_ONBOARDING_STEP_3_COMPLETED', '0', '2015-06-22 10:29:46', '2015-06-22 10:29:46'),
(391, NULL, NULL, 'PS_ONBOARDING_STEP_4_COMPLETED', '0', '2015-06-22 10:29:46', '2015-06-22 10:29:46'),
(392, NULL, NULL, 'GF_NOT_VIEWED_BADGE', '197', '2015-10-17 13:29:48', '2015-11-17 17:10:20'),
(393, NULL, NULL, 'PROBLOCKSOCIAL_FACEBOOK', 'https://ru-ru.facebook.com/prestapro.ru', '2015-10-17 13:56:21', '2015-10-17 13:56:21'),
(394, NULL, NULL, 'PROBLOCKSOCIAL_TWITTER', 'https://twitter.com/Prestapro', '2015-10-17 13:56:21', '2015-10-17 13:56:21'),
(395, NULL, NULL, 'PROBLOCKSOCIAL_RSS', NULL, '2015-10-17 13:56:21', '2015-10-17 13:56:21'),
(396, NULL, NULL, 'PROBLOCKSOCIAL_YOUTUBE', 'http://www.youtube.com/user/ThePrestaPro', '2015-10-17 13:56:21', '2015-10-17 13:56:21'),
(397, NULL, NULL, 'PROBLOCKSOCIAL_GOOGLE_PLUS', 'https://plus.google.com/+AlexsandrPrestaProRu/posts', '2015-10-17 13:56:21', '2015-10-17 13:56:21'),
(398, NULL, NULL, 'PROBLOCKSOCIAL_PINTEREST', NULL, '2015-10-17 13:56:21', '2015-10-17 13:56:21'),
(399, NULL, NULL, 'PROBLOCKSOCIAL_VIMEO', 'https://vimeo.com/prestapro', '2015-10-17 13:56:21', '2015-10-17 13:56:21'),
(400, NULL, NULL, 'DI_END', '0000-00-00 00:00:00', '2015-10-17 13:56:21', '2015-10-17 13:56:21'),
(401, NULL, NULL, 'TWA_SETTINGS_CONTROLLER', '{"num":10,"displayType":2,"orderby":2}', '2015-10-17 13:56:22', '2015-10-17 13:56:22'),
(402, NULL, NULL, 'TWA_SETTINGS_DISPLAYHOME', '{"active":1,"num":5,"displayType":1,"orderby":1}', '2015-10-17 13:56:22', '2015-10-17 13:56:22'),
(403, NULL, NULL, 'TWA_SETTINGS_DISPLAYLEFTCOLUMN', '[]', '2015-10-17 13:56:22', '2015-10-17 13:56:22'),
(404, NULL, NULL, 'TWA_SETTINGS_DISPLAYRIGHTCOLUMN', '[]', '2015-10-17 13:56:22', '2015-10-17 13:56:22'),
(405, NULL, NULL, 'TWA_SETTINGS_TESTIMONIALS1', '[]', '2015-10-17 13:56:22', '2015-10-17 13:56:22'),
(406, NULL, NULL, 'TWA_SETTINGS_TESTIMONIALS2', '[]', '2015-10-17 13:56:22', '2015-10-17 13:56:22'),
(407, NULL, NULL, 'TWA_SETTINGS_TESTIMONIALS3', '[]', '2015-10-17 13:56:22', '2015-10-17 13:56:22'),
(408, NULL, NULL, 'TWA_GENERAL_SETTINGS', '{"slug":"testimonials","notif_email":"sebastian.castano@arkix.com","rating_num":5,"rating_class":"star","max_chars":1000,"ip_interval":86400,"load_owl":0,"allow_html":1,"instant_publish":1}', '2015-10-17 13:56:22', '2015-10-17 13:56:22'),
(409, NULL, NULL, 'EC_LOAD_OWL', '0', '2015-10-17 13:56:22', '2015-10-17 13:56:22'),
(410, NULL, NULL, 'PROBLOCKCONTACTINFOS_COMPANY', 'MATISSES', '2015-10-17 13:56:23', '2015-10-17 13:56:23'),
(411, NULL, NULL, 'PROBLOCKCONTACTINFOS_ADDRESS', NULL, '2015-10-17 13:56:23', '2015-10-17 13:56:23'),
(412, NULL, NULL, 'PROBLOCKCONTACTINFOS_PHONE', NULL, '2015-10-17 13:56:23', '2015-10-17 13:56:23'),
(413, NULL, NULL, 'PROBLOCKCONTACTINFOS_PHONE_2', NULL, '2015-10-17 13:56:23', '2015-10-17 13:56:23'),
(414, NULL, NULL, 'PROBLOCKCONTACTINFOS_EMAIL', 'sebastian.castano@arkix.com', '2015-10-17 13:56:23', '2015-10-17 13:56:23'),
(415, NULL, NULL, 'PLLB_URL', 'prestapro.ru', '2015-10-17 13:56:23', '2015-10-17 13:56:23'),
(416, NULL, NULL, 'PLLB_TITLE', 'Facebook', '2015-10-17 13:56:23', '2015-10-17 13:56:23'),
(417, NULL, NULL, 'PLLB_FACES', '1', '2015-10-17 13:56:23', '2015-10-17 13:56:23'),
(418, NULL, NULL, 'PLLB_COMPANY_NAME', '0', '2015-10-17 13:56:23', '2015-10-17 13:56:23'),
(419, NULL, NULL, 'PLLB_COMPANY_LOGO', '0', '2015-10-17 13:56:23', '2015-10-17 13:56:23'),
(420, NULL, NULL, 'PLLB_NUM', '8', '2015-10-17 13:56:23', '2015-10-17 13:56:23'),
(421, NULL, NULL, 'TWITTLOGIN', 'prestashop', '2015-10-17 13:56:24', '2015-10-17 13:56:24'),
(422, NULL, NULL, 'NUMBEROFTWITTS', '2', '2015-10-17 13:56:24', '2015-10-17 13:56:24'),
(423, NULL, NULL, 'PS_CSS_THEME_CACHE', '0', '2015-10-17 13:57:47', '2015-10-17 13:57:47'),
(424, NULL, NULL, 'PS_JS_THEME_CACHE', '0', '2015-10-17 13:57:47', '2015-10-17 13:57:47'),
(425, NULL, NULL, 'PS_HTML_THEME_COMPRESSION', '0', '2015-10-17 13:57:47', '2015-10-17 13:57:47'),
(426, NULL, NULL, 'PS_JS_HTML_THEME_COMPRESSION', '0', '2015-10-17 13:57:47', '2015-10-17 13:57:47'),
(427, NULL, NULL, 'PS_JS_DEFER', '0', '2015-10-17 13:57:47', '2015-10-17 13:57:47'),
(428, NULL, NULL, 'PS_HTACCESS_CACHE_CONTROL', '0', '2015-10-17 13:57:47', '2015-10-17 13:57:47'),
(429, NULL, NULL, 'PS_DISABLE_NON_NATIVE_MODULE', '0', '2015-10-17 13:57:47', '2015-10-17 13:57:47'),
(430, NULL, NULL, 'PS_DISABLE_OVERRIDES', '0', '2015-10-17 13:57:47', '2015-10-17 13:57:47'),
(431, NULL, NULL, 'PS_CCCJS_VERSION', '6', '2015-10-17 13:58:01', '2015-10-18 16:43:16'),
(432, NULL, NULL, 'PS_CCCCSS_VERSION', '6', '2015-10-17 13:58:01', '2015-10-18 16:43:16'),
(433, NULL, NULL, 'PS_SHOW_CAT_MODULES_1', NULL, '2015-10-18 12:43:20', '2015-11-13 14:30:10'),
(438, NULL, NULL, 'MOD_BLOCKTOPMENU_ITEMS', 'CAT2', '2015-10-18 13:54:44', '2015-10-18 15:45:49'),
(439, NULL, NULL, 'MOD_BLOCKTOPMENU_SEARCH', NULL, '2015-10-18 13:54:44', '2015-10-18 15:45:49'),
(440, NULL, NULL, 'NEWS_N_LIST_SIDES', '3', '2015-10-18 14:16:08', '2015-10-18 14:16:08'),
(441, NULL, NULL, 'NEWS_SIDE_CATEGORIES', '1', '2015-10-18 14:16:08', '2015-10-18 14:16:08'),
(442, NULL, NULL, 'NEWS_N_PAGE', '5', '2015-10-18 14:16:08', '2015-10-18 14:16:08'),
(443, NULL, NULL, 'NEWS_AJAXPAGER', '1', '2015-10-18 14:16:08', '2015-10-18 14:16:08'),
(444, NULL, NULL, 'NEWS_RSS_N', '10', '2015-10-18 14:16:08', '2015-10-18 14:16:08'),
(445, NULL, NULL, 'NEWS_REL', '10', '2015-10-18 14:16:08', '2015-10-18 14:16:08'),
(446, NULL, NULL, 'NEWS_REL_PRODUCTS', '1', '2015-10-18 14:16:08', '2015-10-18 14:16:08'),
(447, NULL, NULL, 'NEWS_N_HOME', '6', '2015-10-18 14:16:08', '2015-10-18 14:16:08'),
(448, NULL, NULL, 'NEWS_SOCIAL_BUTTONS', 'a:7:{i:0;i:1;i:1;i:1;i:2;i:1;i:3;i:1;i:4;i:1;i:5;i:1;i:6;i:1;}', '2015-10-18 14:16:08', '2015-10-18 14:16:08'),
(449, NULL, NULL, 'NEWS_SOCIAL_BUTTON_HTML', NULL, '2015-10-18 14:16:08', '2015-10-18 20:39:17'),
(450, NULL, NULL, 'NEWS_FB_COMMENTS', '0', '2015-10-18 14:16:08', '2015-10-18 14:16:08'),
(451, NULL, NULL, 'NEWS_WIDTH', '556', '2015-10-18 14:16:08', '2015-10-18 14:16:08'),
(452, NULL, NULL, 'NEWS_FB_COMMENTS_LANGS', 'a:1:{i:1;s:5:"en_US";}', '2015-10-18 14:16:08', '2015-10-18 20:39:17'),
(453, NULL, NULL, 'NEWS_THEME', '1', '2015-10-18 14:16:08', '2015-10-18 14:16:08'),
(454, NULL, NULL, 'NEWS_SLIDESHOW_WIDTH', '380', '2015-10-18 14:16:08', '2015-10-18 14:16:08'),
(455, NULL, NULL, 'NEWS_SLIDESHOW_HEIGHT', '250', '2015-10-18 14:16:08', '2015-10-18 14:16:08'),
(456, NULL, NULL, 'BLOCKSOCIAL_FACEBOOK', 'https://www.facebook.com/matissesfanpage/?fref=ts', '2015-10-18 16:28:20', '2015-11-12 16:17:07'),
(457, NULL, NULL, 'BLOCKSOCIAL_TWITTER', NULL, '2015-10-18 16:28:20', '2015-11-12 16:17:07'),
(458, NULL, NULL, 'BLOCKSOCIAL_RSS', NULL, '2015-10-18 16:28:20', '2015-11-12 16:17:07'),
(459, NULL, NULL, 'BLOCKSOCIAL_YOUTUBE', NULL, '2015-10-18 16:28:20', '2015-11-12 16:17:07'),
(460, NULL, NULL, 'BLOCKSOCIAL_GOOGLE_PLUS', NULL, '2015-10-18 16:28:20', '2015-11-12 16:17:07'),
(461, NULL, NULL, 'BLOCKSOCIAL_PINTEREST', 'https://www.pinterest.com/matisses/', '2015-10-18 16:28:20', '2015-11-12 16:17:07'),
(462, NULL, NULL, 'BLOCKSOCIAL_VIMEO', NULL, '2015-10-18 16:28:20', '2015-11-12 16:17:07'),
(463, NULL, NULL, 'BLOCKSOCIAL_INSTAGRAM', 'https://instagram.com/matisses/', '2015-10-18 16:28:20', '2015-11-12 16:17:07'),
(464, NULL, NULL, 'PS_SHOW_TYPE_MODULES_1', 'allModules', '2015-10-18 19:09:20', '2015-10-18 19:09:20'),
(465, NULL, NULL, 'PS_SHOW_INSTALLED_MODULES_1', 'installed', '2015-10-18 19:09:20', '2015-10-18 19:09:20'),
(466, NULL, NULL, 'PS_SHOW_ENABLED_MODULES_1', 'enabledDisabled', '2015-10-18 19:09:20', '2015-10-18 19:09:20'),
(467, NULL, NULL, 'HOMESLIDER_WIDTH', '1893', '2015-10-18 19:22:19', '2015-11-13 14:31:14'),
(468, NULL, NULL, 'HOMESLIDER_SPEED', '500', '2015-10-18 19:22:19', '2015-10-18 19:22:19'),
(469, NULL, NULL, 'HOMESLIDER_PAUSE', '3000', '2015-10-18 19:22:19', '2015-10-18 19:22:19'),
(470, NULL, NULL, 'HOMESLIDER_LOOP', '1', '2015-10-18 19:22:19', '2015-10-18 19:22:19'),
(471, NULL, NULL, 'NW_CONFIRMATION_EMAIL', '1', '2015-10-19 18:03:26', '2015-10-19 18:03:26'),
(472, NULL, NULL, 'NW_VERIFICATION_EMAIL', '1', '2015-10-19 18:03:26', '2015-10-19 18:03:26'),
(473, NULL, NULL, 'NW_VOUCHER_CODE', NULL, '2015-10-19 18:03:26', '2015-10-19 18:03:26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_configuration_kpi`
--

CREATE TABLE IF NOT EXISTS `ps_configuration_kpi` (
  `id_configuration_kpi` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_shop_group` int(11) unsigned DEFAULT NULL,
  `id_shop` int(11) unsigned DEFAULT NULL,
  `name` varchar(32) NOT NULL,
  `value` text,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_configuration_kpi`),
  KEY `name` (`name`),
  KEY `id_shop` (`id_shop`),
  KEY `id_shop_group` (`id_shop_group`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=74 ;

--
-- Volcado de datos para la tabla `ps_configuration_kpi`
--

INSERT INTO `ps_configuration_kpi` (`id_configuration_kpi`, `id_shop_group`, `id_shop`, `name`, `value`, `date_add`, `date_upd`) VALUES
(1, NULL, NULL, 'UPDATE_MODULES', '62', '2015-10-18 12:42:38', '2015-11-17 10:43:21'),
(2, NULL, NULL, 'INSTALLED_MODULES', '68', '2015-10-18 12:42:44', '2015-10-19 18:25:39'),
(3, NULL, NULL, 'INSTALLED_MODULES_EXPIRE', '1447775659', '2015-10-18 12:42:44', '2015-11-17 10:52:19'),
(4, NULL, NULL, 'DISABLED_MODULES', '11', '2015-10-18 12:42:44', '2015-10-19 18:25:40'),
(5, NULL, NULL, 'DISABLED_MODULES_EXPIRE', '1447775659', '2015-10-18 12:42:44', '2015-11-17 10:52:19'),
(6, NULL, NULL, 'UPDATE_MODULES_EXPIRE', '1447775660', '2015-10-18 12:42:45', '2015-11-17 10:52:20'),
(7, NULL, NULL, 'PRODUCT_AVG_GROSS_MARGIN', '74%', '2015-10-18 19:32:05', '2015-11-17 16:47:00'),
(8, NULL, NULL, 'PERCENT_PRODUCT_OUT_OF_STOCK', '13.33%', '2015-10-18 19:32:05', '2015-10-18 19:32:05'),
(9, NULL, NULL, 'PRODUCT_AVG_GROSS_MARGIN_EXPIRE', '1447818420', '2015-10-18 19:32:05', '2015-11-17 16:47:00'),
(10, NULL, NULL, 'PERCENT_PRODUCT_OUT_OF_STOCK_EXP', '1445229125', '2015-10-18 19:32:05', '2015-10-18 19:32:05'),
(11, NULL, NULL, '8020_SALES_CATALOG', '0% de su Catálogo', '2015-10-18 19:32:05', '2015-10-18 19:32:05'),
(12, NULL, NULL, '8020_SALES_CATALOG_EXPIRE', '1447818416', '2015-10-18 19:32:05', '2015-11-17 10:46:56'),
(13, NULL, NULL, 'DISABLED_PRODUCTS', '0%', '2015-10-18 19:32:05', '2015-10-18 19:32:05'),
(14, NULL, NULL, 'DISABLED_PRODUCTS_EXPIRE', '1447800881', '2015-10-18 19:32:05', '2015-11-17 15:54:41'),
(15, NULL, NULL, 'PERCENT_PRODUCT_OUT_OF_STOCK_EXP', '1445229192', '2015-10-18 19:33:12', '2015-10-18 19:33:12'),
(16, NULL, NULL, 'DISABLED_CATEGORIES', '1', '2015-10-18 19:33:38', '2015-10-18 19:33:38'),
(17, NULL, NULL, 'DISABLED_CATEGORIES_EXPIRE', '1447782631', '2015-10-18 19:33:38', '2015-11-17 10:50:31'),
(18, NULL, NULL, 'PRODUCTS_PER_CATEGORY', '1', '2015-10-18 19:33:38', '2015-10-18 19:33:38'),
(19, NULL, NULL, 'PRODUCTS_PER_CATEGORY_EXPIRE', '1447779031', '2015-10-18 19:33:38', '2015-11-17 10:50:31'),
(20, NULL, NULL, 'EMPTY_CATEGORIES', '0', '2015-10-18 19:33:38', '2015-10-18 19:33:38'),
(21, NULL, NULL, 'EMPTY_CATEGORIES_EXPIRE', '1447782631', '2015-10-18 19:33:39', '2015-11-17 10:50:31'),
(22, NULL, NULL, 'TOP_CATEGORY', NULL, '2015-10-18 19:33:39', '2015-10-18 19:33:39'),
(23, NULL, NULL, 'TOP_CATEGORY_EXPIRE', NULL, '2015-10-18 19:33:39', '2015-10-18 19:33:39'),
(24, NULL, NULL, 'PERCENT_PRODUCT_OUT_OF_STOCK_EXP', '1445229225', '2015-10-18 19:33:45', '2015-10-18 19:33:45'),
(25, NULL, NULL, 'PERCENT_PRODUCT_OUT_OF_STOCK_EXP', '1445229427', '2015-10-18 19:37:07', '2015-10-18 19:37:07'),
(26, NULL, NULL, 'PERCENT_PRODUCT_OUT_OF_STOCK_EXP', '1445229453', '2015-10-18 19:37:33', '2015-10-18 19:37:33'),
(27, NULL, NULL, 'ENABLED_LANGUAGES', '1', '2015-11-13 11:15:54', '2015-11-13 11:15:54'),
(28, NULL, NULL, 'ENABLED_LANGUAGES_EXPIRE', '1447775171', '2015-11-13 11:15:54', '2015-11-17 10:45:11'),
(29, NULL, NULL, 'MAIN_COUNTRY', NULL, '2015-11-13 11:15:55', '2015-11-13 11:15:55'),
(30, NULL, NULL, 'FRONTOFFICE_TRANSLATIONS', '0%', '2015-11-13 11:15:55', '2015-11-13 11:15:55'),
(31, NULL, NULL, 'MAIN_COUNTRY_EXPIRE', NULL, '2015-11-13 11:15:55', '2015-11-13 11:15:55'),
(32, NULL, NULL, 'FRONTOFFICE_TRANSLATIONS_EXPIRE', '1447775232', '2015-11-13 11:15:55', '2015-11-17 10:45:12'),
(33, NULL, NULL, 'CUSTOMER_MAIN_GENDER', NULL, '2015-11-13 11:26:05', '2015-11-13 11:26:05'),
(34, NULL, NULL, 'CUSTOMER_MAIN_GENDER_EXPIRE', NULL, '2015-11-13 11:26:05', '2015-11-13 11:26:05'),
(35, NULL, NULL, 'NEWSLETTER_REGISTRATIONS', '1', '2015-11-13 11:26:05', '2015-11-13 11:26:05'),
(36, NULL, NULL, 'NEWSLETTER_REGISTRATIONS_EXPIRE', '1447453565', '2015-11-13 11:26:05', '2015-11-13 11:26:05'),
(37, NULL, NULL, 'AVG_CUSTOMER_AGE', NULL, '2015-11-13 11:26:05', '2015-11-13 11:26:05'),
(38, NULL, NULL, 'AVG_CUSTOMER_AGE_EXPIRE', NULL, '2015-11-13 11:26:05', '2015-11-13 11:26:05'),
(39, NULL, NULL, 'ORDERS_PER_CUSTOMER', '0', '2015-11-13 11:26:05', '2015-11-13 11:26:05'),
(40, NULL, NULL, 'ORDERS_PER_CUSTOMER_EXPIRE', '1447518365', '2015-11-13 11:26:05', '2015-11-13 11:26:05'),
(41, NULL, NULL, 'CONVERSION_RATE', '0%', '2015-11-13 12:10:25', '2015-11-13 12:10:25'),
(42, NULL, NULL, 'CONVERSION_RATE_EXPIRE', '1447477200', '2015-11-13 12:10:25', '2015-11-13 12:10:25'),
(43, NULL, NULL, 'AVG_ORDER_VALUE', '0,00 $', '2015-11-13 12:10:25', '2015-11-13 12:10:25'),
(44, NULL, NULL, 'AVG_ORDER_VALUE_EXPIRE', '1447477200', '2015-11-13 12:10:25', '2015-11-13 12:10:25'),
(45, NULL, NULL, 'ABANDONED_CARTS', '0', '2015-11-13 12:10:25', '2015-11-13 12:10:25'),
(46, NULL, NULL, 'ABANDONED_CARTS_EXPIRE', '1447438225', '2015-11-13 12:10:25', '2015-11-13 12:10:25'),
(47, NULL, NULL, 'PERCENT_PRODUCT_OUT_OF_STOCK_EXP', '1447449827', '2015-11-13 12:23:47', '2015-11-13 12:23:47'),
(48, NULL, NULL, 'PERCENT_PRODUCT_OUT_OF_STOCK_EXP', '1447789616', '2015-11-17 10:46:56', '2015-11-17 10:46:56'),
(49, NULL, NULL, 'PERCENT_PRODUCT_OUT_OF_STOCK_EXP', '1447789902', '2015-11-17 10:51:42', '2015-11-17 10:51:42'),
(50, NULL, NULL, 'PERCENT_PRODUCT_OUT_OF_STOCK_EXP', '1447789922', '2015-11-17 10:52:02', '2015-11-17 10:52:02'),
(51, NULL, NULL, 'PERCENT_PRODUCT_OUT_OF_STOCK_EXP', '1447790037', '2015-11-17 10:53:57', '2015-11-17 10:53:57'),
(52, NULL, NULL, 'PERCENT_PRODUCT_OUT_OF_STOCK_EXP', '1447791087', '2015-11-17 11:11:27', '2015-11-17 11:11:27'),
(53, NULL, NULL, 'PERCENT_PRODUCT_OUT_OF_STOCK_EXP', '1447791097', '2015-11-17 11:11:37', '2015-11-17 11:11:37'),
(54, NULL, NULL, 'PERCENT_PRODUCT_OUT_OF_STOCK_EXP', '1447791111', '2015-11-17 11:11:51', '2015-11-17 11:11:51'),
(55, NULL, NULL, 'PERCENT_PRODUCT_OUT_OF_STOCK_EXP', '1447808081', '2015-11-17 15:54:41', '2015-11-17 15:54:41'),
(56, NULL, NULL, 'PERCENT_PRODUCT_OUT_OF_STOCK_EXP', '1447808173', '2015-11-17 15:56:13', '2015-11-17 15:56:13'),
(57, NULL, NULL, 'PERCENT_PRODUCT_OUT_OF_STOCK_EXP', '1447808327', '2015-11-17 15:58:47', '2015-11-17 15:58:47'),
(58, NULL, NULL, 'PERCENT_PRODUCT_OUT_OF_STOCK_EXP', '1447808405', '2015-11-17 16:00:05', '2015-11-17 16:00:05'),
(59, NULL, NULL, 'PERCENT_PRODUCT_OUT_OF_STOCK_EXP', '1447811195', '2015-11-17 16:46:35', '2015-11-17 16:46:35'),
(60, NULL, NULL, 'PERCENT_PRODUCT_OUT_OF_STOCK_EXP', '1447811220', '2015-11-17 16:47:00', '2015-11-17 16:47:00'),
(61, NULL, NULL, 'PERCENT_PRODUCT_OUT_OF_STOCK_EXP', '1447811340', '2015-11-17 16:49:00', '2015-11-17 16:49:00'),
(62, NULL, NULL, 'PERCENT_PRODUCT_OUT_OF_STOCK_EXP', '1447811715', '2015-11-17 16:55:15', '2015-11-17 16:55:15'),
(63, NULL, NULL, 'PERCENT_PRODUCT_OUT_OF_STOCK_EXP', '1447811750', '2015-11-17 16:55:50', '2015-11-17 16:55:50'),
(64, NULL, NULL, 'PERCENT_PRODUCT_OUT_OF_STOCK_EXP', '1447812316', '2015-11-17 17:05:16', '2015-11-17 17:05:16'),
(65, NULL, NULL, 'PERCENT_PRODUCT_OUT_OF_STOCK_EXP', '1447812339', '2015-11-17 17:05:39', '2015-11-17 17:05:39'),
(66, NULL, NULL, 'PERCENT_PRODUCT_OUT_OF_STOCK_EXP', '1447812620', '2015-11-17 17:10:20', '2015-11-17 17:10:20'),
(67, NULL, NULL, 'PERCENT_PRODUCT_OUT_OF_STOCK_EXP', '1447812658', '2015-11-17 17:10:58', '2015-11-17 17:10:58'),
(68, NULL, NULL, 'PERCENT_PRODUCT_OUT_OF_STOCK_EXP', '1447813888', '2015-11-17 17:31:28', '2015-11-17 17:31:28'),
(69, NULL, NULL, 'PERCENT_PRODUCT_OUT_OF_STOCK_EXP', '1447813956', '2015-11-17 17:32:36', '2015-11-17 17:32:36'),
(70, NULL, NULL, 'PERCENT_PRODUCT_OUT_OF_STOCK_EXP', '1447814141', '2015-11-17 17:35:41', '2015-11-17 17:35:41'),
(71, NULL, NULL, 'PERCENT_PRODUCT_OUT_OF_STOCK_EXP', '1447814503', '2015-11-17 17:41:43', '2015-11-17 17:41:43'),
(72, NULL, NULL, 'PERCENT_PRODUCT_OUT_OF_STOCK_EXP', '1447814624', '2015-11-17 17:43:44', '2015-11-17 17:43:44'),
(73, NULL, NULL, 'PERCENT_PRODUCT_OUT_OF_STOCK_EXP', '1447814671', '2015-11-17 17:44:31', '2015-11-17 17:44:31');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_configuration_kpi_lang`
--

CREATE TABLE IF NOT EXISTS `ps_configuration_kpi_lang` (
  `id_configuration_kpi` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `value` text,
  `date_upd` datetime DEFAULT NULL,
  PRIMARY KEY (`id_configuration_kpi`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ps_configuration_kpi_lang`
--

INSERT INTO `ps_configuration_kpi_lang` (`id_configuration_kpi`, `id_lang`, `value`, `date_upd`) VALUES
(22, 1, 'Vestidos de noche', '2015-11-17 10:50:31'),
(23, 1, '1447861831', '2015-11-17 10:50:31'),
(29, 1, 'Ningún pedido', '2015-11-13 11:15:55'),
(31, 1, '1447861511', '2015-11-17 10:45:11'),
(33, 1, '100% Clientes hombre', '2015-11-13 11:26:05'),
(34, 1, '1447518365', '2015-11-13 11:26:05'),
(37, 1, '46 años', '2015-11-13 11:26:05'),
(38, 1, '1447518365', '2015-11-13 11:26:05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_configuration_lang`
--

CREATE TABLE IF NOT EXISTS `ps_configuration_lang` (
  `id_configuration` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `value` text,
  `date_upd` datetime DEFAULT NULL,
  PRIMARY KEY (`id_configuration`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ps_configuration_lang`
--

INSERT INTO `ps_configuration_lang` (`id_configuration`, `id_lang`, `value`, `date_upd`) VALUES
(41, 1, 'FACT.', NULL),
(42, 1, 'ALB. ENTR.', NULL),
(49, 1, 'un|una|unas|unos|uno|sobre|todo|también|tras|otro|algún|alguno|alguna|algunos|algunas|ser|es|soy|eres|somos|sois|estoy|esta|estamos|estais|estan|como|en|para|atras|porque|por qué|estado|estaba|ante|antes|siendo|ambos|pero|por|poder|puede|puedo|podemos|podeis|pueden|fui|fue|fuimos|fueron|hacer|hago|hace|hacemos|haceis|hacen|cada|fin|incluso|primero|desde|conseguir|consigo|consigue|consigues|conseguimos|consiguen|ir|voy|va|vamos|vais|van|vaya|gueno|ha|tener|tengo|tiene|tenemos|teneis|tienen|el|la|lo|las|los|su|aqui|mio|tuyo|ellos|ellas|nos|nosotros|vosotros|vosotras|si|dentro|solo|solamente|saber|sabes|sabe|sabemos|sabeis|saben|ultimo|largo|bastante|haces|muchos|aquellos|aquellas|sus|entonces|tiempo|verdad|verdadero|verdadera|cierto|ciertos|cierta|ciertas|intentar|intento|intenta|intentas|intentamos|intentais|intentan|dos|bajo|arriba|encima|usar|uso|usas|usa|usamos|usais|usan|emplear|empleo|empleas|emplean|ampleamos|empleais|valor|muy|era|eras|eramos|eran|modo|bien|cual|cuando|donde|mientras|quien|con|entre|sin|trabajo|trabajar|trabajas|trabaja|trabajamos|trabajais|trabajan|podria|podrias|podriamos|podrian|podriais|yo|aquel', NULL),
(71, 1, '0', NULL),
(77, 1, 'Estimado cliente:\n\nSaludos,\nServicio de atención al cliente', NULL),
(280, 1, 'sale70.png', '2015-06-22 10:29:17'),
(281, 1, '', '2015-06-22 10:29:17'),
(282, 1, '', '2015-06-22 10:29:17');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_connections`
--

CREATE TABLE IF NOT EXISTS `ps_connections` (
  `id_connections` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_shop_group` int(11) unsigned NOT NULL DEFAULT '1',
  `id_shop` int(11) unsigned NOT NULL DEFAULT '1',
  `id_guest` int(10) unsigned NOT NULL,
  `id_page` int(10) unsigned NOT NULL,
  `ip_address` bigint(20) DEFAULT NULL,
  `date_add` datetime NOT NULL,
  `http_referer` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_connections`),
  KEY `id_guest` (`id_guest`),
  KEY `date_add` (`date_add`),
  KEY `id_page` (`id_page`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=85 ;

--
-- Volcado de datos para la tabla `ps_connections`
--

INSERT INTO `ps_connections` (`id_connections`, `id_shop_group`, `id_shop`, `id_guest`, `id_page`, `ip_address`, `date_add`, `http_referer`) VALUES
(1, 1, 1, 1, 1, 2130706433, '2015-06-22 10:29:14', 'http://www.prestashop.com'),
(2, 1, 1, 2, 1, 2891383925, '2015-06-22 10:39:46', ''),
(3, 1, 1, 3, 1, 2891383925, '2015-07-29 08:39:39', ''),
(4, 1, 1, 4, 1, 2891383630, '2015-10-15 15:38:35', ''),
(5, 1, 1, 5, 1, 2891383844, '2015-10-15 15:41:48', ''),
(6, 1, 1, 6, 1, 181633537, '2015-10-17 12:38:23', ''),
(7, 1, 1, 6, 1, 181633537, '2015-10-17 13:27:44', ''),
(8, 1, 1, 6, 1, 181633537, '2015-10-17 13:58:19', ''),
(9, 1, 1, 6, 1, 181633537, '2015-10-17 14:52:29', ''),
(10, 1, 1, 6, 1, 181633538, '2015-10-18 11:01:25', ''),
(11, 1, 1, 6, 1, 181633538, '2015-10-18 11:32:50', ''),
(12, 1, 1, 6, 1, 181633538, '2015-10-18 12:03:01', ''),
(13, 1, 1, 6, 1, 181633538, '2015-10-18 12:43:35', ''),
(14, 1, 1, 6, 1, 181633538, '2015-10-18 13:15:06', ''),
(15, 1, 1, 6, 1, 181633538, '2015-10-18 13:46:39', ''),
(16, 1, 1, 6, 2, 181633538, '2015-10-18 14:19:04', ''),
(17, 1, 1, 6, 2, 181633538, '2015-10-18 14:51:41', ''),
(18, 1, 1, 6, 1, 181633538, '2015-10-18 15:23:25', ''),
(19, 1, 1, 6, 1, 181633538, '2015-10-18 15:54:42', ''),
(20, 1, 1, 6, 1, 181633538, '2015-10-18 16:29:04', ''),
(21, 1, 1, 6, 1, 181633538, '2015-10-18 17:23:38', ''),
(22, 1, 1, 6, 3, 181633538, '2015-10-18 17:56:26', ''),
(23, 1, 1, 6, 1, 181633538, '2015-10-18 18:42:36', ''),
(24, 1, 1, 6, 1, 181633538, '2015-10-18 19:14:48', ''),
(25, 1, 1, 6, 1, 181633538, '2015-10-18 19:45:55', ''),
(26, 1, 1, 6, 1, 181633538, '2015-10-18 20:16:59', ''),
(27, 1, 1, 6, 4, 181633538, '2015-10-18 20:51:31', ''),
(28, 1, 1, 5, 1, 2891383696, '2015-10-19 09:03:11', ''),
(29, 1, 1, 6, 1, 181633540, '2015-10-19 16:43:52', ''),
(30, 1, 1, 6, 1, 181633537, '2015-10-19 17:30:19', ''),
(31, 1, 1, 6, 1, 181633537, '2015-10-19 18:03:54', ''),
(32, 1, 1, 6, 1, 181633537, '2015-10-19 18:47:24', ''),
(33, 1, 1, 6, 1, 181633537, '2015-10-19 19:34:46', ''),
(34, 1, 1, 6, 1, 181633537, '2015-10-19 20:25:00', ''),
(35, 1, 1, 5, 1, 2891383844, '2015-10-20 12:07:19', ''),
(36, 1, 1, 6, 1, 181633541, '2015-10-20 16:34:45', ''),
(37, 1, 1, 5, 5, 2891383696, '2015-10-21 11:47:55', ''),
(38, 1, 1, 6, 1, 181633537, '2015-10-24 17:16:00', ''),
(39, 1, 1, 6, 1, 181633537, '2015-10-27 18:09:57', ''),
(40, 1, 1, 6, 1, 181633537, '2015-10-28 18:39:59', ''),
(41, 1, 1, 5, 1, 181633537, '2015-10-28 18:50:17', ''),
(42, 1, 1, 7, 1, 181633540, '2015-10-29 08:41:45', ''),
(43, 1, 1, 7, 1, 181633538, '2015-11-01 16:24:11', ''),
(44, 1, 1, 7, 1, 181633540, '2015-11-02 13:17:20', ''),
(45, 1, 1, 5, 1, 2891383696, '2015-11-05 14:51:59', ''),
(46, 1, 1, 5, 1, 2891383696, '2015-11-10 14:22:34', ''),
(47, 1, 1, 8, 1, 181633537, '2015-11-11 08:51:38', ''),
(48, 1, 1, 8, 1, 181633537, '2015-11-11 15:30:48', ''),
(49, 1, 1, 8, 1, 181633537, '2015-11-11 17:07:29', ''),
(50, 1, 1, 8, 1, 181633537, '2015-11-11 17:39:36', ''),
(51, 1, 1, 8, 1, 181633537, '2015-11-11 18:14:43', ''),
(52, 1, 1, 8, 1, 181633537, '2015-11-11 21:10:31', ''),
(53, 1, 1, 8, 1, 181633537, '2015-11-11 21:49:26', ''),
(54, 1, 1, 8, 1, 181633537, '2015-11-11 22:27:28', ''),
(55, 1, 1, 9, 1, 2891383676, '2015-11-12 10:50:44', ''),
(56, 1, 1, 9, 1, 2891383676, '2015-11-12 11:38:27', ''),
(57, 1, 1, 9, 1, 2891383676, '2015-11-12 12:09:02', ''),
(58, 1, 1, 9, 1, 2891383676, '2015-11-12 12:42:35', ''),
(59, 1, 1, 10, 1, 2891383617, '2015-11-12 16:37:13', ''),
(60, 1, 1, 11, 1, 2891383676, '2015-11-12 16:59:58', ''),
(61, 1, 1, 9, 1, 2891383676, '2015-11-13 08:45:57', ''),
(62, 1, 1, 9, 1, 2891383676, '2015-11-13 09:17:42', ''),
(63, 1, 1, 9, 1, 2891383676, '2015-11-13 09:53:23', ''),
(64, 1, 1, 9, 1, 2891383676, '2015-11-13 10:25:47', ''),
(65, 1, 1, 9, 1, 2891383676, '2015-11-13 10:59:12', ''),
(66, 1, 1, 9, 1, 2891383676, '2015-11-13 11:34:34', ''),
(67, 1, 1, 9, 1, 2891383676, '2015-11-13 12:19:15', ''),
(68, 1, 1, 9, 1, 2891383676, '2015-11-13 13:54:33', ''),
(69, 1, 1, 12, 1, 2891383676, '2015-11-13 14:20:50', ''),
(70, 1, 1, 12, 1, 2891383676, '2015-11-13 14:58:20', ''),
(71, 1, 1, 12, 1, 2891383676, '2015-11-13 15:30:17', ''),
(72, 1, 1, 12, 1, 2891383676, '2015-11-13 16:04:05', ''),
(73, 1, 1, 12, 1, 2891383676, '2015-11-13 16:36:10', ''),
(74, 1, 1, 10, 1, 2891383617, '2015-11-13 17:34:26', ''),
(75, 1, 1, 12, 1, 2891383676, '2015-11-13 17:41:24', ''),
(76, 1, 1, 12, 1, 2891383676, '2015-11-17 08:25:38', ''),
(77, 1, 1, 12, 1, 2891383676, '2015-11-17 10:05:23', ''),
(78, 1, 1, 12, 1, 2891383676, '2015-11-17 10:47:11', ''),
(79, 1, 1, 12, 1, 2891383676, '2015-11-17 12:35:24', ''),
(80, 1, 1, 7, 1, 181633538, '2015-11-17 14:21:44', ''),
(81, 1, 1, 11, 1, 2891383676, '2015-11-17 16:08:38', ''),
(82, 1, 1, 13, 1, 2891383676, '2015-11-17 16:12:59', ''),
(83, 1, 1, 13, 1, 2891383676, '2015-11-17 19:17:59', ''),
(84, 1, 1, 7, 1, 181633538, '2015-11-17 19:24:05', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_connections_page`
--

CREATE TABLE IF NOT EXISTS `ps_connections_page` (
  `id_connections` int(10) unsigned NOT NULL,
  `id_page` int(10) unsigned NOT NULL,
  `time_start` datetime NOT NULL,
  `time_end` datetime DEFAULT NULL,
  PRIMARY KEY (`id_connections`,`id_page`,`time_start`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_connections_source`
--

CREATE TABLE IF NOT EXISTS `ps_connections_source` (
  `id_connections_source` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_connections` int(10) unsigned NOT NULL,
  `http_referer` varchar(255) DEFAULT NULL,
  `request_uri` varchar(255) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_connections_source`),
  KEY `connections` (`id_connections`),
  KEY `orderby` (`date_add`),
  KEY `http_referer` (`http_referer`),
  KEY `request_uri` (`request_uri`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_contact`
--

CREATE TABLE IF NOT EXISTS `ps_contact` (
  `id_contact` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(128) NOT NULL,
  `customer_service` tinyint(1) NOT NULL DEFAULT '0',
  `position` tinyint(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_contact`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `ps_contact`
--

INSERT INTO `ps_contact` (`id_contact`, `email`, `customer_service`, `position`) VALUES
(1, 'sebastian.castano@arkix.com', 1, 0),
(2, 'sebastian.castano@arkix.com', 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_contact_lang`
--

CREATE TABLE IF NOT EXISTS `ps_contact_lang` (
  `id_contact` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` text,
  PRIMARY KEY (`id_contact`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ps_contact_lang`
--

INSERT INTO `ps_contact_lang` (`id_contact`, `id_lang`, `name`, `description`) VALUES
(1, 1, 'Webmaster', 'En caso de problema técnico en esta página web'),
(2, 1, 'Servicio de atención al cliente', 'Para cualquier pregunta sobre un artículo, un pedido');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_contact_shop`
--

CREATE TABLE IF NOT EXISTS `ps_contact_shop` (
  `id_contact` int(11) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_contact`,`id_shop`),
  KEY `id_shop` (`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ps_contact_shop`
--

INSERT INTO `ps_contact_shop` (`id_contact`, `id_shop`) VALUES
(1, 1),
(2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_country`
--

CREATE TABLE IF NOT EXISTS `ps_country` (
  `id_country` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_zone` int(10) unsigned NOT NULL,
  `id_currency` int(10) unsigned NOT NULL DEFAULT '0',
  `iso_code` varchar(3) NOT NULL,
  `call_prefix` int(10) NOT NULL DEFAULT '0',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `contains_states` tinyint(1) NOT NULL DEFAULT '0',
  `need_identification_number` tinyint(1) NOT NULL DEFAULT '0',
  `need_zip_code` tinyint(1) NOT NULL DEFAULT '1',
  `zip_code_format` varchar(12) NOT NULL DEFAULT '',
  `display_tax_label` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_country`),
  KEY `country_iso_code` (`iso_code`),
  KEY `country_` (`id_zone`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=245 ;

--
-- Volcado de datos para la tabla `ps_country`
--

INSERT INTO `ps_country` (`id_country`, `id_zone`, `id_currency`, `iso_code`, `call_prefix`, `active`, `contains_states`, `need_identification_number`, `need_zip_code`, `zip_code_format`, `display_tax_label`) VALUES
(1, 1, 0, 'DE', 49, 0, 0, 0, 1, 'NNNNN', 1),
(2, 1, 0, 'AT', 43, 0, 0, 0, 1, 'NNNN', 1),
(3, 1, 0, 'BE', 32, 0, 0, 0, 1, 'NNNN', 1),
(4, 2, 0, 'CA', 1, 0, 1, 0, 1, 'LNL NLN', 0),
(5, 3, 0, 'CN', 86, 0, 0, 0, 1, 'NNNNNN', 1),
(6, 1, 0, 'ES', 34, 0, 0, 1, 1, 'NNNNN', 1),
(7, 1, 0, 'FI', 358, 0, 0, 0, 1, 'NNNNN', 1),
(8, 1, 0, 'FR', 33, 0, 0, 0, 1, 'NNNNN', 1),
(9, 1, 0, 'GR', 30, 0, 0, 0, 1, 'NNNNN', 1),
(10, 1, 0, 'IT', 39, 0, 1, 0, 1, 'NNNNN', 1),
(11, 3, 0, 'JP', 81, 0, 1, 0, 1, 'NNN-NNNN', 1),
(12, 1, 0, 'LU', 352, 0, 0, 0, 1, 'NNNN', 1),
(13, 1, 0, 'NL', 31, 0, 0, 0, 1, 'NNNN LL', 1),
(14, 1, 0, 'PL', 48, 0, 0, 0, 1, 'NN-NNN', 1),
(15, 1, 0, 'PT', 351, 0, 0, 0, 1, 'NNNN-NNN', 1),
(16, 1, 0, 'CZ', 420, 0, 0, 0, 1, 'NNN NN', 1),
(17, 1, 0, 'GB', 44, 0, 0, 0, 1, '', 1),
(18, 1, 0, 'SE', 46, 0, 0, 0, 1, 'NNN NN', 1),
(19, 7, 0, 'CH', 41, 0, 0, 0, 1, 'NNNN', 1),
(20, 1, 0, 'DK', 45, 0, 0, 0, 1, 'NNNN', 1),
(21, 2, 0, 'US', 1, 0, 1, 0, 1, 'NNNNN', 0),
(22, 3, 0, 'HK', 852, 0, 0, 0, 0, '', 1),
(23, 7, 0, 'NO', 47, 0, 0, 0, 1, 'NNNN', 1),
(24, 5, 0, 'AU', 61, 0, 0, 0, 1, 'NNNN', 1),
(25, 3, 0, 'SG', 65, 0, 0, 0, 1, 'NNNNNN', 1),
(26, 1, 0, 'IE', 353, 0, 0, 0, 0, '', 1),
(27, 5, 0, 'NZ', 64, 0, 0, 0, 1, 'NNNN', 1),
(28, 3, 0, 'KR', 82, 0, 0, 0, 1, 'NNN-NNN', 1),
(29, 3, 0, 'IL', 972, 0, 0, 0, 1, 'NNNNNNN', 1),
(30, 4, 0, 'ZA', 27, 0, 0, 0, 1, 'NNNN', 1),
(31, 4, 0, 'NG', 234, 0, 0, 0, 1, '', 1),
(32, 4, 0, 'CI', 225, 0, 0, 0, 1, '', 1),
(33, 4, 0, 'TG', 228, 0, 0, 0, 1, '', 1),
(34, 6, 0, 'BO', 591, 0, 0, 0, 1, '', 1),
(35, 4, 0, 'MU', 230, 0, 0, 0, 1, '', 1),
(36, 1, 0, 'RO', 40, 0, 0, 0, 1, 'NNNNNN', 1),
(37, 1, 0, 'SK', 421, 0, 0, 0, 1, 'NNN NN', 1),
(38, 4, 0, 'DZ', 213, 0, 0, 0, 1, 'NNNNN', 1),
(39, 2, 0, 'AS', 0, 0, 0, 0, 1, '', 1),
(40, 7, 0, 'AD', 376, 0, 0, 0, 1, 'CNNN', 1),
(41, 4, 0, 'AO', 244, 0, 0, 0, 0, '', 1),
(42, 8, 0, 'AI', 0, 0, 0, 0, 1, '', 1),
(43, 2, 0, 'AG', 0, 0, 0, 0, 1, '', 1),
(44, 6, 0, 'AR', 54, 0, 1, 0, 1, 'LNNNN', 1),
(45, 3, 0, 'AM', 374, 0, 0, 0, 1, 'NNNN', 1),
(46, 8, 0, 'AW', 297, 0, 0, 0, 1, '', 1),
(47, 3, 0, 'AZ', 994, 0, 0, 0, 1, 'CNNNN', 1),
(48, 2, 0, 'BS', 0, 0, 0, 0, 1, '', 1),
(49, 3, 0, 'BH', 973, 0, 0, 0, 1, '', 1),
(50, 3, 0, 'BD', 880, 0, 0, 0, 1, 'NNNN', 1),
(51, 2, 0, 'BB', 0, 0, 0, 0, 1, 'CNNNNN', 1),
(52, 7, 0, 'BY', 0, 0, 0, 0, 1, 'NNNNNN', 1),
(53, 8, 0, 'BZ', 501, 0, 0, 0, 0, '', 1),
(54, 4, 0, 'BJ', 229, 0, 0, 0, 0, '', 1),
(55, 2, 0, 'BM', 0, 0, 0, 0, 1, '', 1),
(56, 3, 0, 'BT', 975, 0, 0, 0, 1, '', 1),
(57, 4, 0, 'BW', 267, 0, 0, 0, 1, '', 1),
(58, 6, 0, 'BR', 55, 0, 0, 0, 1, 'NNNNN-NNN', 1),
(59, 3, 0, 'BN', 673, 0, 0, 0, 1, 'LLNNNN', 1),
(60, 4, 0, 'BF', 226, 0, 0, 0, 1, '', 1),
(61, 3, 0, 'MM', 95, 0, 0, 0, 1, '', 1),
(62, 4, 0, 'BI', 257, 0, 0, 0, 1, '', 1),
(63, 3, 0, 'KH', 855, 0, 0, 0, 1, 'NNNNN', 1),
(64, 4, 0, 'CM', 237, 0, 0, 0, 1, '', 1),
(65, 4, 0, 'CV', 238, 0, 0, 0, 1, 'NNNN', 1),
(66, 4, 0, 'CF', 236, 0, 0, 0, 1, '', 1),
(67, 4, 0, 'TD', 235, 0, 0, 0, 1, '', 1),
(68, 6, 0, 'CL', 56, 0, 0, 0, 1, 'NNN-NNNN', 1),
(69, 6, 0, 'CO', 57, 1, 1, 0, 1, 'NNNNNN', 1),
(70, 4, 0, 'KM', 269, 0, 0, 0, 1, '', 1),
(71, 4, 0, 'CD', 242, 0, 0, 0, 1, '', 1),
(72, 4, 0, 'CG', 243, 0, 0, 0, 1, '', 1),
(73, 8, 0, 'CR', 506, 0, 0, 0, 1, 'NNNNN', 1),
(74, 7, 0, 'HR', 385, 0, 0, 0, 1, 'NNNNN', 1),
(75, 8, 0, 'CU', 53, 0, 0, 0, 1, '', 1),
(76, 1, 0, 'CY', 357, 0, 0, 0, 1, 'NNNN', 1),
(77, 4, 0, 'DJ', 253, 0, 0, 0, 1, '', 1),
(78, 8, 0, 'DM', 0, 0, 0, 0, 1, '', 1),
(79, 8, 0, 'DO', 0, 0, 0, 0, 1, '', 1),
(80, 3, 0, 'TL', 670, 0, 0, 0, 1, '', 1),
(81, 6, 0, 'EC', 593, 0, 0, 0, 1, 'CNNNNNN', 1),
(82, 4, 0, 'EG', 20, 0, 0, 0, 0, '', 1),
(83, 8, 0, 'SV', 503, 0, 0, 0, 1, '', 1),
(84, 4, 0, 'GQ', 240, 0, 0, 0, 1, '', 1),
(85, 4, 0, 'ER', 291, 0, 0, 0, 1, '', 1),
(86, 1, 0, 'EE', 372, 0, 0, 0, 1, 'NNNNN', 1),
(87, 4, 0, 'ET', 251, 0, 0, 0, 1, '', 1),
(88, 8, 0, 'FK', 0, 0, 0, 0, 1, 'LLLL NLL', 1),
(89, 7, 0, 'FO', 298, 0, 0, 0, 1, '', 1),
(90, 5, 0, 'FJ', 679, 0, 0, 0, 1, '', 1),
(91, 4, 0, 'GA', 241, 0, 0, 0, 1, '', 1),
(92, 4, 0, 'GM', 220, 0, 0, 0, 1, '', 1),
(93, 3, 0, 'GE', 995, 0, 0, 0, 1, 'NNNN', 1),
(94, 4, 0, 'GH', 233, 0, 0, 0, 1, '', 1),
(95, 8, 0, 'GD', 0, 0, 0, 0, 1, '', 1),
(96, 7, 0, 'GL', 299, 0, 0, 0, 1, '', 1),
(97, 7, 0, 'GI', 350, 0, 0, 0, 1, '', 1),
(98, 8, 0, 'GP', 590, 0, 0, 0, 1, '', 1),
(99, 5, 0, 'GU', 0, 0, 0, 0, 1, '', 1),
(100, 8, 0, 'GT', 502, 0, 0, 0, 1, '', 1),
(101, 7, 0, 'GG', 0, 0, 0, 0, 1, 'LLN NLL', 1),
(102, 4, 0, 'GN', 224, 0, 0, 0, 1, '', 1),
(103, 4, 0, 'GW', 245, 0, 0, 0, 1, '', 1),
(104, 6, 0, 'GY', 592, 0, 0, 0, 1, '', 1),
(105, 8, 0, 'HT', 509, 0, 0, 0, 1, '', 1),
(106, 5, 0, 'HM', 0, 0, 0, 0, 1, '', 1),
(107, 7, 0, 'VA', 379, 0, 0, 0, 1, 'NNNNN', 1),
(108, 8, 0, 'HN', 504, 0, 0, 0, 1, '', 1),
(109, 7, 0, 'IS', 354, 0, 0, 0, 1, 'NNN', 1),
(110, 3, 0, 'IN', 91, 0, 0, 0, 1, 'NNN NNN', 1),
(111, 3, 0, 'ID', 62, 0, 1, 0, 1, 'NNNNN', 1),
(112, 3, 0, 'IR', 98, 0, 0, 0, 1, 'NNNNN-NNNNN', 1),
(113, 3, 0, 'IQ', 964, 0, 0, 0, 1, 'NNNNN', 1),
(114, 7, 0, 'IM', 0, 0, 0, 0, 1, 'CN NLL', 1),
(115, 8, 0, 'JM', 0, 0, 0, 0, 1, '', 1),
(116, 7, 0, 'JE', 0, 0, 0, 0, 1, 'CN NLL', 1),
(117, 3, 0, 'JO', 962, 0, 0, 0, 1, '', 1),
(118, 3, 0, 'KZ', 7, 0, 0, 0, 1, 'NNNNNN', 1),
(119, 4, 0, 'KE', 254, 0, 0, 0, 1, '', 1),
(120, 5, 0, 'KI', 686, 0, 0, 0, 1, '', 1),
(121, 3, 0, 'KP', 850, 0, 0, 0, 1, '', 1),
(122, 3, 0, 'KW', 965, 0, 0, 0, 1, '', 1),
(123, 3, 0, 'KG', 996, 0, 0, 0, 1, '', 1),
(124, 3, 0, 'LA', 856, 0, 0, 0, 1, '', 1),
(125, 1, 0, 'LV', 371, 0, 0, 0, 1, 'C-NNNN', 1),
(126, 3, 0, 'LB', 961, 0, 0, 0, 1, '', 1),
(127, 4, 0, 'LS', 266, 0, 0, 0, 1, '', 1),
(128, 4, 0, 'LR', 231, 0, 0, 0, 1, '', 1),
(129, 4, 0, 'LY', 218, 0, 0, 0, 1, '', 1),
(130, 1, 0, 'LI', 423, 0, 0, 0, 1, 'NNNN', 1),
(131, 1, 0, 'LT', 370, 0, 0, 0, 1, 'NNNNN', 1),
(132, 3, 0, 'MO', 853, 0, 0, 0, 0, '', 1),
(133, 7, 0, 'MK', 389, 0, 0, 0, 1, '', 1),
(134, 4, 0, 'MG', 261, 0, 0, 0, 1, '', 1),
(135, 4, 0, 'MW', 265, 0, 0, 0, 1, '', 1),
(136, 3, 0, 'MY', 60, 0, 0, 0, 1, 'NNNNN', 1),
(137, 3, 0, 'MV', 960, 0, 0, 0, 1, '', 1),
(138, 4, 0, 'ML', 223, 0, 0, 0, 1, '', 1),
(139, 1, 0, 'MT', 356, 0, 0, 0, 1, 'LLL NNNN', 1),
(140, 5, 0, 'MH', 692, 0, 0, 0, 1, '', 1),
(141, 8, 0, 'MQ', 596, 0, 0, 0, 1, '', 1),
(142, 4, 0, 'MR', 222, 0, 0, 0, 1, '', 1),
(143, 1, 0, 'HU', 36, 0, 0, 0, 1, 'NNNN', 1),
(144, 4, 0, 'YT', 262, 0, 0, 0, 1, '', 1),
(145, 2, 0, 'MX', 52, 0, 1, 1, 1, 'NNNNN', 1),
(146, 5, 0, 'FM', 691, 0, 0, 0, 1, '', 1),
(147, 7, 0, 'MD', 373, 0, 0, 0, 1, 'C-NNNN', 1),
(148, 7, 0, 'MC', 377, 0, 0, 0, 1, '980NN', 1),
(149, 3, 0, 'MN', 976, 0, 0, 0, 1, '', 1),
(150, 7, 0, 'ME', 382, 0, 0, 0, 1, 'NNNNN', 1),
(151, 8, 0, 'MS', 0, 0, 0, 0, 1, '', 1),
(152, 4, 0, 'MA', 212, 0, 0, 0, 1, 'NNNNN', 1),
(153, 4, 0, 'MZ', 258, 0, 0, 0, 1, '', 1),
(154, 4, 0, 'NA', 264, 0, 0, 0, 1, '', 1),
(155, 5, 0, 'NR', 674, 0, 0, 0, 1, '', 1),
(156, 3, 0, 'NP', 977, 0, 0, 0, 1, '', 1),
(157, 8, 0, 'AN', 599, 0, 0, 0, 1, '', 1),
(158, 5, 0, 'NC', 687, 0, 0, 0, 1, '', 1),
(159, 8, 0, 'NI', 505, 0, 0, 0, 1, 'NNNNNN', 1),
(160, 4, 0, 'NE', 227, 0, 0, 0, 1, '', 1),
(161, 5, 0, 'NU', 683, 0, 0, 0, 1, '', 1),
(162, 5, 0, 'NF', 0, 0, 0, 0, 1, '', 1),
(163, 5, 0, 'MP', 0, 0, 0, 0, 1, '', 1),
(164, 3, 0, 'OM', 968, 0, 0, 0, 1, '', 1),
(165, 3, 0, 'PK', 92, 0, 0, 0, 1, '', 1),
(166, 5, 0, 'PW', 680, 0, 0, 0, 1, '', 1),
(167, 3, 0, 'PS', 0, 0, 0, 0, 1, '', 1),
(168, 8, 0, 'PA', 507, 0, 0, 0, 1, 'NNNNNN', 1),
(169, 5, 0, 'PG', 675, 0, 0, 0, 1, '', 1),
(170, 6, 0, 'PY', 595, 0, 0, 0, 1, '', 1),
(171, 6, 0, 'PE', 51, 0, 0, 0, 1, '', 1),
(172, 3, 0, 'PH', 63, 0, 0, 0, 1, 'NNNN', 1),
(173, 5, 0, 'PN', 0, 0, 0, 0, 1, 'LLLL NLL', 1),
(174, 8, 0, 'PR', 0, 0, 0, 0, 1, 'NNNNN', 1),
(175, 3, 0, 'QA', 974, 0, 0, 0, 1, '', 1),
(176, 4, 0, 'RE', 262, 0, 0, 0, 1, '', 1),
(177, 7, 0, 'RU', 7, 0, 0, 0, 1, 'NNNNNN', 1),
(178, 4, 0, 'RW', 250, 0, 0, 0, 1, '', 1),
(179, 8, 0, 'BL', 0, 0, 0, 0, 1, '', 1),
(180, 8, 0, 'KN', 0, 0, 0, 0, 1, '', 1),
(181, 8, 0, 'LC', 0, 0, 0, 0, 1, '', 1),
(182, 8, 0, 'MF', 0, 0, 0, 0, 1, '', 1),
(183, 8, 0, 'PM', 508, 0, 0, 0, 1, '', 1),
(184, 8, 0, 'VC', 0, 0, 0, 0, 1, '', 1),
(185, 5, 0, 'WS', 685, 0, 0, 0, 1, '', 1),
(186, 7, 0, 'SM', 378, 0, 0, 0, 1, 'NNNNN', 1),
(187, 4, 0, 'ST', 239, 0, 0, 0, 1, '', 1),
(188, 3, 0, 'SA', 966, 0, 0, 0, 1, '', 1),
(189, 4, 0, 'SN', 221, 0, 0, 0, 1, '', 1),
(190, 7, 0, 'RS', 381, 0, 0, 0, 1, 'NNNNN', 1),
(191, 4, 0, 'SC', 248, 0, 0, 0, 1, '', 1),
(192, 4, 0, 'SL', 232, 0, 0, 0, 1, '', 1),
(193, 1, 0, 'SI', 386, 0, 0, 0, 1, 'C-NNNN', 1),
(194, 5, 0, 'SB', 677, 0, 0, 0, 1, '', 1),
(195, 4, 0, 'SO', 252, 0, 0, 0, 1, '', 1),
(196, 8, 0, 'GS', 0, 0, 0, 0, 1, 'LLLL NLL', 1),
(197, 3, 0, 'LK', 94, 0, 0, 0, 1, 'NNNNN', 1),
(198, 4, 0, 'SD', 249, 0, 0, 0, 1, '', 1),
(199, 8, 0, 'SR', 597, 0, 0, 0, 1, '', 1),
(200, 7, 0, 'SJ', 0, 0, 0, 0, 1, '', 1),
(201, 4, 0, 'SZ', 268, 0, 0, 0, 1, '', 1),
(202, 3, 0, 'SY', 963, 0, 0, 0, 1, '', 1),
(203, 3, 0, 'TW', 886, 0, 0, 0, 1, 'NNNNN', 1),
(204, 3, 0, 'TJ', 992, 0, 0, 0, 1, '', 1),
(205, 4, 0, 'TZ', 255, 0, 0, 0, 1, '', 1),
(206, 3, 0, 'TH', 66, 0, 0, 0, 1, 'NNNNN', 1),
(207, 5, 0, 'TK', 690, 0, 0, 0, 1, '', 1),
(208, 5, 0, 'TO', 676, 0, 0, 0, 1, '', 1),
(209, 6, 0, 'TT', 0, 0, 0, 0, 1, '', 1),
(210, 4, 0, 'TN', 216, 0, 0, 0, 1, '', 1),
(211, 7, 0, 'TR', 90, 0, 0, 0, 1, 'NNNNN', 1),
(212, 3, 0, 'TM', 993, 0, 0, 0, 1, '', 1),
(213, 8, 0, 'TC', 0, 0, 0, 0, 1, 'LLLL NLL', 1),
(214, 5, 0, 'TV', 688, 0, 0, 0, 1, '', 1),
(215, 4, 0, 'UG', 256, 0, 0, 0, 1, '', 1),
(216, 1, 0, 'UA', 380, 0, 0, 0, 1, 'NNNNN', 1),
(217, 3, 0, 'AE', 971, 0, 0, 0, 1, '', 1),
(218, 6, 0, 'UY', 598, 0, 0, 0, 1, '', 1),
(219, 3, 0, 'UZ', 998, 0, 0, 0, 1, '', 1),
(220, 5, 0, 'VU', 678, 0, 0, 0, 1, '', 1),
(221, 6, 0, 'VE', 58, 0, 0, 0, 1, '', 1),
(222, 3, 0, 'VN', 84, 0, 0, 0, 1, 'NNNNNN', 1),
(223, 2, 0, 'VG', 0, 0, 0, 0, 1, 'CNNNN', 1),
(224, 2, 0, 'VI', 0, 0, 0, 0, 1, '', 1),
(225, 5, 0, 'WF', 681, 0, 0, 0, 1, '', 1),
(226, 4, 0, 'EH', 0, 0, 0, 0, 1, '', 1),
(227, 3, 0, 'YE', 967, 0, 0, 0, 1, '', 1),
(228, 4, 0, 'ZM', 260, 0, 0, 0, 1, '', 1),
(229, 4, 0, 'ZW', 263, 0, 0, 0, 1, '', 1),
(230, 7, 0, 'AL', 355, 0, 0, 0, 1, 'NNNN', 1),
(231, 3, 0, 'AF', 93, 0, 0, 0, 0, '', 1),
(232, 5, 0, 'AQ', 0, 0, 0, 0, 1, '', 1),
(233, 1, 0, 'BA', 387, 0, 0, 0, 1, '', 1),
(234, 5, 0, 'BV', 0, 0, 0, 0, 1, '', 1),
(235, 5, 0, 'IO', 0, 0, 0, 0, 1, 'LLLL NLL', 1),
(236, 1, 0, 'BG', 359, 0, 0, 0, 1, 'NNNN', 1),
(237, 8, 0, 'KY', 0, 0, 0, 0, 1, '', 1),
(238, 3, 0, 'CX', 0, 0, 0, 0, 1, '', 1),
(239, 3, 0, 'CC', 0, 0, 0, 0, 1, '', 1),
(240, 5, 0, 'CK', 682, 0, 0, 0, 1, '', 1),
(241, 6, 0, 'GF', 594, 0, 0, 0, 1, '', 1),
(242, 5, 0, 'PF', 689, 0, 0, 0, 1, '', 1),
(243, 5, 0, 'TF', 0, 0, 0, 0, 1, '', 1),
(244, 7, 0, 'AX', 0, 0, 0, 0, 1, 'NNNNN', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_country_lang`
--

CREATE TABLE IF NOT EXISTS `ps_country_lang` (
  `id_country` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`id_country`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ps_country_lang`
--

INSERT INTO `ps_country_lang` (`id_country`, `id_lang`, `name`) VALUES
(1, 1, 'Alemania'),
(2, 1, 'Austria'),
(3, 1, 'Bélgica'),
(4, 1, 'Canadá'),
(5, 1, 'China'),
(6, 1, 'España'),
(7, 1, 'Finlandia'),
(8, 1, 'Francia'),
(9, 1, 'Grecia'),
(10, 1, 'Italia'),
(11, 1, 'Japón'),
(12, 1, 'Luxemburgo'),
(13, 1, 'Países Bajos'),
(14, 1, 'Polonia'),
(15, 1, 'Portugal'),
(16, 1, 'República Checa'),
(17, 1, 'Reino Unido'),
(18, 1, 'Suecia'),
(19, 1, 'Suiza'),
(20, 1, 'Dinamarca'),
(21, 1, 'EE.UU.'),
(22, 1, 'Hong Kong'),
(23, 1, 'Noruega'),
(24, 1, 'Australia'),
(25, 1, 'Singapur'),
(26, 1, 'Irlanda'),
(27, 1, 'Nueva Zelanda'),
(28, 1, 'Corea del Sur'),
(29, 1, 'Israel'),
(30, 1, 'Sudáfrica'),
(31, 1, 'Nigeria'),
(32, 1, 'Costa de Marfil'),
(33, 1, 'Togo'),
(34, 1, 'Bolivia'),
(35, 1, 'Mauricio'),
(36, 1, 'Rumania'),
(37, 1, 'Eslovaquia'),
(38, 1, 'Argelia'),
(39, 1, 'Samoa Americana'),
(40, 1, 'Andorra'),
(41, 1, 'Angola'),
(42, 1, 'Anguila'),
(43, 1, 'Antigua y Barbuda'),
(44, 1, 'Argentina'),
(45, 1, 'Armenia'),
(46, 1, 'Aruba'),
(47, 1, 'Azerbaiyán'),
(48, 1, 'Bahamas'),
(49, 1, 'Bahrein'),
(50, 1, 'Bangladesh'),
(51, 1, 'Barbados'),
(52, 1, 'Belarús'),
(53, 1, 'Belice'),
(54, 1, 'Benin'),
(55, 1, 'Bermudas'),
(56, 1, 'Bhután'),
(57, 1, 'Botswana'),
(58, 1, 'Brasil'),
(59, 1, 'Brunei'),
(60, 1, 'Burkina Faso'),
(61, 1, 'Birmania (Myanmar)'),
(62, 1, 'Burundi'),
(63, 1, 'Camboya'),
(64, 1, 'Camerún'),
(65, 1, 'Cabo Verde'),
(66, 1, 'República Centroafricana'),
(67, 1, 'Chad'),
(68, 1, 'Chile'),
(69, 1, 'Colombia'),
(70, 1, 'Comoras'),
(71, 1, 'Congo, Rep. Dem.'),
(72, 1, 'Congo, República'),
(73, 1, 'Costa Rica'),
(74, 1, 'Croacia'),
(75, 1, 'Cuba'),
(76, 1, 'Chipre'),
(77, 1, 'Djibouti'),
(78, 1, 'Dominica'),
(79, 1, 'República Dominicana'),
(80, 1, 'Timor Oriental'),
(81, 1, 'Ecuador'),
(82, 1, 'Egipto'),
(83, 1, 'El Salvador'),
(84, 1, 'Guinea Ecuatorial'),
(85, 1, 'Eritrea'),
(86, 1, 'Estonia'),
(87, 1, 'Etiopía'),
(88, 1, 'Islas Malvinas'),
(89, 1, 'Islas Feroe'),
(90, 1, 'Fiji'),
(91, 1, 'Gabón'),
(92, 1, 'Gambia'),
(93, 1, 'Georgia'),
(94, 1, 'Ghana'),
(95, 1, 'Granada'),
(96, 1, 'Groenlandia'),
(97, 1, 'Gibraltar'),
(98, 1, 'Guadalupe'),
(99, 1, 'Guam'),
(100, 1, 'Guatemala'),
(101, 1, 'Guernsey'),
(102, 1, 'Guinea'),
(103, 1, 'Guinea-Bissau'),
(104, 1, 'Guyana'),
(105, 1, 'Haití'),
(106, 1, 'Islas Heard y McDonald Islas'),
(107, 1, 'Ciudad del Vaticano'),
(108, 1, 'Honduras'),
(109, 1, 'Islandia'),
(110, 1, 'India'),
(111, 1, 'Indonesia'),
(112, 1, 'Irán'),
(113, 1, 'Iraq'),
(114, 1, 'Man, Isla'),
(115, 1, 'Jamaica'),
(116, 1, 'Jersey'),
(117, 1, 'Jordania'),
(118, 1, 'Kazajstán'),
(119, 1, 'Kenya'),
(120, 1, 'Kiribati'),
(121, 1, 'KOREA, DEM. República de'),
(122, 1, 'Kuwait'),
(123, 1, 'Kirguistán'),
(124, 1, 'Laos'),
(125, 1, 'Letonia'),
(126, 1, 'Líbano'),
(127, 1, 'Lesotho'),
(128, 1, 'Liberia'),
(129, 1, 'Libia'),
(130, 1, 'Liechtenstein'),
(131, 1, 'Lituania'),
(132, 1, 'Macao'),
(133, 1, 'Macedonia'),
(134, 1, 'Madagascar'),
(135, 1, 'Malawi'),
(136, 1, 'Malasia'),
(137, 1, 'Maldivas'),
(138, 1, 'Malí'),
(139, 1, 'Malta'),
(140, 1, 'Marshall, Islas'),
(141, 1, 'Martinica'),
(142, 1, 'Mauritania'),
(143, 1, 'Hungría'),
(144, 1, 'Mayotte'),
(145, 1, 'México'),
(146, 1, 'Micronesia'),
(147, 1, 'Moldavia'),
(148, 1, 'Mónaco'),
(149, 1, 'Mongolia'),
(150, 1, 'Montenegro'),
(151, 1, 'Montserrat'),
(152, 1, 'Marruecos'),
(153, 1, 'Mozambique'),
(154, 1, 'Namibia'),
(155, 1, 'Nauru'),
(156, 1, 'Nepal'),
(157, 1, 'Antillas Neerlandesas'),
(158, 1, 'Nueva Caledonia'),
(159, 1, 'Nicaragua'),
(160, 1, 'Níger'),
(161, 1, 'Niue'),
(162, 1, 'Norfolk Island'),
(163, 1, 'Islas Marianas del Norte'),
(164, 1, 'Omán'),
(165, 1, 'Pakistán'),
(166, 1, 'Palau'),
(167, 1, 'Territorios Palestinos'),
(168, 1, 'Panamá'),
(169, 1, 'Papua Nueva Guinea'),
(170, 1, 'Paraguay'),
(171, 1, 'Perú'),
(172, 1, 'Filipinas'),
(173, 1, 'Pitcairn'),
(174, 1, 'Puerto Rico'),
(175, 1, 'Qatar'),
(176, 1, 'Reunión, Isla de la'),
(177, 1, 'Rusia, Federación de'),
(178, 1, 'Rwanda'),
(179, 1, 'San Bartolomé'),
(180, 1, 'Saint Kitts y Nevis'),
(181, 1, 'Santa Lucía'),
(182, 1, 'Saint Martin'),
(183, 1, 'San Pedro y Miquelón'),
(184, 1, 'San Vicente y las Granadinas'),
(185, 1, 'Samoa'),
(186, 1, 'San Marino'),
(187, 1, 'Santo Tomé y Príncipe'),
(188, 1, 'Arabia Saudita'),
(189, 1, 'Senegal'),
(190, 1, 'Serbia'),
(191, 1, 'Seychelles'),
(192, 1, 'Sierra Leona'),
(193, 1, 'Eslovenia'),
(194, 1, 'Salomón, Islas'),
(195, 1, 'Somalia'),
(196, 1, 'Georgia del Sur e Islas Sandwich del Sur'),
(197, 1, 'Sri Lanka'),
(198, 1, 'Sudán'),
(199, 1, 'Suriname'),
(200, 1, 'Svalbard y Jan Mayen'),
(201, 1, 'Swazilandia'),
(202, 1, 'Siria'),
(203, 1, 'Taiwán'),
(204, 1, 'Tayikistán'),
(205, 1, 'Tanzania'),
(206, 1, 'Tailandia'),
(207, 1, 'Tokelau'),
(208, 1, 'Tonga'),
(209, 1, 'Trinidad y Tobago'),
(210, 1, 'Túnez'),
(211, 1, 'Turquía'),
(212, 1, 'Turkmenistán'),
(213, 1, 'Islas Turcas y Caicos'),
(214, 1, 'Tuvalu'),
(215, 1, 'Uganda'),
(216, 1, 'Ucrania'),
(217, 1, 'Emiratos ÿrabes Unidos'),
(218, 1, 'Uruguay'),
(219, 1, 'Uzbekistán'),
(220, 1, 'Vanuatu'),
(221, 1, 'Venezuela'),
(222, 1, 'Vietnam'),
(223, 1, 'Islas Vírgenes (Británicas)'),
(224, 1, 'Islas Vírgenes (EE.UU.)'),
(225, 1, 'Wallis y Futuna'),
(226, 1, 'Sáhara Occidental'),
(227, 1, 'Yemen'),
(228, 1, 'Zambia'),
(229, 1, 'Zimbabwe'),
(230, 1, 'Albania'),
(231, 1, 'Afganistán'),
(232, 1, 'Antártida'),
(233, 1, 'Bosnia y Herzegovina'),
(234, 1, 'Isla Bouvet'),
(235, 1, 'British Indian Ocean Territory'),
(236, 1, 'Bulgaria'),
(237, 1, 'Caimán, Islas'),
(238, 1, 'Navidad, Isla de'),
(239, 1, 'Cocos (Keeling), Islas'),
(240, 1, 'Cook, Islas'),
(241, 1, 'Francés Guayana'),
(242, 1, 'Polinesia francés'),
(243, 1, 'Territorios del sur francés'),
(244, 1, 'Islas Åland');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_country_shop`
--

CREATE TABLE IF NOT EXISTS `ps_country_shop` (
  `id_country` int(11) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_country`,`id_shop`),
  KEY `id_shop` (`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ps_country_shop`
--

INSERT INTO `ps_country_shop` (`id_country`, `id_shop`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(71, 1),
(72, 1),
(73, 1),
(74, 1),
(75, 1),
(76, 1),
(77, 1),
(78, 1),
(79, 1),
(80, 1),
(81, 1),
(82, 1),
(83, 1),
(84, 1),
(85, 1),
(86, 1),
(87, 1),
(88, 1),
(89, 1),
(90, 1),
(91, 1),
(92, 1),
(93, 1),
(94, 1),
(95, 1),
(96, 1),
(97, 1),
(98, 1),
(99, 1),
(100, 1),
(101, 1),
(102, 1),
(103, 1),
(104, 1),
(105, 1),
(106, 1),
(107, 1),
(108, 1),
(109, 1),
(110, 1),
(111, 1),
(112, 1),
(113, 1),
(114, 1),
(115, 1),
(116, 1),
(117, 1),
(118, 1),
(119, 1),
(120, 1),
(121, 1),
(122, 1),
(123, 1),
(124, 1),
(125, 1),
(126, 1),
(127, 1),
(128, 1),
(129, 1),
(130, 1),
(131, 1),
(132, 1),
(133, 1),
(134, 1),
(135, 1),
(136, 1),
(137, 1),
(138, 1),
(139, 1),
(140, 1),
(141, 1),
(142, 1),
(143, 1),
(144, 1),
(145, 1),
(146, 1),
(147, 1),
(148, 1),
(149, 1),
(150, 1),
(151, 1),
(152, 1),
(153, 1),
(154, 1),
(155, 1),
(156, 1),
(157, 1),
(158, 1),
(159, 1),
(160, 1),
(161, 1),
(162, 1),
(163, 1),
(164, 1),
(165, 1),
(166, 1),
(167, 1),
(168, 1),
(169, 1),
(170, 1),
(171, 1),
(172, 1),
(173, 1),
(174, 1),
(175, 1),
(176, 1),
(177, 1),
(178, 1),
(179, 1),
(180, 1),
(181, 1),
(182, 1),
(183, 1),
(184, 1),
(185, 1),
(186, 1),
(187, 1),
(188, 1),
(189, 1),
(190, 1),
(191, 1),
(192, 1),
(193, 1),
(194, 1),
(195, 1),
(196, 1),
(197, 1),
(198, 1),
(199, 1),
(200, 1),
(201, 1),
(202, 1),
(203, 1),
(204, 1),
(205, 1),
(206, 1),
(207, 1),
(208, 1),
(209, 1),
(210, 1),
(211, 1),
(212, 1),
(213, 1),
(214, 1),
(215, 1),
(216, 1),
(217, 1),
(218, 1),
(219, 1),
(220, 1),
(221, 1),
(222, 1),
(223, 1),
(224, 1),
(225, 1),
(226, 1),
(227, 1),
(228, 1),
(229, 1),
(230, 1),
(231, 1),
(232, 1),
(233, 1),
(234, 1),
(235, 1),
(236, 1),
(237, 1),
(238, 1),
(239, 1),
(240, 1),
(241, 1),
(242, 1),
(243, 1),
(244, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_cronjobs`
--

CREATE TABLE IF NOT EXISTS `ps_cronjobs` (
  `id_cronjob` int(10) NOT NULL AUTO_INCREMENT,
  `id_module` int(10) DEFAULT NULL,
  `description` text,
  `task` text,
  `hour` int(11) DEFAULT '-1',
  `day` int(11) DEFAULT '-1',
  `month` int(11) DEFAULT '-1',
  `day_of_week` int(11) DEFAULT '-1',
  `updated_at` datetime DEFAULT NULL,
  `one_shot` tinyint(1) NOT NULL DEFAULT '0',
  `active` tinyint(1) DEFAULT '0',
  `id_shop` int(11) DEFAULT '0',
  `id_shop_group` int(11) DEFAULT '0',
  PRIMARY KEY (`id_cronjob`),
  KEY `id_module` (`id_module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_currency`
--

CREATE TABLE IF NOT EXISTS `ps_currency` (
  `id_currency` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `iso_code` varchar(3) NOT NULL DEFAULT '0',
  `iso_code_num` varchar(3) NOT NULL DEFAULT '0',
  `sign` varchar(8) NOT NULL,
  `blank` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `format` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `decimals` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `conversion_rate` decimal(13,6) NOT NULL,
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_currency`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `ps_currency`
--

INSERT INTO `ps_currency` (`id_currency`, `name`, `iso_code`, `iso_code_num`, `sign`, `blank`, `format`, `decimals`, `conversion_rate`, `deleted`, `active`) VALUES
(1, 'Peso', 'COP', '170', '$', 1, 2, 1, 1.000000, 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_currency_shop`
--

CREATE TABLE IF NOT EXISTS `ps_currency_shop` (
  `id_currency` int(11) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL,
  `conversion_rate` decimal(13,6) NOT NULL,
  PRIMARY KEY (`id_currency`,`id_shop`),
  KEY `id_shop` (`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ps_currency_shop`
--

INSERT INTO `ps_currency_shop` (`id_currency`, `id_shop`, `conversion_rate`) VALUES
(1, 1, 1.000000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_custombanners`
--

CREATE TABLE IF NOT EXISTS `ps_custombanners` (
  `id_banner` int(10) unsigned NOT NULL,
  `id_shop` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `hook_name` varchar(64) NOT NULL,
  `position` int(10) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `in_carousel` tinyint(1) NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`id_banner`,`id_shop`,`id_lang`),
  KEY `hook_name` (`hook_name`),
  KEY `active` (`active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ps_custombanners`
--

INSERT INTO `ps_custombanners` (`id_banner`, `id_shop`, `id_lang`, `hook_name`, `position`, `active`, `in_carousel`, `content`) VALUES
(5, 1, 1, 'displayFooter', 1, 1, 0, '{"img":"e9fee6b97a1187eca3ca884711eab2048f0595b0.jpg","title":"Foxlore","link":{"type":"custom","href":"http:\\/\\/prestademo.ru\\/foxlore\\/"},"html":"<h4>Foxlore<\\/h4>","class":"col-xs-12 footer_logo"}'),
(6, 1, 1, 'displayFooter', 2, 1, 0, '{"title":"About us","html":"<h4>About us<\\/h4>\\r\\n<div class=\\"toggle-footer\\">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.<\\/div>","class":"col-xs-12 info_block_store col-sm-3 foot_block footer-block"}'),
(7, 1, 1, 'displayTopColumn', 1, 1, 0, '{"img":"e09fc630872176c8d5628498c4b7737c3ea9739c.png","title":"COLLECTION  SUMMER 2015","link":{"type":"custom","href":"http:\\/\\/prestademo.ru\\/foxlore"},"html":"<h3>COLLECTION SUMMER 2015<\\/h3>\\r\\n<p class=\\"text_banner\\">More info<\\/p>","class":"col-sm-6 col-xs-12"}'),
(8, 1, 1, 'displayTopColumn', 2, 1, 0, '{"img":"31488bb9e9f472d004e2ee52e5462a54a812716e.png","title":"LOREM IPSUM SIT AMET","link":{"type":"custom","href":"http:\\/\\/prestademo.ru\\/foxlore\\/"},"html":"<h3>LOREM IPSUM SIT AMET<\\/h3>\\r\\n<p class=\\"text_banner\\">More info<\\/p>","class":"col-sm-6 col-xs-12"}'),
(10, 1, 1, 'displayCustomBanners1', 1, 1, 0, '{"title":"Map","link":"","html":"<p><iframe style=\\"border: 0;\\" src=\\"https:\\/\\/www.google.com\\/maps\\/embed?pb=!1m18!1m12!1m3!1d83998.91163207516!2d2.3470599!3d48.85885894999999!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47e66e1f06e2b70f%3A0x40b82c3688c9460!2sParis%2C+France!5e0!3m2!1sen!2ses!4v1423107537070\\" width=\\"600\\" height=\\"430\\"><\\/iframe><\\/p>"}'),
(11, 1, 1, 'displayBanner', 1, 1, 0, '{"title":"Foxlore","link":"","html":"<h3 class=\\"title_topbanner\\"><strong>Foxlore<\\/strong><\\/h3>","img":"345768a1347921a5c5cc260845414de05ef029f5.jpg"}'),
(12, 1, 1, 'displayCustomBanners3', 1, 1, 0, '{"title":"COLLECTION SUMMER 2015","link":{"type":"custom","href":"http:\\/\\/prestademo.ru\\/foxlore\\/"},"html":"<h4>COLLECTION SUMMER 2015<\\/h4>\\r\\n<p>SOON<\\/p>","img":"6aeadd3189bea705016f04f74da045d500fb1cc0.jpg"}'),
(13, 1, 1, 'displayHome', 2, 1, 0, '{"html":"<div class=\\"wrap-icon-feature first-style\\"> <\\/div>\\r\\n<h4>Lorem ipsum<\\/h4>\\r\\n<div class=\\"description_features\\">Lorem ipsum Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/div>","class":"col-sm-4 col-xs-12"}'),
(14, 1, 1, 'displayHome', 3, 1, 0, '{"html":"<div class=\\"wrap-icon-feature second-style\\"> <\\/div>\\r\\n<h4>Lorem ipsum<\\/h4>\\r\\n<div class=\\"description_features\\">Lorem ipsum Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/div>","class":"col-sm-4 col-xs-12"}'),
(15, 1, 1, 'displayHome', 4, 1, 0, '{"html":"<div class=\\"wrap-icon-feature third-style\\"> <\\/div>\\r\\n<h4>Lorem ipsum<\\/h4>\\r\\n<div class=\\"description_features\\">Lorem ipsum Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/div>","class":"col-sm-4 col-xs-12"}'),
(16, 1, 1, 'displayHome', 1, 1, 0, '{"html":"<h2 class=\\"title_main_section underline_border white_clr\\"><strong>Our features<\\/strong><\\/h2>\\r\\n<h3 class=\\"undertitle_main grey_clr\\">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed.<\\/h3>","class":"col-xs-12"}'),
(17, 1, 1, 'displayHomeCustom', 1, 1, 0, '{"title":"Video","html":"<div id=\\"video-promo-wrap\\"><video width=\\"800\\" height=\\"510\\" id=\\"video-in\\" poster=\\"http:\\/\\/prestademo.ru\\/foxlore\\/themes\\/foxlore\\/css\\/modules\\/custombanners\\/views\\/img\\/video.jpg\\">\\r\\n Your browser does not support the <code>video<\\/code> element. <source src=\\"http:\\/\\/v.theonion.com\\/onionmedia\\/videos\\/videometa\\/2155\\/zen_mp4.mp4\\" type=\\"video\\/mp4\\"><\\/video> <br \\/>\\r\\n<div class=\\"poster-video\\"> <\\/div>\\r\\n<div class=\\"wrap_descr_video\\">\\r\\n<div class=\\"wrap_button_video\\"><span class=\\"one_sh\\">Sh<\\/span> <span class=\\"wrap_play\\"><strong id=\\"play\\"> <em class=\\"font-play74\\">.<\\/em> <\\/strong><\\/span> <span class=\\"two_wreel\\">Wreel<\\/span><\\/div>\\r\\n<\\/div>\\r\\n<div id=\\"stop\\" class=\\"button_down\\"><em class=\\"font-stop\\">.<\\/em><\\/div>\\r\\n<\\/div>"}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_customer`
--

CREATE TABLE IF NOT EXISTS `ps_customer` (
  `id_customer` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_shop_group` int(11) unsigned NOT NULL DEFAULT '1',
  `id_shop` int(11) unsigned NOT NULL DEFAULT '1',
  `id_gender` int(10) unsigned NOT NULL,
  `id_default_group` int(10) unsigned NOT NULL DEFAULT '1',
  `id_lang` int(10) unsigned DEFAULT NULL,
  `id_risk` int(10) unsigned NOT NULL DEFAULT '1',
  `company` varchar(64) DEFAULT NULL,
  `siret` varchar(14) DEFAULT NULL,
  `ape` varchar(5) DEFAULT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(128) NOT NULL,
  `passwd` varchar(32) NOT NULL,
  `last_passwd_gen` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `birthday` date DEFAULT NULL,
  `newsletter` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ip_registration_newsletter` varchar(15) DEFAULT NULL,
  `newsletter_date_add` datetime DEFAULT NULL,
  `optin` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `website` varchar(128) DEFAULT NULL,
  `outstanding_allow_amount` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `show_public_prices` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `max_payment_days` int(10) unsigned NOT NULL DEFAULT '60',
  `secure_key` varchar(32) NOT NULL DEFAULT '-1',
  `note` text,
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_guest` tinyint(1) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_customer`),
  KEY `customer_email` (`email`),
  KEY `customer_login` (`email`,`passwd`),
  KEY `id_customer_passwd` (`id_customer`,`passwd`),
  KEY `id_gender` (`id_gender`),
  KEY `id_shop_group` (`id_shop_group`),
  KEY `id_shop` (`id_shop`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `ps_customer`
--

INSERT INTO `ps_customer` (`id_customer`, `id_shop_group`, `id_shop`, `id_gender`, `id_default_group`, `id_lang`, `id_risk`, `company`, `siret`, `ape`, `firstname`, `lastname`, `email`, `passwd`, `last_passwd_gen`, `birthday`, `newsletter`, `ip_registration_newsletter`, `newsletter_date_add`, `optin`, `website`, `outstanding_allow_amount`, `show_public_prices`, `max_payment_days`, `secure_key`, `note`, `active`, `is_guest`, `deleted`, `date_add`, `date_upd`) VALUES
(1, 1, 1, 1, 3, 1, 0, '', '', '', 'John', 'DOE', 'pub@prestashop.com', 'b1fe18919f8e0378113502ab49856af2', '2015-06-22 09:29:14', '1970-01-15', 1, '', '2013-12-13 08:19:15', 1, '', 0.000000, 0, 0, 'a83f6d1852e17e039163cfb9d0250ba5', '', 1, 0, 0, '2015-06-22 10:29:14', '2015-06-22 10:29:14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_customer_group`
--

CREATE TABLE IF NOT EXISTS `ps_customer_group` (
  `id_customer` int(10) unsigned NOT NULL,
  `id_group` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_customer`,`id_group`),
  KEY `customer_login` (`id_group`),
  KEY `id_customer` (`id_customer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ps_customer_group`
--

INSERT INTO `ps_customer_group` (`id_customer`, `id_group`) VALUES
(1, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_customer_message`
--

CREATE TABLE IF NOT EXISTS `ps_customer_message` (
  `id_customer_message` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_customer_thread` int(11) DEFAULT NULL,
  `id_employee` int(10) unsigned DEFAULT NULL,
  `message` text NOT NULL,
  `file_name` varchar(18) DEFAULT NULL,
  `ip_address` varchar(16) DEFAULT NULL,
  `user_agent` varchar(128) DEFAULT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  `private` tinyint(4) NOT NULL DEFAULT '0',
  `read` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_customer_message`),
  KEY `id_customer_thread` (`id_customer_thread`),
  KEY `id_employee` (`id_employee`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_customer_message_sync_imap`
--

CREATE TABLE IF NOT EXISTS `ps_customer_message_sync_imap` (
  `md5_header` varbinary(32) NOT NULL,
  KEY `md5_header_index` (`md5_header`(4))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_customer_thread`
--

CREATE TABLE IF NOT EXISTS `ps_customer_thread` (
  `id_customer_thread` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_shop` int(11) unsigned NOT NULL DEFAULT '1',
  `id_lang` int(10) unsigned NOT NULL,
  `id_contact` int(10) unsigned NOT NULL,
  `id_customer` int(10) unsigned DEFAULT NULL,
  `id_order` int(10) unsigned DEFAULT NULL,
  `id_product` int(10) unsigned DEFAULT NULL,
  `status` enum('open','closed','pending1','pending2') NOT NULL DEFAULT 'open',
  `email` varchar(128) NOT NULL,
  `token` varchar(12) DEFAULT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_customer_thread`),
  KEY `id_shop` (`id_shop`),
  KEY `id_lang` (`id_lang`),
  KEY `id_contact` (`id_contact`),
  KEY `id_customer` (`id_customer`),
  KEY `id_order` (`id_order`),
  KEY `id_product` (`id_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_customization`
--

CREATE TABLE IF NOT EXISTS `ps_customization` (
  `id_customization` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_product_attribute` int(10) unsigned NOT NULL DEFAULT '0',
  `id_address_delivery` int(10) unsigned NOT NULL DEFAULT '0',
  `id_cart` int(10) unsigned NOT NULL,
  `id_product` int(10) NOT NULL,
  `quantity` int(10) NOT NULL,
  `quantity_refunded` int(11) NOT NULL DEFAULT '0',
  `quantity_returned` int(11) NOT NULL DEFAULT '0',
  `in_cart` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_customization`,`id_cart`,`id_product`,`id_address_delivery`),
  KEY `id_product_attribute` (`id_product_attribute`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_customization_field`
--

CREATE TABLE IF NOT EXISTS `ps_customization_field` (
  `id_customization_field` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_product` int(10) unsigned NOT NULL,
  `type` tinyint(1) NOT NULL,
  `required` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_customization_field`),
  KEY `id_product` (`id_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_customization_field_lang`
--

CREATE TABLE IF NOT EXISTS `ps_customization_field_lang` (
  `id_customization_field` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `id_shop` int(10) unsigned NOT NULL DEFAULT '1',
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id_customization_field`,`id_lang`,`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_customized_data`
--

CREATE TABLE IF NOT EXISTS `ps_customized_data` (
  `id_customization` int(10) unsigned NOT NULL,
  `type` tinyint(1) NOT NULL,
  `index` int(3) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`id_customization`,`type`,`index`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_date_range`
--

CREATE TABLE IF NOT EXISTS `ps_date_range` (
  `id_date_range` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `time_start` datetime NOT NULL,
  `time_end` datetime NOT NULL,
  PRIMARY KEY (`id_date_range`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_delivery`
--

CREATE TABLE IF NOT EXISTS `ps_delivery` (
  `id_delivery` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_shop` int(10) unsigned DEFAULT NULL,
  `id_shop_group` int(10) unsigned DEFAULT NULL,
  `id_carrier` int(10) unsigned NOT NULL,
  `id_range_price` int(10) unsigned DEFAULT NULL,
  `id_range_weight` int(10) unsigned DEFAULT NULL,
  `id_zone` int(10) unsigned NOT NULL,
  `price` decimal(20,6) NOT NULL,
  PRIMARY KEY (`id_delivery`),
  KEY `id_zone` (`id_zone`),
  KEY `id_carrier` (`id_carrier`,`id_zone`),
  KEY `id_range_price` (`id_range_price`),
  KEY `id_range_weight` (`id_range_weight`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `ps_delivery`
--

INSERT INTO `ps_delivery` (`id_delivery`, `id_shop`, `id_shop_group`, `id_carrier`, `id_range_price`, `id_range_weight`, `id_zone`, `price`) VALUES
(1, NULL, NULL, 2, 0, 1, 1, 5.000000),
(2, NULL, NULL, 2, 0, 1, 2, 5.000000),
(3, NULL, NULL, 2, 1, 0, 1, 5.000000),
(4, NULL, NULL, 2, 1, 0, 2, 5.000000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_easycarousels`
--

CREATE TABLE IF NOT EXISTS `ps_easycarousels` (
  `id_carousel` int(10) unsigned NOT NULL,
  `id_shop` int(10) unsigned NOT NULL,
  `hook_name` varchar(128) NOT NULL,
  `group_in_tabs` tinyint(1) NOT NULL DEFAULT '1',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `position` tinyint(1) NOT NULL,
  `carousel_type` varchar(128) NOT NULL,
  `name_multilang` text NOT NULL,
  `general_settings` text NOT NULL,
  `owl_settings` text NOT NULL,
  PRIMARY KEY (`id_carousel`,`id_shop`),
  KEY `hook_name` (`hook_name`),
  KEY `active` (`active`),
  KEY `group_in_tabs` (`group_in_tabs`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ps_easycarousels`
--

INSERT INTO `ps_easycarousels` (`id_carousel`, `id_shop`, `hook_name`, `group_in_tabs`, `active`, `position`, `carousel_type`, `name_multilang`, `general_settings`, `owl_settings`) VALUES
(1, 1, 'easyCarousel2', 1, 1, 1, 'featuredproducts', '{"1":"Popular"}', '{"image_type":"home_default","custom_class":"","items_in_carousel":15,"show_price":1,"show_add_to_cart":1,"show_view_more":1,"show_stickers":1,"show_quick_view":1,"show_stock":1,"rows":1}', '{"i":5,"p":0,"n":1,"a":0}'),
(2, 1, 'easyCarousel2', 1, 1, 2, 'newproducts', '{"1":"New"}', '{"image_type":"home_default","custom_class":"","items_in_carousel":15,"show_price":1,"show_add_to_cart":1,"show_view_more":1,"show_stickers":1,"show_quick_view":1,"show_stock":1,"rows":1}', '{"i":5,"p":0,"n":1,"a":0}'),
(3, 1, 'easyCarousel2', 1, 1, 3, 'bestsellers', '{"1":"Best"}', '{"image_type":"home_default","custom_class":"","items_in_carousel":15,"show_price":1,"show_add_to_cart":1,"show_view_more":1,"show_stickers":1,"show_quick_view":1,"show_stock":1,"rows":1}', '{"i":5,"p":0,"n":1,"a":0}'),
(4, 1, 'easyCarousel1', 0, 1, 1, 'manufacturers', '{"1":"Our parntners"}', '{"id_feature":"0","cat_ids":"","id_m":"0","id_s":"0","custom_class":"","items_in_carousel":"15","rows":"1","image_type":"medium_default","show_price":"1","show_add_to_cart":"1","show_view_more":"1","show_quick_view":"1","show_stock":"1","show_stickers":"1"}', '{"i":"5","p":"0","n":"1","a":"0"}'),
(5, 1, 'displayFooterProduct', 0, 1, 1, 'samecategory', '{"1":"Related products"}', '{"id_feature":"0","cat_ids":"","id_m":"0","id_s":"0","custom_class":"","items_in_carousel":"15","rows":"1","image_type":"home_default","show_price":"1","show_add_to_cart":"1","show_view_more":"1","show_quick_view":"1","show_stock":"1","show_stickers":"1"}', '{"i":"5","p":"0","n":"1","a":"0"}'),
(7, 1, 'displayEasyCarousel2', 1, 1, 1, 'newproducts', '{"1":"New"}', '{"id_feature":"0","cat_ids":"","id_m":"0","id_s":"0","custom_class":"","items_in_carousel":"15","rows":"1","image_type":"home_default","show_price":"1","show_add_to_cart":"1","show_view_more":"1","show_quick_view":"1","show_stock":"1","show_stickers":"1"}', '{"i":"5","p":"0","n":"1","a":"0"}'),
(8, 1, 'displayEasyCarousel2', 1, 1, 2, 'pricesdrop', '{"1":"On-sale"}', '{"id_feature":"0","cat_ids":"","id_m":"0","id_s":"0","custom_class":"","items_in_carousel":"15","rows":"1","image_type":"home_default","show_price":"1","show_add_to_cart":"1","show_view_more":"1","show_quick_view":"1","show_stock":"1","show_stickers":"1"}', '{"i":"5","p":"0","n":"1","a":"0"}'),
(9, 1, 'displayEasyCarousel2', 1, 1, 3, 'featuredproducts', '{"1":"Popular"}', '{"id_feature":"0","cat_ids":"","id_m":"0","id_s":"0","custom_class":"","items_in_carousel":"15","rows":"1","image_type":"home_default","show_price":"1","show_add_to_cart":"1","show_view_more":"1","show_quick_view":"1","show_stock":"1","show_stickers":"1"}', '{"i":"5","p":"0","n":"1","a":"0"}'),
(10, 1, 'displayHomeCustom', 0, 1, 1, 'manufacturers', '{"1":"Our partners"}', '{"id_feature":"0","cat_ids":"","id_m":"0","id_s":"0","custom_class":"","items_in_carousel":"15","rows":"1","image_type":"manufacturer_default","show_price":"1","show_add_to_cart":"1","show_view_more":"1","show_quick_view":"1","show_stock":"1","show_stickers":"1"}', '{"i":"5","p":"0","n":"1","a":"0"}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_employee`
--

CREATE TABLE IF NOT EXISTS `ps_employee` (
  `id_employee` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_profile` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL DEFAULT '0',
  `lastname` varchar(32) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `email` varchar(128) NOT NULL,
  `passwd` varchar(32) NOT NULL,
  `last_passwd_gen` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `stats_date_from` date DEFAULT NULL,
  `stats_date_to` date DEFAULT NULL,
  `stats_compare_from` date DEFAULT NULL,
  `stats_compare_to` date DEFAULT NULL,
  `stats_compare_option` int(1) unsigned NOT NULL DEFAULT '1',
  `preselect_date_range` varchar(32) DEFAULT NULL,
  `bo_color` varchar(32) DEFAULT NULL,
  `bo_theme` varchar(32) DEFAULT NULL,
  `bo_css` varchar(64) DEFAULT NULL,
  `default_tab` int(10) unsigned NOT NULL DEFAULT '0',
  `bo_width` int(10) unsigned NOT NULL DEFAULT '0',
  `bo_menu` tinyint(1) NOT NULL DEFAULT '1',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `optin` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `id_last_order` int(10) unsigned NOT NULL DEFAULT '0',
  `id_last_customer_message` int(10) unsigned NOT NULL DEFAULT '0',
  `id_last_customer` int(10) unsigned NOT NULL DEFAULT '0',
  `last_connection_date` date DEFAULT '0000-00-00',
  PRIMARY KEY (`id_employee`),
  KEY `employee_login` (`email`,`passwd`),
  KEY `id_employee_passwd` (`id_employee`,`passwd`),
  KEY `id_profile` (`id_profile`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `ps_employee`
--

INSERT INTO `ps_employee` (`id_employee`, `id_profile`, `id_lang`, `lastname`, `firstname`, `email`, `passwd`, `last_passwd_gen`, `stats_date_from`, `stats_date_to`, `stats_compare_from`, `stats_compare_to`, `stats_compare_option`, `preselect_date_range`, `bo_color`, `bo_theme`, `bo_css`, `default_tab`, `bo_width`, `bo_menu`, `active`, `optin`, `id_last_order`, `id_last_customer_message`, `id_last_customer`, `last_connection_date`) VALUES
(1, 1, 1, 'Matisses', 'Admnistrador', 'sebastian.castano@arkix.com', '4ae315adee5f1cee02349af44baa3cb6', '2015-06-22 09:29:12', '2015-05-22', '2015-06-22', '0000-00-00', '0000-00-00', 1, NULL, NULL, 'default', 'admin-theme.css', 1, 0, 1, 1, 0, 5, 0, 1, '2015-11-17');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_employee_shop`
--

CREATE TABLE IF NOT EXISTS `ps_employee_shop` (
  `id_employee` int(11) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_employee`,`id_shop`),
  KEY `id_shop` (`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ps_employee_shop`
--

INSERT INTO `ps_employee_shop` (`id_employee`, `id_shop`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_feature`
--

CREATE TABLE IF NOT EXISTS `ps_feature` (
  `id_feature` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `position` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_feature`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `ps_feature`
--

INSERT INTO `ps_feature` (`id_feature`, `position`) VALUES
(1, 0),
(2, 1),
(3, 2),
(4, 3),
(5, 4),
(6, 5),
(7, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_feature_lang`
--

CREATE TABLE IF NOT EXISTS `ps_feature_lang` (
  `id_feature` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id_feature`,`id_lang`),
  KEY `id_lang` (`id_lang`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ps_feature_lang`
--

INSERT INTO `ps_feature_lang` (`id_feature`, `id_lang`, `name`) VALUES
(1, 1, 'Altura'),
(2, 1, 'Anchura'),
(5, 1, 'Composición'),
(6, 1, 'Estilos'),
(4, 1, 'Peso'),
(3, 1, 'Profundidad'),
(7, 1, 'Propiedades');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_feature_product`
--

CREATE TABLE IF NOT EXISTS `ps_feature_product` (
  `id_feature` int(10) unsigned NOT NULL,
  `id_product` int(10) unsigned NOT NULL,
  `id_feature_value` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_feature`,`id_product`),
  KEY `id_feature_value` (`id_feature_value`),
  KEY `id_product` (`id_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ps_feature_product`
--

INSERT INTO `ps_feature_product` (`id_feature`, `id_product`, `id_feature_value`) VALUES
(5, 6, 1),
(5, 7, 1),
(5, 4, 3),
(5, 5, 3),
(5, 1, 5),
(5, 2, 5),
(5, 3, 5),
(6, 1, 11),
(6, 2, 11),
(6, 5, 11),
(6, 3, 13),
(6, 6, 13),
(6, 7, 13),
(6, 4, 16),
(7, 1, 17),
(7, 2, 17),
(7, 3, 18),
(7, 4, 19),
(7, 6, 19),
(7, 7, 20),
(7, 5, 21);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_feature_shop`
--

CREATE TABLE IF NOT EXISTS `ps_feature_shop` (
  `id_feature` int(11) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_feature`,`id_shop`),
  KEY `id_shop` (`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ps_feature_shop`
--

INSERT INTO `ps_feature_shop` (`id_feature`, `id_shop`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_feature_value`
--

CREATE TABLE IF NOT EXISTS `ps_feature_value` (
  `id_feature_value` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_feature` int(10) unsigned NOT NULL,
  `custom` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`id_feature_value`),
  KEY `feature` (`id_feature`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=34 ;

--
-- Volcado de datos para la tabla `ps_feature_value`
--

INSERT INTO `ps_feature_value` (`id_feature_value`, `id_feature`, `custom`) VALUES
(1, 5, 0),
(2, 5, 0),
(3, 5, 0),
(4, 5, 0),
(5, 5, 0),
(6, 5, 0),
(7, 5, 0),
(8, 5, 0),
(9, 5, 0),
(10, 6, 0),
(11, 6, 0),
(12, 6, 0),
(13, 6, 0),
(14, 6, 0),
(15, 6, 0),
(16, 6, 0),
(17, 7, 0),
(18, 7, 0),
(19, 7, 0),
(20, 7, 0),
(21, 7, 0),
(22, 1, 1),
(23, 2, 1),
(24, 4, 1),
(25, 3, 1),
(26, 1, 1),
(27, 2, 1),
(28, 4, 1),
(29, 3, 1),
(30, 1, 1),
(31, 2, 1),
(32, 4, 1),
(33, 3, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_feature_value_lang`
--

CREATE TABLE IF NOT EXISTS `ps_feature_value_lang` (
  `id_feature_value` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_feature_value`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ps_feature_value_lang`
--

INSERT INTO `ps_feature_value_lang` (`id_feature_value`, `id_lang`, `value`) VALUES
(1, 1, 'Poliéster'),
(2, 1, 'Lana'),
(3, 1, 'Viscosa'),
(4, 1, 'Elastano'),
(5, 1, 'Algodón'),
(6, 1, 'Seda'),
(7, 1, 'Ante'),
(8, 1, 'Paja'),
(9, 1, 'Piel'),
(10, 1, 'Clásico'),
(11, 1, 'Informal'),
(12, 1, 'Militar'),
(13, 1, 'Femenino'),
(14, 1, 'Rockero'),
(15, 1, 'Básico'),
(16, 1, 'Elegante'),
(17, 1, 'Manga corta'),
(18, 1, 'Vestido colorido'),
(19, 1, 'Vestido corto'),
(20, 1, 'Vestido a media pierna'),
(21, 1, 'Vestido largo'),
(22, 1, '2.75 in'),
(23, 1, '2.06 in'),
(24, 1, '49.2 g'),
(25, 1, '0.26 in'),
(26, 1, '1.07 in'),
(27, 1, '1.62 in'),
(28, 1, '15.5 g'),
(29, 1, '0.41 in (clip included)'),
(30, 1, '4.33 in'),
(31, 1, '2.76 in'),
(32, 1, '120g'),
(33, 1, '0.31 in');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_gender`
--

CREATE TABLE IF NOT EXISTS `ps_gender` (
  `id_gender` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_gender`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `ps_gender`
--

INSERT INTO `ps_gender` (`id_gender`, `type`) VALUES
(1, 0),
(2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_gender_lang`
--

CREATE TABLE IF NOT EXISTS `ps_gender_lang` (
  `id_gender` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id_gender`,`id_lang`),
  KEY `id_gender` (`id_gender`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ps_gender_lang`
--

INSERT INTO `ps_gender_lang` (`id_gender`, `id_lang`, `name`) VALUES
(1, 1, 'Sr.'),
(2, 1, 'Sra.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_group`
--

CREATE TABLE IF NOT EXISTS `ps_group` (
  `id_group` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reduction` decimal(17,2) NOT NULL DEFAULT '0.00',
  `price_display_method` tinyint(4) NOT NULL DEFAULT '0',
  `show_prices` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_group`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `ps_group`
--

INSERT INTO `ps_group` (`id_group`, `reduction`, `price_display_method`, `show_prices`, `date_add`, `date_upd`) VALUES
(1, 0.00, 0, 1, '2015-06-22 10:29:04', '2015-06-22 10:29:04'),
(2, 0.00, 0, 1, '2015-06-22 10:29:04', '2015-06-22 10:29:04'),
(3, 0.00, 0, 1, '2015-06-22 10:29:04', '2015-06-22 10:29:04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_group_lang`
--

CREATE TABLE IF NOT EXISTS `ps_group_lang` (
  `id_group` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id_group`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ps_group_lang`
--

INSERT INTO `ps_group_lang` (`id_group`, `id_lang`, `name`) VALUES
(1, 1, 'Visitante'),
(2, 1, 'Invitado'),
(3, 1, 'Cliente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_group_reduction`
--

CREATE TABLE IF NOT EXISTS `ps_group_reduction` (
  `id_group_reduction` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `id_group` int(10) unsigned NOT NULL,
  `id_category` int(10) unsigned NOT NULL,
  `reduction` decimal(4,3) NOT NULL,
  PRIMARY KEY (`id_group_reduction`),
  UNIQUE KEY `id_group` (`id_group`,`id_category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_group_shop`
--

CREATE TABLE IF NOT EXISTS `ps_group_shop` (
  `id_group` int(11) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_group`,`id_shop`),
  KEY `id_shop` (`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ps_group_shop`
--

INSERT INTO `ps_group_shop` (`id_group`, `id_shop`) VALUES
(1, 1),
(2, 1),
(3, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_guest`
--

CREATE TABLE IF NOT EXISTS `ps_guest` (
  `id_guest` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_operating_system` int(10) unsigned DEFAULT NULL,
  `id_web_browser` int(10) unsigned DEFAULT NULL,
  `id_customer` int(10) unsigned DEFAULT NULL,
  `javascript` tinyint(1) DEFAULT '0',
  `screen_resolution_x` smallint(5) unsigned DEFAULT NULL,
  `screen_resolution_y` smallint(5) unsigned DEFAULT NULL,
  `screen_color` tinyint(3) unsigned DEFAULT NULL,
  `sun_java` tinyint(1) DEFAULT NULL,
  `adobe_flash` tinyint(1) DEFAULT NULL,
  `adobe_director` tinyint(1) DEFAULT NULL,
  `apple_quicktime` tinyint(1) DEFAULT NULL,
  `real_player` tinyint(1) DEFAULT NULL,
  `windows_media` tinyint(1) DEFAULT NULL,
  `accept_language` varchar(8) DEFAULT NULL,
  `mobile_theme` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_guest`),
  KEY `id_customer` (`id_customer`),
  KEY `id_operating_system` (`id_operating_system`),
  KEY `id_web_browser` (`id_web_browser`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Volcado de datos para la tabla `ps_guest`
--

INSERT INTO `ps_guest` (`id_guest`, `id_operating_system`, `id_web_browser`, `id_customer`, `javascript`, `screen_resolution_x`, `screen_resolution_y`, `screen_color`, `sun_java`, `adobe_flash`, `adobe_director`, `apple_quicktime`, `real_player`, `windows_media`, `accept_language`, `mobile_theme`) VALUES
(1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0),
(2, 0, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'es', 0),
(3, 0, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'es', 0),
(4, 3, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0),
(5, 3, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'en', 0),
(6, 0, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'es', 0),
(7, 0, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'es', 0),
(8, 0, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0),
(9, 3, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0),
(10, 3, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'es', 0),
(11, 3, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'es', 0),
(12, 3, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0),
(13, 4, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'es', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_homeslider`
--

CREATE TABLE IF NOT EXISTS `ps_homeslider` (
  `id_homeslider_slides` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_shop` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_homeslider_slides`,`id_shop`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `ps_homeslider`
--

INSERT INTO `ps_homeslider` (`id_homeslider_slides`, `id_shop`) VALUES
(1, 1),
(2, 1),
(3, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_homeslider_slides`
--

CREATE TABLE IF NOT EXISTS `ps_homeslider_slides` (
  `id_homeslider_slides` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `position` int(10) unsigned NOT NULL DEFAULT '0',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_homeslider_slides`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `ps_homeslider_slides`
--

INSERT INTO `ps_homeslider_slides` (`id_homeslider_slides`, `position`, `active`) VALUES
(1, 0, 1),
(2, 0, 1),
(3, 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_homeslider_slides_lang`
--

CREATE TABLE IF NOT EXISTS `ps_homeslider_slides_lang` (
  `id_homeslider_slides` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `legend` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`id_homeslider_slides`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ps_homeslider_slides_lang`
--

INSERT INTO `ps_homeslider_slides_lang` (`id_homeslider_slides`, `id_lang`, `title`, `description`, `legend`, `url`, `image`) VALUES
(1, 1, 'Slide 1', '<h2>ACCESS RIOS</h2>\n<p>2015</p>\n<p><button class="btn btn-default" type="button">Shop now !</button></p>', 'Slide 1', 'http://www.prestashop.com/?utm_source=back-office&utm_medium=v16_homeslider&utm_campaign=back-office-ES&utm_content=download', '47dac4c55b8e068788281d1aa1e03a4c309bcd75_slider-1.jpg'),
(2, 1, 'Slide 2', '<h2>EXCEPTEUR<br />OCCAECAT</h2>\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin tristique in tortor et dignissim. Quisque non tempor leo. Maecenas egestas sem elit</p>\n<p><button class="btn btn-default" type="button">Shop now !</button></p>', 'Slide 2', 'http://www.prestashop.com/?utm_source=back-office&utm_medium=v16_homeslider&utm_campaign=back-office-ES&utm_content=download', '6ffba4208a2372cd2d84e7dd83acc4225f81059b_slider-2.jpg'),
(3, 1, 'Slide 3', '<h2>EXCEPTEUR<br />OCCAECAT</h2>\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin tristique in tortor et dignissim. Quisque non tempor leo. Maecenas egestas sem elit</p>\n<p><button class="btn btn-default" type="button">Shop now !</button></p>', 'Slide 3', 'http://www.prestashop.com/?utm_source=back-office&utm_medium=v16_homeslider&utm_campaign=back-office-ES&utm_content=download', '678213b53b15ceb08a49370ee3181c72c2b410d3_slider-3.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_hook`
--

CREATE TABLE IF NOT EXISTS `ps_hook` (
  `id_hook` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `title` varchar(64) NOT NULL,
  `description` text,
  `position` tinyint(1) NOT NULL DEFAULT '1',
  `live_edit` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_hook`),
  UNIQUE KEY `hook_name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=180 ;

--
-- Volcado de datos para la tabla `ps_hook`
--

INSERT INTO `ps_hook` (`id_hook`, `name`, `title`, `description`, `position`, `live_edit`) VALUES
(1, 'displayPayment', 'Payment', 'This hook displays new elements on the payment page', 1, 1),
(2, 'actionValidateOrder', 'New orders', '', 1, 0),
(3, 'displayMaintenance', 'Maintenance Page', 'This hook displays new elements on the maintenance page', 1, 0),
(4, 'actionPaymentConfirmation', 'Payment confirmation', 'This hook displays new elements after the payment is validated', 1, 0),
(5, 'displayPaymentReturn', 'Payment return', '', 1, 0),
(6, 'actionUpdateQuantity', 'Quantity update', 'Quantity is updated only when a customer effectively places their order', 1, 0),
(7, 'displayRightColumn', 'Right column blocks', 'This hook displays new elements in the right-hand column', 1, 1),
(8, 'displayLeftColumn', 'Left column blocks', 'This hook displays new elements in the left-hand column', 1, 1),
(9, 'displayHome', 'Homepage content', 'This hook displays new elements on the homepage', 1, 1),
(10, 'Header', 'Pages html head section', 'This hook adds additional elements in the head section of your pages (head section of html)', 1, 0),
(11, 'actionCartSave', 'Cart creation and update', 'This hook is displayed when a product is added to the cart or if the cart''s content is modified', 1, 0),
(12, 'actionAuthentication', 'Successful customer authentication', 'This hook is displayed after a customer successfully signs in', 1, 0),
(13, 'actionProductAdd', 'Product creation', 'This hook is displayed after a product is created', 1, 0),
(14, 'actionProductUpdate', 'Product update', 'This hook is displayed after a product has been updated', 1, 0),
(15, 'displayTop', 'Top of pages', 'This hook displays additional elements at the top of your pages', 1, 0),
(16, 'displayRightColumnProduct', 'New elements on the product page (right column)', 'This hook displays new elements in the right-hand column of the product page', 1, 0),
(17, 'actionProductDelete', 'Product deletion', 'This hook is called when a product is deleted', 1, 0),
(18, 'displayFooterProduct', 'Product footer', 'This hook adds new blocks under the product''s description', 1, 1),
(19, 'displayInvoice', 'Invoice', 'This hook displays new blocks on the invoice (order)', 1, 0),
(20, 'actionOrderStatusUpdate', 'Order status update - Event', 'This hook launches modules when the status of an order changes.', 1, 0),
(21, 'displayAdminOrder', 'Display new elements in the Back Office, tab AdminOrder', 'This hook launches modules when the AdminOrder tab is displayed in the Back Office', 1, 0),
(22, 'displayAdminOrderTabOrder', 'Display new elements in Back Office, AdminOrder, panel Order', 'This hook launches modules when the AdminOrder tab is displayed in the Back Office and extends / override Order panel tabs', 1, 0),
(23, 'displayAdminOrderTabShip', 'Display new elements in Back Office, AdminOrder, panel Shipping', 'This hook launches modules when the AdminOrder tab is displayed in the Back Office and extends / override Shipping panel tabs', 1, 0),
(24, 'displayAdminOrderContentOrder', 'Display new elements in Back Office, AdminOrder, panel Order', 'This hook launches modules when the AdminOrder tab is displayed in the Back Office and extends / override Order panel content', 1, 0),
(25, 'displayAdminOrderContentShip', 'Display new elements in Back Office, AdminOrder, panel Shipping', 'This hook launches modules when the AdminOrder tab is displayed in the Back Office and extends / override Shipping panel content', 1, 0),
(26, 'displayFooter', 'Footer', 'This hook displays new blocks in the footer', 1, 0),
(27, 'displayPDFInvoice', 'PDF Invoice', 'This hook allows you to display additional information on PDF invoices', 1, 0),
(28, 'displayAdminCustomers', 'Display new elements in the Back Office, tab AdminCustomers', 'This hook launches modules when the AdminCustomers tab is displayed in the Back Office', 1, 0),
(29, 'displayOrderConfirmation', 'Order confirmation page', 'This hook is called within an order''s confirmation page', 1, 0),
(30, 'actionCustomerAccountAdd', 'Successful customer account creation', 'This hook is called when a new customer creates an account successfully', 1, 0),
(31, 'displayCustomerAccount', 'Customer account displayed in Front Office', 'This hook displays new elements on the customer account page', 1, 0),
(32, 'displayCustomerIdentityForm', 'Customer identity form displayed in Front Office', 'This hook displays new elements on the form to update a customer identity', 1, 0),
(33, 'actionOrderSlipAdd', 'Order slip creation', 'This hook is called when a new credit slip is added regarding client order', 1, 0),
(34, 'displayProductTab', 'Tabs on product page', 'This hook is called on the product page''s tab', 1, 0),
(35, 'displayProductTabContent', 'Tabs content on the product page', 'This hook is called on the product page''s tab', 1, 0),
(36, 'displayShoppingCartFooter', 'Shopping cart footer', 'This hook displays some specific information on the shopping cart''s page', 1, 0),
(37, 'displayCustomerAccountForm', 'Customer account creation form', 'This hook displays some information on the form to create a customer account', 1, 0),
(38, 'displayAdminStatsModules', 'Stats - Modules', '', 1, 0),
(39, 'displayAdminStatsGraphEngine', 'Graph engines', '', 1, 0),
(40, 'actionOrderReturn', 'Returned product', 'This hook is displayed when a customer returns a product ', 1, 0),
(41, 'displayProductButtons', 'Product page actions', 'This hook adds new action buttons on the product page', 1, 0),
(42, 'displayBackOfficeHome', 'Administration panel homepage', 'This hook is displayed on the admin panel''s homepage', 1, 0),
(43, 'displayAdminStatsGridEngine', 'Grid engines', '', 1, 0),
(44, 'actionWatermark', 'Watermark', '', 1, 0),
(45, 'actionProductCancel', 'Product cancelled', 'This hook is called when you cancel a product in an order', 1, 0),
(46, 'displayLeftColumnProduct', 'New elements on the product page (left column)', 'This hook displays new elements in the left-hand column of the product page', 1, 0),
(47, 'actionProductOutOfStock', 'Out-of-stock product', 'This hook displays new action buttons if a product is out of stock', 1, 0),
(48, 'actionProductAttributeUpdate', 'Product attribute update', 'This hook is displayed when a product''s attribute is updated', 1, 0),
(49, 'displayCarrierList', 'Extra carrier (module mode)', '', 1, 0),
(50, 'displayShoppingCart', 'Shopping cart - Additional button', 'This hook displays new action buttons within the shopping cart', 1, 0),
(51, 'actionSearch', 'Search', '', 1, 0),
(52, 'displayBeforePayment', 'Redirect during the order process', 'This hook redirects the user to the module instead of displaying payment modules', 1, 0),
(53, 'actionCarrierUpdate', 'Carrier Update', 'This hook is called when a carrier is updated', 1, 0),
(54, 'actionOrderStatusPostUpdate', 'Post update of order status', '', 1, 0),
(55, 'displayCustomerAccountFormTop', 'Block above the form for create an account', 'This hook is displayed above the customer''s account creation form', 1, 0),
(56, 'displayBackOfficeHeader', 'Administration panel header', 'This hook is displayed in the header of the admin panel', 1, 0),
(57, 'displayBackOfficeTop', 'Administration panel hover the tabs', 'This hook is displayed on the roll hover of the tabs within the admin panel', 1, 0),
(58, 'displayBackOfficeFooter', 'Administration panel footer', 'This hook is displayed within the admin panel''s footer', 1, 0),
(59, 'actionProductAttributeDelete', 'Product attribute deletion', 'This hook is displayed when a product''s attribute is deleted', 1, 0),
(60, 'actionCarrierProcess', 'Carrier process', '', 1, 0),
(61, 'actionOrderDetail', 'Order detail', 'This hook is used to set the follow-up in Smarty when an order''s detail is called', 1, 0),
(62, 'displayBeforeCarrier', 'Before carriers list', 'This hook is displayed before the carrier list in Front Office', 1, 0),
(63, 'displayOrderDetail', 'Order detail', 'This hook is displayed within the order''s details in Front Office', 1, 0),
(64, 'actionPaymentCCAdd', 'Payment CC added', '', 1, 0),
(65, 'displayProductComparison', 'Extra product comparison', '', 1, 0),
(66, 'actionCategoryAdd', 'Category creation', 'This hook is displayed when a category is created', 1, 0),
(67, 'actionCategoryUpdate', 'Category modification', 'This hook is displayed when a category is modified', 1, 0),
(68, 'actionCategoryDelete', 'Category deletion', 'This hook is displayed when a category is deleted', 1, 0),
(69, 'actionBeforeAuthentication', 'Before authentication', 'This hook is displayed before the customer''s authentication', 1, 0),
(70, 'displayPaymentTop', 'Top of payment page', 'This hook is displayed at the top of the payment page', 1, 0),
(71, 'actionHtaccessCreate', 'After htaccess creation', 'This hook is displayed after the htaccess creation', 1, 0),
(72, 'actionAdminMetaSave', 'After saving the configuration in AdminMeta', 'This hook is displayed after saving the configuration in AdminMeta', 1, 0),
(73, 'displayAttributeGroupForm', 'Add fields to the form ''attribute group''', 'This hook adds fields to the form ''attribute group''', 1, 0),
(74, 'actionAttributeGroupSave', 'Saving an attribute group', 'This hook is called while saving an attributes group', 1, 0),
(75, 'actionAttributeGroupDelete', 'Deleting attribute group', 'This hook is called while deleting an attributes  group', 1, 0),
(76, 'displayFeatureForm', 'Add fields to the form ''feature''', 'This hook adds fields to the form ''feature''', 1, 0),
(77, 'actionFeatureSave', 'Saving attributes'' features', 'This hook is called while saving an attributes features', 1, 0),
(78, 'actionFeatureDelete', 'Deleting attributes'' features', 'This hook is called while deleting an attributes features', 1, 0),
(79, 'actionProductSave', 'Saving products', 'This hook is called while saving products', 1, 0),
(80, 'actionProductListOverride', 'Assign a products list to a category', 'This hook assigns a products list to a category', 1, 0),
(81, 'displayAttributeGroupPostProcess', 'On post-process in admin attribute group', 'This hook is called on post-process in admin attribute group', 1, 0),
(82, 'displayFeaturePostProcess', 'On post-process in admin feature', 'This hook is called on post-process in admin feature', 1, 0),
(83, 'displayFeatureValueForm', 'Add fields to the form ''feature value''', 'This hook adds fields to the form ''feature value''', 1, 0),
(84, 'displayFeatureValuePostProcess', 'On post-process in admin feature value', 'This hook is called on post-process in admin feature value', 1, 0),
(85, 'actionFeatureValueDelete', 'Deleting attributes'' features'' values', 'This hook is called while deleting an attributes features value', 1, 0),
(86, 'actionFeatureValueSave', 'Saving an attributes features value', 'This hook is called while saving an attributes features value', 1, 0),
(87, 'displayAttributeForm', 'Add fields to the form ''attribute value''', 'This hook adds fields to the form ''attribute value''', 1, 0),
(88, 'actionAttributePostProcess', 'On post-process in admin feature value', 'This hook is called on post-process in admin feature value', 1, 0),
(89, 'actionAttributeDelete', 'Deleting an attributes features value', 'This hook is called while deleting an attributes features value', 1, 0),
(90, 'actionAttributeSave', 'Saving an attributes features value', 'This hook is called while saving an attributes features value', 1, 0),
(91, 'actionTaxManager', 'Tax Manager Factory', '', 1, 0),
(92, 'displayMyAccountBlock', 'My account block', 'This hook displays extra information within the ''my account'' block"', 1, 0),
(93, 'actionModuleInstallBefore', 'actionModuleInstallBefore', '', 1, 0),
(94, 'actionModuleInstallAfter', 'actionModuleInstallAfter', '', 1, 0),
(95, 'displayHomeTab', 'Home Page Tabs', 'This hook displays new elements on the homepage tabs', 1, 1),
(96, 'displayHomeTabContent', 'Home Page Tabs Content', 'This hook displays new elements on the homepage tabs content', 1, 1),
(97, 'displayTopColumn', 'Top column blocks', 'This hook displays new elements in the top of columns', 1, 1),
(98, 'displayBackOfficeCategory', 'Display new elements in the Back Office, tab AdminCategories', 'This hook launches modules when the AdminCategories tab is displayed in the Back Office', 1, 0),
(99, 'displayProductListFunctionalButtons', 'Display new elements in the Front Office, products list', 'This hook launches modules when the products list is displayed in the Front Office', 1, 0),
(100, 'displayNav', 'Navigation', '', 1, 1),
(101, 'displayOverrideTemplate', 'Change the default template of current controller', '', 1, 0),
(102, 'actionObjectProductUpdateAfter', 'actionObjectProductUpdateAfter', '', 0, 0),
(103, 'actionObjectProductDeleteAfter', 'actionObjectProductDeleteAfter', '', 0, 0),
(104, 'displayCompareExtraInformation', 'displayCompareExtraInformation', '', 1, 1),
(105, 'displayBanner', 'displayBanner', '', 1, 1),
(106, 'actionObjectLanguageAddAfter', 'actionObjectLanguageAddAfter', '', 0, 0),
(107, 'displayPaymentEU', 'displayPaymentEU', '', 1, 1),
(108, 'actionCartListOverride', 'actionCartListOverride', '', 0, 0),
(109, 'actionAdminMetaControllerUpdate_optionsBefore', 'actionAdminMetaControllerUpdate_optionsBefore', '', 0, 0),
(110, 'actionAdminLanguagesControllerStatusBefore', 'actionAdminLanguagesControllerStatusBefore', '', 0, 0),
(111, 'actionObjectCmsUpdateAfter', 'actionObjectCmsUpdateAfter', '', 0, 0),
(112, 'actionObjectCmsDeleteAfter', 'actionObjectCmsDeleteAfter', '', 0, 0),
(113, 'actionShopDataDuplication', 'actionShopDataDuplication', '', 0, 0),
(114, 'actionAdminStoresControllerUpdate_optionsAfter', 'actionAdminStoresControllerUpdate_optionsAfter', '', 0, 0),
(115, 'actionObjectManufacturerDeleteAfter', 'actionObjectManufacturerDeleteAfter', '', 0, 0),
(116, 'actionObjectManufacturerAddAfter', 'actionObjectManufacturerAddAfter', '', 0, 0),
(117, 'actionObjectManufacturerUpdateAfter', 'actionObjectManufacturerUpdateAfter', '', 0, 0),
(119, 'actionModuleRegisterHookAfter', 'actionModuleRegisterHookAfter', '', 0, 0),
(120, 'actionModuleUnRegisterHookAfter', 'actionModuleUnRegisterHookAfter', '', 0, 0),
(121, 'displayMyAccountBlockfooter', 'My account block', 'Display extra informations inside the "my account" block', 1, 0),
(122, 'displayMobileTopSiteMap', 'displayMobileTopSiteMap', '', 1, 1),
(123, 'actionObjectSupplierDeleteAfter', 'actionObjectSupplierDeleteAfter', '', 0, 0),
(124, 'actionObjectSupplierAddAfter', 'actionObjectSupplierAddAfter', '', 0, 0),
(125, 'actionObjectSupplierUpdateAfter', 'actionObjectSupplierUpdateAfter', '', 0, 0),
(126, 'actionObjectCategoryUpdateAfter', 'actionObjectCategoryUpdateAfter', '', 0, 0),
(127, 'actionObjectCategoryDeleteAfter', 'actionObjectCategoryDeleteAfter', '', 0, 0),
(128, 'actionObjectCategoryAddAfter', 'actionObjectCategoryAddAfter', '', 0, 0),
(129, 'actionObjectCmsAddAfter', 'actionObjectCmsAddAfter', '', 0, 0),
(130, 'actionObjectProductAddAfter', 'actionObjectProductAddAfter', '', 0, 0),
(131, 'dashboardZoneOne', 'dashboardZoneOne', '', 0, 0),
(132, 'dashboardData', 'dashboardData', '', 0, 0),
(133, 'actionObjectOrderAddAfter', 'actionObjectOrderAddAfter', '', 0, 0),
(134, 'actionObjectCustomerAddAfter', 'actionObjectCustomerAddAfter', '', 0, 0),
(135, 'actionObjectCustomerMessageAddAfter', 'actionObjectCustomerMessageAddAfter', '', 0, 0),
(136, 'actionObjectCustomerThreadAddAfter', 'actionObjectCustomerThreadAddAfter', '', 0, 0),
(137, 'actionObjectOrderReturnAddAfter', 'actionObjectOrderReturnAddAfter', '', 0, 0),
(138, 'actionAdminControllerSetMedia', 'actionAdminControllerSetMedia', '', 0, 0),
(139, 'dashboardZoneTwo', 'dashboardZoneTwo', '', 0, 0),
(140, 'displayProductListReviews', 'displayProductListReviews', '', 1, 1),
(141, 'actionAdminMetaControllerUpdate_optionsAfter', 'actionAdminMetaControllerUpdate_optionsAfter', '', 0, 0),
(142, 'actionAdminPerformanceControllerSaveAfter', 'actionAdminPerformanceControllerSaveAfter', '', 0, 0),
(143, 'actionObjectCarrierAddAfter', 'actionObjectCarrierAddAfter', '', 0, 0),
(144, 'actionObjectContactAddAfter', 'actionObjectContactAddAfter', '', 0, 0),
(145, 'actionAdminThemesControllerUpdate_optionsAfter', 'actionAdminThemesControllerUpdate_optionsAfter', '', 0, 0),
(146, 'actionObjectShopUpdateAfter', 'actionObjectShopUpdateAfter', '', 0, 0),
(147, 'actionAdminPreferencesControllerUpdate_optionsAfter', 'actionAdminPreferencesControllerUpdate_optionsAfter', '', 0, 0),
(148, 'actionObjectShopAddAfter', 'actionObjectShopAddAfter', '', 0, 0),
(149, 'actionObjectShopGroupAddAfter', 'actionObjectShopGroupAddAfter', '', 0, 0),
(150, 'actionObjectCartAddAfter', 'actionObjectCartAddAfter', '', 0, 0),
(151, 'actionObjectEmployeeAddAfter', 'actionObjectEmployeeAddAfter', '', 0, 0),
(152, 'actionObjectImageAddAfter', 'actionObjectImageAddAfter', '', 0, 0),
(153, 'actionObjectCartRuleAddAfter', 'actionObjectCartRuleAddAfter', '', 0, 0),
(154, 'actionAdminStoresControllerSaveAfter', 'actionAdminStoresControllerSaveAfter', '', 0, 0),
(155, 'actionAdminWebserviceControllerSaveAfter', 'actionAdminWebserviceControllerSaveAfter', '', 0, 0),
(156, 'footerTop', 'footerTop', '', 0, 0),
(157, 'testimonials1', 'testimonials1', '', 0, 0),
(158, 'testimonials2', 'testimonials2', '', 0, 0),
(159, 'testimonials3', 'testimonials3', '', 0, 0),
(160, 'moduleRoutes', 'moduleRoutes', '', 0, 0),
(161, 'easyCarousel2', 'easyCarousel2', '', 0, 0),
(162, 'easyCarousel1', 'easyCarousel1', '', 0, 0),
(163, 'displayEasyCarousel2', 'displayEasyCarousel2', '', 1, 1),
(164, 'displayHomeCustom', 'displayHomeCustom', '', 1, 1),
(165, 'displayCustomBanners1', 'displayCustomBanners1', '', 1, 1),
(166, 'displayCustomBanners2', 'displayCustomBanners2', '', 1, 1),
(167, 'displayCustomBanners3', 'displayCustomBanners3', '', 1, 1),
(168, 'displayMatWishlist', 'displayMatWishlist', '', 1, 1),
(169, 'displayMatMegamenu', 'displayMatMegamenu', '', 1, 1),
(170, 'news', 'news', '', 0, 0),
(171, 'displayMatBuscador', 'displayMatBuscador', '', 1, 1),
(172, 'displayMatRedes', 'displayMatRedes', '', 1, 1),
(173, 'displayMatUser', 'displayMatUser', '', 1, 1),
(174, 'displayMatCart', 'displayMatCart', '', 1, 1),
(175, 'displayMatSlider', 'displayMatSlider', '', 1, 1),
(176, 'displayMatShowesProducts', 'displayMatShowesProducts', '', 1, 1),
(177, 'displayMatNewProducts', 'displayMatNewProducts', '', 1, 1),
(178, 'displayMatBlog', 'displayMatBlog', '', 1, 1),
(179, 'displayMatNewsletter', 'displayMatNewsletter', '', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_hook_alias`
--

CREATE TABLE IF NOT EXISTS `ps_hook_alias` (
  `id_hook_alias` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `alias` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`id_hook_alias`),
  UNIQUE KEY `alias` (`alias`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=87 ;

--
-- Volcado de datos para la tabla `ps_hook_alias`
--

INSERT INTO `ps_hook_alias` (`id_hook_alias`, `alias`, `name`) VALUES
(1, 'payment', 'displayPayment'),
(2, 'newOrder', 'actionValidateOrder'),
(3, 'paymentConfirm', 'actionPaymentConfirmation'),
(4, 'paymentReturn', 'displayPaymentReturn'),
(5, 'updateQuantity', 'actionUpdateQuantity'),
(6, 'rightColumn', 'displayRightColumn'),
(7, 'leftColumn', 'displayLeftColumn'),
(8, 'home', 'displayHome'),
(9, 'displayHeader', 'Header'),
(10, 'cart', 'actionCartSave'),
(11, 'authentication', 'actionAuthentication'),
(12, 'addproduct', 'actionProductAdd'),
(13, 'updateproduct', 'actionProductUpdate'),
(14, 'top', 'displayTop'),
(15, 'extraRight', 'displayRightColumnProduct'),
(16, 'deleteproduct', 'actionProductDelete'),
(17, 'productfooter', 'displayFooterProduct'),
(18, 'invoice', 'displayInvoice'),
(19, 'updateOrderStatus', 'actionOrderStatusUpdate'),
(20, 'adminOrder', 'displayAdminOrder'),
(21, 'footer', 'displayFooter'),
(22, 'PDFInvoice', 'displayPDFInvoice'),
(23, 'adminCustomers', 'displayAdminCustomers'),
(24, 'orderConfirmation', 'displayOrderConfirmation'),
(25, 'createAccount', 'actionCustomerAccountAdd'),
(26, 'customerAccount', 'displayCustomerAccount'),
(27, 'orderSlip', 'actionOrderSlipAdd'),
(28, 'productTab', 'displayProductTab'),
(29, 'productTabContent', 'displayProductTabContent'),
(30, 'shoppingCart', 'displayShoppingCartFooter'),
(31, 'createAccountForm', 'displayCustomerAccountForm'),
(32, 'AdminStatsModules', 'displayAdminStatsModules'),
(33, 'GraphEngine', 'displayAdminStatsGraphEngine'),
(34, 'orderReturn', 'actionOrderReturn'),
(35, 'productActions', 'displayProductButtons'),
(36, 'backOfficeHome', 'displayBackOfficeHome'),
(37, 'GridEngine', 'displayAdminStatsGridEngine'),
(38, 'watermark', 'actionWatermark'),
(39, 'cancelProduct', 'actionProductCancel'),
(40, 'extraLeft', 'displayLeftColumnProduct'),
(41, 'productOutOfStock', 'actionProductOutOfStock'),
(42, 'updateProductAttribute', 'actionProductAttributeUpdate'),
(43, 'extraCarrier', 'displayCarrierList'),
(44, 'shoppingCartExtra', 'displayShoppingCart'),
(45, 'search', 'actionSearch'),
(46, 'backBeforePayment', 'displayBeforePayment'),
(47, 'updateCarrier', 'actionCarrierUpdate'),
(48, 'postUpdateOrderStatus', 'actionOrderStatusPostUpdate'),
(49, 'createAccountTop', 'displayCustomerAccountFormTop'),
(50, 'backOfficeHeader', 'displayBackOfficeHeader'),
(51, 'backOfficeTop', 'displayBackOfficeTop'),
(52, 'backOfficeFooter', 'displayBackOfficeFooter'),
(53, 'deleteProductAttribute', 'actionProductAttributeDelete'),
(54, 'processCarrier', 'actionCarrierProcess'),
(55, 'orderDetail', 'actionOrderDetail'),
(56, 'beforeCarrier', 'displayBeforeCarrier'),
(57, 'orderDetailDisplayed', 'displayOrderDetail'),
(58, 'paymentCCAdded', 'actionPaymentCCAdd'),
(59, 'extraProductComparison', 'displayProductComparison'),
(60, 'categoryAddition', 'actionCategoryAdd'),
(61, 'categoryUpdate', 'actionCategoryUpdate'),
(62, 'categoryDeletion', 'actionCategoryDelete'),
(63, 'beforeAuthentication', 'actionBeforeAuthentication'),
(64, 'paymentTop', 'displayPaymentTop'),
(65, 'afterCreateHtaccess', 'actionHtaccessCreate'),
(66, 'afterSaveAdminMeta', 'actionAdminMetaSave'),
(67, 'attributeGroupForm', 'displayAttributeGroupForm'),
(68, 'afterSaveAttributeGroup', 'actionAttributeGroupSave'),
(69, 'afterDeleteAttributeGroup', 'actionAttributeGroupDelete'),
(70, 'featureForm', 'displayFeatureForm'),
(71, 'afterSaveFeature', 'actionFeatureSave'),
(72, 'afterDeleteFeature', 'actionFeatureDelete'),
(73, 'afterSaveProduct', 'actionProductSave'),
(74, 'productListAssign', 'actionProductListOverride'),
(75, 'postProcessAttributeGroup', 'displayAttributeGroupPostProcess'),
(76, 'postProcessFeature', 'displayFeaturePostProcess'),
(77, 'featureValueForm', 'displayFeatureValueForm'),
(78, 'postProcessFeatureValue', 'displayFeatureValuePostProcess'),
(79, 'afterDeleteFeatureValue', 'actionFeatureValueDelete'),
(80, 'afterSaveFeatureValue', 'actionFeatureValueSave'),
(81, 'attributeForm', 'displayAttributeForm'),
(82, 'postProcessAttribute', 'actionAttributePostProcess'),
(83, 'afterDeleteAttribute', 'actionAttributeDelete'),
(84, 'afterSaveAttribute', 'actionAttributeSave'),
(85, 'taxManager', 'actionTaxManager'),
(86, 'myAccountBlock', 'displayMyAccountBlock');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_hook_module`
--

CREATE TABLE IF NOT EXISTS `ps_hook_module` (
  `id_module` int(10) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL DEFAULT '1',
  `id_hook` int(10) unsigned NOT NULL,
  `position` tinyint(2) unsigned NOT NULL,
  PRIMARY KEY (`id_module`,`id_hook`,`id_shop`),
  KEY `id_hook` (`id_hook`),
  KEY `id_module` (`id_module`),
  KEY `position` (`id_shop`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ps_hook_module`
--

INSERT INTO `ps_hook_module` (`id_module`, `id_shop`, `id_hook`, `position`) VALUES
(1, 1, 0, 1),
(1, 1, 16, 1),
(1, 1, 102, 1),
(1, 1, 103, 1),
(1, 1, 104, 1),
(2, 1, 10, 1),
(2, 1, 105, 1),
(2, 1, 106, 1),
(3, 1, 1, 1),
(3, 1, 5, 1),
(3, 1, 107, 1),
(4, 1, 13, 1),
(4, 1, 14, 1),
(4, 1, 17, 1),
(4, 1, 54, 1),
(7, 1, 66, 1),
(7, 1, 67, 1),
(7, 1, 68, 1),
(7, 1, 98, 1),
(7, 1, 109, 1),
(7, 1, 110, 1),
(8, 1, 100, 1),
(11, 1, 8, 1),
(11, 1, 73, 1),
(11, 1, 74, 1),
(11, 1, 75, 1),
(11, 1, 76, 1),
(11, 1, 77, 1),
(11, 1, 78, 1),
(11, 1, 79, 1),
(11, 1, 80, 1),
(11, 1, 81, 1),
(11, 1, 82, 1),
(11, 1, 83, 1),
(11, 1, 84, 1),
(11, 1, 85, 1),
(11, 1, 86, 1),
(11, 1, 87, 1),
(11, 1, 88, 1),
(11, 1, 89, 1),
(11, 1, 90, 1),
(12, 1, 111, 1),
(12, 1, 112, 1),
(12, 1, 113, 1),
(12, 1, 114, 1),
(16, 1, 115, 1),
(16, 1, 116, 1),
(16, 1, 117, 1),
(17, 1, 119, 1),
(17, 1, 120, 1),
(25, 1, 123, 1),
(25, 1, 124, 1),
(25, 1, 125, 1),
(31, 1, 131, 1),
(31, 1, 132, 1),
(31, 1, 133, 1),
(31, 1, 134, 1),
(31, 1, 135, 1),
(31, 1, 136, 1),
(31, 1, 137, 1),
(31, 1, 138, 1),
(32, 1, 139, 1),
(34, 1, 51, 1),
(35, 1, 39, 1),
(36, 1, 43, 1),
(39, 1, 41, 1),
(40, 1, 15, 1),
(40, 1, 38, 1),
(50, 1, 12, 1),
(50, 1, 30, 1),
(63, 1, 56, 1),
(64, 1, 2, 1),
(64, 1, 20, 1),
(64, 1, 94, 1),
(64, 1, 129, 1),
(64, 1, 130, 1),
(64, 1, 141, 1),
(64, 1, 142, 1),
(64, 1, 143, 1),
(64, 1, 144, 1),
(64, 1, 145, 1),
(64, 1, 146, 1),
(64, 1, 147, 1),
(64, 1, 148, 1),
(64, 1, 149, 1),
(64, 1, 150, 1),
(64, 1, 151, 1),
(64, 1, 152, 1),
(64, 1, 153, 1),
(64, 1, 154, 1),
(64, 1, 155, 1),
(67, 1, 46, 1),
(69, 1, 57, 1),
(70, 1, 156, 1),
(73, 1, 157, 1),
(73, 1, 158, 1),
(73, 1, 159, 1),
(73, 1, 160, 1),
(74, 1, 0, 1),
(74, 1, 161, 1),
(74, 1, 162, 1),
(74, 1, 163, 1),
(75, 1, 9, 1),
(75, 1, 19, 1),
(75, 1, 26, 1),
(75, 1, 27, 1),
(75, 1, 29, 1),
(75, 1, 31, 1),
(75, 1, 34, 1),
(75, 1, 35, 1),
(75, 1, 36, 1),
(75, 1, 37, 1),
(75, 1, 49, 1),
(75, 1, 50, 1),
(75, 1, 52, 1),
(75, 1, 55, 1),
(75, 1, 62, 1),
(75, 1, 63, 1),
(75, 1, 65, 1),
(75, 1, 70, 1),
(75, 1, 92, 1),
(75, 1, 97, 1),
(75, 1, 121, 1),
(75, 1, 122, 1),
(75, 1, 164, 1),
(75, 1, 165, 1),
(75, 1, 166, 1),
(75, 1, 167, 1),
(79, 1, 11, 1),
(79, 1, 28, 1),
(79, 1, 99, 1),
(79, 1, 168, 1),
(82, 1, 126, 1),
(82, 1, 127, 1),
(82, 1, 128, 1),
(82, 1, 169, 1),
(84, 1, 171, 1),
(85, 1, 172, 1),
(86, 1, 173, 1),
(88, 1, 108, 1),
(88, 1, 174, 1),
(89, 1, 175, 1),
(90, 1, 176, 1),
(91, 1, 95, 1),
(91, 1, 96, 1),
(91, 1, 177, 1),
(92, 1, 170, 1),
(92, 1, 178, 1),
(93, 1, 179, 1),
(4, 1, 10, 2),
(7, 1, 8, 2),
(10, 1, 100, 2),
(11, 1, 66, 2),
(11, 1, 68, 2),
(12, 1, 26, 2),
(18, 1, 119, 2),
(18, 1, 120, 2),
(23, 1, 13, 2),
(23, 1, 14, 2),
(23, 1, 17, 2),
(30, 1, 1, 2),
(30, 1, 5, 2),
(30, 1, 107, 2),
(32, 1, 54, 2),
(32, 1, 132, 2),
(32, 1, 138, 2),
(33, 1, 139, 2),
(34, 1, 133, 2),
(38, 1, 67, 2),
(41, 1, 15, 2),
(41, 1, 38, 2),
(60, 1, 51, 2),
(63, 1, 9, 2),
(63, 1, 97, 2),
(63, 1, 106, 2),
(64, 1, 56, 2),
(64, 1, 114, 2),
(64, 1, 134, 2),
(64, 1, 136, 2),
(66, 1, 34, 2),
(66, 1, 35, 2),
(66, 1, 65, 2),
(70, 1, 30, 2),
(71, 1, 156, 2),
(72, 1, 3, 2),
(75, 1, 18, 2),
(75, 1, 41, 2),
(75, 1, 46, 2),
(75, 1, 104, 2),
(75, 1, 105, 2),
(75, 1, 140, 2),
(78, 1, 164, 2),
(79, 1, 31, 2),
(79, 1, 92, 2),
(82, 1, 102, 2),
(82, 1, 103, 2),
(82, 1, 111, 2),
(82, 1, 112, 2),
(82, 1, 113, 2),
(82, 1, 115, 2),
(82, 1, 116, 2),
(82, 1, 117, 2),
(82, 1, 123, 2),
(82, 1, 124, 2),
(82, 1, 125, 2),
(82, 1, 129, 2),
(82, 1, 130, 2),
(84, 1, 122, 2),
(92, 1, 160, 2),
(4, 1, 8, 3),
(7, 1, 10, 3),
(9, 1, 9, 3),
(11, 1, 67, 3),
(14, 1, 100, 3),
(18, 1, 26, 3),
(33, 1, 132, 3),
(33, 1, 138, 3),
(34, 1, 139, 3),
(38, 1, 13, 3),
(38, 1, 14, 3),
(38, 1, 17, 3),
(42, 1, 38, 3),
(64, 1, 133, 3),
(66, 1, 140, 3),
(68, 1, 56, 3),
(68, 1, 119, 3),
(68, 1, 120, 3),
(74, 1, 164, 3),
(75, 1, 1, 3),
(75, 1, 5, 3),
(75, 1, 7, 3),
(75, 1, 15, 3),
(75, 1, 16, 3),
(79, 1, 41, 3),
(89, 1, 97, 3),
(89, 1, 113, 3),
(93, 1, 30, 3),
(8, 1, 10, 4),
(15, 1, 26, 4),
(23, 1, 8, 4),
(26, 1, 13, 4),
(26, 1, 14, 4),
(26, 1, 17, 4),
(34, 1, 132, 4),
(35, 1, 138, 4),
(43, 1, 38, 4),
(73, 1, 9, 4),
(73, 1, 56, 4),
(74, 1, 18, 4),
(75, 1, 3, 4),
(75, 1, 100, 4),
(79, 1, 15, 4),
(82, 1, 67, 4),
(10, 1, 10, 5),
(13, 1, 9, 5),
(26, 1, 8, 5),
(44, 1, 38, 5),
(50, 1, 26, 5),
(66, 1, 16, 5),
(69, 1, 138, 5),
(73, 1, 7, 5),
(74, 1, 56, 5),
(82, 1, 15, 5),
(86, 1, 100, 5),
(91, 1, 13, 5),
(91, 1, 14, 5),
(91, 1, 17, 5),
(9, 1, 10, 6),
(21, 1, 26, 6),
(45, 1, 38, 6),
(75, 1, 8, 6),
(75, 1, 56, 6),
(79, 1, 7, 6),
(84, 1, 15, 6),
(92, 1, 9, 6),
(12, 1, 10, 7),
(46, 1, 38, 7),
(63, 1, 26, 7),
(73, 1, 8, 7),
(86, 1, 15, 7),
(92, 1, 56, 7),
(16, 1, 10, 8),
(47, 1, 38, 8),
(63, 1, 8, 8),
(77, 1, 26, 8),
(88, 1, 15, 8),
(17, 1, 10, 9),
(48, 1, 38, 9),
(85, 1, 26, 9),
(90, 1, 8, 9),
(92, 1, 15, 9),
(14, 1, 10, 10),
(49, 1, 38, 10),
(91, 1, 8, 10),
(93, 1, 26, 10),
(18, 1, 10, 11),
(51, 1, 38, 11),
(92, 1, 8, 11),
(15, 1, 10, 12),
(52, 1, 38, 12),
(23, 1, 10, 13),
(53, 1, 38, 13),
(24, 1, 10, 14),
(54, 1, 38, 14),
(25, 1, 10, 15),
(55, 1, 38, 15),
(26, 1, 10, 16),
(56, 1, 38, 16),
(38, 1, 10, 17),
(57, 1, 38, 17),
(58, 1, 38, 18),
(67, 1, 10, 18),
(39, 1, 10, 19),
(59, 1, 38, 19),
(60, 1, 38, 20),
(63, 1, 10, 20),
(21, 1, 10, 21),
(61, 1, 38, 21),
(1, 1, 10, 22),
(62, 1, 38, 22),
(66, 1, 10, 23),
(11, 1, 10, 24),
(75, 1, 10, 25),
(70, 1, 10, 26),
(71, 1, 10, 27),
(72, 1, 10, 28),
(73, 1, 10, 29),
(74, 1, 10, 30),
(76, 1, 10, 31),
(77, 1, 10, 32),
(78, 1, 10, 33),
(79, 1, 10, 34),
(84, 1, 10, 35),
(85, 1, 10, 36),
(86, 1, 10, 37),
(88, 1, 10, 38),
(89, 1, 10, 39),
(90, 1, 10, 40),
(91, 1, 10, 41),
(92, 1, 10, 42),
(93, 1, 10, 43);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_hook_module_exceptions`
--

CREATE TABLE IF NOT EXISTS `ps_hook_module_exceptions` (
  `id_hook_module_exceptions` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_shop` int(11) unsigned NOT NULL DEFAULT '1',
  `id_module` int(10) unsigned NOT NULL,
  `id_hook` int(10) unsigned NOT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_hook_module_exceptions`),
  KEY `id_module` (`id_module`),
  KEY `id_hook` (`id_hook`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=79 ;

--
-- Volcado de datos para la tabla `ps_hook_module_exceptions`
--

INSERT INTO `ps_hook_module_exceptions` (`id_hook_module_exceptions`, `id_shop`, `id_module`, `id_hook`, `file_name`) VALUES
(1, 1, 4, 8, 'category'),
(2, 1, 16, 8, 'category'),
(3, 1, 17, 8, 'category'),
(4, 1, 21, 8, 'category'),
(5, 1, 25, 8, 'category'),
(6, 1, 4, 8, 'product'),
(7, 1, 4, 8, 'category'),
(8, 1, 4, 8, 'category'),
(9, 1, 4, 8, 'category'),
(10, 1, 4, 8, 'category'),
(11, 1, 4, 8, 'category'),
(12, 1, 4, 8, 'category'),
(13, 1, 7, 8, 'category'),
(15, 1, 23, 8, 'product'),
(18, 1, 1, 10, 'best-sales'),
(19, 1, 1, 10, 'guest-tracking'),
(20, 1, 1, 10, 'order'),
(21, 1, 1, 10, 'module-dproductrating-rating'),
(22, 1, 1, 10, 'module-bankwire-payment'),
(23, 1, 1, 10, 'contact'),
(24, 1, 1, 10, 'module-cheque-payment'),
(25, 1, 1, 10, 'order-follow'),
(26, 1, 1, 10, 'attachment'),
(27, 1, 1, 10, 'module-cheque-validation'),
(28, 1, 1, 10, 'history'),
(29, 1, 1, 10, 'sitemap'),
(30, 1, 1, 10, 'cart'),
(31, 1, 1, 10, 'pdf-order-return'),
(32, 1, 1, 10, 'module-blockwishlist-mywishlist'),
(33, 1, 1, 10, 'module-guestbookwithavatars-ajax'),
(34, 1, 1, 10, 'order'),
(35, 1, 1, 10, 'attachment'),
(36, 1, 1, 10, 'best-sales'),
(37, 1, 1, 10, 'module-problocknewsletter-verification'),
(38, 1, 1, 10, 'module-bankwire-validation'),
(39, 1, 1, 10, 'order-follow'),
(40, 1, 1, 10, 'pdf-invoice'),
(41, 1, 1, 10, 'module-blocknewsletter-verification'),
(42, 1, 1, 10, 'address'),
(43, 1, 1, 10, 'order-slip'),
(44, 1, 1, 10, 'index'),
(45, 1, 1, 10, 'module-bankwire-payment'),
(46, 1, 1, 10, '404'),
(47, 1, 1, 10, 'index'),
(48, 1, 1, 10, 'discount'),
(49, 1, 1, 10, 'prices-drop'),
(50, 1, 1, 10, 'order-opc'),
(51, 1, 1, 10, 'module-problocknewsletter-verification'),
(52, 1, 1, 10, 'module-guestbookwithavatars-ajax'),
(53, 1, 1, 10, 'module-blockwishlist-view'),
(54, 1, 1, 10, 'products-comparison'),
(55, 1, 1, 10, 'prices-drop'),
(56, 1, 1, 10, 'order-detail'),
(57, 1, 1, 10, 'order-return'),
(58, 1, 1, 10, 'authentication'),
(59, 1, 1, 10, 'module-blockwishlist-view'),
(60, 1, 1, 10, 'stores'),
(61, 1, 1, 10, 'new-products'),
(62, 1, 1, 10, 'history'),
(63, 1, 1, 10, 'order-confirmation'),
(64, 1, 1, 10, 'my-account'),
(65, 1, 1, 10, 'addresses'),
(66, 1, 1, 10, 'sitemap'),
(67, 1, 1, 10, 'manufacturer'),
(68, 1, 1, 10, 'module-productcomments-default'),
(69, 1, 1, 10, 'pdf-order-return'),
(70, 1, 1, 10, 'order-return'),
(71, 1, 1, 10, 'discount'),
(72, 1, 1, 10, 'products-comparison'),
(73, 1, 1, 10, 'identity'),
(74, 1, 1, 10, '404'),
(75, 1, 1, 10, 'module-guestbookwithavatars-guestbook'),
(76, 1, 1, 10, 'module-cheque-validation'),
(77, 1, 1, 10, 'g'),
(78, 1, 11, 89, 'statistic');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_image`
--

CREATE TABLE IF NOT EXISTS `ps_image` (
  `id_image` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_product` int(10) unsigned NOT NULL,
  `position` smallint(2) unsigned NOT NULL DEFAULT '0',
  `cover` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_image`),
  UNIQUE KEY `idx_product_image` (`id_image`,`id_product`,`cover`),
  KEY `image_product` (`id_product`),
  KEY `id_product_cover` (`id_product`,`cover`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=32 ;

--
-- Volcado de datos para la tabla `ps_image`
--

INSERT INTO `ps_image` (`id_image`, `id_product`, `position`, `cover`) VALUES
(1, 1, 1, 1),
(2, 1, 2, 0),
(3, 1, 3, 0),
(4, 1, 4, 0),
(5, 2, 2, 0),
(6, 2, 3, 0),
(7, 2, 4, 0),
(8, 3, 2, 0),
(9, 3, 3, 0),
(10, 4, 2, 0),
(11, 4, 3, 0),
(12, 5, 1, 1),
(13, 5, 2, 0),
(14, 5, 3, 0),
(15, 5, 4, 0),
(16, 6, 1, 1),
(17, 6, 2, 0),
(18, 6, 3, 0),
(19, 6, 4, 0),
(20, 7, 1, 1),
(21, 7, 2, 0),
(22, 7, 3, 0),
(23, 7, 4, 0),
(27, 4, 1, 1),
(30, 3, 1, 1),
(31, 2, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_image_lang`
--

CREATE TABLE IF NOT EXISTS `ps_image_lang` (
  `id_image` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `legend` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id_image`,`id_lang`),
  KEY `id_image` (`id_image`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ps_image_lang`
--

INSERT INTO `ps_image_lang` (`id_image`, `id_lang`, `legend`) VALUES
(1, 1, ''),
(2, 1, ''),
(3, 1, ''),
(4, 1, ''),
(5, 1, ''),
(6, 1, ''),
(7, 1, ''),
(8, 1, 'Bahagian'),
(9, 1, 'Bahagian'),
(10, 1, ''),
(11, 1, ''),
(12, 1, ''),
(13, 1, ''),
(14, 1, ''),
(15, 1, ''),
(16, 1, ''),
(17, 1, ''),
(18, 1, ''),
(19, 1, ''),
(20, 1, ''),
(21, 1, ''),
(22, 1, ''),
(23, 1, ''),
(27, 1, ''),
(30, 1, 'Bahagian'),
(31, 1, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_image_shop`
--

CREATE TABLE IF NOT EXISTS `ps_image_shop` (
  `id_image` int(11) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL,
  `cover` tinyint(1) NOT NULL DEFAULT '0',
  KEY `id_image` (`id_image`,`id_shop`,`cover`),
  KEY `id_shop` (`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ps_image_shop`
--

INSERT INTO `ps_image_shop` (`id_image`, `id_shop`, `cover`) VALUES
(1, 1, 1),
(2, 1, 0),
(3, 1, 0),
(4, 1, 0),
(5, 1, 0),
(6, 1, 0),
(7, 1, 0),
(8, 1, 0),
(9, 1, 0),
(10, 1, 0),
(11, 1, 0),
(12, 1, 1),
(13, 1, 0),
(14, 1, 0),
(15, 1, 0),
(16, 1, 1),
(17, 1, 0),
(18, 1, 0),
(19, 1, 0),
(20, 1, 1),
(21, 1, 0),
(22, 1, 0),
(23, 1, 0),
(27, 1, 1),
(30, 1, 1),
(31, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_image_type`
--

CREATE TABLE IF NOT EXISTS `ps_image_type` (
  `id_image_type` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `width` int(10) unsigned NOT NULL,
  `height` int(10) unsigned NOT NULL,
  `products` tinyint(1) NOT NULL DEFAULT '1',
  `categories` tinyint(1) NOT NULL DEFAULT '1',
  `manufacturers` tinyint(1) NOT NULL DEFAULT '1',
  `suppliers` tinyint(1) NOT NULL DEFAULT '1',
  `scenes` tinyint(1) NOT NULL DEFAULT '1',
  `stores` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_image_type`),
  KEY `image_type_name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

--
-- Volcado de datos para la tabla `ps_image_type`
--

INSERT INTO `ps_image_type` (`id_image_type`, `name`, `width`, `height`, `products`, `categories`, `manufacturers`, `suppliers`, `scenes`, `stores`) VALUES
(10, 'manufacturer_default', 170, 55, 0, 0, 1, 0, 0, 1),
(11, 'cart_default', 80, 80, 1, 0, 0, 0, 0, 1),
(12, 'small_default', 98, 98, 1, 0, 1, 1, 0, 1),
(13, 'medium_default', 228, 228, 1, 1, 1, 1, 0, 1),
(14, 'home_default', 360, 395, 1, 0, 0, 0, 0, 1),
(15, 'large_default', 458, 458, 1, 0, 1, 1, 0, 1),
(16, 'thickbox_default', 800, 800, 1, 0, 0, 0, 0, 1),
(17, 'category_default', 870, 217, 0, 1, 0, 0, 0, 1),
(18, 'scene_default', 870, 270, 0, 0, 0, 0, 1, 1),
(19, 'm_scene_default', 161, 58, 0, 0, 0, 0, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_import_match`
--

CREATE TABLE IF NOT EXISTS `ps_import_match` (
  `id_import_match` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `match` text NOT NULL,
  `skip` int(2) NOT NULL,
  PRIMARY KEY (`id_import_match`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_info`
--

CREATE TABLE IF NOT EXISTS `ps_info` (
  `id_info` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_shop` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id_info`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `ps_info`
--

INSERT INTO `ps_info` (`id_info`, `id_shop`) VALUES
(1, 1),
(2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_info_lang`
--

CREATE TABLE IF NOT EXISTS `ps_info_lang` (
  `id_info` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`id_info`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ps_info_lang`
--

INSERT INTO `ps_info_lang` (`id_info`, `id_lang`, `text`) VALUES
(1, 1, '<ul>\n<li><em class="icon-truck" id="icon-truck"></em>\n<div class="type-text">\n<h3>Lorem Ipsum</h3>\n<p>Lorem ipsum dolor sit amet conse ctetur voluptate velit esse cillum dolore eu</p>\n</div>\n</li>\n<li><em class="icon-phone" id="icon-phone"></em>\n<div class="type-text">\n<h3>Dolor Sit Amet</h3>\n<p>Lorem ipsum dolor sit amet conse ctetur voluptate velit esse cillum dolore eu</p>\n</div>\n</li>\n<li><em class="icon-credit-card" id="icon-credit-card"></em>\n<div class="type-text">\n<h3>Ctetur Voluptate</h3>\n<p>Lorem ipsum dolor sit amet conse ctetur voluptate velit esse cillum dolore eu</p>\n</div>\n</li>\n</ul>'),
(2, 1, '<h3>Custom Block</h3>\n<p><strong class="dark">Lorem ipsum dolor sit amet conse ctetu</strong></p>\n<p>Sit amet conse ctetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit.</p>');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_lang`
--

CREATE TABLE IF NOT EXISTS `ps_lang` (
  `id_lang` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `active` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `iso_code` char(2) NOT NULL,
  `language_code` char(5) NOT NULL,
  `date_format_lite` char(32) NOT NULL DEFAULT 'Y-m-d',
  `date_format_full` char(32) NOT NULL DEFAULT 'Y-m-d H:i:s',
  `is_rtl` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_lang`),
  KEY `lang_iso_code` (`iso_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `ps_lang`
--

INSERT INTO `ps_lang` (`id_lang`, `name`, `active`, `iso_code`, `language_code`, `date_format_lite`, `date_format_full`, `is_rtl`) VALUES
(1, 'Español (Spanish)', 1, 'es', 'es-es', 'd/m/Y', 'd/m/Y H:i:s', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_lang_shop`
--

CREATE TABLE IF NOT EXISTS `ps_lang_shop` (
  `id_lang` int(11) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_lang`,`id_shop`),
  KEY `id_shop` (`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ps_lang_shop`
--

INSERT INTO `ps_lang_shop` (`id_lang`, `id_shop`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_layered_category`
--

CREATE TABLE IF NOT EXISTS `ps_layered_category` (
  `id_layered_category` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_shop` int(11) unsigned NOT NULL,
  `id_category` int(10) unsigned NOT NULL,
  `id_value` int(10) unsigned DEFAULT '0',
  `type` enum('category','id_feature','id_attribute_group','quantity','condition','manufacturer','weight','price') NOT NULL,
  `position` int(10) unsigned NOT NULL,
  `filter_type` int(10) unsigned NOT NULL DEFAULT '0',
  `filter_show_limit` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_layered_category`),
  KEY `id_category` (`id_category`,`type`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=100 ;

--
-- Volcado de datos para la tabla `ps_layered_category`
--

INSERT INTO `ps_layered_category` (`id_layered_category`, `id_shop`, `id_category`, `id_value`, `type`, `position`, `filter_type`, `filter_show_limit`) VALUES
(1, 1, 2, NULL, 'category', 1, 0, 0),
(2, 1, 2, 1, 'id_attribute_group', 2, 0, 0),
(3, 1, 2, 3, 'id_attribute_group', 3, 0, 0),
(4, 1, 2, 5, 'id_feature', 4, 0, 0),
(5, 1, 2, 6, 'id_feature', 5, 0, 0),
(6, 1, 2, 7, 'id_feature', 6, 0, 0),
(7, 1, 2, NULL, 'quantity', 7, 0, 0),
(8, 1, 2, NULL, 'manufacturer', 8, 0, 0),
(9, 1, 2, NULL, 'condition', 9, 0, 0),
(10, 1, 2, NULL, 'weight', 10, 0, 0),
(11, 1, 2, NULL, 'price', 11, 0, 0),
(12, 1, 5, NULL, 'category', 1, 0, 0),
(13, 1, 5, 1, 'id_attribute_group', 2, 0, 0),
(14, 1, 5, 3, 'id_attribute_group', 3, 0, 0),
(15, 1, 5, 5, 'id_feature', 4, 0, 0),
(16, 1, 5, 6, 'id_feature', 5, 0, 0),
(17, 1, 5, 7, 'id_feature', 6, 0, 0),
(18, 1, 5, NULL, 'quantity', 7, 0, 0),
(19, 1, 5, NULL, 'manufacturer', 8, 0, 0),
(20, 1, 5, NULL, 'condition', 9, 0, 0),
(21, 1, 5, NULL, 'weight', 10, 0, 0),
(22, 1, 5, NULL, 'price', 11, 0, 0),
(23, 1, 3, NULL, 'category', 1, 0, 0),
(24, 1, 3, 1, 'id_attribute_group', 2, 0, 0),
(25, 1, 3, 3, 'id_attribute_group', 3, 0, 0),
(26, 1, 3, 5, 'id_feature', 4, 0, 0),
(27, 1, 3, 6, 'id_feature', 5, 0, 0),
(28, 1, 3, 7, 'id_feature', 6, 0, 0),
(29, 1, 3, NULL, 'quantity', 7, 0, 0),
(30, 1, 3, NULL, 'manufacturer', 8, 0, 0),
(31, 1, 3, NULL, 'condition', 9, 0, 0),
(32, 1, 3, NULL, 'weight', 10, 0, 0),
(33, 1, 3, NULL, 'price', 11, 0, 0),
(34, 1, 4, NULL, 'category', 1, 0, 0),
(35, 1, 4, 1, 'id_attribute_group', 2, 0, 0),
(36, 1, 4, 3, 'id_attribute_group', 3, 0, 0),
(37, 1, 4, 5, 'id_feature', 4, 0, 0),
(38, 1, 4, 6, 'id_feature', 5, 0, 0),
(39, 1, 4, 7, 'id_feature', 6, 0, 0),
(40, 1, 4, NULL, 'quantity', 7, 0, 0),
(41, 1, 4, NULL, 'manufacturer', 8, 0, 0),
(42, 1, 4, NULL, 'condition', 9, 0, 0),
(43, 1, 4, NULL, 'weight', 10, 0, 0),
(44, 1, 4, NULL, 'price', 11, 0, 0),
(45, 1, 7, NULL, 'category', 1, 0, 0),
(46, 1, 7, 1, 'id_attribute_group', 2, 0, 0),
(47, 1, 7, 3, 'id_attribute_group', 3, 0, 0),
(48, 1, 7, 5, 'id_feature', 4, 0, 0),
(49, 1, 7, 6, 'id_feature', 5, 0, 0),
(50, 1, 7, 7, 'id_feature', 6, 0, 0),
(51, 1, 7, NULL, 'quantity', 7, 0, 0),
(52, 1, 7, NULL, 'manufacturer', 8, 0, 0),
(53, 1, 7, NULL, 'condition', 9, 0, 0),
(54, 1, 7, NULL, 'weight', 10, 0, 0),
(55, 1, 7, NULL, 'price', 11, 0, 0),
(56, 1, 8, NULL, 'category', 1, 0, 0),
(57, 1, 8, 1, 'id_attribute_group', 2, 0, 0),
(58, 1, 8, 3, 'id_attribute_group', 3, 0, 0),
(59, 1, 8, 5, 'id_feature', 4, 0, 0),
(60, 1, 8, 6, 'id_feature', 5, 0, 0),
(61, 1, 8, 7, 'id_feature', 6, 0, 0),
(62, 1, 8, NULL, 'quantity', 7, 0, 0),
(63, 1, 8, NULL, 'manufacturer', 8, 0, 0),
(64, 1, 8, NULL, 'condition', 9, 0, 0),
(65, 1, 8, NULL, 'weight', 10, 0, 0),
(66, 1, 8, NULL, 'price', 11, 0, 0),
(67, 1, 9, NULL, 'category', 1, 0, 0),
(68, 1, 9, 1, 'id_attribute_group', 2, 0, 0),
(69, 1, 9, 3, 'id_attribute_group', 3, 0, 0),
(70, 1, 9, 5, 'id_feature', 4, 0, 0),
(71, 1, 9, 6, 'id_feature', 5, 0, 0),
(72, 1, 9, 7, 'id_feature', 6, 0, 0),
(73, 1, 9, NULL, 'quantity', 7, 0, 0),
(74, 1, 9, NULL, 'manufacturer', 8, 0, 0),
(75, 1, 9, NULL, 'condition', 9, 0, 0),
(76, 1, 9, NULL, 'weight', 10, 0, 0),
(77, 1, 9, NULL, 'price', 11, 0, 0),
(78, 1, 10, NULL, 'category', 1, 0, 0),
(79, 1, 10, 1, 'id_attribute_group', 2, 0, 0),
(80, 1, 10, 3, 'id_attribute_group', 3, 0, 0),
(81, 1, 10, 5, 'id_feature', 4, 0, 0),
(82, 1, 10, 6, 'id_feature', 5, 0, 0),
(83, 1, 10, 7, 'id_feature', 6, 0, 0),
(84, 1, 10, NULL, 'quantity', 7, 0, 0),
(85, 1, 10, NULL, 'manufacturer', 8, 0, 0),
(86, 1, 10, NULL, 'condition', 9, 0, 0),
(87, 1, 10, NULL, 'weight', 10, 0, 0),
(88, 1, 10, NULL, 'price', 11, 0, 0),
(89, 1, 11, NULL, 'category', 1, 0, 0),
(90, 1, 11, 1, 'id_attribute_group', 2, 0, 0),
(91, 1, 11, 3, 'id_attribute_group', 3, 0, 0),
(92, 1, 11, 5, 'id_feature', 4, 0, 0),
(93, 1, 11, 6, 'id_feature', 5, 0, 0),
(94, 1, 11, 7, 'id_feature', 6, 0, 0),
(95, 1, 11, NULL, 'quantity', 7, 0, 0),
(96, 1, 11, NULL, 'manufacturer', 8, 0, 0),
(97, 1, 11, NULL, 'condition', 9, 0, 0),
(98, 1, 11, NULL, 'weight', 10, 0, 0),
(99, 1, 11, NULL, 'price', 11, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_layered_filter`
--

CREATE TABLE IF NOT EXISTS `ps_layered_filter` (
  `id_layered_filter` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `filters` text,
  `n_categories` int(10) unsigned NOT NULL,
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_layered_filter`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `ps_layered_filter`
--

INSERT INTO `ps_layered_filter` (`id_layered_filter`, `name`, `filters`, `n_categories`, `date_add`) VALUES
(1, 'Mi plantilla 2015-06-22', 'a:13:{s:10:"categories";a:9:{i:0;i:2;i:1;i:5;i:2;i:3;i:3;i:4;i:4;i:7;i:5;i:8;i:6;i:9;i:7;i:10;i:8;i:11;}s:9:"shop_list";a:1:{i:1;i:1;}s:31:"layered_selection_subcategories";a:2:{s:11:"filter_type";i:0;s:17:"filter_show_limit";i:0;}s:22:"layered_selection_ag_1";a:2:{s:11:"filter_type";i:0;s:17:"filter_show_limit";i:0;}s:22:"layered_selection_ag_3";a:2:{s:11:"filter_type";i:0;s:17:"filter_show_limit";i:0;}s:24:"layered_selection_feat_5";a:2:{s:11:"filter_type";i:0;s:17:"filter_show_limit";i:0;}s:24:"layered_selection_feat_6";a:2:{s:11:"filter_type";i:0;s:17:"filter_show_limit";i:0;}s:24:"layered_selection_feat_7";a:2:{s:11:"filter_type";i:0;s:17:"filter_show_limit";i:0;}s:23:"layered_selection_stock";a:2:{s:11:"filter_type";i:0;s:17:"filter_show_limit";i:0;}s:30:"layered_selection_manufacturer";a:2:{s:11:"filter_type";i:0;s:17:"filter_show_limit";i:0;}s:27:"layered_selection_condition";a:2:{s:11:"filter_type";i:0;s:17:"filter_show_limit";i:0;}s:31:"layered_selection_weight_slider";a:2:{s:11:"filter_type";i:0;s:17:"filter_show_limit";i:0;}s:30:"layered_selection_price_slider";a:2:{s:11:"filter_type";i:0;s:17:"filter_show_limit";i:0;}}', 9, '2015-06-22 10:29:18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_layered_filter_shop`
--

CREATE TABLE IF NOT EXISTS `ps_layered_filter_shop` (
  `id_layered_filter` int(10) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_layered_filter`,`id_shop`),
  KEY `id_shop` (`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ps_layered_filter_shop`
--

INSERT INTO `ps_layered_filter_shop` (`id_layered_filter`, `id_shop`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_layered_friendly_url`
--

CREATE TABLE IF NOT EXISTS `ps_layered_friendly_url` (
  `id_layered_friendly_url` int(11) NOT NULL AUTO_INCREMENT,
  `url_key` varchar(32) NOT NULL,
  `data` varchar(200) NOT NULL,
  `id_lang` int(11) NOT NULL,
  PRIMARY KEY (`id_layered_friendly_url`),
  KEY `id_lang` (`id_lang`),
  KEY `url_key` (`url_key`(5))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=56 ;

--
-- Volcado de datos para la tabla `ps_layered_friendly_url`
--

INSERT INTO `ps_layered_friendly_url` (`id_layered_friendly_url`, `url_key`, `data`, `id_lang`) VALUES
(1, '39fd71c6c16ef7ed6ed2b8ba93e276e2', 'a:1:{s:8:"category";a:1:{i:1;s:1:"1";}}', 1),
(2, '7b850fefd113e4fc1b050b13b68c38d5', 'a:1:{s:8:"category";a:1:{i:2;s:1:"2";}}', 1),
(3, '8df2d37bcbe9b28ea7596cee5ccd62ab', 'a:1:{s:8:"category";a:1:{i:3;s:1:"3";}}', 1),
(4, 'b2068d00a9aaf0da051d00ba0a6cc5a2', 'a:1:{s:8:"category";a:1:{i:4;s:1:"4";}}', 1),
(5, '66e056a1955f601a970f7d9b155e0635', 'a:1:{s:8:"category";a:1:{i:8;s:1:"8";}}', 1),
(6, 'd7ca0cab13dc04f35b2c7569f0cc4228', 'a:1:{s:8:"category";a:1:{i:5;s:1:"5";}}', 1),
(7, '4357c275876fdff03d7c4cdf8f882ec5', 'a:1:{s:8:"category";a:1:{i:7;s:1:"7";}}', 1),
(8, 'a60cb1416420de423170ef631ba37f05', 'a:1:{s:8:"category";a:1:{i:9;s:1:"9";}}', 1),
(9, '151949f29b2bfc4dededa65b8857b2f2', 'a:1:{s:8:"category";a:1:{i:10;s:2:"10";}}', 1),
(10, '015741d0472809f158ddf2317bf057c4', 'a:1:{s:8:"category";a:1:{i:11;s:2:"11";}}', 1),
(11, 'd5cbab54a3ca1d7db386ad196407764f', 'a:1:{s:10:"id_feature";a:1:{i:1;s:3:"5_1";}}', 1),
(12, 'd3f53f3235dbe693e3a5ff6ef132f69f', 'a:1:{s:10:"id_feature";a:1:{i:2;s:3:"5_2";}}', 1),
(13, '0932c1e2ccda9974a2aa46ffc62a74aa', 'a:1:{s:10:"id_feature";a:1:{i:3;s:3:"5_3";}}', 1),
(14, 'fdd7832769f92635ea6cf622601bf475', 'a:1:{s:10:"id_feature";a:1:{i:4;s:3:"5_4";}}', 1),
(15, 'a16cb39c73d3a13133a78276df4255af', 'a:1:{s:10:"id_feature";a:1:{i:5;s:3:"5_5";}}', 1),
(16, '943b5e6999b97c9d265d190242f0a684', 'a:1:{s:10:"id_feature";a:1:{i:6;s:3:"5_6";}}', 1),
(17, '235854e8ef39bb0df5697073d3d90540', 'a:1:{s:10:"id_feature";a:1:{i:7;s:3:"5_7";}}', 1),
(18, '3ae17610775d27b1db8514b2ecd8a69d', 'a:1:{s:10:"id_feature";a:1:{i:8;s:3:"5_8";}}', 1),
(19, '558e9a195562d0555553d846b5654610', 'a:1:{s:10:"id_feature";a:1:{i:9;s:3:"5_9";}}', 1),
(20, 'e799f4d0abb0cf8927bcb60375974496', 'a:1:{s:10:"id_feature";a:1:{i:10;s:4:"6_10";}}', 1),
(21, '46b8400d3be5c11515cb97699b8c2b5f', 'a:1:{s:10:"id_feature";a:1:{i:11;s:4:"6_11";}}', 1),
(22, 'c41f78f59c8a3d76253f60747dd4e240', 'a:1:{s:10:"id_feature";a:1:{i:12;s:4:"6_12";}}', 1),
(23, '6fee10826bc5822f3ff569ed13523d59', 'a:1:{s:10:"id_feature";a:1:{i:13;s:4:"6_13";}}', 1),
(24, 'ee4452d85805c23df068b6c871ae5e81', 'a:1:{s:10:"id_feature";a:1:{i:14;s:4:"6_14";}}', 1),
(25, 'd9fecf8bec077f0cf78ab8090cb1384b', 'a:1:{s:10:"id_feature";a:1:{i:15;s:4:"6_15";}}', 1),
(26, 'f2299fcc01ad7282b14837db948c29d1', 'a:1:{s:10:"id_feature";a:1:{i:16;s:4:"6_16";}}', 1),
(27, '70f2b919cd07d2eedf4d0fa36ddb2ef9', 'a:1:{s:10:"id_feature";a:1:{i:17;s:4:"7_17";}}', 1),
(28, 'f7efe1215721d20b8c7b67357e220a43', 'a:1:{s:10:"id_feature";a:1:{i:18;s:4:"7_18";}}', 1),
(29, '3f78db0184270fdeb169ec979846ca50', 'a:1:{s:10:"id_feature";a:1:{i:19;s:4:"7_19";}}', 1),
(30, '936a5e0d2b18f15a7865846c9ebd2f7a', 'a:1:{s:10:"id_feature";a:1:{i:20;s:4:"7_20";}}', 1),
(31, 'bc1a747be70119467250821b48533190', 'a:1:{s:10:"id_feature";a:1:{i:21;s:4:"7_21";}}', 1),
(32, '97d9dd08827238b39342d37e16ee7fc3', 'a:1:{s:18:"id_attribute_group";a:1:{i:1;s:3:"1_1";}}', 1),
(33, '2f3d5048a6335cac20241e0f8cb5294e', 'a:1:{s:18:"id_attribute_group";a:1:{i:2;s:3:"1_2";}}', 1),
(34, '19819345209f29bb2865355fa2cdb800', 'a:1:{s:18:"id_attribute_group";a:1:{i:3;s:3:"1_3";}}', 1),
(35, 'f00b851d158ffd7b8f4750d251caf742', 'a:1:{s:18:"id_attribute_group";a:1:{i:4;s:3:"1_4";}}', 1),
(36, '955959be60adbc2672d9f475c80427b5', 'a:1:{s:18:"id_attribute_group";a:1:{i:5;s:3:"3_5";}}', 1),
(37, '302b5943e4f2147546c456adf925016a', 'a:1:{s:18:"id_attribute_group";a:1:{i:6;s:3:"3_6";}}', 1),
(38, 'f036e061c6e0e9cd6b3c463f72f524a5', 'a:1:{s:18:"id_attribute_group";a:1:{i:7;s:3:"3_7";}}', 1),
(39, '7da361d2ac219366406c8ba83f839e49', 'a:1:{s:18:"id_attribute_group";a:1:{i:8;s:3:"3_8";}}', 1),
(40, '8a2e3aa84a460e7eedf0a696a557f87d', 'a:1:{s:18:"id_attribute_group";a:1:{i:9;s:3:"3_9";}}', 1),
(41, '10d4b015cd4670238f90af49853a0b09', 'a:1:{s:18:"id_attribute_group";a:1:{i:10;s:4:"3_10";}}', 1),
(42, '3f7f5aaa6d609de3b6a2b3addd27e352', 'a:1:{s:18:"id_attribute_group";a:1:{i:11;s:4:"3_11";}}', 1),
(43, '5f556205d67d7c26c2726dba638c2d95', 'a:1:{s:18:"id_attribute_group";a:1:{i:12;s:4:"3_12";}}', 1),
(44, 'e51d8bd9a716af167a1e4e3c3111c597', 'a:1:{s:18:"id_attribute_group";a:1:{i:13;s:4:"3_13";}}', 1),
(45, '95ed6e1c18ff0e1bd610a517f229f652', 'a:1:{s:18:"id_attribute_group";a:1:{i:14;s:4:"3_14";}}', 1),
(46, '6dd5d6e16acddb5ab2d612ad65603344', 'a:1:{s:18:"id_attribute_group";a:1:{i:15;s:4:"3_15";}}', 1),
(47, 'c63c700f59e69866b4619eef8bc6e597', 'a:1:{s:18:"id_attribute_group";a:1:{i:16;s:4:"3_16";}}', 1),
(48, 'fe4284d073fc299122d1f83ec63488a2', 'a:1:{s:18:"id_attribute_group";a:1:{i:17;s:4:"3_17";}}', 1),
(49, 'b7ca381eeae1441140d52502461c6a2c', 'a:1:{s:18:"id_attribute_group";a:1:{i:24;s:4:"3_24";}}', 1),
(50, '44294b0028a0213fc55128fecfbdfbed', 'a:1:{s:8:"quantity";a:1:{i:0;i:0;}}', 1),
(51, 'dd4f6902b4e7b3fb676b9ce2cedfa9b4', 'a:1:{s:8:"quantity";a:1:{i:0;i:1;}}', 1),
(52, 'f84cffad3cf7a6b7856c8a72b8c8df90', 'a:1:{s:9:"condition";a:1:{s:3:"new";s:3:"new";}}', 1),
(53, '14c9246c3ce6dd5317ffefc0545bba2e', 'a:1:{s:9:"condition";a:1:{s:4:"used";s:4:"used";}}', 1),
(54, '9b16a88b60f3455d51212bf2dc1d3a95', 'a:1:{s:9:"condition";a:1:{s:11:"refurbished";s:11:"refurbished";}}', 1),
(55, 'e3d5c79878834b2f61e6f37c1425bee9', 'a:1:{s:12:"manufacturer";a:1:{i:1;s:1:"1";}}', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_layered_indexable_attribute_group`
--

CREATE TABLE IF NOT EXISTS `ps_layered_indexable_attribute_group` (
  `id_attribute_group` int(11) NOT NULL,
  `indexable` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_attribute_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ps_layered_indexable_attribute_group`
--

INSERT INTO `ps_layered_indexable_attribute_group` (`id_attribute_group`, `indexable`) VALUES
(1, 1),
(2, 1),
(3, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_layered_indexable_attribute_group_lang_value`
--

CREATE TABLE IF NOT EXISTS `ps_layered_indexable_attribute_group_lang_value` (
  `id_attribute_group` int(11) NOT NULL,
  `id_lang` int(11) NOT NULL,
  `url_name` varchar(20) DEFAULT NULL,
  `meta_title` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_attribute_group`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_layered_indexable_attribute_lang_value`
--

CREATE TABLE IF NOT EXISTS `ps_layered_indexable_attribute_lang_value` (
  `id_attribute` int(11) NOT NULL,
  `id_lang` int(11) NOT NULL,
  `url_name` varchar(20) DEFAULT NULL,
  `meta_title` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_attribute`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_layered_indexable_feature`
--

CREATE TABLE IF NOT EXISTS `ps_layered_indexable_feature` (
  `id_feature` int(11) NOT NULL,
  `indexable` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_feature`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ps_layered_indexable_feature`
--

INSERT INTO `ps_layered_indexable_feature` (`id_feature`, `indexable`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_layered_indexable_feature_lang_value`
--

CREATE TABLE IF NOT EXISTS `ps_layered_indexable_feature_lang_value` (
  `id_feature` int(11) NOT NULL,
  `id_lang` int(11) NOT NULL,
  `url_name` varchar(20) NOT NULL,
  `meta_title` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_feature`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_layered_indexable_feature_value_lang_value`
--

CREATE TABLE IF NOT EXISTS `ps_layered_indexable_feature_value_lang_value` (
  `id_feature_value` int(11) NOT NULL,
  `id_lang` int(11) NOT NULL,
  `url_name` varchar(20) DEFAULT NULL,
  `meta_title` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_feature_value`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_layered_price_index`
--

CREATE TABLE IF NOT EXISTS `ps_layered_price_index` (
  `id_product` int(11) NOT NULL,
  `id_currency` int(11) NOT NULL,
  `id_shop` int(11) NOT NULL,
  `price_min` int(11) NOT NULL,
  `price_max` int(11) NOT NULL,
  PRIMARY KEY (`id_product`,`id_currency`,`id_shop`),
  KEY `id_currency` (`id_currency`),
  KEY `price_min` (`price_min`),
  KEY `price_max` (`price_max`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ps_layered_price_index`
--

INSERT INTO `ps_layered_price_index` (`id_product`, `id_currency`, `id_shop`, `price_min`, `price_max`) VALUES
(1, 1, 1, 16, 19),
(2, 1, 1, 26, 31),
(3, 1, 1, 5220000, 6055200),
(4, 1, 1, 4500000, 5220000),
(5, 1, 1, 28, 34),
(6, 1, 1, 30, 35),
(7, 1, 1, 16, 19);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_layered_product_attribute`
--

CREATE TABLE IF NOT EXISTS `ps_layered_product_attribute` (
  `id_attribute` int(10) unsigned NOT NULL,
  `id_product` int(10) unsigned NOT NULL,
  `id_attribute_group` int(10) unsigned NOT NULL DEFAULT '0',
  `id_shop` int(10) unsigned NOT NULL DEFAULT '1',
  KEY `id_attribute` (`id_attribute`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ps_layered_product_attribute`
--

INSERT INTO `ps_layered_product_attribute` (`id_attribute`, `id_product`, `id_attribute_group`, `id_shop`) VALUES
(1, 1, 1, 1),
(1, 5, 1, 1),
(1, 6, 1, 1),
(2, 1, 1, 1),
(2, 5, 1, 1),
(2, 6, 1, 1),
(3, 1, 1, 1),
(3, 5, 1, 1),
(3, 6, 1, 1),
(8, 6, 3, 1),
(11, 5, 3, 1),
(13, 1, 3, 1),
(13, 5, 3, 1),
(14, 1, 3, 1),
(14, 5, 3, 1),
(16, 5, 3, 1),
(16, 6, 3, 1),
(1, 7, 1, 1),
(2, 7, 1, 1),
(3, 7, 1, 1),
(15, 7, 3, 1),
(16, 7, 3, 1),
(1, 4, 1, 1),
(2, 4, 1, 1),
(3, 4, 1, 1),
(7, 4, 3, 1),
(24, 4, 3, 1),
(1, 3, 1, 1),
(2, 3, 1, 1),
(3, 3, 1, 1),
(13, 3, 3, 1),
(1, 2, 1, 1),
(2, 2, 1, 1),
(3, 2, 1, 1),
(8, 2, 3, 1),
(11, 2, 3, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_linksmenutop`
--

CREATE TABLE IF NOT EXISTS `ps_linksmenutop` (
  `id_linksmenutop` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_shop` int(11) unsigned NOT NULL,
  `new_window` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_linksmenutop`),
  KEY `id_shop` (`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_linksmenutop_lang`
--

CREATE TABLE IF NOT EXISTS `ps_linksmenutop_lang` (
  `id_linksmenutop` int(11) unsigned NOT NULL,
  `id_lang` int(11) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL,
  `label` varchar(128) NOT NULL,
  `link` varchar(128) NOT NULL,
  KEY `id_linksmenutop` (`id_linksmenutop`,`id_lang`,`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_log`
--

CREATE TABLE IF NOT EXISTS `ps_log` (
  `id_log` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `severity` tinyint(1) NOT NULL,
  `error_code` int(11) DEFAULT NULL,
  `message` text NOT NULL,
  `object_type` varchar(32) DEFAULT NULL,
  `object_id` int(10) unsigned DEFAULT NULL,
  `id_employee` int(10) unsigned DEFAULT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_log`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=36 ;

--
-- Volcado de datos para la tabla `ps_log`
--

INSERT INTO `ps_log` (`id_log`, `severity`, `error_code`, `message`, `object_type`, `object_id`, `id_employee`, `date_add`, `date_upd`) VALUES
(1, 1, 0, 'Conexión con el Backoffice desde 10.211.130.1', '', 0, 1, '2015-10-17 13:29:12', '2015-10-17 13:29:12'),
(2, 1, 0, 'Conexión con el Backoffice desde 10.211.130.2', '', 0, 1, '2015-10-18 11:51:04', '2015-10-18 11:51:04'),
(3, 1, 0, 'Meta añadido', 'Meta', 41, 1, '2015-10-18 14:39:24', '2015-10-18 14:39:24'),
(4, 1, 0, 'Meta modificación', 'Meta', 41, 1, '2015-10-18 14:40:12', '2015-10-18 14:40:12'),
(5, 1, 0, 'Meta modificación', 'Meta', 41, 1, '2015-10-18 14:52:13', '2015-10-18 14:52:13'),
(6, 1, 0, 'Conexión con el Backoffice desde 10.211.130.1', '', 0, 1, '2015-10-19 17:25:30', '2015-10-19 17:25:30'),
(7, 1, 0, 'CMSCategory añadido', 'CMSCategory', 2, 1, '2015-10-19 18:37:07', '2015-10-19 18:37:07'),
(8, 1, 0, 'Conexión con el Backoffice desde 172.87.3.124', '', 0, 1, '2015-11-12 12:21:54', '2015-11-12 12:21:54'),
(9, 1, 0, 'Conexión con el Backoffice desde 172.87.3.124', '', 0, 1, '2015-11-12 17:05:51', '2015-11-12 17:05:51'),
(10, 1, 0, 'Conexión con el Backoffice desde 172.87.3.124', '', 0, 1, '2015-11-13 11:05:52', '2015-11-13 11:05:52'),
(11, 1, 0, 'Conexión con el Backoffice desde 172.87.3.124', '', 0, 1, '2015-11-13 12:07:04', '2015-11-13 12:07:04'),
(12, 1, 0, 'Conexión con el Backoffice desde 172.87.3.124', '', 0, 1, '2015-11-13 14:28:46', '2015-11-13 14:28:46'),
(13, 1, 0, 'Conexión con el Backoffice desde 172.87.3.124', '', 0, 1, '2015-11-17 10:35:25', '2015-11-17 10:35:25'),
(14, 1, 0, 'Conexión con el Backoffice desde 172.87.3.124', '', 0, 1, '2015-11-17 11:11:27', '2015-11-17 11:11:27'),
(15, 1, 0, 'Product modificación', 'Product', 4, 1, '2015-11-17 11:11:36', '2015-11-17 11:11:36'),
(16, 1, 0, 'Product modificación', 'Product', 7, 1, '2015-11-17 11:11:50', '2015-11-17 11:11:50'),
(17, 1, 0, 'Conexión con el Backoffice desde 172.87.3.124', '', 0, 1, '2015-11-17 15:54:30', '2015-11-17 15:54:30'),
(18, 1, 0, 'Product modificación', 'Product', 4, 1, '2015-11-17 15:55:49', '2015-11-17 15:55:49'),
(19, 1, 0, 'Product modificación', 'Product', 4, 1, '2015-11-17 15:56:12', '2015-11-17 15:56:12'),
(20, 1, 0, 'Product modificación', 'Product', 4, 1, '2015-11-17 15:58:45', '2015-11-17 15:58:45'),
(21, 1, 0, 'Product modificación', 'Product', 4, 1, '2015-11-17 16:00:04', '2015-11-17 16:00:04'),
(22, 1, 0, 'Conexión con el Backoffice desde 172.87.3.124', '', 0, 1, '2015-11-17 16:46:34', '2015-11-17 16:46:34'),
(23, 1, 0, 'Product modificación', 'Product', 4, 1, '2015-11-17 16:46:59', '2015-11-17 16:46:59'),
(24, 1, 0, 'Conexión con el Backoffice desde 172.87.3.124', '', 0, 1, '2015-11-17 16:48:59', '2015-11-17 16:48:59'),
(25, 1, 0, 'Product modificación', 'Product', 4, 1, '2015-11-17 16:55:49', '2015-11-17 16:55:49'),
(26, 1, 0, 'Product modificación', 'Product', 4, 1, '2015-11-17 17:05:15', '2015-11-17 17:05:15'),
(27, 1, 0, 'Product modificación', 'Product', 4, 1, '2015-11-17 17:05:38', '2015-11-17 17:05:38'),
(28, 1, 0, 'Product modificación', 'Product', 4, 1, '2015-11-17 17:10:19', '2015-11-17 17:10:19'),
(29, 1, 0, 'Product modificación', 'Product', 4, 1, '2015-11-17 17:10:58', '2015-11-17 17:10:58'),
(30, 1, 0, 'Product modificación', 'Product', 3, 1, '2015-11-17 17:31:27', '2015-11-17 17:31:27'),
(31, 1, 0, 'Product modificación', 'Product', 3, 1, '2015-11-17 17:32:36', '2015-11-17 17:32:36'),
(32, 1, 0, 'Product modificación', 'Product', 3, 1, '2015-11-17 17:35:40', '2015-11-17 17:35:40'),
(33, 1, 0, 'Product modificación', 'Product', 3, 1, '2015-11-17 17:41:42', '2015-11-17 17:41:42'),
(34, 1, 0, 'Product modificación', 'Product', 2, 1, '2015-11-17 17:43:43', '2015-11-17 17:43:43'),
(35, 1, 0, 'Product modificación', 'Product', 2, 1, '2015-11-17 17:44:30', '2015-11-17 17:44:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_mail`
--

CREATE TABLE IF NOT EXISTS `ps_mail` (
  `id_mail` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `recipient` varchar(126) NOT NULL,
  `template` varchar(62) NOT NULL,
  `subject` varchar(254) NOT NULL,
  `id_lang` int(11) unsigned NOT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_mail`),
  KEY `recipient` (`recipient`(10))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `ps_mail`
--

INSERT INTO `ps_mail` (`id_mail`, `recipient`, `template`, `subject`, `id_lang`, `date_add`) VALUES
(1, 'asd@asd.com', 'newsletter_verif', '[MATISSES] Verificación de correo', 1, '2015-10-19 23:12:37');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_manufacturer`
--

CREATE TABLE IF NOT EXISTS `ps_manufacturer` (
  `id_manufacturer` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_manufacturer`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `ps_manufacturer`
--

INSERT INTO `ps_manufacturer` (`id_manufacturer`, `name`, `date_add`, `date_upd`, `active`) VALUES
(1, 'Fashion Manufacturer', '2015-06-22 10:29:13', '2015-06-22 10:29:13', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_manufacturer_lang`
--

CREATE TABLE IF NOT EXISTS `ps_manufacturer_lang` (
  `id_manufacturer` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `description` text,
  `short_description` text,
  `meta_title` varchar(128) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_manufacturer`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ps_manufacturer_lang`
--

INSERT INTO `ps_manufacturer_lang` (`id_manufacturer`, `id_lang`, `description`, `short_description`, `meta_title`, `meta_keywords`, `meta_description`) VALUES
(1, 1, '', '', '', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_manufacturer_shop`
--

CREATE TABLE IF NOT EXISTS `ps_manufacturer_shop` (
  `id_manufacturer` int(11) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_manufacturer`,`id_shop`),
  KEY `id_shop` (`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ps_manufacturer_shop`
--

INSERT INTO `ps_manufacturer_shop` (`id_manufacturer`, `id_shop`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_memcached_servers`
--

CREATE TABLE IF NOT EXISTS `ps_memcached_servers` (
  `id_memcached_server` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(254) NOT NULL,
  `port` int(11) unsigned NOT NULL,
  `weight` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_memcached_server`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_message`
--

CREATE TABLE IF NOT EXISTS `ps_message` (
  `id_message` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_cart` int(10) unsigned DEFAULT NULL,
  `id_customer` int(10) unsigned NOT NULL,
  `id_employee` int(10) unsigned DEFAULT NULL,
  `id_order` int(10) unsigned NOT NULL,
  `message` text NOT NULL,
  `private` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_message`),
  KEY `message_order` (`id_order`),
  KEY `id_cart` (`id_cart`),
  KEY `id_customer` (`id_customer`),
  KEY `id_employee` (`id_employee`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_message_readed`
--

CREATE TABLE IF NOT EXISTS `ps_message_readed` (
  `id_message` int(10) unsigned NOT NULL,
  `id_employee` int(10) unsigned NOT NULL,
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_message`,`id_employee`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_meta`
--

CREATE TABLE IF NOT EXISTS `ps_meta` (
  `id_meta` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `page` varchar(64) NOT NULL,
  `configurable` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_meta`),
  UNIQUE KEY `page` (`page`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=43 ;

--
-- Volcado de datos para la tabla `ps_meta`
--

INSERT INTO `ps_meta` (`id_meta`, `page`, `configurable`) VALUES
(1, 'pagenotfound', 1),
(2, 'best-sales', 1),
(3, 'contact', 1),
(4, 'index', 1),
(5, 'manufacturer', 1),
(6, 'new-products', 1),
(7, 'password', 1),
(8, 'prices-drop', 1),
(9, 'sitemap', 1),
(10, 'supplier', 1),
(11, 'address', 1),
(12, 'addresses', 1),
(13, 'authentication', 1),
(14, 'cart', 1),
(15, 'discount', 1),
(16, 'history', 1),
(17, 'identity', 1),
(18, 'my-account', 1),
(19, 'order-follow', 1),
(20, 'order-slip', 1),
(21, 'order', 1),
(22, 'search', 1),
(23, 'stores', 1),
(24, 'order-opc', 1),
(25, 'guest-tracking', 1),
(26, 'order-confirmation', 1),
(27, 'product', 0),
(28, 'category', 0),
(29, 'cms', 0),
(30, 'module-cheque-payment', 0),
(31, 'module-cheque-validation', 0),
(32, 'module-bankwire-validation', 0),
(33, 'module-bankwire-payment', 0),
(34, 'products-comparison', 1),
(38, 'module-cronjobs-callback', 1),
(39, 'module-blockwishlist-mywishlist', 1),
(40, 'module-blockwishlist-view', 1),
(41, 'module-news-list', 1),
(42, 'module-blocknewsletter-verification', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_meta_lang`
--

CREATE TABLE IF NOT EXISTS `ps_meta_lang` (
  `id_meta` int(10) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL DEFAULT '1',
  `id_lang` int(10) unsigned NOT NULL,
  `title` varchar(128) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `url_rewrite` varchar(254) NOT NULL,
  PRIMARY KEY (`id_meta`,`id_shop`,`id_lang`),
  KEY `id_shop` (`id_shop`),
  KEY `id_lang` (`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ps_meta_lang`
--

INSERT INTO `ps_meta_lang` (`id_meta`, `id_shop`, `id_lang`, `title`, `description`, `keywords`, `url_rewrite`) VALUES
(1, 1, 1, 'Error 404', 'Página no encontrada', 'error, 404, No se ha encontrado', 'pagina-no-ecnontrada'),
(2, 1, 1, 'Lo más vendido', 'Nuestros productos estrella', 'los más vendidos', 'mas-vendido'),
(3, 1, 1, 'Contáctanos', 'Utiliza nuestro formulario para ponerte en contacto con nosotros', 'formulario de contacto, e-mail', 'contactanos'),
(4, 1, 1, '', 'Tienda creada con PrestaShop', 'tienda, prestashop', ''),
(5, 1, 1, 'Fabricantes', 'Lista de fabricantes', 'fabricantes', 'fabricantes'),
(6, 1, 1, 'Productos nuevos', 'Nuestros productos nuevos', 'nuevo, productos', 'nuevos-productos'),
(7, 1, 1, '¿Has olvidado tu contraseña?', 'Introduce la dirección de correo electrónico que utilices para acceder para recibir un mensaje de correo con una nueva contraseña', 'contraseña, has olvidado, e-mail, nuevo, regeneración', 'recuperacion-contraseña'),
(8, 1, 1, 'Bajamos los precios', 'Nuestros productos especiales', 'promoción, reducción', 'bajamos-precios'),
(9, 1, 1, 'Mapa del sitio web', '¿Estás perdido? Encuentra lo que buscas', 'plan, sitio', 'mapa-web'),
(10, 1, 1, 'Proveedores', 'Lista de proveedores', 'proveedores', 'proveedor'),
(11, 1, 1, 'Dirección', '', '', 'direccion'),
(12, 1, 1, 'Direcciones', '', '', 'direcciones'),
(13, 1, 1, 'Iniciar sesión', '', '', 'inicio-sesion'),
(14, 1, 1, 'Carrito', '', '', 'carrito'),
(15, 1, 1, 'Descuento', '', '', 'descuento'),
(16, 1, 1, 'Historial de compra', '', '', 'historial-compra'),
(17, 1, 1, 'Datos personales', '', '', 'datos-personales'),
(18, 1, 1, 'Mi cuenta', '', '', 'mi-cuenta'),
(19, 1, 1, 'Seguimiento del pedido', '', '', 'seguimiento-pedido'),
(20, 1, 1, 'Albarán', '', '', 'albaran'),
(21, 1, 1, 'Pedido', '', '', 'pedido'),
(22, 1, 1, 'Buscar', '', '', 'buscar'),
(23, 1, 1, 'Tiendas', '', '', 'tiendas'),
(24, 1, 1, 'Pedido', '', '', 'pedido-rapido'),
(25, 1, 1, 'Seguimiento para clientes no registrados', '', '', 'seguimiento-cliente-no-registrado'),
(26, 1, 1, 'Confirmación de pedido', '', '', 'confirmacion-pedido'),
(34, 1, 1, 'Comparativa de productos', '', '', 'comparativa-productos'),
(38, 1, 1, '', '', '', ''),
(39, 1, 1, '', '', '', ''),
(40, 1, 1, '', '', '', ''),
(41, 1, 1, 'blog', '', '', 'blog'),
(42, 1, 1, '', '', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_module`
--

CREATE TABLE IF NOT EXISTS `ps_module` (
  `id_module` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `version` varchar(8) NOT NULL,
  PRIMARY KEY (`id_module`),
  KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=94 ;

--
-- Volcado de datos para la tabla `ps_module`
--

INSERT INTO `ps_module` (`id_module`, `name`, `active`, `version`) VALUES
(1, 'socialsharing', 1, '1.2.9'),
(2, 'blockbanner', 1, '1.3.4'),
(3, 'bankwire', 1, '1.0.5'),
(4, 'blockbestsellers', 1, '1.6.0'),
(7, 'blockcategories', 1, '2.8.7'),
(8, 'blockcurrencies', 1, '0.3.2'),
(9, 'blockfacebook', 1, '1.3.3'),
(10, 'blocklanguages', 1, '1.3.3'),
(11, 'blocklayered', 1, '2.0.7'),
(12, 'blockcms', 1, '2.0.1'),
(13, 'blockcmsinfo', 1, '1.5.2'),
(14, 'blockcontact', 1, '1.3.2'),
(15, 'blockcontactinfos', 1, '1.1.2'),
(16, 'blockmanufacturer', 1, '1.2.2'),
(17, 'blockmyaccount', 1, '1.3.1'),
(18, 'blockmyaccountfooter', 1, '1.5.1'),
(21, 'blockpaymentlogo', 1, '0.3.3'),
(23, 'blockspecials', 1, '1.1.4'),
(24, 'blockstore', 1, '1.2.1'),
(25, 'blocksupplier', 1, '1.1.1'),
(26, 'blocktags', 1, '1.2.5'),
(30, 'cheque', 1, '2.5.6'),
(31, 'dashactivity', 1, '0.4.6'),
(32, 'dashtrends', 1, '0.7.3'),
(33, 'dashgoals', 1, '0.6.4'),
(34, 'dashproducts', 1, '0.3.2'),
(35, 'graphnvd3', 1, '1.4'),
(36, 'gridhtml', 1, '1.2.2'),
(38, 'homefeatured', 1, '1.6.2'),
(39, 'productpaymentlogos', 1, '1.3.6'),
(40, 'pagesnotfound', 1, '1.3.4'),
(41, 'sekeywords', 1, '1.2.4'),
(42, 'statsbestcategories', 1, '1.4.1'),
(43, 'statsbestcustomers', 1, '1.4.1'),
(44, 'statsbestproducts', 1, '1.4.1'),
(45, 'statsbestsuppliers', 1, '1.3.1'),
(46, 'statsbestvouchers', 1, '1.4.1'),
(47, 'statscarrier', 1, '1.3.1'),
(48, 'statscatalog', 1, '1.2.3'),
(49, 'statscheckup', 1, '1.3.1'),
(50, 'statsdata', 1, '1.4.1'),
(51, 'statsequipment', 1, '1.2.3'),
(52, 'statsforecast', 1, '1.3.5'),
(53, 'statslive', 1, '1.2.2'),
(54, 'statsnewsletter', 1, '1.3.1'),
(55, 'statsorigin', 1, '1.3.1'),
(56, 'statspersonalinfos', 1, '1.3.1'),
(57, 'statsproduct', 1, '1.3.1'),
(58, 'statsregistrations', 1, '1.3.1'),
(59, 'statssales', 1, '1.2.3'),
(60, 'statssearch', 1, '1.3.2'),
(61, 'statsstock', 1, '1.4.2'),
(62, 'statsvisits', 1, '1.5.1'),
(63, 'themeconfigurator', 1, '1.1.8'),
(64, 'gamification', 1, '1.10.3'),
(66, 'productcomments', 1, '3.4.1'),
(67, 'sendtoafriend', 1, '1.7.3'),
(68, 'cronjobs', 1, '1.2.7'),
(69, 'onboarding', 1, '0.2.0'),
(70, 'problocknewsletter', 1, '1.0.1'),
(71, 'problocksocial', 1, '1.1.3'),
(72, 'dinterval', 1, '1.0.0'),
(73, 'testimonialswithavatars', 1, '2.0.0'),
(74, 'easycarousels', 1, '1.1.0'),
(75, 'custombanners', 1, '2.5.0'),
(76, 'problockcontactinfos', 1, '1.1.1'),
(77, 'blockfacebooklike', 1, '1.3.1'),
(78, 'twitterwidget', 1, '1.0.0'),
(79, 'blockwishlist', 1, '1.2.3'),
(82, 'blocktopmenu', 1, '2.0.9'),
(84, 'blocksearch', 1, '1.5.3'),
(85, 'blocksocial', 1, '1.1.5'),
(86, 'blockuserinfo', 1, '0.3.1'),
(88, 'blockcart', 1, '1.5.6'),
(89, 'homeslider', 1, '1.4.5'),
(90, 'blockviewed', 1, '1.2.3'),
(91, 'blocknewproducts', 1, '1.9.3'),
(92, 'news', 1, '2.2.9'),
(93, 'blocknewsletter', 1, '2.1.5');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_module_access`
--

CREATE TABLE IF NOT EXISTS `ps_module_access` (
  `id_profile` int(10) unsigned NOT NULL,
  `id_module` int(10) unsigned NOT NULL,
  `view` tinyint(1) NOT NULL DEFAULT '0',
  `configure` tinyint(1) NOT NULL DEFAULT '0',
  `uninstall` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_profile`,`id_module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ps_module_access`
--

INSERT INTO `ps_module_access` (`id_profile`, `id_module`, `view`, `configure`, `uninstall`) VALUES
(1, 1, 1, 0, 0),
(1, 2, 1, 0, 0),
(1, 3, 1, 0, 0),
(1, 4, 1, 0, 0),
(1, 7, 1, 0, 0),
(1, 8, 1, 0, 0),
(1, 9, 1, 0, 0),
(1, 10, 1, 0, 0),
(1, 11, 1, 0, 0),
(1, 12, 1, 0, 0),
(1, 13, 1, 0, 0),
(1, 14, 1, 0, 0),
(1, 15, 1, 0, 0),
(1, 16, 1, 0, 0),
(1, 17, 1, 0, 0),
(1, 18, 1, 0, 0),
(1, 21, 1, 0, 0),
(1, 23, 1, 0, 0),
(1, 24, 1, 0, 0),
(1, 25, 1, 0, 0),
(1, 26, 1, 0, 0),
(1, 30, 1, 0, 0),
(1, 31, 1, 0, 0),
(1, 32, 1, 0, 0),
(1, 33, 1, 0, 0),
(1, 34, 1, 0, 0),
(1, 35, 1, 0, 0),
(1, 36, 1, 0, 0),
(1, 38, 1, 0, 0),
(1, 39, 1, 0, 0),
(1, 40, 1, 0, 0),
(1, 41, 1, 0, 0),
(1, 42, 1, 0, 0),
(1, 43, 1, 0, 0),
(1, 44, 1, 0, 0),
(1, 45, 1, 0, 0),
(1, 46, 1, 0, 0),
(1, 47, 1, 0, 0),
(1, 48, 1, 0, 0),
(1, 49, 1, 0, 0),
(1, 50, 1, 0, 0),
(1, 51, 1, 0, 0),
(1, 52, 1, 0, 0),
(1, 53, 1, 0, 0),
(1, 54, 1, 0, 0),
(1, 55, 1, 0, 0),
(1, 56, 1, 0, 0),
(1, 57, 1, 0, 0),
(1, 58, 1, 0, 0),
(1, 59, 1, 0, 0),
(1, 60, 1, 0, 0),
(1, 61, 1, 0, 0),
(1, 62, 1, 0, 0),
(1, 63, 1, 0, 0),
(1, 64, 1, 0, 0),
(1, 66, 1, 0, 0),
(1, 67, 1, 0, 0),
(1, 68, 1, 0, 0),
(1, 69, 1, 0, 0),
(1, 70, 1, 0, 0),
(1, 71, 1, 0, 0),
(1, 72, 1, 0, 0),
(1, 73, 1, 0, 0),
(1, 74, 1, 0, 0),
(1, 75, 1, 0, 0),
(1, 76, 1, 0, 0),
(1, 77, 1, 0, 0),
(1, 78, 1, 0, 0),
(1, 79, 1, 0, 0),
(1, 82, 1, 0, 0),
(1, 84, 1, 0, 0),
(1, 85, 1, 0, 0),
(1, 86, 1, 0, 0),
(1, 88, 1, 0, 0),
(1, 89, 1, 0, 0),
(1, 90, 1, 0, 0),
(1, 91, 1, 0, 0),
(1, 92, 1, 0, 0),
(1, 93, 1, 0, 0),
(2, 1, 1, 1, 1),
(2, 2, 1, 1, 1),
(2, 3, 1, 1, 1),
(2, 4, 1, 1, 1),
(2, 7, 1, 1, 1),
(2, 8, 1, 1, 1),
(2, 9, 1, 1, 1),
(2, 10, 1, 1, 1),
(2, 11, 1, 1, 1),
(2, 12, 1, 1, 1),
(2, 13, 1, 1, 1),
(2, 14, 1, 1, 1),
(2, 15, 1, 1, 1),
(2, 16, 1, 1, 1),
(2, 17, 1, 1, 1),
(2, 18, 1, 1, 1),
(2, 21, 1, 1, 1),
(2, 23, 1, 1, 1),
(2, 24, 1, 1, 1),
(2, 25, 1, 1, 1),
(2, 26, 1, 1, 1),
(2, 30, 1, 1, 1),
(2, 31, 1, 1, 1),
(2, 32, 1, 1, 1),
(2, 33, 1, 1, 1),
(2, 34, 1, 1, 1),
(2, 35, 1, 1, 1),
(2, 36, 1, 1, 1),
(2, 38, 1, 1, 1),
(2, 39, 1, 1, 1),
(2, 40, 1, 1, 1),
(2, 41, 1, 1, 1),
(2, 42, 1, 1, 1),
(2, 43, 1, 1, 1),
(2, 44, 1, 1, 1),
(2, 45, 1, 1, 1),
(2, 46, 1, 1, 1),
(2, 47, 1, 1, 1),
(2, 48, 1, 1, 1),
(2, 49, 1, 1, 1),
(2, 50, 1, 1, 1),
(2, 51, 1, 1, 1),
(2, 52, 1, 1, 1),
(2, 53, 1, 1, 1),
(2, 54, 1, 1, 1),
(2, 55, 1, 1, 1),
(2, 56, 1, 1, 1),
(2, 57, 1, 1, 1),
(2, 58, 1, 1, 1),
(2, 59, 1, 1, 1),
(2, 60, 1, 1, 1),
(2, 61, 1, 1, 1),
(2, 62, 1, 1, 1),
(2, 63, 1, 1, 1),
(2, 64, 1, 1, 1),
(2, 66, 1, 1, 1),
(2, 67, 1, 1, 1),
(2, 68, 1, 1, 1),
(2, 69, 1, 1, 1),
(2, 70, 1, 1, 1),
(2, 71, 1, 1, 1),
(2, 72, 1, 1, 1),
(2, 73, 1, 1, 1),
(2, 74, 1, 1, 1),
(2, 75, 1, 1, 1),
(2, 76, 1, 1, 1),
(2, 77, 1, 1, 1),
(2, 78, 1, 1, 1),
(2, 79, 1, 1, 1),
(2, 82, 1, 1, 1),
(2, 84, 1, 1, 1),
(2, 85, 1, 1, 1),
(2, 86, 1, 1, 1),
(2, 88, 1, 1, 1),
(2, 89, 1, 1, 1),
(2, 90, 1, 1, 1),
(2, 91, 1, 1, 1),
(2, 92, 1, 1, 1),
(2, 93, 1, 1, 1),
(3, 1, 1, 0, 0),
(3, 2, 1, 0, 0),
(3, 3, 1, 0, 0),
(3, 4, 1, 0, 0),
(3, 7, 1, 0, 0),
(3, 8, 1, 0, 0),
(3, 9, 1, 0, 0),
(3, 10, 1, 0, 0),
(3, 11, 1, 0, 0),
(3, 12, 1, 0, 0),
(3, 13, 1, 0, 0),
(3, 14, 1, 0, 0),
(3, 15, 1, 0, 0),
(3, 16, 1, 0, 0),
(3, 17, 1, 0, 0),
(3, 18, 1, 0, 0),
(3, 21, 1, 0, 0),
(3, 23, 1, 0, 0),
(3, 24, 1, 0, 0),
(3, 25, 1, 0, 0),
(3, 26, 1, 0, 0),
(3, 30, 1, 0, 0),
(3, 31, 1, 0, 0),
(3, 32, 1, 0, 0),
(3, 33, 1, 0, 0),
(3, 34, 1, 0, 0),
(3, 35, 1, 0, 0),
(3, 36, 1, 0, 0),
(3, 38, 1, 0, 0),
(3, 39, 1, 0, 0),
(3, 40, 1, 0, 0),
(3, 41, 1, 0, 0),
(3, 42, 1, 0, 0),
(3, 43, 1, 0, 0),
(3, 44, 1, 0, 0),
(3, 45, 1, 0, 0),
(3, 46, 1, 0, 0),
(3, 47, 1, 0, 0),
(3, 48, 1, 0, 0),
(3, 49, 1, 0, 0),
(3, 50, 1, 0, 0),
(3, 51, 1, 0, 0),
(3, 52, 1, 0, 0),
(3, 53, 1, 0, 0),
(3, 54, 1, 0, 0),
(3, 55, 1, 0, 0),
(3, 56, 1, 0, 0),
(3, 57, 1, 0, 0),
(3, 58, 1, 0, 0),
(3, 59, 1, 0, 0),
(3, 60, 1, 0, 0),
(3, 61, 1, 0, 0),
(3, 62, 1, 0, 0),
(3, 63, 1, 0, 0),
(3, 64, 1, 0, 0),
(3, 66, 1, 0, 0),
(3, 67, 1, 0, 0),
(3, 68, 1, 0, 0),
(3, 69, 1, 0, 0),
(3, 70, 1, 0, 0),
(3, 71, 1, 0, 0),
(3, 72, 1, 0, 0),
(3, 73, 1, 0, 0),
(3, 74, 1, 0, 0),
(3, 75, 1, 0, 0),
(3, 76, 1, 0, 0),
(3, 77, 1, 0, 0),
(3, 78, 1, 0, 0),
(3, 79, 1, 0, 0),
(3, 82, 1, 0, 0),
(3, 84, 1, 0, 0),
(3, 85, 1, 0, 0),
(3, 86, 1, 0, 0),
(3, 88, 1, 0, 0),
(3, 89, 1, 0, 0),
(3, 90, 1, 0, 0),
(3, 91, 1, 0, 0),
(3, 92, 1, 0, 0),
(3, 93, 1, 0, 0),
(4, 1, 1, 1, 1),
(4, 2, 1, 1, 1),
(4, 3, 1, 1, 1),
(4, 4, 1, 1, 1),
(4, 7, 1, 1, 1),
(4, 8, 1, 1, 1),
(4, 9, 1, 1, 1),
(4, 10, 1, 1, 1),
(4, 11, 1, 1, 1),
(4, 12, 1, 1, 1),
(4, 13, 1, 1, 1),
(4, 14, 1, 1, 1),
(4, 15, 1, 1, 1),
(4, 16, 1, 1, 1),
(4, 17, 1, 1, 1),
(4, 18, 1, 1, 1),
(4, 21, 1, 1, 1),
(4, 23, 1, 1, 1),
(4, 24, 1, 1, 1),
(4, 25, 1, 1, 1),
(4, 26, 1, 1, 1),
(4, 30, 1, 1, 1),
(4, 31, 1, 1, 1),
(4, 32, 1, 1, 1),
(4, 33, 1, 1, 1),
(4, 34, 1, 1, 1),
(4, 35, 1, 1, 1),
(4, 36, 1, 1, 1),
(4, 38, 1, 1, 1),
(4, 39, 1, 1, 1),
(4, 40, 1, 1, 1),
(4, 41, 1, 1, 1),
(4, 42, 1, 1, 1),
(4, 43, 1, 1, 1),
(4, 44, 1, 1, 1),
(4, 45, 1, 1, 1),
(4, 46, 1, 1, 1),
(4, 47, 1, 1, 1),
(4, 48, 1, 1, 1),
(4, 49, 1, 1, 1),
(4, 50, 1, 1, 1),
(4, 51, 1, 1, 1),
(4, 52, 1, 1, 1),
(4, 53, 1, 1, 1),
(4, 54, 1, 1, 1),
(4, 55, 1, 1, 1),
(4, 56, 1, 1, 1),
(4, 57, 1, 1, 1),
(4, 58, 1, 1, 1),
(4, 59, 1, 1, 1),
(4, 60, 1, 1, 1),
(4, 61, 1, 1, 1),
(4, 62, 1, 1, 1),
(4, 63, 1, 1, 1),
(4, 64, 1, 1, 1),
(4, 66, 1, 1, 1),
(4, 67, 1, 1, 1),
(4, 68, 1, 1, 1),
(4, 69, 1, 1, 1),
(4, 70, 1, 1, 1),
(4, 71, 1, 1, 1),
(4, 72, 1, 1, 1),
(4, 73, 1, 1, 1),
(4, 74, 1, 1, 1),
(4, 75, 1, 1, 1),
(4, 76, 1, 1, 1),
(4, 77, 1, 1, 1),
(4, 78, 1, 1, 1),
(4, 79, 1, 1, 1),
(4, 82, 1, 1, 1),
(4, 84, 1, 1, 1),
(4, 85, 1, 1, 1),
(4, 86, 1, 1, 1),
(4, 88, 1, 1, 1),
(4, 89, 1, 1, 1),
(4, 90, 1, 1, 1),
(4, 91, 1, 1, 1),
(4, 92, 1, 1, 1),
(4, 93, 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_module_country`
--

CREATE TABLE IF NOT EXISTS `ps_module_country` (
  `id_module` int(10) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL DEFAULT '1',
  `id_country` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_module`,`id_shop`,`id_country`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ps_module_country`
--

INSERT INTO `ps_module_country` (`id_module`, `id_shop`, `id_country`) VALUES
(3, 1, 69),
(30, 1, 69);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_module_currency`
--

CREATE TABLE IF NOT EXISTS `ps_module_currency` (
  `id_module` int(10) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL DEFAULT '1',
  `id_currency` int(11) NOT NULL,
  PRIMARY KEY (`id_module`,`id_shop`,`id_currency`),
  KEY `id_module` (`id_module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ps_module_currency`
--

INSERT INTO `ps_module_currency` (`id_module`, `id_shop`, `id_currency`) VALUES
(3, 1, 1),
(30, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_module_group`
--

CREATE TABLE IF NOT EXISTS `ps_module_group` (
  `id_module` int(10) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL DEFAULT '1',
  `id_group` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_module`,`id_shop`,`id_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ps_module_group`
--

INSERT INTO `ps_module_group` (`id_module`, `id_shop`, `id_group`) VALUES
(1, 1, 1),
(1, 1, 2),
(1, 1, 3),
(2, 1, 1),
(2, 1, 2),
(2, 1, 3),
(3, 1, 1),
(3, 1, 2),
(3, 1, 3),
(4, 1, 1),
(4, 1, 2),
(4, 1, 3),
(7, 1, 1),
(7, 1, 2),
(7, 1, 3),
(8, 1, 1),
(8, 1, 2),
(8, 1, 3),
(9, 1, 1),
(9, 1, 2),
(9, 1, 3),
(10, 1, 1),
(10, 1, 2),
(10, 1, 3),
(11, 1, 1),
(11, 1, 2),
(11, 1, 3),
(12, 1, 1),
(12, 1, 2),
(12, 1, 3),
(13, 1, 1),
(13, 1, 2),
(13, 1, 3),
(14, 1, 1),
(14, 1, 2),
(14, 1, 3),
(15, 1, 1),
(15, 1, 2),
(15, 1, 3),
(16, 1, 1),
(16, 1, 2),
(16, 1, 3),
(17, 1, 1),
(17, 1, 2),
(17, 1, 3),
(18, 1, 1),
(18, 1, 2),
(18, 1, 3),
(21, 1, 1),
(21, 1, 2),
(21, 1, 3),
(23, 1, 1),
(23, 1, 2),
(23, 1, 3),
(24, 1, 1),
(24, 1, 2),
(24, 1, 3),
(25, 1, 1),
(25, 1, 2),
(25, 1, 3),
(26, 1, 1),
(26, 1, 2),
(26, 1, 3),
(30, 1, 1),
(30, 1, 2),
(30, 1, 3),
(31, 1, 1),
(31, 1, 2),
(31, 1, 3),
(32, 1, 1),
(32, 1, 2),
(32, 1, 3),
(33, 1, 1),
(33, 1, 2),
(33, 1, 3),
(34, 1, 1),
(34, 1, 2),
(34, 1, 3),
(35, 1, 1),
(35, 1, 2),
(35, 1, 3),
(36, 1, 1),
(36, 1, 2),
(36, 1, 3),
(38, 1, 1),
(38, 1, 2),
(38, 1, 3),
(39, 1, 1),
(39, 1, 2),
(39, 1, 3),
(40, 1, 1),
(40, 1, 2),
(40, 1, 3),
(41, 1, 1),
(41, 1, 2),
(41, 1, 3),
(42, 1, 1),
(42, 1, 2),
(42, 1, 3),
(43, 1, 1),
(43, 1, 2),
(43, 1, 3),
(44, 1, 1),
(44, 1, 2),
(44, 1, 3),
(45, 1, 1),
(45, 1, 2),
(45, 1, 3),
(46, 1, 1),
(46, 1, 2),
(46, 1, 3),
(47, 1, 1),
(47, 1, 2),
(47, 1, 3),
(48, 1, 1),
(48, 1, 2),
(48, 1, 3),
(49, 1, 1),
(49, 1, 2),
(49, 1, 3),
(50, 1, 1),
(50, 1, 2),
(50, 1, 3),
(51, 1, 1),
(51, 1, 2),
(51, 1, 3),
(52, 1, 1),
(52, 1, 2),
(52, 1, 3),
(53, 1, 1),
(53, 1, 2),
(53, 1, 3),
(54, 1, 1),
(54, 1, 2),
(54, 1, 3),
(55, 1, 1),
(55, 1, 2),
(55, 1, 3),
(56, 1, 1),
(56, 1, 2),
(56, 1, 3),
(57, 1, 1),
(57, 1, 2),
(57, 1, 3),
(58, 1, 1),
(58, 1, 2),
(58, 1, 3),
(59, 1, 1),
(59, 1, 2),
(59, 1, 3),
(60, 1, 1),
(60, 1, 2),
(60, 1, 3),
(61, 1, 1),
(61, 1, 2),
(61, 1, 3),
(62, 1, 1),
(62, 1, 2),
(62, 1, 3),
(63, 1, 1),
(63, 1, 2),
(63, 1, 3),
(64, 1, 1),
(64, 1, 2),
(64, 1, 3),
(66, 1, 1),
(66, 1, 2),
(66, 1, 3),
(67, 1, 1),
(67, 1, 2),
(67, 1, 3),
(68, 1, 1),
(68, 1, 2),
(68, 1, 3),
(69, 1, 1),
(69, 1, 2),
(69, 1, 3),
(70, 1, 1),
(70, 1, 2),
(70, 1, 3),
(71, 1, 1),
(71, 1, 2),
(71, 1, 3),
(72, 1, 1),
(72, 1, 2),
(72, 1, 3),
(73, 1, 1),
(73, 1, 2),
(73, 1, 3),
(74, 1, 1),
(74, 1, 2),
(74, 1, 3),
(75, 1, 1),
(75, 1, 2),
(75, 1, 3),
(76, 1, 1),
(76, 1, 2),
(76, 1, 3),
(77, 1, 1),
(77, 1, 2),
(77, 1, 3),
(78, 1, 1),
(78, 1, 2),
(78, 1, 3),
(79, 1, 1),
(79, 1, 2),
(79, 1, 3),
(82, 1, 1),
(82, 1, 2),
(82, 1, 3),
(84, 1, 1),
(84, 1, 2),
(84, 1, 3),
(85, 1, 1),
(85, 1, 2),
(85, 1, 3),
(86, 1, 1),
(86, 1, 2),
(86, 1, 3),
(88, 1, 1),
(88, 1, 2),
(88, 1, 3),
(89, 1, 1),
(89, 1, 2),
(89, 1, 3),
(90, 1, 1),
(90, 1, 2),
(90, 1, 3),
(91, 1, 1),
(91, 1, 2),
(91, 1, 3),
(92, 1, 1),
(92, 1, 2),
(92, 1, 3),
(93, 1, 1),
(93, 1, 2),
(93, 1, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_module_preference`
--

CREATE TABLE IF NOT EXISTS `ps_module_preference` (
  `id_module_preference` int(11) NOT NULL AUTO_INCREMENT,
  `id_employee` int(11) NOT NULL,
  `module` varchar(255) NOT NULL,
  `interest` tinyint(1) DEFAULT NULL,
  `favorite` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_module_preference`),
  UNIQUE KEY `employee_module` (`id_employee`,`module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_module_shop`
--

CREATE TABLE IF NOT EXISTS `ps_module_shop` (
  `id_module` int(11) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL,
  `enable_device` tinyint(1) NOT NULL DEFAULT '7',
  PRIMARY KEY (`id_module`,`id_shop`),
  KEY `id_shop` (`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ps_module_shop`
--

INSERT INTO `ps_module_shop` (`id_module`, `id_shop`, `enable_device`) VALUES
(1, 1, 7),
(3, 1, 7),
(4, 1, 7),
(7, 1, 7),
(8, 1, 7),
(10, 1, 7),
(11, 1, 7),
(12, 1, 7),
(16, 1, 7),
(17, 1, 7),
(18, 1, 7),
(21, 1, 7),
(23, 1, 7),
(24, 1, 7),
(25, 1, 7),
(26, 1, 7),
(30, 1, 7),
(31, 1, 7),
(32, 1, 7),
(33, 1, 7),
(34, 1, 7),
(35, 1, 7),
(36, 1, 7),
(38, 1, 7),
(40, 1, 7),
(41, 1, 7),
(42, 1, 7),
(43, 1, 7),
(44, 1, 7),
(45, 1, 7),
(46, 1, 7),
(47, 1, 7),
(48, 1, 7),
(49, 1, 7),
(50, 1, 7),
(51, 1, 7),
(52, 1, 7),
(53, 1, 7),
(54, 1, 7),
(55, 1, 7),
(56, 1, 7),
(57, 1, 7),
(58, 1, 7),
(59, 1, 7),
(60, 1, 7),
(61, 1, 7),
(62, 1, 7),
(64, 1, 7),
(66, 1, 7),
(67, 1, 7),
(68, 1, 7),
(69, 1, 7),
(70, 1, 7),
(71, 1, 7),
(72, 1, 7),
(76, 1, 7),
(77, 1, 7),
(79, 1, 7),
(82, 1, 7),
(84, 1, 7),
(85, 1, 7),
(86, 1, 7),
(88, 1, 7),
(89, 1, 3),
(90, 1, 7),
(91, 1, 7),
(92, 1, 7),
(93, 1, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_news`
--

CREATE TABLE IF NOT EXISTS `ps_news` (
  `id_news` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `autor` varchar(100) DEFAULT NULL,
  `pos` int(11) NOT NULL DEFAULT '1',
  `active` int(1) NOT NULL DEFAULT '0',
  `date` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_news`),
  KEY `Index1` (`id_news`),
  KEY `Index2` (`id_news`,`pos`,`active`,`date`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `ps_news`
--

INSERT INTO `ps_news` (`id_news`, `autor`, `pos`, `active`, `date`) VALUES
(1, '', 2, 1, 1445218511),
(2, '', 1, 1, 1445218878);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_newsletter`
--

CREATE TABLE IF NOT EXISTS `ps_newsletter` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `id_shop` int(10) unsigned NOT NULL DEFAULT '1',
  `id_shop_group` int(10) unsigned NOT NULL DEFAULT '1',
  `email` varchar(255) NOT NULL,
  `newsletter_date_add` datetime DEFAULT NULL,
  `ip_registration_newsletter` varchar(15) NOT NULL,
  `http_referer` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `ps_newsletter`
--

INSERT INTO `ps_newsletter` (`id`, `id_shop`, `id_shop_group`, `email`, `newsletter_date_add`, `ip_registration_newsletter`, `http_referer`, `active`) VALUES
(1, 1, 1, 'asd@asd.com', '2015-10-19 18:12:36', '10.211.130.1', NULL, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_news_cats`
--

CREATE TABLE IF NOT EXISTS `ps_news_cats` (
  `id_cat` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pos` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_cat`),
  KEY `Index1` (`id_cat`,`pos`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `ps_news_cats`
--

INSERT INTO `ps_news_cats` (`id_cat`, `pos`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_news_cats_lang`
--

CREATE TABLE IF NOT EXISTS `ps_news_cats_lang` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_cat` int(11) unsigned NOT NULL DEFAULT '0',
  `id_lang` int(11) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Index1` (`id`,`id_cat`,`id_lang`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `ps_news_cats_lang`
--

INSERT INTO `ps_news_cats_lang` (`id`, `id_cat`, `id_lang`, `title`) VALUES
(1, 1, 1, 'Blog');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_news_cats_rel`
--

CREATE TABLE IF NOT EXISTS `ps_news_cats_rel` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_cat` int(11) unsigned NOT NULL DEFAULT '0',
  `id_new` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `Index1` (`id`,`id_cat`,`id_new`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `ps_news_cats_rel`
--

INSERT INTO `ps_news_cats_rel` (`id`, `id_cat`, `id_new`) VALUES
(1, 1, 2),
(2, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_news_imgs`
--

CREATE TABLE IF NOT EXISTS `ps_news_imgs` (
  `id_img` int(11) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_img`),
  KEY `Index1` (`id_img`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `ps_news_imgs`
--

INSERT INTO `ps_news_imgs` (`id_img`) VALUES
(1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_news_imgs_rel`
--

CREATE TABLE IF NOT EXISTS `ps_news_imgs_rel` (
  `id_rel` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_news` int(11) NOT NULL DEFAULT '0',
  `id_img` int(11) NOT NULL DEFAULT '0',
  `pos` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_rel`),
  KEY `Index1` (`id_rel`,`id_news`,`id_img`,`pos`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `ps_news_imgs_rel`
--

INSERT INTO `ps_news_imgs_rel` (`id_rel`, `id_news`, `id_img`, `pos`) VALUES
(1, 2, 1, 1),
(2, 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_news_langs`
--

CREATE TABLE IF NOT EXISTS `ps_news_langs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_news` int(11) unsigned NOT NULL DEFAULT '0',
  `id_lang` int(11) unsigned NOT NULL DEFAULT '1',
  `title` varchar(255) DEFAULT NULL,
  `new` text,
  `description` varchar(255) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Index1` (`id`,`id_news`,`id_lang`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `ps_news_langs`
--

INSERT INTO `ps_news_langs` (`id`, `id_news`, `id_lang`, `title`, `new`, `description`, `keywords`) VALUES
(1, 1, 1, 'Test ', 'Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test ', '', ''),
(2, 2, 1, 'test 2 ', 'test 2 test 2 test 2 test 2 test 2 test 2 test 2 test 2 test 2 test 2 test 2 test 2 test 2 test 2 test 2 test 2 test 2 test 2 test 2 test 2 test 2 test 2 test 2 test 2 test 2 test 2 test 2 test 2 test 2 test 2 test 2 test 2 test 2 test 2 test 2 test 2 test 2 test 2 test 2 test 2 test 2 test 2 test 2 test 2 test 2 test 2 test 2 test 2 test 2 test 2 test 2 test 2 test 2 test 2 ', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_news_products`
--

CREATE TABLE IF NOT EXISTS `ps_news_products` (
  `id` int(7) unsigned NOT NULL AUTO_INCREMENT,
  `id_news` int(7) unsigned NOT NULL DEFAULT '0',
  `id_product` int(7) unsigned NOT NULL,
  `pos` int(7) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `Index1` (`id`,`id_news`,`id_product`,`pos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_news_rel`
--

CREATE TABLE IF NOT EXISTS `ps_news_rel` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_news` int(11) unsigned NOT NULL DEFAULT '0',
  `id_news_rel` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `Index1` (`id`,`id_news`,`id_news_rel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_news_tag_lang`
--

CREATE TABLE IF NOT EXISTS `ps_news_tag_lang` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_tag` int(11) unsigned NOT NULL DEFAULT '0',
  `id_lang` int(11) unsigned NOT NULL DEFAULT '1',
  `tag` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Index1` (`id`,`id_tag`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_news_tag_rel`
--

CREATE TABLE IF NOT EXISTS `ps_news_tag_rel` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_new` int(11) unsigned NOT NULL DEFAULT '0',
  `id_tag` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `Index1` (`id`,`id_tag`,`id_new`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_operating_system`
--

CREATE TABLE IF NOT EXISTS `ps_operating_system` (
  `id_operating_system` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id_operating_system`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `ps_operating_system`
--

INSERT INTO `ps_operating_system` (`id_operating_system`, `name`) VALUES
(1, 'Windows XP'),
(2, 'Windows Vista'),
(3, 'Windows 7'),
(4, 'Windows 8'),
(5, 'MacOsX'),
(6, 'Linux'),
(7, 'Android');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_orders`
--

CREATE TABLE IF NOT EXISTS `ps_orders` (
  `id_order` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reference` varchar(9) DEFAULT NULL,
  `id_shop_group` int(11) unsigned NOT NULL DEFAULT '1',
  `id_shop` int(11) unsigned NOT NULL DEFAULT '1',
  `id_carrier` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `id_customer` int(10) unsigned NOT NULL,
  `id_cart` int(10) unsigned NOT NULL,
  `id_currency` int(10) unsigned NOT NULL,
  `id_address_delivery` int(10) unsigned NOT NULL,
  `id_address_invoice` int(10) unsigned NOT NULL,
  `current_state` int(10) unsigned NOT NULL,
  `secure_key` varchar(32) NOT NULL DEFAULT '-1',
  `payment` varchar(255) NOT NULL,
  `conversion_rate` decimal(13,6) NOT NULL DEFAULT '1.000000',
  `module` varchar(255) DEFAULT NULL,
  `recyclable` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `gift` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `gift_message` text,
  `mobile_theme` tinyint(1) NOT NULL DEFAULT '0',
  `shipping_number` varchar(64) DEFAULT NULL,
  `total_discounts` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `total_discounts_tax_incl` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `total_discounts_tax_excl` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `total_paid` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `total_paid_tax_incl` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `total_paid_tax_excl` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `total_paid_real` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `total_products` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `total_products_wt` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `total_shipping` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `total_shipping_tax_incl` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `total_shipping_tax_excl` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `carrier_tax_rate` decimal(10,3) NOT NULL DEFAULT '0.000',
  `total_wrapping` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `total_wrapping_tax_incl` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `total_wrapping_tax_excl` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `round_mode` tinyint(1) NOT NULL DEFAULT '2',
  `invoice_number` int(10) unsigned NOT NULL DEFAULT '0',
  `delivery_number` int(10) unsigned NOT NULL DEFAULT '0',
  `invoice_date` datetime NOT NULL,
  `delivery_date` datetime NOT NULL,
  `valid` int(1) unsigned NOT NULL DEFAULT '0',
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_order`),
  KEY `reference` (`reference`),
  KEY `id_customer` (`id_customer`),
  KEY `id_cart` (`id_cart`),
  KEY `invoice_number` (`invoice_number`),
  KEY `id_carrier` (`id_carrier`),
  KEY `id_lang` (`id_lang`),
  KEY `id_currency` (`id_currency`),
  KEY `id_address_delivery` (`id_address_delivery`),
  KEY `id_address_invoice` (`id_address_invoice`),
  KEY `id_shop_group` (`id_shop_group`),
  KEY `current_state` (`current_state`),
  KEY `id_shop` (`id_shop`),
  KEY `date_add` (`date_add`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `ps_orders`
--

INSERT INTO `ps_orders` (`id_order`, `reference`, `id_shop_group`, `id_shop`, `id_carrier`, `id_lang`, `id_customer`, `id_cart`, `id_currency`, `id_address_delivery`, `id_address_invoice`, `current_state`, `secure_key`, `payment`, `conversion_rate`, `module`, `recyclable`, `gift`, `gift_message`, `mobile_theme`, `shipping_number`, `total_discounts`, `total_discounts_tax_incl`, `total_discounts_tax_excl`, `total_paid`, `total_paid_tax_incl`, `total_paid_tax_excl`, `total_paid_real`, `total_products`, `total_products_wt`, `total_shipping`, `total_shipping_tax_incl`, `total_shipping_tax_excl`, `carrier_tax_rate`, `total_wrapping`, `total_wrapping_tax_incl`, `total_wrapping_tax_excl`, `round_mode`, `invoice_number`, `delivery_number`, `invoice_date`, `delivery_date`, `valid`, `date_add`, `date_upd`) VALUES
(1, 'XKBKNABJK', 1, 1, 2, 1, 1, 1, 1, 4, 4, 6, 'b44a6d9efd7a0076a0fbce6b15eaf3b1', 'Payment by check', 1.000000, 'cheque', 0, 0, '', 0, '', 0.000000, 0.000000, 0.000000, 55.000000, 55.000000, 55.000000, 0.000000, 53.000000, 53.000000, 2.000000, 2.000000, 2.000000, 0.000, 0.000000, 0.000000, 0.000000, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '2015-06-22 10:29:14', '2015-06-22 10:29:14'),
(2, 'OHSATSERP', 1, 1, 2, 1, 1, 2, 1, 4, 4, 1, 'b44a6d9efd7a0076a0fbce6b15eaf3b1', 'Payment by check', 1.000000, 'cheque', 0, 0, '', 0, '', 0.000000, 0.000000, 0.000000, 75.900000, 75.900000, 75.900000, 0.000000, 73.900000, 73.900000, 2.000000, 2.000000, 2.000000, 0.000, 0.000000, 0.000000, 0.000000, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '2015-06-22 10:29:14', '2015-06-22 10:29:14'),
(3, 'UOYEVOLI', 1, 1, 2, 1, 1, 3, 1, 4, 4, 8, 'b44a6d9efd7a0076a0fbce6b15eaf3b1', 'Payment by check', 1.000000, 'cheque', 0, 0, '', 0, '', 0.000000, 0.000000, 0.000000, 76.010000, 76.010000, 76.010000, 0.000000, 74.010000, 74.010000, 2.000000, 2.000000, 2.000000, 0.000, 0.000000, 0.000000, 0.000000, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '2015-06-22 10:29:14', '2015-06-22 10:29:14'),
(4, 'FFATNOMMJ', 1, 1, 2, 1, 1, 4, 1, 4, 4, 1, 'b44a6d9efd7a0076a0fbce6b15eaf3b1', 'Payment by check', 1.000000, 'cheque', 0, 0, '', 0, '', 0.000000, 0.000000, 0.000000, 89.890000, 89.890000, 89.890000, 0.000000, 87.890000, 87.890000, 2.000000, 2.000000, 2.000000, 0.000, 0.000000, 0.000000, 0.000000, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '2015-06-22 10:29:14', '2015-06-22 10:29:14'),
(5, 'KHWLILZLL', 1, 1, 2, 1, 1, 5, 1, 4, 4, 10, 'b44a6d9efd7a0076a0fbce6b15eaf3b1', 'Bank wire', 1.000000, 'bankwire', 0, 0, '', 0, '', 0.000000, 0.000000, 0.000000, 71.510000, 71.510000, 71.510000, 0.000000, 69.510000, 69.510000, 2.000000, 2.000000, 2.000000, 0.000, 0.000000, 0.000000, 0.000000, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '2015-06-22 10:29:14', '2015-06-22 10:29:14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_order_carrier`
--

CREATE TABLE IF NOT EXISTS `ps_order_carrier` (
  `id_order_carrier` int(11) NOT NULL AUTO_INCREMENT,
  `id_order` int(11) unsigned NOT NULL,
  `id_carrier` int(11) unsigned NOT NULL,
  `id_order_invoice` int(11) unsigned DEFAULT NULL,
  `weight` decimal(20,6) DEFAULT NULL,
  `shipping_cost_tax_excl` decimal(20,6) DEFAULT NULL,
  `shipping_cost_tax_incl` decimal(20,6) DEFAULT NULL,
  `tracking_number` varchar(64) DEFAULT NULL,
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_order_carrier`),
  KEY `id_order` (`id_order`),
  KEY `id_carrier` (`id_carrier`),
  KEY `id_order_invoice` (`id_order_invoice`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `ps_order_carrier`
--

INSERT INTO `ps_order_carrier` (`id_order_carrier`, `id_order`, `id_carrier`, `id_order_invoice`, `weight`, `shipping_cost_tax_excl`, `shipping_cost_tax_incl`, `tracking_number`, `date_add`) VALUES
(1, 1, 2, 0, 0.000000, 2.000000, 2.000000, '', '2015-06-22 10:29:15'),
(2, 2, 2, 0, 0.000000, 2.000000, 2.000000, '', '2015-06-22 10:29:15'),
(3, 3, 2, 0, 0.000000, 2.000000, 2.000000, '', '2015-06-22 10:29:15'),
(4, 4, 2, 0, 0.000000, 2.000000, 2.000000, '', '2015-06-22 10:29:15'),
(5, 5, 2, 0, 0.000000, 2.000000, 2.000000, '', '2015-06-22 10:29:15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_order_cart_rule`
--

CREATE TABLE IF NOT EXISTS `ps_order_cart_rule` (
  `id_order_cart_rule` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_order` int(10) unsigned NOT NULL,
  `id_cart_rule` int(10) unsigned NOT NULL,
  `id_order_invoice` int(10) unsigned DEFAULT '0',
  `name` varchar(254) NOT NULL,
  `value` decimal(17,2) NOT NULL DEFAULT '0.00',
  `value_tax_excl` decimal(17,2) NOT NULL DEFAULT '0.00',
  `free_shipping` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_order_cart_rule`),
  KEY `id_order` (`id_order`),
  KEY `id_cart_rule` (`id_cart_rule`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_order_detail`
--

CREATE TABLE IF NOT EXISTS `ps_order_detail` (
  `id_order_detail` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_order` int(10) unsigned NOT NULL,
  `id_order_invoice` int(11) DEFAULT NULL,
  `id_warehouse` int(10) unsigned DEFAULT '0',
  `id_shop` int(11) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `product_attribute_id` int(10) unsigned DEFAULT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_quantity` int(10) unsigned NOT NULL DEFAULT '0',
  `product_quantity_in_stock` int(10) NOT NULL DEFAULT '0',
  `product_quantity_refunded` int(10) unsigned NOT NULL DEFAULT '0',
  `product_quantity_return` int(10) unsigned NOT NULL DEFAULT '0',
  `product_quantity_reinjected` int(10) unsigned NOT NULL DEFAULT '0',
  `product_price` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `reduction_percent` decimal(10,2) NOT NULL DEFAULT '0.00',
  `reduction_amount` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `reduction_amount_tax_incl` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `reduction_amount_tax_excl` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `group_reduction` decimal(10,2) NOT NULL DEFAULT '0.00',
  `product_quantity_discount` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `product_ean13` varchar(13) DEFAULT NULL,
  `product_upc` varchar(12) DEFAULT NULL,
  `product_reference` varchar(32) DEFAULT NULL,
  `product_supplier_reference` varchar(32) DEFAULT NULL,
  `product_weight` decimal(20,6) NOT NULL,
  `id_tax_rules_group` int(11) unsigned DEFAULT '0',
  `tax_computation_method` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `tax_name` varchar(16) NOT NULL,
  `tax_rate` decimal(10,3) NOT NULL DEFAULT '0.000',
  `ecotax` decimal(21,6) NOT NULL DEFAULT '0.000000',
  `ecotax_tax_rate` decimal(5,3) NOT NULL DEFAULT '0.000',
  `discount_quantity_applied` tinyint(1) NOT NULL DEFAULT '0',
  `download_hash` varchar(255) DEFAULT NULL,
  `download_nb` int(10) unsigned DEFAULT '0',
  `download_deadline` datetime DEFAULT NULL,
  `total_price_tax_incl` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `total_price_tax_excl` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `unit_price_tax_incl` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `unit_price_tax_excl` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `total_shipping_price_tax_incl` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `total_shipping_price_tax_excl` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `purchase_supplier_price` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `original_product_price` decimal(20,6) NOT NULL DEFAULT '0.000000',
  PRIMARY KEY (`id_order_detail`),
  KEY `order_detail_order` (`id_order`),
  KEY `product_id` (`product_id`),
  KEY `product_attribute_id` (`product_attribute_id`),
  KEY `id_tax_rules_group` (`id_tax_rules_group`),
  KEY `id_order_id_order_detail` (`id_order`,`id_order_detail`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Volcado de datos para la tabla `ps_order_detail`
--

INSERT INTO `ps_order_detail` (`id_order_detail`, `id_order`, `id_order_invoice`, `id_warehouse`, `id_shop`, `product_id`, `product_attribute_id`, `product_name`, `product_quantity`, `product_quantity_in_stock`, `product_quantity_refunded`, `product_quantity_return`, `product_quantity_reinjected`, `product_price`, `reduction_percent`, `reduction_amount`, `reduction_amount_tax_incl`, `reduction_amount_tax_excl`, `group_reduction`, `product_quantity_discount`, `product_ean13`, `product_upc`, `product_reference`, `product_supplier_reference`, `product_weight`, `id_tax_rules_group`, `tax_computation_method`, `tax_name`, `tax_rate`, `ecotax`, `ecotax_tax_rate`, `discount_quantity_applied`, `download_hash`, `download_nb`, `download_deadline`, `total_price_tax_incl`, `total_price_tax_excl`, `unit_price_tax_incl`, `unit_price_tax_excl`, `total_shipping_price_tax_incl`, `total_shipping_price_tax_excl`, `purchase_supplier_price`, `original_product_price`) VALUES
(1, 1, 0, 0, 1, 2, 10, 'Blouse - Color : White, Size : M', 1, 1, 0, 0, 0, 26.999852, 0.00, 0.000000, 0.000000, 0.000000, 0.00, 0.000000, '', '', 'demo_2', '', 0.000000, 0, 0, '', 0.000, 0.000000, 0.000, 0, '', 0, '0000-00-00 00:00:00', 27.000000, 27.000000, 27.000000, 27.000000, 0.000000, 0.000000, 0.000000, 26.999852),
(2, 1, 0, 0, 1, 3, 13, 'Printed Dress - Color : Orange, Size : S', 1, 1, 0, 0, 0, 25.999852, 0.00, 0.000000, 0.000000, 0.000000, 0.00, 0.000000, '', '', 'demo_3', '', 0.000000, 0, 0, '', 0.000, 0.000000, 0.000, 0, '', 0, '0000-00-00 00:00:00', 26.000000, 26.000000, 26.000000, 26.000000, 0.000000, 0.000000, 0.000000, 25.999852),
(3, 2, 0, 0, 1, 2, 10, 'Blouse - Color : White, Size : M', 1, 1, 0, 0, 0, 26.999852, 0.00, 0.000000, 0.000000, 0.000000, 0.00, 0.000000, '', '', 'demo_2', '', 0.000000, 0, 0, '', 0.000, 0.000000, 0.000, 0, '', 0, '0000-00-00 00:00:00', 27.000000, 27.000000, 27.000000, 27.000000, 0.000000, 0.000000, 0.000000, 26.999852),
(4, 2, 0, 0, 1, 6, 32, 'Printed Summer Dress - Color : Yellow, Size : M', 1, 1, 0, 0, 0, 30.502569, 0.00, 0.000000, 0.000000, 0.000000, 0.00, 0.000000, '', '', 'demo_6', '', 0.000000, 0, 0, '', 0.000, 0.000000, 0.000, 0, '', 0, '0000-00-00 00:00:00', 30.500000, 30.500000, 30.500000, 30.500000, 0.000000, 0.000000, 0.000000, 30.502569),
(5, 2, 0, 0, 1, 7, 34, 'Printed Chiffon Dress - Color : Yellow, Size : S', 1, 1, 0, 0, 0, 20.501236, 20.00, 0.000000, 0.000000, 0.000000, 0.00, 17.400000, '', '', 'demo_7', '', 0.000000, 0, 0, '', 0.000, 0.000000, 0.000, 0, '', 0, '0000-00-00 00:00:00', 16.400000, 16.400000, 16.400000, 16.400000, 0.000000, 0.000000, 0.000000, 20.501236),
(6, 3, 0, 0, 1, 1, 1, 'Faded Short Sleeve T-shirts - Color : Orange, Size : S', 1, 1, 0, 0, 0, 16.510000, 0.00, 0.000000, 0.000000, 0.000000, 0.00, 0.000000, '', '', 'demo_1', '', 0.000000, 0, 0, '', 0.000, 0.000000, 0.000, 0, '', 0, '0000-00-00 00:00:00', 16.510000, 16.510000, 16.510000, 16.510000, 0.000000, 0.000000, 0.000000, 16.510000),
(7, 3, 0, 0, 1, 2, 10, 'Blouse - Color : White, Size : M', 1, 1, 0, 0, 0, 26.999852, 0.00, 0.000000, 0.000000, 0.000000, 0.00, 0.000000, '', '', 'demo_2', '', 0.000000, 0, 0, '', 0.000, 0.000000, 0.000, 0, '', 0, '0000-00-00 00:00:00', 27.000000, 27.000000, 27.000000, 27.000000, 0.000000, 0.000000, 0.000000, 26.999852),
(8, 3, 0, 0, 1, 6, 32, 'Printed Summer Dress - Color : Yellow, Size : M', 1, 1, 0, 0, 0, 30.502569, 0.00, 0.000000, 0.000000, 0.000000, 0.00, 0.000000, '', '', 'demo_6', '', 0.000000, 0, 0, '', 0.000, 0.000000, 0.000, 0, '', 0, '0000-00-00 00:00:00', 30.500000, 30.500000, 30.500000, 30.500000, 0.000000, 0.000000, 0.000000, 30.502569),
(9, 4, 0, 0, 1, 1, 1, 'Faded Short Sleeve T-shirts - Color : Orange, Size : S', 1, 1, 0, 0, 0, 16.510000, 0.00, 0.000000, 0.000000, 0.000000, 0.00, 0.000000, '', '', 'demo_1', '', 0.000000, 0, 0, '', 0.000, 0.000000, 0.000, 0, '', 0, '0000-00-00 00:00:00', 16.510000, 16.510000, 16.510000, 16.510000, 0.000000, 0.000000, 0.000000, 16.510000),
(10, 4, 0, 0, 1, 3, 13, 'Printed Dress - Color : Orange, Size : S', 1, 1, 0, 0, 0, 25.999852, 0.00, 0.000000, 0.000000, 0.000000, 0.00, 0.000000, '', '', 'demo_3', '', 0.000000, 0, 0, '', 0.000, 0.000000, 0.000, 0, '', 0, '0000-00-00 00:00:00', 26.000000, 26.000000, 26.000000, 26.000000, 0.000000, 0.000000, 0.000000, 25.999852),
(11, 4, 0, 0, 1, 5, 19, 'Printed Summer Dress - Color : Yellow, Size : S', 1, 1, 0, 0, 0, 30.506321, 5.00, 0.000000, 0.000000, 0.000000, 0.00, 29.980000, '', '', 'demo_5', '', 0.000000, 0, 0, '', 0.000, 0.000000, 0.000, 0, '', 0, '0000-00-00 00:00:00', 28.980000, 28.980000, 28.980000, 28.980000, 0.000000, 0.000000, 0.000000, 30.506321),
(12, 4, 0, 0, 1, 7, 34, 'Printed Chiffon Dress - Color : Yellow, Size : S', 1, 1, 0, 0, 0, 20.501236, 20.00, 0.000000, 0.000000, 0.000000, 0.00, 17.400000, '', '', 'demo_7', '', 0.000000, 0, 0, '', 0.000, 0.000000, 0.000, 0, '', 0, '0000-00-00 00:00:00', 16.400000, 16.400000, 16.400000, 16.400000, 0.000000, 0.000000, 0.000000, 20.501236),
(13, 5, 0, 0, 1, 1, 1, 'Faded Short Sleeve T-shirts - Color : Orange, Size : S', 1, 1, 0, 0, 0, 16.510000, 0.00, 0.000000, 0.000000, 0.000000, 0.00, 0.000000, '', '', 'demo_1', '', 0.000000, 0, 0, '', 0.000, 0.000000, 0.000, 0, '', 0, '0000-00-00 00:00:00', 16.510000, 16.510000, 16.510000, 16.510000, 0.000000, 0.000000, 0.000000, 16.510000),
(14, 5, 0, 0, 1, 2, 7, 'Blouse - Color : Black, Size : S', 1, 1, 0, 0, 0, 26.999852, 0.00, 0.000000, 0.000000, 0.000000, 0.00, 0.000000, '', '', 'demo_2', '', 0.000000, 0, 0, '', 0.000, 0.000000, 0.000, 0, '', 0, '0000-00-00 00:00:00', 27.000000, 27.000000, 27.000000, 27.000000, 0.000000, 0.000000, 0.000000, 26.999852),
(15, 5, 0, 0, 1, 3, 13, 'Printed Dress - Color : Orange, Size : S', 1, 1, 0, 0, 0, 25.999852, 0.00, 0.000000, 0.000000, 0.000000, 0.00, 0.000000, '', '', 'demo_3', '', 0.000000, 0, 0, '', 0.000, 0.000000, 0.000, 0, '', 0, '0000-00-00 00:00:00', 26.000000, 26.000000, 26.000000, 26.000000, 0.000000, 0.000000, 0.000000, 25.999852);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_order_detail_tax`
--

CREATE TABLE IF NOT EXISTS `ps_order_detail_tax` (
  `id_order_detail` int(11) NOT NULL,
  `id_tax` int(11) NOT NULL,
  `unit_amount` decimal(16,6) NOT NULL DEFAULT '0.000000',
  `total_amount` decimal(16,6) NOT NULL DEFAULT '0.000000',
  KEY `id_order_detail` (`id_order_detail`),
  KEY `id_tax` (`id_tax`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_order_history`
--

CREATE TABLE IF NOT EXISTS `ps_order_history` (
  `id_order_history` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_employee` int(10) unsigned NOT NULL,
  `id_order` int(10) unsigned NOT NULL,
  `id_order_state` int(10) unsigned NOT NULL,
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_order_history`),
  KEY `order_history_order` (`id_order`),
  KEY `id_employee` (`id_employee`),
  KEY `id_order_state` (`id_order_state`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `ps_order_history`
--

INSERT INTO `ps_order_history` (`id_order_history`, `id_employee`, `id_order`, `id_order_state`, `date_add`) VALUES
(1, 0, 1, 1, '2015-06-22 10:29:14'),
(2, 0, 2, 1, '2015-06-22 10:29:14'),
(3, 0, 3, 1, '2015-06-22 10:29:14'),
(4, 0, 4, 1, '2015-06-22 10:29:14'),
(5, 0, 5, 10, '2015-06-22 10:29:14'),
(6, 1, 1, 6, '2015-06-22 10:29:14'),
(7, 1, 3, 8, '2015-06-22 10:29:14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_order_invoice`
--

CREATE TABLE IF NOT EXISTS `ps_order_invoice` (
  `id_order_invoice` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_order` int(11) NOT NULL,
  `number` int(11) NOT NULL,
  `delivery_number` int(11) NOT NULL,
  `delivery_date` datetime DEFAULT NULL,
  `total_discount_tax_excl` decimal(17,2) NOT NULL DEFAULT '0.00',
  `total_discount_tax_incl` decimal(17,2) NOT NULL DEFAULT '0.00',
  `total_paid_tax_excl` decimal(17,2) NOT NULL DEFAULT '0.00',
  `total_paid_tax_incl` decimal(17,2) NOT NULL DEFAULT '0.00',
  `total_products` decimal(17,2) NOT NULL DEFAULT '0.00',
  `total_products_wt` decimal(17,2) NOT NULL DEFAULT '0.00',
  `total_shipping_tax_excl` decimal(17,2) NOT NULL DEFAULT '0.00',
  `total_shipping_tax_incl` decimal(17,2) NOT NULL DEFAULT '0.00',
  `shipping_tax_computation_method` int(10) unsigned NOT NULL,
  `total_wrapping_tax_excl` decimal(17,2) NOT NULL DEFAULT '0.00',
  `total_wrapping_tax_incl` decimal(17,2) NOT NULL DEFAULT '0.00',
  `note` text,
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_order_invoice`),
  KEY `id_order` (`id_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_order_invoice_payment`
--

CREATE TABLE IF NOT EXISTS `ps_order_invoice_payment` (
  `id_order_invoice` int(11) unsigned NOT NULL,
  `id_order_payment` int(11) unsigned NOT NULL,
  `id_order` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_order_invoice`,`id_order_payment`),
  KEY `order_payment` (`id_order_payment`),
  KEY `id_order` (`id_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_order_invoice_tax`
--

CREATE TABLE IF NOT EXISTS `ps_order_invoice_tax` (
  `id_order_invoice` int(11) NOT NULL,
  `type` varchar(15) NOT NULL,
  `id_tax` int(11) NOT NULL,
  `amount` decimal(10,6) NOT NULL DEFAULT '0.000000',
  KEY `id_tax` (`id_tax`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_order_message`
--

CREATE TABLE IF NOT EXISTS `ps_order_message` (
  `id_order_message` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_order_message`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `ps_order_message`
--

INSERT INTO `ps_order_message` (`id_order_message`, `date_add`) VALUES
(1, '2015-06-22 10:29:13');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_order_message_lang`
--

CREATE TABLE IF NOT EXISTS `ps_order_message_lang` (
  `id_order_message` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(128) NOT NULL,
  `message` text NOT NULL,
  PRIMARY KEY (`id_order_message`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ps_order_message_lang`
--

INSERT INTO `ps_order_message_lang` (`id_order_message`, `id_lang`, `name`, `message`) VALUES
(1, 1, 'Retraso', 'Hola.\n\nLamentablemente, uno de los artículos que has pedido está agotado. Esto podría causar un ligero retraso en el envío.\nPor favor, disculpa las molestias ocasionadas. Estamos trabajando duro para solucionarlo, no te preocupes.\n\nUn saludo,');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_order_payment`
--

CREATE TABLE IF NOT EXISTS `ps_order_payment` (
  `id_order_payment` int(11) NOT NULL AUTO_INCREMENT,
  `order_reference` varchar(9) DEFAULT NULL,
  `id_currency` int(10) unsigned NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `conversion_rate` decimal(13,6) NOT NULL DEFAULT '1.000000',
  `transaction_id` varchar(254) DEFAULT NULL,
  `card_number` varchar(254) DEFAULT NULL,
  `card_brand` varchar(254) DEFAULT NULL,
  `card_expiration` char(7) DEFAULT NULL,
  `card_holder` varchar(254) DEFAULT NULL,
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_order_payment`),
  KEY `order_reference` (`order_reference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_order_return`
--

CREATE TABLE IF NOT EXISTS `ps_order_return` (
  `id_order_return` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_customer` int(10) unsigned NOT NULL,
  `id_order` int(10) unsigned NOT NULL,
  `state` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `question` text NOT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_order_return`),
  KEY `order_return_customer` (`id_customer`),
  KEY `id_order` (`id_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_order_return_detail`
--

CREATE TABLE IF NOT EXISTS `ps_order_return_detail` (
  `id_order_return` int(10) unsigned NOT NULL,
  `id_order_detail` int(10) unsigned NOT NULL,
  `id_customization` int(10) unsigned NOT NULL DEFAULT '0',
  `product_quantity` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_order_return`,`id_order_detail`,`id_customization`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_order_return_state`
--

CREATE TABLE IF NOT EXISTS `ps_order_return_state` (
  `id_order_return_state` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `color` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id_order_return_state`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `ps_order_return_state`
--

INSERT INTO `ps_order_return_state` (`id_order_return_state`, `color`) VALUES
(1, '#4169E1'),
(2, '#8A2BE2'),
(3, '#32CD32'),
(4, '#DC143C'),
(5, '#108510');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_order_return_state_lang`
--

CREATE TABLE IF NOT EXISTS `ps_order_return_state_lang` (
  `id_order_return_state` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`id_order_return_state`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ps_order_return_state_lang`
--

INSERT INTO `ps_order_return_state_lang` (`id_order_return_state`, `id_lang`, `name`) VALUES
(1, 1, 'Pendiente de confirmación'),
(2, 1, 'Pendiente del paquete'),
(3, 1, 'Paquete recibido'),
(4, 1, 'Devolución denegada'),
(5, 1, 'Devolución completada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_order_slip`
--

CREATE TABLE IF NOT EXISTS `ps_order_slip` (
  `id_order_slip` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `conversion_rate` decimal(13,6) NOT NULL DEFAULT '1.000000',
  `id_customer` int(10) unsigned NOT NULL,
  `id_order` int(10) unsigned NOT NULL,
  `total_products_tax_excl` decimal(20,6) DEFAULT NULL,
  `total_products_tax_incl` decimal(20,6) DEFAULT NULL,
  `total_shipping_tax_excl` decimal(20,6) DEFAULT NULL,
  `total_shipping_tax_incl` decimal(20,6) DEFAULT NULL,
  `shipping_cost` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `amount` decimal(10,2) NOT NULL,
  `shipping_cost_amount` decimal(10,2) NOT NULL,
  `partial` tinyint(1) NOT NULL,
  `order_slip_type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_order_slip`),
  KEY `order_slip_customer` (`id_customer`),
  KEY `id_order` (`id_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_order_slip_detail`
--

CREATE TABLE IF NOT EXISTS `ps_order_slip_detail` (
  `id_order_slip` int(10) unsigned NOT NULL,
  `id_order_detail` int(10) unsigned NOT NULL,
  `product_quantity` int(10) unsigned NOT NULL DEFAULT '0',
  `unit_price_tax_excl` decimal(20,6) DEFAULT NULL,
  `unit_price_tax_incl` decimal(20,6) DEFAULT NULL,
  `total_price_tax_excl` decimal(20,6) DEFAULT NULL,
  `total_price_tax_incl` decimal(20,6) DEFAULT NULL,
  `amount_tax_excl` decimal(20,6) DEFAULT NULL,
  `amount_tax_incl` decimal(20,6) DEFAULT NULL,
  PRIMARY KEY (`id_order_slip`,`id_order_detail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_order_slip_detail_tax`
--

CREATE TABLE IF NOT EXISTS `ps_order_slip_detail_tax` (
  `id_order_slip_detail` int(11) unsigned NOT NULL,
  `id_tax` int(11) unsigned NOT NULL,
  `unit_amount` decimal(16,6) NOT NULL DEFAULT '0.000000',
  `total_amount` decimal(16,6) NOT NULL DEFAULT '0.000000',
  KEY `id_order_slip_detail` (`id_order_slip_detail`),
  KEY `id_tax` (`id_tax`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_order_state`
--

CREATE TABLE IF NOT EXISTS `ps_order_state` (
  `id_order_state` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `invoice` tinyint(1) unsigned DEFAULT '0',
  `send_email` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `module_name` varchar(255) DEFAULT NULL,
  `color` varchar(32) DEFAULT NULL,
  `unremovable` tinyint(1) unsigned NOT NULL,
  `hidden` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `logable` tinyint(1) NOT NULL DEFAULT '0',
  `delivery` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `shipped` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `paid` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pdf_invoice` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pdf_delivery` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_order_state`),
  KEY `module_name` (`module_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Volcado de datos para la tabla `ps_order_state`
--

INSERT INTO `ps_order_state` (`id_order_state`, `invoice`, `send_email`, `module_name`, `color`, `unremovable`, `hidden`, `logable`, `delivery`, `shipped`, `paid`, `pdf_invoice`, `pdf_delivery`, `deleted`) VALUES
(1, 0, 1, 'cheque', '#4169E1', 1, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 1, 1, '', '#32CD32', 1, 0, 1, 0, 0, 1, 1, 0, 0),
(3, 1, 1, '', '#FF8C00', 1, 0, 1, 1, 0, 1, 0, 0, 0),
(4, 1, 1, '', '#8A2BE2', 1, 0, 1, 1, 1, 1, 0, 0, 0),
(5, 1, 0, '', '#108510', 1, 0, 1, 1, 1, 1, 0, 0, 0),
(6, 0, 1, '', '#DC143C', 1, 0, 0, 0, 0, 0, 0, 0, 0),
(7, 1, 1, '', '#ec2e15', 1, 0, 0, 0, 0, 0, 0, 0, 0),
(8, 0, 1, '', '#8f0621', 1, 0, 0, 0, 0, 0, 0, 0, 0),
(9, 1, 1, '', '#FF69B4', 1, 0, 0, 0, 0, 1, 0, 0, 0),
(10, 0, 1, 'bankwire', '#4169E1', 1, 0, 0, 0, 0, 0, 0, 0, 0),
(11, 0, 0, '', '#4169E1', 1, 0, 0, 0, 0, 0, 0, 0, 0),
(12, 1, 1, '', '#32CD32', 1, 0, 1, 0, 0, 1, 0, 0, 0),
(13, 0, 1, '', '#FF69B4', 1, 0, 0, 0, 0, 0, 0, 0, 0),
(14, 0, 0, 'cashondelivery', '#4169E1', 1, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_order_state_lang`
--

CREATE TABLE IF NOT EXISTS `ps_order_state_lang` (
  `id_order_state` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(64) NOT NULL,
  `template` varchar(64) NOT NULL,
  PRIMARY KEY (`id_order_state`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ps_order_state_lang`
--

INSERT INTO `ps_order_state_lang` (`id_order_state`, `id_lang`, `name`, `template`) VALUES
(1, 1, 'Pago mediante cheque pendiente', 'cheque'),
(2, 1, 'Pago aceptado', 'payment'),
(3, 1, 'Preparación en proceso', 'preparation'),
(4, 1, 'Enviado', 'shipped'),
(5, 1, 'Entregado', ''),
(6, 1, 'Cancelado', 'order_canceled'),
(7, 1, 'Reembolso', 'refund'),
(8, 1, 'Error en el pago', 'payment_error'),
(9, 1, 'Productos fuera de línea', 'outofstock'),
(10, 1, 'Pago por transferencia bancaria pendiente', 'bankwire'),
(11, 1, 'Pago mediante PayPal pendiente', ''),
(12, 1, 'Pago a distancia aceptado', 'payment'),
(13, 1, 'Productos fuera de línea', 'outofstock'),
(14, 1, 'Awaiting cod validation', 'cashondelivery');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_pack`
--

CREATE TABLE IF NOT EXISTS `ps_pack` (
  `id_product_pack` int(10) unsigned NOT NULL,
  `id_product_item` int(10) unsigned NOT NULL,
  `id_product_attribute_item` int(10) unsigned NOT NULL,
  `quantity` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_product_pack`,`id_product_item`,`id_product_attribute_item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_page`
--

CREATE TABLE IF NOT EXISTS `ps_page` (
  `id_page` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_page_type` int(10) unsigned NOT NULL,
  `id_object` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id_page`),
  KEY `id_page_type` (`id_page_type`),
  KEY `id_object` (`id_object`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `ps_page`
--

INSERT INTO `ps_page` (`id_page`, `id_page_type`, `id_object`) VALUES
(1, 1, NULL),
(2, 2, NULL),
(3, 3, 5),
(4, 4, NULL),
(5, 5, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_pagenotfound`
--

CREATE TABLE IF NOT EXISTS `ps_pagenotfound` (
  `id_pagenotfound` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_shop` int(10) unsigned NOT NULL DEFAULT '1',
  `id_shop_group` int(10) unsigned NOT NULL DEFAULT '1',
  `request_uri` varchar(256) NOT NULL,
  `http_referer` varchar(256) NOT NULL,
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_pagenotfound`),
  KEY `date_add` (`date_add`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

--
-- Volcado de datos para la tabla `ps_pagenotfound`
--

INSERT INTO `ps_pagenotfound` (`id_pagenotfound`, `id_shop`, `id_shop_group`, `request_uri`, `http_referer`, `date_add`) VALUES
(1, 1, 1, '/blog', '', '2015-10-18 14:19:04'),
(2, 1, 1, '/blog', '', '2015-10-18 14:39:40'),
(3, 1, 1, '/Blog/', '', '2015-10-18 14:39:48'),
(4, 1, 1, '/news/list', '', '2015-10-18 14:42:01'),
(5, 1, 1, '/news/', '', '2015-10-18 14:42:06'),
(6, 1, 1, '/module/news/default', 'http://www.matisses.co/', '2015-10-18 14:48:41'),
(7, 1, 1, '/module/news/default', 'http://www.matisses.co/', '2015-10-18 14:49:35'),
(8, 1, 1, '/index.php?controller=news', 'http://www.matisses.co/', '2015-10-18 14:50:09'),
(9, 1, 1, '/blog', '', '2015-10-18 14:51:41'),
(10, 1, 1, '/themes/font/trade-gothic-bold-condensed-no.woff', 'http://www.matisses.co/themes/matisses/css/global.css', '2015-11-12 12:07:58'),
(11, 1, 1, '/themes/font/trade-gothic-bold-condensed-no.ttf', 'http://www.matisses.co/themes/matisses/css/global.css', '2015-11-12 12:07:58'),
(12, 1, 1, '/admin', '', '2015-11-12 12:17:15'),
(13, 1, 1, '/login', '', '2015-11-12 12:19:10'),
(14, 1, 1, '/administrator', '', '2015-11-12 12:20:01'),
(15, 1, 1, '/administration', '', '2015-11-12 12:20:08'),
(16, 1, 1, '/admin', '', '2015-11-12 12:20:15'),
(17, 1, 1, '/login', '', '2015-11-12 12:20:18'),
(18, 1, 1, '/google', 'http://www.matisses.co/', '2015-11-12 16:09:52'),
(19, 1, 1, '/facebook', 'http://www.matisses.co/', '2015-11-12 16:14:35');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_page_type`
--

CREATE TABLE IF NOT EXISTS `ps_page_type` (
  `id_page_type` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id_page_type`),
  KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `ps_page_type`
--

INSERT INTO `ps_page_type` (`id_page_type`, `name`) VALUES
(1, 'index'),
(4, 'list'),
(2, 'pagenotfound'),
(3, 'product'),
(5, 'stores');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_page_viewed`
--

CREATE TABLE IF NOT EXISTS `ps_page_viewed` (
  `id_page` int(10) unsigned NOT NULL,
  `id_shop_group` int(10) unsigned NOT NULL DEFAULT '1',
  `id_shop` int(10) unsigned NOT NULL DEFAULT '1',
  `id_date_range` int(10) unsigned NOT NULL,
  `counter` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_page`,`id_date_range`,`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_product`
--

CREATE TABLE IF NOT EXISTS `ps_product` (
  `id_product` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_supplier` int(10) unsigned DEFAULT NULL,
  `id_manufacturer` int(10) unsigned DEFAULT NULL,
  `id_category_default` int(10) unsigned DEFAULT NULL,
  `id_shop_default` int(10) unsigned NOT NULL DEFAULT '1',
  `id_tax_rules_group` int(11) unsigned NOT NULL,
  `on_sale` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `online_only` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ean13` varchar(13) DEFAULT NULL,
  `upc` varchar(12) DEFAULT NULL,
  `ecotax` decimal(17,6) NOT NULL DEFAULT '0.000000',
  `quantity` int(10) NOT NULL DEFAULT '0',
  `minimal_quantity` int(10) unsigned NOT NULL DEFAULT '1',
  `price` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `wholesale_price` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `unity` varchar(255) DEFAULT NULL,
  `unit_price_ratio` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `additional_shipping_cost` decimal(20,2) NOT NULL DEFAULT '0.00',
  `reference` varchar(32) DEFAULT NULL,
  `supplier_reference` varchar(32) DEFAULT NULL,
  `location` varchar(64) DEFAULT NULL,
  `width` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `height` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `depth` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `weight` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `out_of_stock` int(10) unsigned NOT NULL DEFAULT '2',
  `quantity_discount` tinyint(1) DEFAULT '0',
  `customizable` tinyint(2) NOT NULL DEFAULT '0',
  `uploadable_files` tinyint(4) NOT NULL DEFAULT '0',
  `text_fields` tinyint(4) NOT NULL DEFAULT '0',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `redirect_type` enum('','404','301','302') NOT NULL DEFAULT '',
  `id_product_redirected` int(10) unsigned NOT NULL DEFAULT '0',
  `available_for_order` tinyint(1) NOT NULL DEFAULT '1',
  `available_date` date NOT NULL DEFAULT '0000-00-00',
  `condition` enum('new','used','refurbished') NOT NULL DEFAULT 'new',
  `show_price` tinyint(1) NOT NULL DEFAULT '1',
  `indexed` tinyint(1) NOT NULL DEFAULT '0',
  `visibility` enum('both','catalog','search','none') NOT NULL DEFAULT 'both',
  `cache_is_pack` tinyint(1) NOT NULL DEFAULT '0',
  `cache_has_attachments` tinyint(1) NOT NULL DEFAULT '0',
  `is_virtual` tinyint(1) NOT NULL DEFAULT '0',
  `cache_default_attribute` int(10) unsigned DEFAULT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  `advanced_stock_management` tinyint(1) NOT NULL DEFAULT '0',
  `pack_stock_type` int(11) unsigned NOT NULL DEFAULT '3',
  PRIMARY KEY (`id_product`),
  KEY `product_supplier` (`id_supplier`),
  KEY `product_manufacturer` (`id_manufacturer`),
  KEY `id_category_default` (`id_category_default`),
  KEY `indexed` (`indexed`),
  KEY `date_add` (`date_add`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `ps_product`
--

INSERT INTO `ps_product` (`id_product`, `id_supplier`, `id_manufacturer`, `id_category_default`, `id_shop_default`, `id_tax_rules_group`, `on_sale`, `online_only`, `ean13`, `upc`, `ecotax`, `quantity`, `minimal_quantity`, `price`, `wholesale_price`, `unity`, `unit_price_ratio`, `additional_shipping_cost`, `reference`, `supplier_reference`, `location`, `width`, `height`, `depth`, `weight`, `out_of_stock`, `quantity_discount`, `customizable`, `uploadable_files`, `text_fields`, `active`, `redirect_type`, `id_product_redirected`, `available_for_order`, `available_date`, `condition`, `show_price`, `indexed`, `visibility`, `cache_is_pack`, `cache_has_attachments`, `is_virtual`, `cache_default_attribute`, `date_add`, `date_upd`, `advanced_stock_management`, `pack_stock_type`) VALUES
(1, 1, 1, 5, 1, 1, 0, 0, '0', '', 0.000000, 0, 1, 16.510000, 4.950000, '', 0.000000, 0.00, 'demo_1', '', '', 0.000000, 0.000000, 0.000000, 0.000000, 2, 0, 0, 0, 0, 1, '404', 0, 1, '0000-00-00', 'new', 1, 1, 'both', 0, 0, 0, 1, '2015-06-22 10:29:13', '2015-06-22 10:29:13', 0, 3),
(2, 1, 1, 7, 1, 1, 0, 0, '0', '', 0.000000, 0, 1, 26.999852, 8.100000, '', 0.000000, 0.00, 'silla-unitarias', '', '', 0.000000, 0.000000, 0.000000, 0.000000, 2, 0, 0, 0, 0, 1, '404', 0, 1, '0000-00-00', 'new', 1, 1, 'both', 0, 0, 0, 7, '2015-06-22 10:29:13', '2015-11-17 17:44:30', 0, 3),
(3, 1, 1, 9, 1, 1, 1, 0, '0', '', 0.000000, 0, 1, 5220000.000000, 5220000.000000, '', 1.000000, 0.00, 'silla-bahagian', '', '', 0.000000, 0.000000, 0.000000, 0.000000, 2, 0, 0, 0, 0, 1, '404', 0, 1, '0000-00-00', 'new', 1, 1, 'both', 0, 0, 0, 13, '2015-06-22 10:29:13', '2015-11-17 17:41:42', 0, 3),
(4, 1, 1, 10, 1, 1, 0, 0, '0', '', 0.000000, 0, 1, 4500000.000000, 15.300000, '', 0.000000, 0.00, 'silla-jeno', '', '', 0.000000, 0.000000, 0.000000, 0.000000, 2, 0, 0, 0, 0, 1, '404', 0, 1, '0000-00-00', 'new', 1, 1, 'both', 0, 0, 0, 16, '2015-06-22 10:29:13', '2015-11-17 17:10:58', 0, 3),
(5, 1, 1, 11, 1, 1, 0, 0, '0', '', 0.000000, 0, 1, 30.506321, 9.150000, '', 0.000000, 0.00, 'demo_5', '', '', 0.000000, 0.000000, 0.000000, 0.000000, 2, 0, 0, 0, 0, 1, '404', 0, 1, '0000-00-00', 'new', 1, 1, 'both', 0, 0, 0, 19, '2015-06-22 10:29:13', '2015-06-22 10:29:13', 0, 3),
(6, 1, 1, 11, 1, 1, 0, 0, '0', '', 0.000000, 0, 1, 30.502569, 9.150000, '', 0.000000, 0.00, 'demo_6', '', '', 0.000000, 0.000000, 0.000000, 0.000000, 2, 0, 0, 0, 0, 1, '404', 0, 1, '0000-00-00', 'new', 1, 1, 'both', 0, 0, 0, 31, '2015-06-22 10:29:13', '2015-06-22 10:29:13', 0, 3),
(7, 1, 1, 11, 1, 1, 0, 0, '0', '', 0.000000, 0, 1, 20.501236, 6.150000, '', 0.000000, 0.00, 'demo_7', '', '', 0.000000, 0.000000, 0.000000, 0.000000, 2, 0, 0, 0, 0, 1, '404', 0, 1, '0000-00-00', 'new', 1, 1, 'both', 0, 0, 0, 34, '2015-06-22 10:29:13', '2015-11-17 11:11:50', 0, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_product_attachment`
--

CREATE TABLE IF NOT EXISTS `ps_product_attachment` (
  `id_product` int(10) unsigned NOT NULL,
  `id_attachment` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_product`,`id_attachment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_product_attribute`
--

CREATE TABLE IF NOT EXISTS `ps_product_attribute` (
  `id_product_attribute` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_product` int(10) unsigned NOT NULL,
  `reference` varchar(32) DEFAULT NULL,
  `supplier_reference` varchar(32) DEFAULT NULL,
  `location` varchar(64) DEFAULT NULL,
  `ean13` varchar(13) DEFAULT NULL,
  `upc` varchar(12) DEFAULT NULL,
  `wholesale_price` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `price` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `ecotax` decimal(17,6) NOT NULL DEFAULT '0.000000',
  `quantity` int(10) NOT NULL DEFAULT '0',
  `weight` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `unit_price_impact` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `default_on` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `minimal_quantity` int(10) unsigned NOT NULL DEFAULT '1',
  `available_date` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`id_product_attribute`),
  KEY `product_attribute_product` (`id_product`),
  KEY `reference` (`reference`),
  KEY `supplier_reference` (`supplier_reference`),
  KEY `product_default` (`id_product`,`default_on`),
  KEY `id_product_id_product_attribute` (`id_product_attribute`,`id_product`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=46 ;

--
-- Volcado de datos para la tabla `ps_product_attribute`
--

INSERT INTO `ps_product_attribute` (`id_product_attribute`, `id_product`, `reference`, `supplier_reference`, `location`, `ean13`, `upc`, `wholesale_price`, `price`, `ecotax`, `quantity`, `weight`, `unit_price_impact`, `default_on`, `minimal_quantity`, `available_date`) VALUES
(1, 1, '', '', '', '', '', 0.000000, 0.000000, 0.000000, 100, 0.000000, 0.000000, 1, 1, '0000-00-00'),
(2, 1, '', '', '', '', '', 0.000000, 0.000000, 0.000000, 100, 0.000000, 0.000000, 0, 1, '0000-00-00'),
(3, 1, '', '', '', '', '', 0.000000, 0.000000, 0.000000, 100, 0.000000, 0.000000, 0, 1, '0000-00-00'),
(4, 1, '', '', '', '', '', 0.000000, 0.000000, 0.000000, 100, 0.000000, 0.000000, 0, 1, '0000-00-00'),
(5, 1, '', '', '', '', '', 0.000000, 0.000000, 0.000000, 100, 0.000000, 0.000000, 0, 1, '0000-00-00'),
(6, 1, '', '', '', '', '', 0.000000, 0.000000, 0.000000, 100, 0.000000, 0.000000, 0, 1, '0000-00-00'),
(7, 2, '', '', '', '', '', 0.000000, 0.000000, 0.000000, 100, 0.000000, 0.000000, 1, 1, '0000-00-00'),
(8, 2, '', '', '', '', '', 0.000000, 0.000000, 0.000000, 100, 0.000000, 0.000000, 0, 1, '0000-00-00'),
(9, 2, '', '', '', '', '', 0.000000, 0.000000, 0.000000, 100, 0.000000, 0.000000, 0, 1, '0000-00-00'),
(10, 2, '', '', '', '', '', 0.000000, 0.000000, 0.000000, 100, 0.000000, 0.000000, 0, 1, '0000-00-00'),
(11, 2, '', '', '', '', '', 0.000000, 0.000000, 0.000000, 100, 0.000000, 0.000000, 0, 1, '0000-00-00'),
(12, 2, '', '', '', '', '', 0.000000, 0.000000, 0.000000, 100, 0.000000, 0.000000, 0, 1, '0000-00-00'),
(13, 3, '', '', '', '', '', 0.000000, 0.000000, 0.000000, 100, 0.000000, 0.000000, 1, 1, '0000-00-00'),
(14, 3, '', '', '', '', '', 0.000000, 0.000000, 0.000000, 100, 0.000000, 0.000000, 0, 1, '0000-00-00'),
(15, 3, '', '', '', '', '', 0.000000, 0.000000, 0.000000, 100, 0.000000, 0.000000, 0, 1, '0000-00-00'),
(16, 4, '', '', '', '', '', 0.000000, 0.000000, 0.000000, 100, 0.000000, 0.000000, 1, 1, '0000-00-00'),
(17, 4, '', '', '', '', '', 0.000000, 0.000000, 0.000000, 100, 0.000000, 0.000000, 0, 1, '0000-00-00'),
(18, 4, '', '', '', '', '', 0.000000, 0.000000, 0.000000, 100, 0.000000, 0.000000, 0, 1, '0000-00-00'),
(19, 5, '', '', '', '', '', 0.000000, 0.000000, 0.000000, 100, 0.000000, 0.000000, 1, 1, '0000-00-00'),
(20, 5, '', '', '', '', '', 0.000000, 0.000000, 0.000000, 100, 0.000000, 0.000000, 0, 1, '0000-00-00'),
(21, 5, '', '', '', '', '', 0.000000, 0.000000, 0.000000, 100, 0.000000, 0.000000, 0, 1, '0000-00-00'),
(22, 5, '', '', '', '', '', 0.000000, 0.000000, 0.000000, 100, 0.000000, 0.000000, 0, 1, '0000-00-00'),
(23, 5, '', '', '', '', '', 0.000000, 0.000000, 0.000000, 100, 0.000000, 0.000000, 0, 1, '0000-00-00'),
(24, 5, '', '', '', '', '', 0.000000, 0.000000, 0.000000, 100, 0.000000, 0.000000, 0, 1, '0000-00-00'),
(25, 5, '', '', '', '', '', 0.000000, 0.000000, 0.000000, 100, 0.000000, 0.000000, 0, 1, '0000-00-00'),
(26, 5, '', '', '', '', '', 0.000000, 0.000000, 0.000000, 100, 0.000000, 0.000000, 0, 1, '0000-00-00'),
(27, 5, '', '', '', '', '', 0.000000, 0.000000, 0.000000, 100, 0.000000, 0.000000, 0, 1, '0000-00-00'),
(28, 5, '', '', '', '', '', 0.000000, 0.000000, 0.000000, 100, 0.000000, 0.000000, 0, 1, '0000-00-00'),
(29, 5, '', '', '', '', '', 0.000000, 0.000000, 0.000000, 100, 0.000000, 0.000000, 0, 1, '0000-00-00'),
(30, 5, '', '', '', '', '', 0.000000, 0.000000, 0.000000, 100, 0.000000, 0.000000, 0, 1, '0000-00-00'),
(31, 6, '', '', '', '', '', 0.000000, 0.000000, 0.000000, 100, 0.000000, 0.000000, 1, 1, '0000-00-00'),
(32, 6, '', '', '', '', '', 0.000000, 0.000000, 0.000000, 100, 0.000000, 0.000000, 0, 1, '0000-00-00'),
(33, 6, '', '', '', '', '', 0.000000, 0.000000, 0.000000, 100, 0.000000, 0.000000, 0, 1, '0000-00-00'),
(34, 7, '', '', '', '', '', 0.000000, 0.000000, 0.000000, 100, 0.000000, 0.000000, 1, 1, '0000-00-00'),
(35, 7, '', '', '', '', '', 0.000000, 0.000000, 0.000000, 100, 0.000000, 0.000000, 0, 1, '0000-00-00'),
(36, 7, '', '', '', '', '', 0.000000, 0.000000, 0.000000, 100, 0.000000, 0.000000, 0, 1, '0000-00-00'),
(37, 7, '', '', '', '', '', 0.000000, 0.000000, 0.000000, 0, 0.000000, 0.000000, 0, 1, '0000-00-00'),
(38, 7, '', '', '', '', '', 0.000000, 0.000000, 0.000000, 0, 0.000000, 0.000000, 0, 1, '0000-00-00'),
(39, 7, '', '', '', '', '', 0.000000, 0.000000, 0.000000, 0, 0.000000, 0.000000, 0, 1, '0000-00-00'),
(40, 6, '', '', '', '', '', 0.000000, 0.000000, 0.000000, 0, 0.000000, 0.000000, 0, 1, '0000-00-00'),
(41, 6, '', '', '', '', '', 0.000000, 0.000000, 0.000000, 0, 0.000000, 0.000000, 0, 1, '0000-00-00'),
(42, 6, '', '', '', '', '', 0.000000, 0.000000, 0.000000, 0, 0.000000, 0.000000, 0, 1, '0000-00-00'),
(43, 4, '', '', '', '', '', 0.000000, 0.000000, 0.000000, 0, 0.000000, 0.000000, 0, 1, '0000-00-00'),
(44, 4, '', '', '', '', '', 0.000000, 0.000000, 0.000000, 0, 0.000000, 0.000000, 0, 1, '0000-00-00'),
(45, 4, '', '', '', '', '', 0.000000, 0.000000, 0.000000, 0, 0.000000, 0.000000, 0, 1, '0000-00-00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_product_attribute_combination`
--

CREATE TABLE IF NOT EXISTS `ps_product_attribute_combination` (
  `id_attribute` int(10) unsigned NOT NULL,
  `id_product_attribute` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_attribute`,`id_product_attribute`),
  KEY `id_product_attribute` (`id_product_attribute`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ps_product_attribute_combination`
--

INSERT INTO `ps_product_attribute_combination` (`id_attribute`, `id_product_attribute`) VALUES
(1, 1),
(13, 1),
(1, 2),
(14, 2),
(2, 3),
(13, 3),
(2, 4),
(14, 4),
(3, 5),
(13, 5),
(3, 6),
(14, 6),
(1, 7),
(11, 7),
(1, 8),
(8, 8),
(2, 9),
(11, 9),
(2, 10),
(8, 10),
(3, 11),
(11, 11),
(3, 12),
(8, 12),
(1, 13),
(13, 13),
(2, 14),
(13, 14),
(3, 15),
(13, 15),
(1, 16),
(7, 16),
(2, 17),
(7, 17),
(3, 18),
(7, 18),
(1, 19),
(16, 19),
(1, 20),
(14, 20),
(1, 21),
(13, 21),
(1, 22),
(11, 22),
(2, 23),
(16, 23),
(2, 24),
(14, 24),
(2, 25),
(13, 25),
(2, 26),
(11, 26),
(3, 27),
(16, 27),
(3, 28),
(14, 28),
(3, 29),
(13, 29),
(3, 30),
(11, 30),
(1, 31),
(16, 31),
(2, 32),
(16, 32),
(3, 33),
(16, 33),
(1, 34),
(16, 34),
(2, 35),
(16, 35),
(3, 36),
(16, 36),
(1, 37),
(15, 37),
(2, 38),
(15, 38),
(3, 39),
(15, 39),
(1, 40),
(8, 40),
(2, 41),
(8, 41),
(3, 42),
(8, 42),
(1, 43),
(24, 43),
(2, 44),
(24, 44),
(3, 45),
(24, 45);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_product_attribute_image`
--

CREATE TABLE IF NOT EXISTS `ps_product_attribute_image` (
  `id_product_attribute` int(10) unsigned NOT NULL,
  `id_image` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_product_attribute`,`id_image`),
  KEY `id_image` (`id_image`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ps_product_attribute_image`
--

INSERT INTO `ps_product_attribute_image` (`id_product_attribute`, `id_image`) VALUES
(1, 1),
(3, 1),
(5, 1),
(1, 2),
(3, 2),
(5, 2),
(2, 3),
(4, 3),
(6, 3),
(2, 4),
(4, 4),
(6, 4),
(8, 5),
(10, 5),
(12, 5),
(8, 6),
(10, 6),
(12, 6),
(7, 7),
(9, 7),
(11, 7),
(16, 10),
(17, 10),
(18, 10),
(43, 11),
(44, 11),
(45, 11),
(19, 12),
(23, 12),
(27, 12),
(20, 13),
(24, 13),
(28, 13),
(21, 14),
(25, 14),
(29, 14),
(22, 15),
(26, 15),
(30, 15),
(31, 16),
(32, 16),
(33, 16),
(31, 17),
(32, 17),
(33, 17),
(40, 18),
(41, 18),
(42, 18),
(40, 19),
(41, 19),
(42, 19),
(34, 20),
(35, 20),
(36, 20),
(34, 21),
(35, 21),
(36, 21),
(37, 22),
(38, 22),
(39, 22),
(37, 23),
(38, 23),
(39, 23);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_product_attribute_shop`
--

CREATE TABLE IF NOT EXISTS `ps_product_attribute_shop` (
  `id_product_attribute` int(10) unsigned NOT NULL,
  `id_shop` int(10) unsigned NOT NULL,
  `wholesale_price` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `price` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `ecotax` decimal(17,6) NOT NULL DEFAULT '0.000000',
  `weight` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `unit_price_impact` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `default_on` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `minimal_quantity` int(10) unsigned NOT NULL DEFAULT '1',
  `available_date` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`id_product_attribute`,`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ps_product_attribute_shop`
--

INSERT INTO `ps_product_attribute_shop` (`id_product_attribute`, `id_shop`, `wholesale_price`, `price`, `ecotax`, `weight`, `unit_price_impact`, `default_on`, `minimal_quantity`, `available_date`) VALUES
(1, 1, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 1, 1, '0000-00-00'),
(2, 1, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0, 1, '0000-00-00'),
(3, 1, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0, 1, '0000-00-00'),
(4, 1, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0, 1, '0000-00-00'),
(5, 1, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0, 1, '0000-00-00'),
(6, 1, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0, 1, '0000-00-00'),
(7, 1, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 1, 1, '0000-00-00'),
(8, 1, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0, 1, '0000-00-00'),
(9, 1, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0, 1, '0000-00-00'),
(10, 1, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0, 1, '0000-00-00'),
(11, 1, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0, 1, '0000-00-00'),
(12, 1, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0, 1, '0000-00-00'),
(13, 1, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 1, 1, '0000-00-00'),
(14, 1, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0, 1, '0000-00-00'),
(15, 1, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0, 1, '0000-00-00'),
(16, 1, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 1, 1, '0000-00-00'),
(17, 1, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0, 1, '0000-00-00'),
(18, 1, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0, 1, '0000-00-00'),
(19, 1, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 1, 1, '0000-00-00'),
(20, 1, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0, 1, '0000-00-00'),
(21, 1, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0, 1, '0000-00-00'),
(22, 1, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0, 1, '0000-00-00'),
(23, 1, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0, 1, '0000-00-00'),
(24, 1, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0, 1, '0000-00-00'),
(25, 1, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0, 1, '0000-00-00'),
(26, 1, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0, 1, '0000-00-00'),
(27, 1, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0, 1, '0000-00-00'),
(28, 1, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0, 1, '0000-00-00'),
(29, 1, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0, 1, '0000-00-00'),
(30, 1, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0, 1, '0000-00-00'),
(31, 1, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 1, 1, '0000-00-00'),
(32, 1, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0, 1, '0000-00-00'),
(33, 1, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0, 1, '0000-00-00'),
(34, 1, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 1, 1, '0000-00-00'),
(35, 1, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0, 1, '0000-00-00'),
(36, 1, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0, 1, '0000-00-00'),
(37, 1, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0, 1, '0000-00-00'),
(38, 1, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0, 1, '0000-00-00'),
(39, 1, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0, 1, '0000-00-00'),
(40, 1, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0, 1, '0000-00-00'),
(41, 1, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0, 1, '0000-00-00'),
(42, 1, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0, 1, '0000-00-00'),
(43, 1, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0, 1, '0000-00-00'),
(44, 1, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0, 1, '0000-00-00'),
(45, 1, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0, 1, '0000-00-00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_product_carrier`
--

CREATE TABLE IF NOT EXISTS `ps_product_carrier` (
  `id_product` int(10) unsigned NOT NULL,
  `id_carrier_reference` int(10) unsigned NOT NULL,
  `id_shop` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_product`,`id_carrier_reference`,`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_product_comment`
--

CREATE TABLE IF NOT EXISTS `ps_product_comment` (
  `id_product_comment` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_product` int(10) unsigned NOT NULL,
  `id_customer` int(10) unsigned NOT NULL,
  `id_guest` int(10) unsigned DEFAULT NULL,
  `title` varchar(64) DEFAULT NULL,
  `content` text NOT NULL,
  `customer_name` varchar(64) DEFAULT NULL,
  `grade` float unsigned NOT NULL,
  `validate` tinyint(1) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_product_comment`),
  KEY `id_product` (`id_product`),
  KEY `id_customer` (`id_customer`),
  KEY `id_guest` (`id_guest`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_product_comment_criterion`
--

CREATE TABLE IF NOT EXISTS `ps_product_comment_criterion` (
  `id_product_comment_criterion` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_product_comment_criterion_type` tinyint(1) NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_product_comment_criterion`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `ps_product_comment_criterion`
--

INSERT INTO `ps_product_comment_criterion` (`id_product_comment_criterion`, `id_product_comment_criterion_type`, `active`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_product_comment_criterion_category`
--

CREATE TABLE IF NOT EXISTS `ps_product_comment_criterion_category` (
  `id_product_comment_criterion` int(10) unsigned NOT NULL,
  `id_category` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_product_comment_criterion`,`id_category`),
  KEY `id_category` (`id_category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_product_comment_criterion_lang`
--

CREATE TABLE IF NOT EXISTS `ps_product_comment_criterion_lang` (
  `id_product_comment_criterion` int(11) unsigned NOT NULL,
  `id_lang` int(11) unsigned NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`id_product_comment_criterion`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ps_product_comment_criterion_lang`
--

INSERT INTO `ps_product_comment_criterion_lang` (`id_product_comment_criterion`, `id_lang`, `name`) VALUES
(1, 1, 'Quality');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_product_comment_criterion_product`
--

CREATE TABLE IF NOT EXISTS `ps_product_comment_criterion_product` (
  `id_product` int(10) unsigned NOT NULL,
  `id_product_comment_criterion` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_product`,`id_product_comment_criterion`),
  KEY `id_product_comment_criterion` (`id_product_comment_criterion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_product_comment_grade`
--

CREATE TABLE IF NOT EXISTS `ps_product_comment_grade` (
  `id_product_comment` int(10) unsigned NOT NULL,
  `id_product_comment_criterion` int(10) unsigned NOT NULL,
  `grade` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_product_comment`,`id_product_comment_criterion`),
  KEY `id_product_comment_criterion` (`id_product_comment_criterion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_product_comment_report`
--

CREATE TABLE IF NOT EXISTS `ps_product_comment_report` (
  `id_product_comment` int(10) unsigned NOT NULL,
  `id_customer` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_product_comment`,`id_customer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_product_comment_usefulness`
--

CREATE TABLE IF NOT EXISTS `ps_product_comment_usefulness` (
  `id_product_comment` int(10) unsigned NOT NULL,
  `id_customer` int(10) unsigned NOT NULL,
  `usefulness` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id_product_comment`,`id_customer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_product_country_tax`
--

CREATE TABLE IF NOT EXISTS `ps_product_country_tax` (
  `id_product` int(11) NOT NULL,
  `id_country` int(11) NOT NULL,
  `id_tax` int(11) NOT NULL,
  PRIMARY KEY (`id_product`,`id_country`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_product_download`
--

CREATE TABLE IF NOT EXISTS `ps_product_download` (
  `id_product_download` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_product` int(10) unsigned NOT NULL,
  `display_filename` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `date_add` datetime NOT NULL,
  `date_expiration` datetime DEFAULT NULL,
  `nb_days_accessible` int(10) unsigned DEFAULT NULL,
  `nb_downloadable` int(10) unsigned DEFAULT '1',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `is_shareable` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_product_download`),
  KEY `product_active` (`id_product`,`active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_product_group_reduction_cache`
--

CREATE TABLE IF NOT EXISTS `ps_product_group_reduction_cache` (
  `id_product` int(10) unsigned NOT NULL,
  `id_group` int(10) unsigned NOT NULL,
  `reduction` decimal(4,3) NOT NULL,
  PRIMARY KEY (`id_product`,`id_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_product_lang`
--

CREATE TABLE IF NOT EXISTS `ps_product_lang` (
  `id_product` int(10) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL DEFAULT '1',
  `id_lang` int(10) unsigned NOT NULL,
  `description` text,
  `description_short` text,
  `link_rewrite` varchar(128) NOT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `meta_title` varchar(128) DEFAULT NULL,
  `name` varchar(128) NOT NULL,
  `available_now` varchar(255) DEFAULT NULL,
  `available_later` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_product`,`id_shop`,`id_lang`),
  KEY `id_lang` (`id_lang`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ps_product_lang`
--

INSERT INTO `ps_product_lang` (`id_product`, `id_shop`, `id_lang`, `description`, `description_short`, `link_rewrite`, `meta_description`, `meta_keywords`, `meta_title`, `name`, `available_now`, `available_later`) VALUES
(1, 1, 1, '<p>Fashion lleva diseñando colecciones increíbles desde 2010. La marca ofrece diseños femeninos, con elegantes prendas para combinar y las últimas tendencias en vestidos. Las colecciones han evolucionado hacia una línea prêt-à-porter en la que cada elemento resulta indispensable en el fondo de armario de una mujer. ¿El resultado? Looks frescos, sencillos y muy chic, con una elegancia juvenil y un estilo único e inconfundible. Todas las prendas se confeccionan en Italia, prestando atención hasta al más mínimo detalle. Ahora Fashion ha ampliado su catálogo para incluir todo tipo de complementos: ¡zapatos, sombreros, cinturones y mucho más! </ p>', '<p>Camiseta de manga corta con efecto desteñido  y escote cerrado. Material suave y elástico para un ajuste cómodo. ¡Combínala con un sombrero de paja y estarás lista para el verano!</p>', 'camiseta-destenida-manga-corta', '', '', '', 'Camiseta efecto desteñido de manga corta', 'En stock', ''),
(2, 1, 1, '<p>Fashion lleva diseñando colecciones increíbles desde 2010. La marca ofrece diseños femeninos, con elegantes prendas para combinar y las últimas tendencias en vestidos. Las colecciones han evolucionado hacia una línea prêt-à-porter en la que cada elemento resulta indispensable en el fondo de armario de una mujer. ¿El resultado? Looks frescos, sencillos y muy chic, con una elegancia juvenil y un estilo único e inconfundible. Todas las prendas se confeccionan en Italia, prestando atención hasta al más mínimo detalle. Ahora Fashion ha ampliado su catálogo para incluir todo tipo de complementos: ¡zapatos, sombreros, cinturones y mucho más!</p>', '', 'blusa', '', '', '', 'Unitarias', 'En stock', ''),
(3, 1, 1, '<p>Fashion lleva diseñando colecciones increíbles desde 2010. La marca ofrece diseños femeninos, con elegantes prendas para combinar y las últimas tendencias en vestidos. Las colecciones han evolucionado hacia una línea prêt-à-porter en la que cada elemento resulta indispensable en el fondo de armario de una mujer. ¿El resultado? Looks frescos, sencillos y muy chic, con una elegancia juvenil y un estilo único e inconfundible. Todas las prendas se confeccionan en Italia,prestando atención hasta al más mínimo detalle. Ahora Fashion ha ampliado su catálogo para incluir todo tipo de complementos: ¡zapatos, sombreros, cinturones y mucho más!</p>', '', 'vestido-estampado', '', '', '', 'BAHAGIAN', 'En stock', ''),
(4, 1, 1, '<p>Fashion lleva diseñando increíbles colecciones desde 2010. La marca ofrece diseños femeninos, con elegantes prendas para combinar y las últimas tendencias en vestidos. Las colecciones han evolucionado hacia una línea prêt-à-porter en la que cada elemento resulta indispensable en el fondo de armario de una mujer. ¿El resultado? Looks frescos, sencillos y muy chic, con una elegancia juvenil y un estilo único e inconfundible. Todas las prendas se confeccionan en Italia, prestando atención hasta al más mínimo detalle. Ahora Fashion ha ampliado su catálogo para incluir todo tipo de complementos: ¡zapatos, sombreros, cinturones y mucho más!</p>', '', 'vestido-estampado', '', '', '', 'Jeno', 'En stock', ''),
(5, 1, 1, '<p>Fashion lleva diseñando increíbles colecciones desde 2010. La marca ofrece diseños femeninos, con elegantes prendas para combinar y las últimas tendencias en vestidos. Las colecciones han evolucionado hacia una línea prêt-à-porter en la que cada elemento resulta indispensable en el fondo de armario de una mujer. ¿El resultado? Looks frescos, sencillos y muy chic, con una elegancia juvenil y un estilo único e inconfundible. Todas las prendas se confeccionan en Italia, prestando atención hasta al más mínimo detalle. Ahora Fashion ha ampliado su catálogo para incluir todo tipo de complementos: ¡zapatos, sombreros, cinturones y mucho más! </ p>', '<p>Vestido largo estampado con tirantes finos ajustables. Escote en V, fruncido debajo del pecho y volantes en la parte inferior del vestido.</p>', 'vestido-verano-estampado', '', '', '', 'Vestido de verano estampado', 'En stock', ''),
(6, 1, 1, '<p>Fashion lleva diseñando increíbles colecciones desde 2010. La marca ofrece diseños femeninos, con elegantes prendas para combinar y las últimas tendencias en vestidos. Las colecciones han evolucionado hacia una línea prêt-à-porter en la que cada elemento resulta indispensable en el fondo de armario de una mujer. ¿El resultado? Looks frescos, sencillos y muy chic, con una elegancia juvenil y un estilo único e inconfundible. Todas las prendas se confeccionan en Italia, prestando atención hasta al más mínimo detalle. Ahora Fashion ha ampliado su catálogo para incluir todo tipo de complementos: ¡zapatos, sombreros, cinturones y mucho más! </ p>', '<p>Vestido sin mangas de gasa hasta la rodilla. Escote en V con elástico debajo del pecho.</p>', 'vestido-verano-estampado', '', '', '', 'Vestido de verano estampado', 'En stock', ''),
(7, 1, 1, '<p>Fashion lleva diseñando increíbles colecciones desde 2010. La marca ofrece diseños femeninos, con elegantes prendas para combinar y las últimas tendencias en vestidos. Las colecciones han evolucionado hacia una línea prêt-à-porter en la que cada elemento resulta indispensable en el fondo de armario de una mujer. ¿El resultado? Looks frescos, sencillos y muy chic, con una elegancia juvenil y un estilo único e inconfundible. Todas las prendas se confeccionan en Italia, yprestando atención hasta al más mínimo detalle. Ahora Fashion ha ampliado su catálogo para incluir todo tipo de complementos: ¡zapatos, sombreros, cinturones y mucho más!</p>', '<p>Vestido sin mangas hasta la rodilla, tejido de gasa estampado. Escote pronunciado.</p>', 'vestido-estampado-gasa', '', '', '', 'Vestido de gasa estampado', 'En stock', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_product_sale`
--

CREATE TABLE IF NOT EXISTS `ps_product_sale` (
  `id_product` int(10) unsigned NOT NULL,
  `quantity` int(10) unsigned NOT NULL DEFAULT '0',
  `sale_nbr` int(10) unsigned NOT NULL DEFAULT '0',
  `date_upd` date NOT NULL,
  PRIMARY KEY (`id_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ps_product_sale`
--

INSERT INTO `ps_product_sale` (`id_product`, `quantity`, `sale_nbr`, `date_upd`) VALUES
(1, 3, 3, '2015-06-22'),
(2, 4, 4, '2015-06-22'),
(3, 3, 3, '2015-06-22'),
(5, 1, 1, '2015-06-22'),
(6, 2, 2, '2015-06-22'),
(7, 2, 2, '2015-06-22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_product_shop`
--

CREATE TABLE IF NOT EXISTS `ps_product_shop` (
  `id_product` int(10) unsigned NOT NULL,
  `id_shop` int(10) unsigned NOT NULL,
  `id_category_default` int(10) unsigned DEFAULT NULL,
  `id_tax_rules_group` int(11) unsigned NOT NULL,
  `on_sale` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `online_only` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ecotax` decimal(17,6) NOT NULL DEFAULT '0.000000',
  `minimal_quantity` int(10) unsigned NOT NULL DEFAULT '1',
  `price` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `wholesale_price` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `unity` varchar(255) DEFAULT NULL,
  `unit_price_ratio` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `additional_shipping_cost` decimal(20,2) NOT NULL DEFAULT '0.00',
  `customizable` tinyint(2) NOT NULL DEFAULT '0',
  `uploadable_files` tinyint(4) NOT NULL DEFAULT '0',
  `text_fields` tinyint(4) NOT NULL DEFAULT '0',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `redirect_type` enum('','404','301','302') NOT NULL DEFAULT '',
  `id_product_redirected` int(10) unsigned NOT NULL DEFAULT '0',
  `available_for_order` tinyint(1) NOT NULL DEFAULT '1',
  `available_date` date NOT NULL DEFAULT '0000-00-00',
  `condition` enum('new','used','refurbished') NOT NULL DEFAULT 'new',
  `show_price` tinyint(1) NOT NULL DEFAULT '1',
  `indexed` tinyint(1) NOT NULL DEFAULT '0',
  `visibility` enum('both','catalog','search','none') NOT NULL DEFAULT 'both',
  `cache_default_attribute` int(10) unsigned DEFAULT NULL,
  `advanced_stock_management` tinyint(1) NOT NULL DEFAULT '0',
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  `pack_stock_type` int(11) unsigned NOT NULL DEFAULT '3',
  PRIMARY KEY (`id_product`,`id_shop`),
  KEY `id_category_default` (`id_category_default`),
  KEY `date_add` (`date_add`,`active`,`visibility`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ps_product_shop`
--

INSERT INTO `ps_product_shop` (`id_product`, `id_shop`, `id_category_default`, `id_tax_rules_group`, `on_sale`, `online_only`, `ecotax`, `minimal_quantity`, `price`, `wholesale_price`, `unity`, `unit_price_ratio`, `additional_shipping_cost`, `customizable`, `uploadable_files`, `text_fields`, `active`, `redirect_type`, `id_product_redirected`, `available_for_order`, `available_date`, `condition`, `show_price`, `indexed`, `visibility`, `cache_default_attribute`, `advanced_stock_management`, `date_add`, `date_upd`, `pack_stock_type`) VALUES
(1, 1, 5, 1, 0, 0, 0.000000, 1, 16.510000, 4.950000, '', 0.000000, 0.00, 0, 0, 0, 1, '404', 0, 1, '0000-00-00', 'new', 1, 1, 'both', 1, 0, '2015-06-22 10:29:13', '2015-06-22 10:29:13', 3),
(2, 1, 7, 1, 0, 0, 0.000000, 1, 26.999852, 8.100000, '', 0.000000, 0.00, 0, 0, 0, 1, '404', 0, 1, '0000-00-00', 'new', 1, 1, 'both', 7, 0, '2015-06-22 10:29:13', '2015-11-17 17:44:30', 3),
(3, 1, 9, 1, 1, 0, 0.000000, 1, 5220000.000000, 5220000.000000, '', 1.000000, 0.00, 0, 0, 0, 1, '404', 0, 1, '0000-00-00', 'new', 1, 1, 'both', 13, 0, '2015-06-22 10:29:13', '2015-11-17 17:41:42', 3),
(4, 1, 10, 1, 0, 0, 0.000000, 1, 4500000.000000, 15.300000, '', 0.000000, 0.00, 0, 0, 0, 1, '404', 0, 1, '0000-00-00', 'new', 1, 1, 'both', 16, 0, '2015-06-22 10:29:13', '2015-11-17 17:10:58', 3),
(5, 1, 11, 1, 0, 0, 0.000000, 1, 30.506321, 9.150000, '', 0.000000, 0.00, 0, 0, 0, 1, '404', 0, 1, '0000-00-00', 'new', 1, 1, 'both', 19, 0, '2015-06-22 10:29:13', '2015-06-22 10:29:13', 3),
(6, 1, 11, 1, 0, 0, 0.000000, 1, 30.502569, 9.150000, '', 0.000000, 0.00, 0, 0, 0, 1, '404', 0, 1, '0000-00-00', 'new', 1, 1, 'both', 31, 0, '2015-06-22 10:29:13', '2015-06-22 10:29:13', 3),
(7, 1, 11, 1, 0, 0, 0.000000, 1, 20.501236, 6.150000, '', 0.000000, 0.00, 0, 0, 0, 1, '404', 0, 1, '0000-00-00', 'new', 1, 1, 'both', 34, 0, '2015-06-22 10:29:13', '2015-11-17 11:11:50', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_product_supplier`
--

CREATE TABLE IF NOT EXISTS `ps_product_supplier` (
  `id_product_supplier` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_product` int(11) unsigned NOT NULL,
  `id_product_attribute` int(11) unsigned NOT NULL DEFAULT '0',
  `id_supplier` int(11) unsigned NOT NULL,
  `product_supplier_reference` varchar(32) DEFAULT NULL,
  `product_supplier_price_te` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `id_currency` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_product_supplier`),
  UNIQUE KEY `id_product` (`id_product`,`id_product_attribute`,`id_supplier`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=29 ;

--
-- Volcado de datos para la tabla `ps_product_supplier`
--

INSERT INTO `ps_product_supplier` (`id_product_supplier`, `id_product`, `id_product_attribute`, `id_supplier`, `product_supplier_reference`, `product_supplier_price_te`, `id_currency`) VALUES
(1, 1, 0, 1, '', 0.000000, 0),
(2, 2, 0, 1, '', 0.000000, 0),
(3, 3, 0, 1, '', 0.000000, 0),
(4, 4, 0, 1, '', 0.000000, 0),
(5, 5, 0, 1, '', 0.000000, 0),
(6, 6, 0, 1, '', 0.000000, 0),
(7, 7, 0, 1, '', 0.000000, 0),
(8, 4, 16, 1, '', 0.000000, 1),
(9, 4, 17, 1, '', 0.000000, 1),
(10, 4, 18, 1, '', 0.000000, 1),
(11, 4, 43, 1, '', 0.000000, 1),
(12, 4, 44, 1, '', 0.000000, 1),
(13, 4, 45, 1, '', 0.000000, 1),
(14, 7, 34, 1, '', 0.000000, 1),
(15, 7, 35, 1, '', 0.000000, 1),
(16, 7, 36, 1, '', 0.000000, 1),
(17, 7, 37, 1, '', 0.000000, 1),
(18, 7, 38, 1, '', 0.000000, 1),
(19, 7, 39, 1, '', 0.000000, 1),
(20, 3, 13, 1, '', 0.000000, 1),
(21, 3, 14, 1, '', 0.000000, 1),
(22, 3, 15, 1, '', 0.000000, 1),
(23, 2, 7, 1, '', 0.000000, 1),
(24, 2, 8, 1, '', 0.000000, 1),
(25, 2, 9, 1, '', 0.000000, 1),
(26, 2, 10, 1, '', 0.000000, 1),
(27, 2, 11, 1, '', 0.000000, 1),
(28, 2, 12, 1, '', 0.000000, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_product_tag`
--

CREATE TABLE IF NOT EXISTS `ps_product_tag` (
  `id_product` int(10) unsigned NOT NULL,
  `id_tag` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_product`,`id_tag`),
  KEY `id_tag` (`id_tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_profile`
--

CREATE TABLE IF NOT EXISTS `ps_profile` (
  `id_profile` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_profile`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `ps_profile`
--

INSERT INTO `ps_profile` (`id_profile`) VALUES
(1),
(2),
(3),
(4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_profile_lang`
--

CREATE TABLE IF NOT EXISTS `ps_profile_lang` (
  `id_lang` int(10) unsigned NOT NULL,
  `id_profile` int(10) unsigned NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id_profile`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ps_profile_lang`
--

INSERT INTO `ps_profile_lang` (`id_lang`, `id_profile`, `name`) VALUES
(1, 1, 'SuperAdmin'),
(1, 2, 'Especialista en logística'),
(1, 3, 'Traductor'),
(1, 4, 'Vendedor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_quick_access`
--

CREATE TABLE IF NOT EXISTS `ps_quick_access` (
  `id_quick_access` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `new_window` tinyint(1) NOT NULL DEFAULT '0',
  `link` varchar(255) NOT NULL,
  PRIMARY KEY (`id_quick_access`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `ps_quick_access`
--

INSERT INTO `ps_quick_access` (`id_quick_access`, `new_window`, `link`) VALUES
(1, 0, 'index.php?controller=AdminCategories&addcategory'),
(2, 0, 'index.php?controller=AdminProducts&addproduct'),
(3, 0, 'index.php?controller=AdminCartRules&addcart_rule');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_quick_access_lang`
--

CREATE TABLE IF NOT EXISTS `ps_quick_access_lang` (
  `id_quick_access` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id_quick_access`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ps_quick_access_lang`
--

INSERT INTO `ps_quick_access_lang` (`id_quick_access`, `id_lang`, `name`) VALUES
(1, 1, 'Nueva categoría'),
(2, 1, 'Nuevo producto'),
(3, 1, 'Nuevo vale');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_range_price`
--

CREATE TABLE IF NOT EXISTS `ps_range_price` (
  `id_range_price` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_carrier` int(10) unsigned NOT NULL,
  `delimiter1` decimal(20,6) NOT NULL,
  `delimiter2` decimal(20,6) NOT NULL,
  PRIMARY KEY (`id_range_price`),
  UNIQUE KEY `id_carrier` (`id_carrier`,`delimiter1`,`delimiter2`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `ps_range_price`
--

INSERT INTO `ps_range_price` (`id_range_price`, `id_carrier`, `delimiter1`, `delimiter2`) VALUES
(1, 2, 0.000000, 10000.000000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_range_weight`
--

CREATE TABLE IF NOT EXISTS `ps_range_weight` (
  `id_range_weight` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_carrier` int(10) unsigned NOT NULL,
  `delimiter1` decimal(20,6) NOT NULL,
  `delimiter2` decimal(20,6) NOT NULL,
  PRIMARY KEY (`id_range_weight`),
  UNIQUE KEY `id_carrier` (`id_carrier`,`delimiter1`,`delimiter2`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `ps_range_weight`
--

INSERT INTO `ps_range_weight` (`id_range_weight`, `id_carrier`, `delimiter1`, `delimiter2`) VALUES
(1, 2, 0.000000, 10000.000000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_referrer`
--

CREATE TABLE IF NOT EXISTS `ps_referrer` (
  `id_referrer` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `passwd` varchar(32) DEFAULT NULL,
  `http_referer_regexp` varchar(64) DEFAULT NULL,
  `http_referer_like` varchar(64) DEFAULT NULL,
  `request_uri_regexp` varchar(64) DEFAULT NULL,
  `request_uri_like` varchar(64) DEFAULT NULL,
  `http_referer_regexp_not` varchar(64) DEFAULT NULL,
  `http_referer_like_not` varchar(64) DEFAULT NULL,
  `request_uri_regexp_not` varchar(64) DEFAULT NULL,
  `request_uri_like_not` varchar(64) DEFAULT NULL,
  `base_fee` decimal(5,2) NOT NULL DEFAULT '0.00',
  `percent_fee` decimal(5,2) NOT NULL DEFAULT '0.00',
  `click_fee` decimal(5,2) NOT NULL DEFAULT '0.00',
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_referrer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_referrer_cache`
--

CREATE TABLE IF NOT EXISTS `ps_referrer_cache` (
  `id_connections_source` int(11) unsigned NOT NULL,
  `id_referrer` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_connections_source`,`id_referrer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_referrer_shop`
--

CREATE TABLE IF NOT EXISTS `ps_referrer_shop` (
  `id_referrer` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_shop` int(10) unsigned NOT NULL DEFAULT '1',
  `cache_visitors` int(11) DEFAULT NULL,
  `cache_visits` int(11) DEFAULT NULL,
  `cache_pages` int(11) DEFAULT NULL,
  `cache_registrations` int(11) DEFAULT NULL,
  `cache_orders` int(11) DEFAULT NULL,
  `cache_sales` decimal(17,2) DEFAULT NULL,
  `cache_reg_rate` decimal(5,4) DEFAULT NULL,
  `cache_order_rate` decimal(5,4) DEFAULT NULL,
  PRIMARY KEY (`id_referrer`,`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_request_sql`
--

CREATE TABLE IF NOT EXISTS `ps_request_sql` (
  `id_request_sql` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `sql` text NOT NULL,
  PRIMARY KEY (`id_request_sql`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_required_field`
--

CREATE TABLE IF NOT EXISTS `ps_required_field` (
  `id_required_field` int(11) NOT NULL AUTO_INCREMENT,
  `object_name` varchar(32) NOT NULL,
  `field_name` varchar(32) NOT NULL,
  PRIMARY KEY (`id_required_field`),
  KEY `object_name` (`object_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_risk`
--

CREATE TABLE IF NOT EXISTS `ps_risk` (
  `id_risk` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `percent` tinyint(3) NOT NULL,
  `color` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id_risk`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `ps_risk`
--

INSERT INTO `ps_risk` (`id_risk`, `percent`, `color`) VALUES
(1, 0, '#32CD32'),
(2, 35, '#FF8C00'),
(3, 75, '#DC143C'),
(4, 100, '#ec2e15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_risk_lang`
--

CREATE TABLE IF NOT EXISTS `ps_risk_lang` (
  `id_risk` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id_risk`,`id_lang`),
  KEY `id_risk` (`id_risk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ps_risk_lang`
--

INSERT INTO `ps_risk_lang` (`id_risk`, `id_lang`, `name`) VALUES
(1, 1, 'None'),
(2, 1, 'Low'),
(3, 1, 'Medium'),
(4, 1, 'High');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_scene`
--

CREATE TABLE IF NOT EXISTS `ps_scene` (
  `id_scene` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_scene`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_scene_category`
--

CREATE TABLE IF NOT EXISTS `ps_scene_category` (
  `id_scene` int(10) unsigned NOT NULL,
  `id_category` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_scene`,`id_category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_scene_lang`
--

CREATE TABLE IF NOT EXISTS `ps_scene_lang` (
  `id_scene` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id_scene`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_scene_products`
--

CREATE TABLE IF NOT EXISTS `ps_scene_products` (
  `id_scene` int(10) unsigned NOT NULL,
  `id_product` int(10) unsigned NOT NULL,
  `x_axis` int(4) NOT NULL,
  `y_axis` int(4) NOT NULL,
  `zone_width` int(3) NOT NULL,
  `zone_height` int(3) NOT NULL,
  PRIMARY KEY (`id_scene`,`id_product`,`x_axis`,`y_axis`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_scene_shop`
--

CREATE TABLE IF NOT EXISTS `ps_scene_shop` (
  `id_scene` int(11) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_scene`,`id_shop`),
  KEY `id_shop` (`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_search_engine`
--

CREATE TABLE IF NOT EXISTS `ps_search_engine` (
  `id_search_engine` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `server` varchar(64) NOT NULL,
  `getvar` varchar(16) NOT NULL,
  PRIMARY KEY (`id_search_engine`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=39 ;

--
-- Volcado de datos para la tabla `ps_search_engine`
--

INSERT INTO `ps_search_engine` (`id_search_engine`, `server`, `getvar`) VALUES
(1, 'google', 'q'),
(2, 'aol', 'q'),
(3, 'yandex', 'text'),
(4, 'ask.com', 'q'),
(5, 'nhl.com', 'q'),
(6, 'yahoo', 'p'),
(7, 'baidu', 'wd'),
(8, 'lycos', 'query'),
(9, 'exalead', 'q'),
(10, 'search.live', 'q'),
(11, 'voila', 'rdata'),
(12, 'altavista', 'q'),
(13, 'bing', 'q'),
(14, 'daum', 'q'),
(15, 'eniro', 'search_word'),
(16, 'naver', 'query'),
(17, 'msn', 'q'),
(18, 'netscape', 'query'),
(19, 'cnn', 'query'),
(20, 'about', 'terms'),
(21, 'mamma', 'query'),
(22, 'alltheweb', 'q'),
(23, 'virgilio', 'qs'),
(24, 'alice', 'qs'),
(25, 'najdi', 'q'),
(26, 'mama', 'query'),
(27, 'seznam', 'q'),
(28, 'onet', 'qt'),
(29, 'szukacz', 'q'),
(30, 'yam', 'k'),
(31, 'pchome', 'q'),
(32, 'kvasir', 'q'),
(33, 'sesam', 'q'),
(34, 'ozu', 'q'),
(35, 'terra', 'query'),
(36, 'mynet', 'q'),
(37, 'ekolay', 'q'),
(38, 'rambler', 'words');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_search_index`
--

CREATE TABLE IF NOT EXISTS `ps_search_index` (
  `id_product` int(11) unsigned NOT NULL,
  `id_word` int(11) unsigned NOT NULL,
  `weight` smallint(4) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_word`,`id_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ps_search_index`
--

INSERT INTO `ps_search_index` (`id_product`, `id_word`, `weight`) VALUES
(1, 1, 42),
(1, 2, 42),
(1, 3, 42),
(1, 4, 54),
(2, 4, 12),
(1, 5, 54),
(2, 5, 12),
(1, 6, 60),
(5, 6, 120),
(6, 6, 60),
(7, 6, 60),
(1, 7, 6),
(5, 7, 12),
(6, 7, 6),
(7, 7, 6),
(1, 8, 6),
(1, 9, 6),
(1, 10, 6),
(1, 11, 6),
(6, 11, 6),
(1, 12, 6),
(1, 13, 6),
(1, 14, 6),
(1, 15, 6),
(1, 16, 6),
(1, 17, 6),
(1, 18, 6),
(1, 19, 6),
(5, 19, 108),
(6, 19, 54),
(7, 19, 18),
(1, 20, 30),
(2, 20, 30),
(3, 20, 15),
(4, 20, 30),
(5, 20, 60),
(6, 20, 30),
(7, 20, 30),
(1, 21, 6),
(2, 21, 6),
(3, 21, 3),
(4, 21, 6),
(5, 21, 12),
(6, 21, 6),
(7, 21, 6),
(1, 22, 6),
(2, 22, 6),
(3, 22, 3),
(4, 22, 6),
(5, 22, 12),
(6, 22, 6),
(7, 22, 6),
(1, 23, 12),
(2, 23, 12),
(3, 23, 6),
(4, 23, 12),
(5, 23, 24),
(6, 23, 12),
(7, 23, 12),
(1, 24, 6),
(2, 24, 6),
(3, 24, 3),
(4, 24, 6),
(5, 24, 12),
(6, 24, 6),
(7, 24, 6),
(1, 25, 6),
(2, 25, 6),
(3, 25, 3),
(4, 25, 6),
(5, 25, 12),
(6, 25, 6),
(7, 25, 6),
(1, 26, 6),
(2, 26, 6),
(3, 26, 3),
(4, 26, 6),
(5, 26, 12),
(6, 26, 6),
(7, 26, 6),
(1, 27, 6),
(2, 27, 6),
(3, 27, 3),
(4, 27, 6),
(5, 27, 12),
(6, 27, 6),
(7, 27, 6),
(1, 28, 6),
(2, 28, 6),
(3, 28, 3),
(4, 28, 6),
(5, 28, 12),
(6, 28, 6),
(7, 28, 6),
(1, 29, 6),
(2, 29, 6),
(3, 29, 3),
(4, 29, 6),
(5, 29, 12),
(6, 29, 6),
(7, 29, 6),
(1, 30, 6),
(2, 30, 6),
(3, 30, 3),
(4, 30, 6),
(5, 30, 12),
(6, 30, 6),
(7, 30, 6),
(1, 31, 12),
(2, 31, 12),
(3, 31, 6),
(4, 31, 12),
(5, 31, 24),
(6, 31, 12),
(7, 31, 12),
(1, 32, 6),
(2, 32, 6),
(3, 32, 3),
(4, 32, 6),
(5, 32, 12),
(6, 32, 6),
(7, 32, 6),
(1, 33, 6),
(2, 33, 6),
(3, 33, 3),
(4, 33, 6),
(5, 33, 12),
(6, 33, 6),
(7, 33, 6),
(1, 34, 6),
(2, 34, 6),
(3, 34, 3),
(4, 34, 6),
(5, 34, 12),
(6, 34, 6),
(7, 34, 6),
(1, 35, 6),
(2, 35, 6),
(3, 35, 12),
(4, 35, 24),
(5, 35, 48),
(6, 35, 24),
(7, 35, 24),
(1, 36, 6),
(2, 36, 6),
(3, 36, 3),
(4, 36, 6),
(5, 36, 12),
(6, 36, 6),
(7, 36, 6),
(1, 37, 6),
(2, 37, 6),
(3, 37, 3),
(4, 37, 6),
(5, 37, 12),
(6, 37, 6),
(7, 37, 6),
(1, 38, 6),
(2, 38, 6),
(3, 38, 3),
(4, 38, 6),
(5, 38, 12),
(6, 38, 6),
(7, 38, 6),
(1, 39, 6),
(2, 39, 6),
(3, 39, 3),
(4, 39, 6),
(5, 39, 12),
(6, 39, 6),
(7, 39, 6),
(1, 40, 6),
(2, 40, 6),
(3, 40, 3),
(4, 40, 6),
(5, 40, 12),
(6, 40, 6),
(7, 40, 6),
(1, 41, 6),
(2, 41, 6),
(3, 41, 3),
(4, 41, 6),
(5, 41, 12),
(6, 41, 6),
(7, 41, 6),
(1, 42, 6),
(2, 42, 6),
(3, 42, 3),
(4, 42, 6),
(5, 42, 12),
(6, 42, 6),
(7, 42, 6),
(1, 43, 6),
(2, 43, 6),
(3, 43, 3),
(4, 43, 6),
(5, 43, 12),
(6, 43, 6),
(7, 43, 6),
(1, 44, 6),
(2, 44, 6),
(3, 44, 3),
(4, 44, 6),
(5, 44, 12),
(6, 44, 6),
(7, 44, 6),
(1, 45, 6),
(2, 45, 6),
(3, 45, 3),
(4, 45, 6),
(5, 45, 12),
(6, 45, 6),
(7, 45, 6),
(1, 46, 6),
(2, 46, 6),
(3, 46, 3),
(4, 46, 6),
(5, 46, 12),
(6, 46, 6),
(7, 46, 6),
(1, 47, 6),
(2, 47, 6),
(3, 47, 3),
(4, 47, 6),
(5, 47, 12),
(6, 47, 6),
(7, 47, 6),
(1, 48, 6),
(2, 48, 6),
(3, 48, 3),
(4, 48, 6),
(5, 48, 12),
(6, 48, 6),
(7, 48, 6),
(1, 49, 6),
(2, 49, 6),
(3, 49, 3),
(4, 49, 6),
(5, 49, 12),
(6, 49, 6),
(7, 49, 6),
(1, 50, 6),
(2, 50, 6),
(3, 50, 3),
(4, 50, 6),
(5, 50, 12),
(6, 50, 6),
(7, 50, 6),
(1, 51, 6),
(2, 51, 6),
(3, 51, 3),
(4, 51, 6),
(5, 51, 12),
(6, 51, 6),
(7, 51, 6),
(1, 52, 6),
(2, 52, 6),
(3, 52, 3),
(4, 52, 6),
(5, 52, 12),
(6, 52, 6),
(7, 52, 6),
(1, 53, 6),
(2, 53, 6),
(3, 53, 3),
(4, 53, 6),
(5, 53, 12),
(6, 53, 6),
(7, 53, 6),
(1, 54, 6),
(2, 54, 6),
(3, 54, 3),
(4, 54, 6),
(5, 54, 12),
(6, 54, 6),
(7, 54, 6),
(1, 55, 6),
(2, 55, 6),
(3, 55, 3),
(4, 55, 6),
(5, 55, 12),
(6, 55, 6),
(7, 55, 6),
(1, 56, 6),
(2, 56, 6),
(3, 56, 3),
(4, 56, 6),
(5, 56, 12),
(6, 56, 6),
(7, 56, 6),
(1, 57, 6),
(2, 57, 6),
(3, 57, 3),
(4, 57, 6),
(5, 57, 12),
(6, 57, 6),
(7, 57, 6),
(1, 58, 6),
(2, 58, 6),
(3, 58, 3),
(4, 58, 6),
(5, 58, 12),
(6, 58, 6),
(7, 58, 6),
(1, 59, 6),
(2, 59, 6),
(3, 59, 3),
(4, 59, 6),
(5, 59, 12),
(6, 59, 6),
(7, 59, 6),
(1, 60, 6),
(2, 60, 6),
(3, 60, 3),
(4, 60, 6),
(5, 60, 12),
(6, 60, 6),
(7, 60, 6),
(1, 61, 6),
(2, 61, 6),
(3, 61, 3),
(4, 61, 6),
(5, 61, 12),
(6, 61, 6),
(7, 61, 6),
(1, 62, 6),
(2, 62, 6),
(3, 62, 3),
(4, 62, 6),
(5, 62, 12),
(6, 62, 6),
(1, 63, 6),
(2, 63, 6),
(3, 63, 3),
(4, 63, 6),
(5, 63, 12),
(6, 63, 6),
(7, 63, 6),
(1, 64, 6),
(2, 64, 6),
(3, 64, 3),
(4, 64, 6),
(5, 64, 12),
(6, 64, 12),
(7, 64, 12),
(1, 65, 12),
(2, 65, 12),
(3, 65, 6),
(4, 65, 12),
(5, 65, 24),
(6, 65, 12),
(7, 65, 12),
(1, 66, 6),
(2, 66, 6),
(3, 66, 3),
(4, 66, 6),
(5, 66, 12),
(6, 66, 6),
(7, 66, 6),
(1, 67, 6),
(2, 67, 6),
(3, 67, 3),
(4, 67, 6),
(5, 67, 12),
(6, 67, 6),
(7, 67, 6),
(1, 68, 6),
(2, 68, 6),
(3, 68, 3),
(4, 68, 6),
(5, 68, 12),
(6, 68, 6),
(7, 68, 6),
(1, 69, 6),
(2, 69, 6),
(3, 69, 3),
(4, 69, 6),
(5, 69, 12),
(6, 69, 6),
(7, 69, 6),
(1, 70, 6),
(2, 70, 6),
(3, 70, 3),
(4, 70, 6),
(5, 70, 12),
(6, 70, 6),
(7, 70, 6),
(1, 71, 6),
(2, 71, 6),
(3, 71, 3),
(4, 71, 6),
(5, 71, 12),
(6, 71, 6),
(7, 71, 6),
(1, 72, 6),
(2, 72, 6),
(3, 72, 3),
(4, 72, 6),
(5, 72, 12),
(6, 72, 6),
(7, 72, 6),
(1, 73, 6),
(2, 73, 6),
(3, 73, 3),
(4, 73, 6),
(5, 73, 12),
(6, 73, 6),
(7, 73, 6),
(1, 74, 6),
(2, 74, 6),
(3, 74, 3),
(4, 74, 6),
(5, 74, 12),
(6, 74, 6),
(7, 74, 6),
(1, 75, 6),
(2, 75, 6),
(3, 75, 3),
(4, 75, 6),
(5, 75, 12),
(6, 75, 6),
(7, 75, 6),
(1, 76, 6),
(2, 76, 6),
(3, 76, 3),
(4, 76, 6),
(5, 76, 12),
(6, 76, 6),
(7, 76, 6),
(1, 77, 6),
(2, 77, 6),
(3, 77, 3),
(4, 77, 6),
(5, 77, 12),
(6, 77, 6),
(7, 77, 6),
(1, 78, 18),
(1, 79, 18),
(2, 79, 18),
(3, 79, 9),
(4, 79, 18),
(5, 79, 36),
(6, 79, 18),
(7, 79, 18),
(1, 80, 36),
(3, 80, 18),
(5, 80, 72),
(1, 81, 36),
(5, 81, 72),
(1, 82, 12),
(2, 82, 12),
(3, 82, 6),
(1, 83, 12),
(2, 83, 12),
(5, 83, 24),
(3, 86, 6),
(6, 86, 12),
(7, 86, 12),
(2, 87, 18),
(2, 88, 36),
(5, 88, 72),
(2, 89, 36),
(6, 89, 36),
(3, 90, 6),
(4, 90, 12),
(5, 90, 120),
(6, 90, 54),
(7, 90, 54),
(5, 91, 84),
(6, 91, 36),
(7, 91, 42),
(3, 102, 9),
(3, 103, 6),
(4, 104, 18),
(6, 105, 6),
(7, 105, 6),
(5, 108, 12),
(4, 109, 36),
(4, 110, 36),
(4, 111, 12),
(5, 111, 24),
(4, 112, 12),
(4, 113, 12),
(6, 113, 12),
(5, 114, 12),
(5, 115, 12),
(5, 116, 12),
(5, 117, 12),
(5, 118, 12),
(6, 118, 6),
(5, 119, 24),
(6, 119, 6),
(5, 120, 12),
(6, 120, 6),
(5, 121, 12),
(5, 122, 12),
(5, 123, 72),
(6, 123, 36),
(7, 123, 36),
(6, 124, 6),
(7, 124, 42),
(6, 125, 6),
(7, 125, 6),
(6, 126, 12),
(7, 126, 12),
(7, 127, 6),
(7, 128, 6),
(7, 129, 6),
(7, 130, 36),
(7, 131, 12),
(7, 132, 12),
(2, 133, 60),
(3, 133, 30),
(4, 133, 60),
(4, 134, 96),
(3, 135, 48),
(2, 136, 96);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_search_word`
--

CREATE TABLE IF NOT EXISTS `ps_search_word` (
  `id_word` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_shop` int(11) unsigned NOT NULL DEFAULT '1',
  `id_lang` int(10) unsigned NOT NULL,
  `word` varchar(15) NOT NULL,
  PRIMARY KEY (`id_word`),
  UNIQUE KEY `id_lang` (`id_lang`,`id_shop`,`word`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=137 ;

--
-- Volcado de datos para la tabla `ps_search_word`
--

INSERT INTO `ps_search_word` (`id_word`, `id_shop`, `id_lang`, `word`) VALUES
(93, 1, 1, '100'),
(25, 1, 1, '2010'),
(68, 1, 1, 'ahora'),
(116, 1, 1, 'ajustables'),
(12, 1, 1, 'ajuste'),
(82, 1, 1, 'algodon'),
(101, 1, 1, 'alta'),
(123, 1, 1, 'amarillo'),
(69, 1, 1, 'ampliado'),
(47, 1, 1, 'armario'),
(63, 1, 1, 'atencion'),
(81, 1, 1, 'azul'),
(135, 1, 1, 'bahagian'),
(109, 1, 1, 'beige'),
(97, 1, 1, 'blancas'),
(89, 1, 1, 'blanco'),
(84, 1, 1, 'blusa'),
(87, 1, 1, 'blusas'),
(1, 1, 1, 'camiseta'),
(78, 1, 1, 'camisetas'),
(70, 1, 1, 'catalogo'),
(8, 1, 1, 'cerrado'),
(53, 1, 1, 'chic'),
(100, 1, 1, 'cintura'),
(107, 1, 1, 'cinturon'),
(76, 1, 1, 'cinturones'),
(23, 1, 1, 'colecciones'),
(103, 1, 1, 'colorido'),
(14, 1, 1, 'combinala'),
(32, 1, 1, 'combinar'),
(13, 1, 1, 'comodo'),
(73, 1, 1, 'complementos'),
(60, 1, 1, 'confeccionan'),
(5, 1, 1, 'corta'),
(113, 1, 1, 'corto'),
(118, 1, 1, 'debajo'),
(119, 1, 1, 'del'),
(6, 1, 1, 'demo'),
(3, 1, 1, 'destenido'),
(67, 1, 1, 'detalle'),
(22, 1, 1, 'disenando'),
(28, 1, 1, 'disenos'),
(92, 1, 1, 'doble'),
(85, 1, 1, 'drapeado'),
(2, 1, 1, 'efecto'),
(11, 1, 1, 'elastico'),
(54, 1, 1, 'elegancia'),
(112, 1, 1, 'elegante'),
(30, 1, 1, 'elegantes'),
(43, 1, 1, 'elemento'),
(7, 1, 1, 'escote'),
(91, 1, 1, 'estampado'),
(17, 1, 1, 'estaras'),
(56, 1, 1, 'estilo'),
(37, 1, 1, 'evolucionado'),
(98, 1, 1, 'falda'),
(20, 1, 1, 'fashion'),
(86, 1, 1, 'femenino'),
(29, 1, 1, 'femeninos'),
(115, 1, 1, 'finos'),
(46, 1, 1, 'fondo'),
(51, 1, 1, 'frescos'),
(117, 1, 1, 'fruncido'),
(124, 1, 1, 'gasa'),
(38, 1, 1, 'hacia'),
(36, 1, 1, 'han'),
(64, 1, 1, 'hasta'),
(71, 1, 1, 'incluir'),
(58, 1, 1, 'inconfundible'),
(24, 1, 1, 'increibles'),
(45, 1, 1, 'indispensable'),
(122, 1, 1, 'inferior'),
(83, 1, 1, 'informal'),
(102, 1, 1, 'informales'),
(61, 1, 1, 'italia'),
(134, 1, 1, 'jeno'),
(55, 1, 1, 'juvenil'),
(39, 1, 1, 'linea'),
(18, 1, 1, 'lista'),
(21, 1, 1, 'lleva'),
(50, 1, 1, 'looks'),
(4, 1, 1, 'manga'),
(105, 1, 1, 'mangas'),
(79, 1, 1, 'manufacturer'),
(26, 1, 1, 'marca'),
(65, 1, 1, 'mas'),
(9, 1, 1, 'material'),
(131, 1, 1, 'media'),
(66, 1, 1, 'minimo'),
(77, 1, 1, 'mucho'),
(48, 1, 1, 'mujer'),
(80, 1, 1, 'naranja'),
(96, 1, 1, 'negras'),
(88, 1, 1, 'negro'),
(104, 1, 1, 'noche'),
(27, 1, 1, 'ofrece'),
(16, 1, 1, 'paja'),
(121, 1, 1, 'parte'),
(120, 1, 1, 'pecho'),
(132, 1, 1, 'pierna'),
(126, 1, 1, 'poliester'),
(41, 1, 1, 'porter'),
(31, 1, 1, 'prendas'),
(62, 1, 1, 'prestando'),
(40, 1, 1, 'pret'),
(128, 1, 1, 'pronunciado'),
(42, 1, 1, 'que'),
(95, 1, 1, 'rayas'),
(106, 1, 1, 'rectas'),
(44, 1, 1, 'resulta'),
(49, 1, 1, 'resultado'),
(125, 1, 1, 'rodilla'),
(110, 1, 1, 'rosa'),
(52, 1, 1, 'sencillos'),
(133, 1, 1, 'silla'),
(99, 1, 1, 'skater'),
(15, 1, 1, 'sombrero'),
(75, 1, 1, 'sombreros'),
(10, 1, 1, 'suave'),
(127, 1, 1, 'tejido'),
(34, 1, 1, 'tendencias'),
(72, 1, 1, 'tipo'),
(114, 1, 1, 'tirantes'),
(59, 1, 1, 'todas'),
(94, 1, 1, 'top'),
(33, 1, 1, 'ultimas'),
(57, 1, 1, 'unico'),
(136, 1, 1, 'unitarias'),
(19, 1, 1, 'verano'),
(130, 1, 1, 'verde'),
(90, 1, 1, 'vestido'),
(35, 1, 1, 'vestidos'),
(111, 1, 1, 'viscosa'),
(108, 1, 1, 'volantes'),
(129, 1, 1, 'yprestando'),
(74, 1, 1, 'zapatos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_sekeyword`
--

CREATE TABLE IF NOT EXISTS `ps_sekeyword` (
  `id_sekeyword` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_shop` int(10) unsigned NOT NULL DEFAULT '1',
  `id_shop_group` int(10) unsigned NOT NULL DEFAULT '1',
  `keyword` varchar(256) NOT NULL,
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_sekeyword`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_shop`
--

CREATE TABLE IF NOT EXISTS `ps_shop` (
  `id_shop` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_shop_group` int(11) unsigned NOT NULL,
  `name` varchar(64) NOT NULL,
  `id_category` int(11) unsigned NOT NULL DEFAULT '1',
  `id_theme` int(1) unsigned NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_shop`),
  KEY `id_shop_group` (`id_shop_group`),
  KEY `id_category` (`id_category`),
  KEY `id_theme` (`id_theme`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `ps_shop`
--

INSERT INTO `ps_shop` (`id_shop`, `id_shop_group`, `name`, `id_category`, `id_theme`, `active`, `deleted`) VALUES
(1, 1, 'MATISSES', 2, 2, 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_shop_group`
--

CREATE TABLE IF NOT EXISTS `ps_shop_group` (
  `id_shop_group` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `share_customer` tinyint(1) NOT NULL,
  `share_order` tinyint(1) NOT NULL,
  `share_stock` tinyint(1) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_shop_group`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `ps_shop_group`
--

INSERT INTO `ps_shop_group` (`id_shop_group`, `name`, `share_customer`, `share_order`, `share_stock`, `active`, `deleted`) VALUES
(1, 'Default', 0, 0, 0, 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_shop_url`
--

CREATE TABLE IF NOT EXISTS `ps_shop_url` (
  `id_shop_url` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_shop` int(11) unsigned NOT NULL,
  `domain` varchar(150) NOT NULL,
  `domain_ssl` varchar(150) NOT NULL,
  `physical_uri` varchar(64) NOT NULL,
  `virtual_uri` varchar(64) NOT NULL,
  `main` tinyint(1) NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_shop_url`),
  UNIQUE KEY `full_shop_url` (`domain`,`physical_uri`,`virtual_uri`),
  UNIQUE KEY `full_shop_url_ssl` (`domain_ssl`,`physical_uri`,`virtual_uri`),
  KEY `id_shop` (`id_shop`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `ps_shop_url`
--

INSERT INTO `ps_shop_url` (`id_shop_url`, `id_shop`, `domain`, `domain_ssl`, `physical_uri`, `virtual_uri`, `main`, `active`) VALUES
(1, 1, 'www.matisses.co', 'www.matisses.co', '/', '', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_smarty_cache`
--

CREATE TABLE IF NOT EXISTS `ps_smarty_cache` (
  `id_smarty_cache` char(40) NOT NULL,
  `name` char(40) NOT NULL,
  `cache_id` varchar(254) DEFAULT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `content` longtext NOT NULL,
  PRIMARY KEY (`id_smarty_cache`),
  KEY `name` (`name`),
  KEY `cache_id` (`cache_id`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_specific_price`
--

CREATE TABLE IF NOT EXISTS `ps_specific_price` (
  `id_specific_price` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_specific_price_rule` int(11) unsigned NOT NULL,
  `id_cart` int(11) unsigned NOT NULL,
  `id_product` int(10) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL DEFAULT '1',
  `id_shop_group` int(11) unsigned NOT NULL,
  `id_currency` int(10) unsigned NOT NULL,
  `id_country` int(10) unsigned NOT NULL,
  `id_group` int(10) unsigned NOT NULL,
  `id_customer` int(10) unsigned NOT NULL,
  `id_product_attribute` int(10) unsigned NOT NULL,
  `price` decimal(20,6) NOT NULL,
  `from_quantity` mediumint(8) unsigned NOT NULL,
  `reduction` decimal(20,6) NOT NULL,
  `reduction_tax` tinyint(1) NOT NULL DEFAULT '1',
  `reduction_type` enum('amount','percentage') NOT NULL,
  `from` datetime NOT NULL,
  `to` datetime NOT NULL,
  PRIMARY KEY (`id_specific_price`),
  KEY `id_product` (`id_product`,`id_shop`,`id_currency`,`id_country`,`id_group`,`id_customer`,`from_quantity`,`from`,`to`),
  KEY `from_quantity` (`from_quantity`),
  KEY `id_specific_price_rule` (`id_specific_price_rule`),
  KEY `id_cart` (`id_cart`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `ps_specific_price`
--

INSERT INTO `ps_specific_price` (`id_specific_price`, `id_specific_price_rule`, `id_cart`, `id_product`, `id_shop`, `id_shop_group`, `id_currency`, `id_country`, `id_group`, `id_customer`, `id_product_attribute`, `price`, `from_quantity`, `reduction`, `reduction_tax`, `reduction_type`, `from`, `to`) VALUES
(1, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, -1.000000, 1, 0.050000, 1, 'percentage', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, -1.000000, 1, 0.200000, 1, 'percentage', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_specific_price_priority`
--

CREATE TABLE IF NOT EXISTS `ps_specific_price_priority` (
  `id_specific_price_priority` int(11) NOT NULL AUTO_INCREMENT,
  `id_product` int(11) NOT NULL,
  `priority` varchar(80) NOT NULL,
  PRIMARY KEY (`id_specific_price_priority`,`id_product`),
  UNIQUE KEY `id_product` (`id_product`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- Volcado de datos para la tabla `ps_specific_price_priority`
--

INSERT INTO `ps_specific_price_priority` (`id_specific_price_priority`, `id_product`, `priority`) VALUES
(1, 4, 'id_shop;id_currency;id_country;id_group'),
(2, 7, 'id_shop;id_currency;id_country;id_group'),
(13, 3, 'id_shop;id_currency;id_country;id_group'),
(17, 2, 'id_shop;id_currency;id_country;id_group');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_specific_price_rule`
--

CREATE TABLE IF NOT EXISTS `ps_specific_price_rule` (
  `id_specific_price_rule` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `id_shop` int(11) unsigned NOT NULL DEFAULT '1',
  `id_currency` int(10) unsigned NOT NULL,
  `id_country` int(10) unsigned NOT NULL,
  `id_group` int(10) unsigned NOT NULL,
  `from_quantity` mediumint(8) unsigned NOT NULL,
  `price` decimal(20,6) DEFAULT NULL,
  `reduction` decimal(20,6) NOT NULL,
  `reduction_tax` tinyint(1) NOT NULL DEFAULT '1',
  `reduction_type` enum('amount','percentage') NOT NULL,
  `from` datetime NOT NULL,
  `to` datetime NOT NULL,
  PRIMARY KEY (`id_specific_price_rule`),
  KEY `id_product` (`id_shop`,`id_currency`,`id_country`,`id_group`,`from_quantity`,`from`,`to`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_specific_price_rule_condition`
--

CREATE TABLE IF NOT EXISTS `ps_specific_price_rule_condition` (
  `id_specific_price_rule_condition` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_specific_price_rule_condition_group` int(11) unsigned NOT NULL,
  `type` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`id_specific_price_rule_condition`),
  KEY `id_specific_price_rule_condition_group` (`id_specific_price_rule_condition_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_specific_price_rule_condition_group`
--

CREATE TABLE IF NOT EXISTS `ps_specific_price_rule_condition_group` (
  `id_specific_price_rule_condition_group` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_specific_price_rule` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_specific_price_rule_condition_group`,`id_specific_price_rule`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_state`
--

CREATE TABLE IF NOT EXISTS `ps_state` (
  `id_state` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_country` int(11) unsigned NOT NULL,
  `id_zone` int(11) unsigned NOT NULL,
  `name` varchar(64) NOT NULL,
  `iso_code` varchar(7) NOT NULL,
  `tax_behavior` smallint(1) NOT NULL DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_state`),
  KEY `id_country` (`id_country`),
  KEY `name` (`name`),
  KEY `id_zone` (`id_zone`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=346 ;

--
-- Volcado de datos para la tabla `ps_state`
--

INSERT INTO `ps_state` (`id_state`, `id_country`, `id_zone`, `name`, `iso_code`, `tax_behavior`, `active`) VALUES
(1, 21, 2, 'Alabama', 'AL', 0, 1),
(2, 21, 2, 'Alaska', 'AK', 0, 1),
(3, 21, 2, 'Arizona', 'AZ', 0, 1),
(4, 21, 2, 'Arkansas', 'AR', 0, 1),
(5, 21, 2, 'California', 'CA', 0, 1),
(6, 21, 2, 'Colorado', 'CO', 0, 1),
(7, 21, 2, 'Connecticut', 'CT', 0, 1),
(8, 21, 2, 'Delaware', 'DE', 0, 1),
(9, 21, 2, 'Florida', 'FL', 0, 1),
(10, 21, 2, 'Georgia', 'GA', 0, 1),
(11, 21, 2, 'Hawaii', 'HI', 0, 1),
(12, 21, 2, 'Idaho', 'ID', 0, 1),
(13, 21, 2, 'Illinois', 'IL', 0, 1),
(14, 21, 2, 'Indiana', 'IN', 0, 1),
(15, 21, 2, 'Iowa', 'IA', 0, 1),
(16, 21, 2, 'Kansas', 'KS', 0, 1),
(17, 21, 2, 'Kentucky', 'KY', 0, 1),
(18, 21, 2, 'Louisiana', 'LA', 0, 1),
(19, 21, 2, 'Maine', 'ME', 0, 1),
(20, 21, 2, 'Maryland', 'MD', 0, 1),
(21, 21, 2, 'Massachusetts', 'MA', 0, 1),
(22, 21, 2, 'Michigan', 'MI', 0, 1),
(23, 21, 2, 'Minnesota', 'MN', 0, 1),
(24, 21, 2, 'Mississippi', 'MS', 0, 1),
(25, 21, 2, 'Missouri', 'MO', 0, 1),
(26, 21, 2, 'Montana', 'MT', 0, 1),
(27, 21, 2, 'Nebraska', 'NE', 0, 1),
(28, 21, 2, 'Nevada', 'NV', 0, 1),
(29, 21, 2, 'New Hampshire', 'NH', 0, 1),
(30, 21, 2, 'New Jersey', 'NJ', 0, 1),
(31, 21, 2, 'New Mexico', 'NM', 0, 1),
(32, 21, 2, 'New York', 'NY', 0, 1),
(33, 21, 2, 'North Carolina', 'NC', 0, 1),
(34, 21, 2, 'North Dakota', 'ND', 0, 1),
(35, 21, 2, 'Ohio', 'OH', 0, 1),
(36, 21, 2, 'Oklahoma', 'OK', 0, 1),
(37, 21, 2, 'Oregon', 'OR', 0, 1),
(38, 21, 2, 'Pennsylvania', 'PA', 0, 1),
(39, 21, 2, 'Rhode Island', 'RI', 0, 1),
(40, 21, 2, 'South Carolina', 'SC', 0, 1),
(41, 21, 2, 'South Dakota', 'SD', 0, 1),
(42, 21, 2, 'Tennessee', 'TN', 0, 1),
(43, 21, 2, 'Texas', 'TX', 0, 1),
(44, 21, 2, 'Utah', 'UT', 0, 1),
(45, 21, 2, 'Vermont', 'VT', 0, 1),
(46, 21, 2, 'Virginia', 'VA', 0, 1),
(47, 21, 2, 'Washington', 'WA', 0, 1),
(48, 21, 2, 'West Virginia', 'WV', 0, 1),
(49, 21, 2, 'Wisconsin', 'WI', 0, 1),
(50, 21, 2, 'Wyoming', 'WY', 0, 1),
(51, 21, 2, 'Puerto Rico', 'PR', 0, 1),
(52, 21, 2, 'US Virgin Islands', 'VI', 0, 1),
(53, 21, 2, 'District of Columbia', 'DC', 0, 1),
(54, 145, 2, 'Aguascalientes', 'AGS', 0, 1),
(55, 145, 2, 'Baja California', 'BCN', 0, 1),
(56, 145, 2, 'Baja California Sur', 'BCS', 0, 1),
(57, 145, 2, 'Campeche', 'CAM', 0, 1),
(58, 145, 2, 'Chiapas', 'CHP', 0, 1),
(59, 145, 2, 'Chihuahua', 'CHH', 0, 1),
(60, 145, 2, 'Coahuila', 'COA', 0, 1),
(61, 145, 2, 'Colima', 'COL', 0, 1),
(62, 145, 2, 'Distrito Federal', 'DIF', 0, 1),
(63, 145, 2, 'Durango', 'DUR', 0, 1),
(64, 145, 2, 'Guanajuato', 'GUA', 0, 1),
(65, 145, 2, 'Guerrero', 'GRO', 0, 1),
(66, 145, 2, 'Hidalgo', 'HID', 0, 1),
(67, 145, 2, 'Jalisco', 'JAL', 0, 1),
(68, 145, 2, 'Estado de México', 'MEX', 0, 1),
(69, 145, 2, 'Michoacán', 'MIC', 0, 1),
(70, 145, 2, 'Morelos', 'MOR', 0, 1),
(71, 145, 2, 'Nayarit', 'NAY', 0, 1),
(72, 145, 2, 'Nuevo León', 'NLE', 0, 1),
(73, 145, 2, 'Oaxaca', 'OAX', 0, 1),
(74, 145, 2, 'Puebla', 'PUE', 0, 1),
(75, 145, 2, 'Querétaro', 'QUE', 0, 1),
(76, 145, 2, 'Quintana Roo', 'ROO', 0, 1),
(77, 145, 2, 'San Luis Potosí', 'SLP', 0, 1),
(78, 145, 2, 'Sinaloa', 'SIN', 0, 1),
(79, 145, 2, 'Sonora', 'SON', 0, 1),
(80, 145, 2, 'Tabasco', 'TAB', 0, 1),
(81, 145, 2, 'Tamaulipas', 'TAM', 0, 1),
(82, 145, 2, 'Tlaxcala', 'TLA', 0, 1),
(83, 145, 2, 'Veracruz', 'VER', 0, 1),
(84, 145, 2, 'Yucatán', 'YUC', 0, 1),
(85, 145, 2, 'Zacatecas', 'ZAC', 0, 1),
(86, 4, 2, 'Ontario', 'ON', 0, 1),
(87, 4, 2, 'Quebec', 'QC', 0, 1),
(88, 4, 2, 'British Columbia', 'BC', 0, 1),
(89, 4, 2, 'Alberta', 'AB', 0, 1),
(90, 4, 2, 'Manitoba', 'MB', 0, 1),
(91, 4, 2, 'Saskatchewan', 'SK', 0, 1),
(92, 4, 2, 'Nova Scotia', 'NS', 0, 1),
(93, 4, 2, 'New Brunswick', 'NB', 0, 1),
(94, 4, 2, 'Newfoundland and Labrador', 'NL', 0, 1),
(95, 4, 2, 'Prince Edward Island', 'PE', 0, 1),
(96, 4, 2, 'Northwest Territories', 'NT', 0, 1),
(97, 4, 2, 'Yukon', 'YT', 0, 1),
(98, 4, 2, 'Nunavut', 'NU', 0, 1),
(99, 44, 6, 'Buenos Aires', 'B', 0, 1),
(100, 44, 6, 'Catamarca', 'K', 0, 1),
(101, 44, 6, 'Chaco', 'H', 0, 1),
(102, 44, 6, 'Chubut', 'U', 0, 1),
(103, 44, 6, 'Ciudad de Buenos Aires', 'C', 0, 1),
(104, 44, 6, 'Córdoba', 'X', 0, 1),
(105, 44, 6, 'Corrientes', 'W', 0, 1),
(106, 44, 6, 'Entre Ríos', 'E', 0, 1),
(107, 44, 6, 'Formosa', 'P', 0, 1),
(108, 44, 6, 'Jujuy', 'Y', 0, 1),
(109, 44, 6, 'La Pampa', 'L', 0, 1),
(110, 44, 6, 'La Rioja', 'F', 0, 1),
(111, 44, 6, 'Mendoza', 'M', 0, 1),
(112, 44, 6, 'Misiones', 'N', 0, 1),
(113, 44, 6, 'Neuquén', 'Q', 0, 1),
(114, 44, 6, 'Río Negro', 'R', 0, 1),
(115, 44, 6, 'Salta', 'A', 0, 1),
(116, 44, 6, 'San Juan', 'J', 0, 1),
(117, 44, 6, 'San Luis', 'D', 0, 1),
(118, 44, 6, 'Santa Cruz', 'Z', 0, 1),
(119, 44, 6, 'Santa Fe', 'S', 0, 1),
(120, 44, 6, 'Santiago del Estero', 'G', 0, 1),
(121, 44, 6, 'Tierra del Fuego', 'V', 0, 1),
(122, 44, 6, 'Tucumán', 'T', 0, 1),
(123, 10, 1, 'Agrigento', 'AG', 0, 1),
(124, 10, 1, 'Alessandria', 'AL', 0, 1),
(125, 10, 1, 'Ancona', 'AN', 0, 1),
(126, 10, 1, 'Aosta', 'AO', 0, 1),
(127, 10, 1, 'Arezzo', 'AR', 0, 1),
(128, 10, 1, 'Ascoli Piceno', 'AP', 0, 1),
(129, 10, 1, 'Asti', 'AT', 0, 1),
(130, 10, 1, 'Avellino', 'AV', 0, 1),
(131, 10, 1, 'Bari', 'BA', 0, 1),
(132, 10, 1, 'Barletta-Andria-Trani', 'BT', 0, 1),
(133, 10, 1, 'Belluno', 'BL', 0, 1),
(134, 10, 1, 'Benevento', 'BN', 0, 1),
(135, 10, 1, 'Bergamo', 'BG', 0, 1),
(136, 10, 1, 'Biella', 'BI', 0, 1),
(137, 10, 1, 'Bologna', 'BO', 0, 1),
(138, 10, 1, 'Bolzano', 'BZ', 0, 1),
(139, 10, 1, 'Brescia', 'BS', 0, 1),
(140, 10, 1, 'Brindisi', 'BR', 0, 1),
(141, 10, 1, 'Cagliari', 'CA', 0, 1),
(142, 10, 1, 'Caltanissetta', 'CL', 0, 1),
(143, 10, 1, 'Campobasso', 'CB', 0, 1),
(144, 10, 1, 'Carbonia-Iglesias', 'CI', 0, 1),
(145, 10, 1, 'Caserta', 'CE', 0, 1),
(146, 10, 1, 'Catania', 'CT', 0, 1),
(147, 10, 1, 'Catanzaro', 'CZ', 0, 1),
(148, 10, 1, 'Chieti', 'CH', 0, 1),
(149, 10, 1, 'Como', 'CO', 0, 1),
(150, 10, 1, 'Cosenza', 'CS', 0, 1),
(151, 10, 1, 'Cremona', 'CR', 0, 1),
(152, 10, 1, 'Crotone', 'KR', 0, 1),
(153, 10, 1, 'Cuneo', 'CN', 0, 1),
(154, 10, 1, 'Enna', 'EN', 0, 1),
(155, 10, 1, 'Fermo', 'FM', 0, 1),
(156, 10, 1, 'Ferrara', 'FE', 0, 1),
(157, 10, 1, 'Firenze', 'FI', 0, 1),
(158, 10, 1, 'Foggia', 'FG', 0, 1),
(159, 10, 1, 'Forlì-Cesena', 'FC', 0, 1),
(160, 10, 1, 'Frosinone', 'FR', 0, 1),
(161, 10, 1, 'Genova', 'GE', 0, 1),
(162, 10, 1, 'Gorizia', 'GO', 0, 1),
(163, 10, 1, 'Grosseto', 'GR', 0, 1),
(164, 10, 1, 'Imperia', 'IM', 0, 1),
(165, 10, 1, 'Isernia', 'IS', 0, 1),
(166, 10, 1, 'L''Aquila', 'AQ', 0, 1),
(167, 10, 1, 'La Spezia', 'SP', 0, 1),
(168, 10, 1, 'Latina', 'LT', 0, 1),
(169, 10, 1, 'Lecce', 'LE', 0, 1),
(170, 10, 1, 'Lecco', 'LC', 0, 1),
(171, 10, 1, 'Livorno', 'LI', 0, 1),
(172, 10, 1, 'Lodi', 'LO', 0, 1),
(173, 10, 1, 'Lucca', 'LU', 0, 1),
(174, 10, 1, 'Macerata', 'MC', 0, 1),
(175, 10, 1, 'Mantova', 'MN', 0, 1),
(176, 10, 1, 'Massa', 'MS', 0, 1),
(177, 10, 1, 'Matera', 'MT', 0, 1),
(178, 10, 1, 'Medio Campidano', 'VS', 0, 1),
(179, 10, 1, 'Messina', 'ME', 0, 1),
(180, 10, 1, 'Milano', 'MI', 0, 1),
(181, 10, 1, 'Modena', 'MO', 0, 1),
(182, 10, 1, 'Monza e della Brianza', 'MB', 0, 1),
(183, 10, 1, 'Napoli', 'NA', 0, 1),
(184, 10, 1, 'Novara', 'NO', 0, 1),
(185, 10, 1, 'Nuoro', 'NU', 0, 1),
(186, 10, 1, 'Ogliastra', 'OG', 0, 1),
(187, 10, 1, 'Olbia-Tempio', 'OT', 0, 1),
(188, 10, 1, 'Oristano', 'OR', 0, 1),
(189, 10, 1, 'Padova', 'PD', 0, 1),
(190, 10, 1, 'Palermo', 'PA', 0, 1),
(191, 10, 1, 'Parma', 'PR', 0, 1),
(192, 10, 1, 'Pavia', 'PV', 0, 1),
(193, 10, 1, 'Perugia', 'PG', 0, 1),
(194, 10, 1, 'Pesaro-Urbino', 'PU', 0, 1),
(195, 10, 1, 'Pescara', 'PE', 0, 1),
(196, 10, 1, 'Piacenza', 'PC', 0, 1),
(197, 10, 1, 'Pisa', 'PI', 0, 1),
(198, 10, 1, 'Pistoia', 'PT', 0, 1),
(199, 10, 1, 'Pordenone', 'PN', 0, 1),
(200, 10, 1, 'Potenza', 'PZ', 0, 1),
(201, 10, 1, 'Prato', 'PO', 0, 1),
(202, 10, 1, 'Ragusa', 'RG', 0, 1),
(203, 10, 1, 'Ravenna', 'RA', 0, 1),
(204, 10, 1, 'Reggio Calabria', 'RC', 0, 1),
(205, 10, 1, 'Reggio Emilia', 'RE', 0, 1),
(206, 10, 1, 'Rieti', 'RI', 0, 1),
(207, 10, 1, 'Rimini', 'RN', 0, 1),
(208, 10, 1, 'Roma', 'RM', 0, 1),
(209, 10, 1, 'Rovigo', 'RO', 0, 1),
(210, 10, 1, 'Salerno', 'SA', 0, 1),
(211, 10, 1, 'Sassari', 'SS', 0, 1),
(212, 10, 1, 'Savona', 'SV', 0, 1),
(213, 10, 1, 'Siena', 'SI', 0, 1),
(214, 10, 1, 'Siracusa', 'SR', 0, 1),
(215, 10, 1, 'Sondrio', 'SO', 0, 1),
(216, 10, 1, 'Taranto', 'TA', 0, 1),
(217, 10, 1, 'Teramo', 'TE', 0, 1),
(218, 10, 1, 'Terni', 'TR', 0, 1),
(219, 10, 1, 'Torino', 'TO', 0, 1),
(220, 10, 1, 'Trapani', 'TP', 0, 1),
(221, 10, 1, 'Trento', 'TN', 0, 1),
(222, 10, 1, 'Treviso', 'TV', 0, 1),
(223, 10, 1, 'Trieste', 'TS', 0, 1),
(224, 10, 1, 'Udine', 'UD', 0, 1),
(225, 10, 1, 'Varese', 'VA', 0, 1),
(226, 10, 1, 'Venezia', 'VE', 0, 1),
(227, 10, 1, 'Verbano-Cusio-Ossola', 'VB', 0, 1),
(228, 10, 1, 'Vercelli', 'VC', 0, 1),
(229, 10, 1, 'Verona', 'VR', 0, 1),
(230, 10, 1, 'Vibo Valentia', 'VV', 0, 1),
(231, 10, 1, 'Vicenza', 'VI', 0, 1),
(232, 10, 1, 'Viterbo', 'VT', 0, 1),
(233, 111, 3, 'Aceh', 'AC', 0, 1),
(234, 111, 3, 'Bali', 'BA', 0, 1),
(235, 111, 3, 'Bangka', 'BB', 0, 1),
(236, 111, 3, 'Banten', 'BT', 0, 1),
(237, 111, 3, 'Bengkulu', 'BE', 0, 1),
(238, 111, 3, 'Central Java', 'JT', 0, 1),
(239, 111, 3, 'Central Kalimantan', 'KT', 0, 1),
(240, 111, 3, 'Central Sulawesi', 'ST', 0, 1),
(241, 111, 3, 'Coat of arms of East Java', 'JI', 0, 1),
(242, 111, 3, 'East kalimantan', 'KI', 0, 1),
(243, 111, 3, 'East Nusa Tenggara', 'NT', 0, 1),
(244, 111, 3, 'Lambang propinsi', 'GO', 0, 1),
(245, 111, 3, 'Jakarta', 'JK', 0, 1),
(246, 111, 3, 'Jambi', 'JA', 0, 1),
(247, 111, 3, 'Lampung', 'LA', 0, 1),
(248, 111, 3, 'Maluku', 'MA', 0, 1),
(249, 111, 3, 'North Maluku', 'MU', 0, 1),
(250, 111, 3, 'North Sulawesi', 'SA', 0, 1),
(251, 111, 3, 'North Sumatra', 'SU', 0, 1),
(252, 111, 3, 'Papua', 'PA', 0, 1),
(253, 111, 3, 'Riau', 'RI', 0, 1),
(254, 111, 3, 'Lambang Riau', 'KR', 0, 1),
(255, 111, 3, 'Southeast Sulawesi', 'SG', 0, 1),
(256, 111, 3, 'South Kalimantan', 'KS', 0, 1),
(257, 111, 3, 'South Sulawesi', 'SN', 0, 1),
(258, 111, 3, 'South Sumatra', 'SS', 0, 1),
(259, 111, 3, 'West Java', 'JB', 0, 1),
(260, 111, 3, 'West Kalimantan', 'KB', 0, 1),
(261, 111, 3, 'West Nusa Tenggara', 'NB', 0, 1),
(262, 111, 3, 'Lambang Provinsi Papua Barat', 'PB', 0, 1),
(263, 111, 3, 'West Sulawesi', 'SR', 0, 1),
(264, 111, 3, 'West Sumatra', 'SB', 0, 1),
(265, 111, 3, 'Yogyakarta', 'YO', 0, 1),
(266, 11, 3, 'Aichi', '23', 0, 1),
(267, 11, 3, 'Akita', '05', 0, 1),
(268, 11, 3, 'Aomori', '02', 0, 1),
(269, 11, 3, 'Chiba', '12', 0, 1),
(270, 11, 3, 'Ehime', '38', 0, 1),
(271, 11, 3, 'Fukui', '18', 0, 1),
(272, 11, 3, 'Fukuoka', '40', 0, 1),
(273, 11, 3, 'Fukushima', '07', 0, 1),
(274, 11, 3, 'Gifu', '21', 0, 1),
(275, 11, 3, 'Gunma', '10', 0, 1),
(276, 11, 3, 'Hiroshima', '34', 0, 1),
(277, 11, 3, 'Hokkaido', '01', 0, 1),
(278, 11, 3, 'Hyogo', '28', 0, 1),
(279, 11, 3, 'Ibaraki', '08', 0, 1),
(280, 11, 3, 'Ishikawa', '17', 0, 1),
(281, 11, 3, 'Iwate', '03', 0, 1),
(282, 11, 3, 'Kagawa', '37', 0, 1),
(283, 11, 3, 'Kagoshima', '46', 0, 1),
(284, 11, 3, 'Kanagawa', '14', 0, 1),
(285, 11, 3, 'Kochi', '39', 0, 1),
(286, 11, 3, 'Kumamoto', '43', 0, 1),
(287, 11, 3, 'Kyoto', '26', 0, 1),
(288, 11, 3, 'Mie', '24', 0, 1),
(289, 11, 3, 'Miyagi', '04', 0, 1),
(290, 11, 3, 'Miyazaki', '45', 0, 1),
(291, 11, 3, 'Nagano', '20', 0, 1),
(292, 11, 3, 'Nagasaki', '42', 0, 1),
(293, 11, 3, 'Nara', '29', 0, 1),
(294, 11, 3, 'Niigata', '15', 0, 1),
(295, 11, 3, 'Oita', '44', 0, 1),
(296, 11, 3, 'Okayama', '33', 0, 1),
(297, 11, 3, 'Okinawa', '47', 0, 1),
(298, 11, 3, 'Osaka', '27', 0, 1),
(299, 11, 3, 'Saga', '41', 0, 1),
(300, 11, 3, 'Saitama', '11', 0, 1),
(301, 11, 3, 'Shiga', '25', 0, 1),
(302, 11, 3, 'Shimane', '32', 0, 1),
(303, 11, 3, 'Shizuoka', '22', 0, 1),
(304, 11, 3, 'Tochigi', '09', 0, 1),
(305, 11, 3, 'Tokushima', '36', 0, 1),
(306, 11, 3, 'Tokyo', '13', 0, 1),
(307, 11, 3, 'Tottori', '31', 0, 1),
(308, 11, 3, 'Toyama', '16', 0, 1),
(309, 11, 3, 'Wakayama', '30', 0, 1),
(310, 11, 3, 'Yamagata', '06', 0, 1),
(311, 11, 3, 'Yamaguchi', '35', 0, 1),
(312, 11, 3, 'Yamanashi', '19', 0, 1),
(313, 69, 6, 'Amazonas', 'AMA', 0, 1),
(314, 69, 6, 'Antioquia', 'ANT', 0, 1),
(315, 69, 6, 'Arauca', 'ARA', 0, 1),
(316, 69, 6, 'Atlantico', 'ATL', 0, 1),
(317, 69, 6, 'Bolivar', 'BOL', 0, 1),
(318, 69, 6, 'Boyaca', 'BOY', 0, 1),
(319, 69, 6, 'Caldas', 'CAL', 0, 1),
(320, 69, 6, 'Caqueta', 'CAQ', 0, 1),
(321, 69, 6, 'Casanare', 'CAS', 0, 1),
(322, 69, 6, 'Cauca', 'CAU', 0, 1),
(323, 69, 6, 'Cesar', 'CES', 0, 1),
(324, 69, 6, 'Choco', 'CHO', 0, 1),
(325, 69, 6, 'Cordoba', 'COR', 0, 1),
(326, 69, 6, 'Cundinamarca', 'CUN', 0, 1),
(327, 69, 6, 'Distrito Capital', 'DC', 0, 1),
(328, 69, 6, 'Guainia', 'GUA', 0, 1),
(329, 69, 6, 'Guaviare', 'GUV', 0, 1),
(330, 69, 6, 'Huila', 'HUI', 0, 1),
(331, 69, 6, 'La Guajira', 'LAG', 0, 1),
(332, 69, 6, 'Magdalena', 'MAG', 0, 1),
(333, 69, 6, 'Meta', 'MET', 0, 1),
(334, 69, 6, 'Nariño', 'NAR', 0, 1),
(335, 69, 6, 'Norte de Santander', 'NSA', 0, 1),
(336, 69, 6, 'Putumayo', 'PUT', 0, 1),
(337, 69, 6, 'Quindio', 'QUI', 0, 1),
(338, 69, 6, 'Risaralda', 'RIS', 0, 1),
(339, 69, 6, 'San Andres y Providencia', 'SAP', 0, 1),
(340, 69, 6, 'Santander', 'SAN', 0, 1),
(341, 69, 6, 'Sucre', 'SUC', 0, 1),
(342, 69, 6, 'Tolima', 'TOL', 0, 1),
(343, 69, 6, 'Valle del Cauca', 'VAC', 0, 1),
(344, 69, 6, 'Vaupes', 'VAU', 0, 1),
(345, 69, 6, 'Vichada', 'VID', 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_statssearch`
--

CREATE TABLE IF NOT EXISTS `ps_statssearch` (
  `id_statssearch` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_shop` int(10) unsigned NOT NULL DEFAULT '1',
  `id_shop_group` int(10) unsigned NOT NULL DEFAULT '1',
  `keywords` varchar(255) NOT NULL,
  `results` int(6) NOT NULL DEFAULT '0',
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_statssearch`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `ps_statssearch`
--

INSERT INTO `ps_statssearch` (`id_statssearch`, `id_shop`, `id_shop_group`, `keywords`, `results`, `date_add`) VALUES
(1, 1, 1, 'fdgdfdgdfgfgdfgdsafsd fdf sdfsd fsdf sdfsd fsdf', 0, '2015-10-18 15:34:51');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_stock`
--

CREATE TABLE IF NOT EXISTS `ps_stock` (
  `id_stock` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_warehouse` int(11) unsigned NOT NULL,
  `id_product` int(11) unsigned NOT NULL,
  `id_product_attribute` int(11) unsigned NOT NULL,
  `reference` varchar(32) NOT NULL,
  `ean13` varchar(13) DEFAULT NULL,
  `upc` varchar(12) DEFAULT NULL,
  `physical_quantity` int(11) unsigned NOT NULL,
  `usable_quantity` int(11) unsigned NOT NULL,
  `price_te` decimal(20,6) DEFAULT '0.000000',
  PRIMARY KEY (`id_stock`),
  KEY `id_warehouse` (`id_warehouse`),
  KEY `id_product` (`id_product`),
  KEY `id_product_attribute` (`id_product_attribute`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_stock_available`
--

CREATE TABLE IF NOT EXISTS `ps_stock_available` (
  `id_stock_available` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_product` int(11) unsigned NOT NULL,
  `id_product_attribute` int(11) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL,
  `id_shop_group` int(11) unsigned NOT NULL,
  `quantity` int(10) NOT NULL DEFAULT '0',
  `depends_on_stock` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `out_of_stock` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_stock_available`),
  UNIQUE KEY `product_sqlstock` (`id_product`,`id_product_attribute`,`id_shop`,`id_shop_group`),
  KEY `id_shop` (`id_shop`),
  KEY `id_shop_group` (`id_shop_group`),
  KEY `id_product` (`id_product`),
  KEY `id_product_attribute` (`id_product_attribute`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=53 ;

--
-- Volcado de datos para la tabla `ps_stock_available`
--

INSERT INTO `ps_stock_available` (`id_stock_available`, `id_product`, `id_product_attribute`, `id_shop`, `id_shop_group`, `quantity`, `depends_on_stock`, `out_of_stock`) VALUES
(1, 1, 0, 1, 0, 1799, 0, 2),
(2, 2, 0, 1, 0, 1799, 0, 2),
(3, 3, 0, 1, 0, 899, 0, 2),
(4, 4, 0, 1, 0, 900, 0, 2),
(5, 5, 0, 1, 0, 3600, 0, 2),
(6, 6, 0, 1, 0, 900, 0, 2),
(7, 7, 0, 1, 0, 1800, 0, 2),
(8, 1, 1, 1, 0, 299, 0, 2),
(9, 1, 2, 1, 0, 300, 0, 2),
(10, 1, 3, 1, 0, 300, 0, 2),
(11, 1, 4, 1, 0, 300, 0, 2),
(12, 1, 5, 1, 0, 300, 0, 2),
(13, 1, 6, 1, 0, 300, 0, 2),
(14, 2, 7, 1, 0, 299, 0, 2),
(15, 2, 8, 1, 0, 300, 0, 2),
(16, 2, 9, 1, 0, 300, 0, 2),
(17, 2, 10, 1, 0, 300, 0, 2),
(18, 2, 11, 1, 0, 300, 0, 2),
(19, 2, 12, 1, 0, 300, 0, 2),
(20, 3, 13, 1, 0, 299, 0, 2),
(21, 3, 14, 1, 0, 300, 0, 2),
(22, 3, 15, 1, 0, 300, 0, 2),
(23, 4, 16, 1, 0, 300, 0, 2),
(24, 4, 17, 1, 0, 300, 0, 2),
(25, 4, 18, 1, 0, 300, 0, 2),
(26, 5, 19, 1, 0, 300, 0, 2),
(27, 5, 20, 1, 0, 300, 0, 2),
(28, 5, 21, 1, 0, 300, 0, 2),
(29, 5, 22, 1, 0, 300, 0, 2),
(30, 5, 23, 1, 0, 300, 0, 2),
(31, 5, 24, 1, 0, 300, 0, 2),
(32, 5, 25, 1, 0, 300, 0, 2),
(33, 5, 26, 1, 0, 300, 0, 2),
(34, 5, 27, 1, 0, 300, 0, 2),
(35, 5, 28, 1, 0, 300, 0, 2),
(36, 5, 29, 1, 0, 300, 0, 2),
(37, 5, 30, 1, 0, 300, 0, 2),
(38, 6, 31, 1, 0, 300, 0, 2),
(39, 6, 32, 1, 0, 300, 0, 2),
(40, 6, 33, 1, 0, 300, 0, 2),
(41, 7, 34, 1, 0, 300, 0, 2),
(42, 7, 35, 1, 0, 300, 0, 2),
(43, 7, 36, 1, 0, 300, 0, 2),
(44, 7, 37, 1, 0, 300, 0, 2),
(45, 7, 38, 1, 0, 300, 0, 2),
(46, 7, 39, 1, 0, 300, 0, 2),
(47, 6, 40, 1, 0, 0, 0, 2),
(48, 6, 41, 1, 0, 0, 0, 2),
(49, 6, 42, 1, 0, 0, 0, 2),
(50, 4, 43, 1, 0, 0, 0, 2),
(51, 4, 44, 1, 0, 0, 0, 2),
(52, 4, 45, 1, 0, 0, 0, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_stock_mvt`
--

CREATE TABLE IF NOT EXISTS `ps_stock_mvt` (
  `id_stock_mvt` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_stock` int(11) unsigned NOT NULL,
  `id_order` int(11) unsigned DEFAULT NULL,
  `id_supply_order` int(11) unsigned DEFAULT NULL,
  `id_stock_mvt_reason` int(11) unsigned NOT NULL,
  `id_employee` int(11) unsigned NOT NULL,
  `employee_lastname` varchar(32) DEFAULT '',
  `employee_firstname` varchar(32) DEFAULT '',
  `physical_quantity` int(11) unsigned NOT NULL,
  `date_add` datetime NOT NULL,
  `sign` tinyint(1) NOT NULL DEFAULT '1',
  `price_te` decimal(20,6) DEFAULT '0.000000',
  `last_wa` decimal(20,6) DEFAULT '0.000000',
  `current_wa` decimal(20,6) DEFAULT '0.000000',
  `referer` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id_stock_mvt`),
  KEY `id_stock` (`id_stock`),
  KEY `id_stock_mvt_reason` (`id_stock_mvt_reason`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_stock_mvt_reason`
--

CREATE TABLE IF NOT EXISTS `ps_stock_mvt_reason` (
  `id_stock_mvt_reason` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sign` tinyint(1) NOT NULL DEFAULT '1',
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_stock_mvt_reason`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Volcado de datos para la tabla `ps_stock_mvt_reason`
--

INSERT INTO `ps_stock_mvt_reason` (`id_stock_mvt_reason`, `sign`, `date_add`, `date_upd`, `deleted`) VALUES
(1, 1, '2015-06-22 10:29:06', '2015-06-22 10:29:06', 0),
(2, -1, '2015-06-22 10:29:06', '2015-06-22 10:29:06', 0),
(3, -1, '2015-06-22 10:29:06', '2015-06-22 10:29:06', 0),
(4, -1, '2015-06-22 10:29:06', '2015-06-22 10:29:06', 0),
(5, 1, '2015-06-22 10:29:06', '2015-06-22 10:29:06', 0),
(6, -1, '2015-06-22 10:29:06', '2015-06-22 10:29:06', 0),
(7, 1, '2015-06-22 10:29:06', '2015-06-22 10:29:06', 0),
(8, 1, '2015-06-22 10:29:06', '2015-06-22 10:29:06', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_stock_mvt_reason_lang`
--

CREATE TABLE IF NOT EXISTS `ps_stock_mvt_reason_lang` (
  `id_stock_mvt_reason` int(11) unsigned NOT NULL,
  `id_lang` int(11) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id_stock_mvt_reason`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ps_stock_mvt_reason_lang`
--

INSERT INTO `ps_stock_mvt_reason_lang` (`id_stock_mvt_reason`, `id_lang`, `name`) VALUES
(1, 1, 'Aumentar'),
(2, 1, 'Disminuir'),
(3, 1, 'Pedido del cliente'),
(4, 1, 'Regulación tras inventario'),
(5, 1, 'Regulación tras inventario'),
(6, 1, 'Transferir a otro almacén'),
(7, 1, 'Transferir desde otro almacén'),
(8, 1, 'Pedido de suministros');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_store`
--

CREATE TABLE IF NOT EXISTS `ps_store` (
  `id_store` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_country` int(10) unsigned NOT NULL,
  `id_state` int(10) unsigned DEFAULT NULL,
  `name` varchar(128) NOT NULL,
  `address1` varchar(128) NOT NULL,
  `address2` varchar(128) DEFAULT NULL,
  `city` varchar(64) NOT NULL,
  `postcode` varchar(12) NOT NULL,
  `latitude` decimal(13,8) DEFAULT NULL,
  `longitude` decimal(13,8) DEFAULT NULL,
  `hours` varchar(254) DEFAULT NULL,
  `phone` varchar(16) DEFAULT NULL,
  `fax` varchar(16) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `note` text,
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_store`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `ps_store`
--

INSERT INTO `ps_store` (`id_store`, `id_country`, `id_state`, `name`, `address1`, `address2`, `city`, `postcode`, `latitude`, `longitude`, `hours`, `phone`, `fax`, `email`, `note`, `active`, `date_add`, `date_upd`) VALUES
(1, 21, 9, 'Dade County', '3030 SW 8th St Miami', '', 'Miami', ' 33135', 25.76500500, -80.24379700, 'a:7:{i:0;s:13:"09:00 - 19:00";i:1;s:13:"09:00 - 19:00";i:2;s:13:"09:00 - 19:00";i:3;s:13:"09:00 - 19:00";i:4;s:13:"09:00 - 19:00";i:5;s:13:"10:00 - 16:00";i:6;s:13:"10:00 - 16:00";}', '', '', '', '', 1, '2015-06-22 10:29:14', '2015-06-22 10:29:14'),
(2, 21, 9, 'E Fort Lauderdale', '1000 Northeast 4th Ave Fort Lauderdale', '', 'Miami', ' 33304', 26.13793600, -80.13943500, 'a:7:{i:0;s:13:"09:00 - 19:00";i:1;s:13:"09:00 - 19:00";i:2;s:13:"09:00 - 19:00";i:3;s:13:"09:00 - 19:00";i:4;s:13:"09:00 - 19:00";i:5;s:13:"10:00 - 16:00";i:6;s:13:"10:00 - 16:00";}', '', '', '', '', 1, '2015-06-22 10:29:14', '2015-06-22 10:29:14'),
(3, 21, 9, 'Pembroke Pines', '11001 Pines Blvd Pembroke Pines', '', 'Miami', '33026', 26.00998700, -80.29447200, 'a:7:{i:0;s:13:"09:00 - 19:00";i:1;s:13:"09:00 - 19:00";i:2;s:13:"09:00 - 19:00";i:3;s:13:"09:00 - 19:00";i:4;s:13:"09:00 - 19:00";i:5;s:13:"10:00 - 16:00";i:6;s:13:"10:00 - 16:00";}', '', '', '', '', 1, '2015-06-22 10:29:14', '2015-06-22 10:29:14'),
(4, 21, 9, 'Coconut Grove', '2999 SW 32nd Avenue', '', 'Miami', ' 33133', 25.73629600, -80.24479700, 'a:7:{i:0;s:13:"09:00 - 19:00";i:1;s:13:"09:00 - 19:00";i:2;s:13:"09:00 - 19:00";i:3;s:13:"09:00 - 19:00";i:4;s:13:"09:00 - 19:00";i:5;s:13:"10:00 - 16:00";i:6;s:13:"10:00 - 16:00";}', '', '', '', '', 1, '2015-06-22 10:29:14', '2015-06-22 10:29:14'),
(5, 21, 9, 'N Miami/Biscayne', '12055 Biscayne Blvd', '', 'Miami', '33181', 25.88674000, -80.16329200, 'a:7:{i:0;s:13:"09:00 - 19:00";i:1;s:13:"09:00 - 19:00";i:2;s:13:"09:00 - 19:00";i:3;s:13:"09:00 - 19:00";i:4;s:13:"09:00 - 19:00";i:5;s:13:"10:00 - 16:00";i:6;s:13:"10:00 - 16:00";}', '', '', '', '', 1, '2015-06-22 10:29:14', '2015-06-22 10:29:14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_store_shop`
--

CREATE TABLE IF NOT EXISTS `ps_store_shop` (
  `id_store` int(11) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_store`,`id_shop`),
  KEY `id_shop` (`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ps_store_shop`
--

INSERT INTO `ps_store_shop` (`id_store`, `id_shop`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_supplier`
--

CREATE TABLE IF NOT EXISTS `ps_supplier` (
  `id_supplier` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_supplier`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `ps_supplier`
--

INSERT INTO `ps_supplier` (`id_supplier`, `name`, `date_add`, `date_upd`, `active`) VALUES
(1, 'Fashion Supplier', '2015-06-22 10:29:13', '2015-06-22 10:29:13', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_supplier_lang`
--

CREATE TABLE IF NOT EXISTS `ps_supplier_lang` (
  `id_supplier` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `description` text,
  `meta_title` varchar(128) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_supplier`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ps_supplier_lang`
--

INSERT INTO `ps_supplier_lang` (`id_supplier`, `id_lang`, `description`, `meta_title`, `meta_keywords`, `meta_description`) VALUES
(1, 1, '', '', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_supplier_shop`
--

CREATE TABLE IF NOT EXISTS `ps_supplier_shop` (
  `id_supplier` int(11) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_supplier`,`id_shop`),
  KEY `id_shop` (`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ps_supplier_shop`
--

INSERT INTO `ps_supplier_shop` (`id_supplier`, `id_shop`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_supply_order`
--

CREATE TABLE IF NOT EXISTS `ps_supply_order` (
  `id_supply_order` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_supplier` int(11) unsigned NOT NULL,
  `supplier_name` varchar(64) NOT NULL,
  `id_lang` int(11) unsigned NOT NULL,
  `id_warehouse` int(11) unsigned NOT NULL,
  `id_supply_order_state` int(11) unsigned NOT NULL,
  `id_currency` int(11) unsigned NOT NULL,
  `id_ref_currency` int(11) unsigned NOT NULL,
  `reference` varchar(64) NOT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  `date_delivery_expected` datetime DEFAULT NULL,
  `total_te` decimal(20,6) DEFAULT '0.000000',
  `total_with_discount_te` decimal(20,6) DEFAULT '0.000000',
  `total_tax` decimal(20,6) DEFAULT '0.000000',
  `total_ti` decimal(20,6) DEFAULT '0.000000',
  `discount_rate` decimal(20,6) DEFAULT '0.000000',
  `discount_value_te` decimal(20,6) DEFAULT '0.000000',
  `is_template` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id_supply_order`),
  KEY `id_supplier` (`id_supplier`),
  KEY `id_warehouse` (`id_warehouse`),
  KEY `reference` (`reference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_supply_order_detail`
--

CREATE TABLE IF NOT EXISTS `ps_supply_order_detail` (
  `id_supply_order_detail` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_supply_order` int(11) unsigned NOT NULL,
  `id_currency` int(11) unsigned NOT NULL,
  `id_product` int(11) unsigned NOT NULL,
  `id_product_attribute` int(11) unsigned NOT NULL,
  `reference` varchar(32) NOT NULL,
  `supplier_reference` varchar(32) NOT NULL,
  `name` varchar(128) NOT NULL,
  `ean13` varchar(13) DEFAULT NULL,
  `upc` varchar(12) DEFAULT NULL,
  `exchange_rate` decimal(20,6) DEFAULT '0.000000',
  `unit_price_te` decimal(20,6) DEFAULT '0.000000',
  `quantity_expected` int(11) unsigned NOT NULL,
  `quantity_received` int(11) unsigned NOT NULL,
  `price_te` decimal(20,6) DEFAULT '0.000000',
  `discount_rate` decimal(20,6) DEFAULT '0.000000',
  `discount_value_te` decimal(20,6) DEFAULT '0.000000',
  `price_with_discount_te` decimal(20,6) DEFAULT '0.000000',
  `tax_rate` decimal(20,6) DEFAULT '0.000000',
  `tax_value` decimal(20,6) DEFAULT '0.000000',
  `price_ti` decimal(20,6) DEFAULT '0.000000',
  `tax_value_with_order_discount` decimal(20,6) DEFAULT '0.000000',
  `price_with_order_discount_te` decimal(20,6) DEFAULT '0.000000',
  PRIMARY KEY (`id_supply_order_detail`),
  KEY `id_supply_order` (`id_supply_order`),
  KEY `id_product` (`id_product`),
  KEY `id_product_attribute` (`id_product_attribute`),
  KEY `id_product_product_attribute` (`id_product`,`id_product_attribute`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_supply_order_history`
--

CREATE TABLE IF NOT EXISTS `ps_supply_order_history` (
  `id_supply_order_history` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_supply_order` int(11) unsigned NOT NULL,
  `id_employee` int(11) unsigned NOT NULL,
  `employee_lastname` varchar(32) DEFAULT '',
  `employee_firstname` varchar(32) DEFAULT '',
  `id_state` int(11) unsigned NOT NULL,
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_supply_order_history`),
  KEY `id_supply_order` (`id_supply_order`),
  KEY `id_employee` (`id_employee`),
  KEY `id_state` (`id_state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_supply_order_receipt_history`
--

CREATE TABLE IF NOT EXISTS `ps_supply_order_receipt_history` (
  `id_supply_order_receipt_history` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_supply_order_detail` int(11) unsigned NOT NULL,
  `id_employee` int(11) unsigned NOT NULL,
  `employee_lastname` varchar(32) DEFAULT '',
  `employee_firstname` varchar(32) DEFAULT '',
  `id_supply_order_state` int(11) unsigned NOT NULL,
  `quantity` int(11) unsigned NOT NULL,
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_supply_order_receipt_history`),
  KEY `id_supply_order_detail` (`id_supply_order_detail`),
  KEY `id_supply_order_state` (`id_supply_order_state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_supply_order_state`
--

CREATE TABLE IF NOT EXISTS `ps_supply_order_state` (
  `id_supply_order_state` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `delivery_note` tinyint(1) NOT NULL DEFAULT '0',
  `editable` tinyint(1) NOT NULL DEFAULT '0',
  `receipt_state` tinyint(1) NOT NULL DEFAULT '0',
  `pending_receipt` tinyint(1) NOT NULL DEFAULT '0',
  `enclosed` tinyint(1) NOT NULL DEFAULT '0',
  `color` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id_supply_order_state`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `ps_supply_order_state`
--

INSERT INTO `ps_supply_order_state` (`id_supply_order_state`, `delivery_note`, `editable`, `receipt_state`, `pending_receipt`, `enclosed`, `color`) VALUES
(1, 0, 1, 0, 0, 0, '#faab00'),
(2, 1, 0, 0, 0, 0, '#273cff'),
(3, 0, 0, 0, 1, 0, '#ff37f5'),
(4, 0, 0, 1, 1, 0, '#ff3e33'),
(5, 0, 0, 1, 0, 1, '#00d60c'),
(6, 0, 0, 0, 0, 1, '#666666');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_supply_order_state_lang`
--

CREATE TABLE IF NOT EXISTS `ps_supply_order_state_lang` (
  `id_supply_order_state` int(11) unsigned NOT NULL,
  `id_lang` int(11) unsigned NOT NULL,
  `name` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id_supply_order_state`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ps_supply_order_state_lang`
--

INSERT INTO `ps_supply_order_state_lang` (`id_supply_order_state`, `id_lang`, `name`) VALUES
(1, 1, '1 - Creación en curso'),
(2, 1, '2 - Pedido validado'),
(3, 1, '3 - Pendiente de recepción'),
(4, 1, '4 - Pedido recibido parcialmente'),
(5, 1, '5 - Pedido recibido completamente'),
(6, 1, '6 - Pedido cancelado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_tab`
--

CREATE TABLE IF NOT EXISTS `ps_tab` (
  `id_tab` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_parent` int(11) NOT NULL,
  `class_name` varchar(64) NOT NULL,
  `module` varchar(64) DEFAULT NULL,
  `position` int(10) unsigned NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `hide_host_mode` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_tab`),
  KEY `class_name` (`class_name`),
  KEY `id_parent` (`id_parent`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=107 ;

--
-- Volcado de datos para la tabla `ps_tab`
--

INSERT INTO `ps_tab` (`id_tab`, `id_parent`, `class_name`, `module`, `position`, `active`, `hide_host_mode`) VALUES
(1, 0, 'AdminDashboard', '', 0, 1, 0),
(2, -1, 'AdminCms', '', 0, 1, 0),
(3, -1, 'AdminCmsCategories', '', 1, 1, 0),
(4, -1, 'AdminAttributeGenerator', '', 2, 1, 0),
(5, -1, 'AdminSearch', '', 3, 1, 0),
(6, -1, 'AdminLogin', '', 4, 1, 0),
(7, -1, 'AdminShop', '', 5, 1, 0),
(8, -1, 'AdminShopUrl', '', 6, 1, 0),
(9, 0, 'AdminCatalog', '', 1, 1, 0),
(10, 0, 'AdminParentOrders', '', 2, 1, 0),
(11, 0, 'AdminParentCustomer', '', 3, 1, 0),
(12, 0, 'AdminPriceRule', '', 4, 1, 0),
(13, 0, 'AdminParentModules', '', 5, 1, 0),
(14, 0, 'AdminParentShipping', '', 6, 1, 0),
(15, 0, 'AdminParentLocalization', '', 7, 1, 0),
(16, 0, 'AdminParentPreferences', '', 8, 1, 0),
(17, 0, 'AdminTools', '', 9, 1, 0),
(18, 0, 'AdminAdmin', '', 10, 1, 0),
(19, 0, 'AdminParentStats', '', 11, 1, 0),
(20, 0, 'AdminStock', '', 12, 1, 0),
(21, 9, 'AdminProducts', '', 0, 1, 0),
(22, 9, 'AdminCategories', '', 1, 1, 0),
(23, 9, 'AdminTracking', '', 2, 1, 0),
(24, 9, 'AdminAttributesGroups', '', 3, 1, 0),
(25, 9, 'AdminFeatures', '', 4, 1, 0),
(26, 9, 'AdminManufacturers', '', 5, 1, 0),
(27, 9, 'AdminSuppliers', '', 6, 1, 0),
(28, 9, 'AdminTags', '', 7, 1, 0),
(29, 9, 'AdminAttachments', '', 8, 1, 0),
(30, 10, 'AdminOrders', '', 0, 1, 0),
(31, 10, 'AdminInvoices', '', 1, 1, 0),
(32, 10, 'AdminReturn', '', 2, 1, 0),
(33, 10, 'AdminDeliverySlip', '', 3, 1, 0),
(34, 10, 'AdminSlip', '', 4, 1, 0),
(35, 10, 'AdminStatuses', '', 5, 1, 0),
(36, 10, 'AdminOrderMessage', '', 6, 1, 0),
(37, 11, 'AdminCustomers', '', 0, 1, 0),
(38, 11, 'AdminAddresses', '', 1, 1, 0),
(39, 11, 'AdminGroups', '', 2, 1, 0),
(40, 11, 'AdminCarts', '', 3, 1, 0),
(41, 11, 'AdminCustomerThreads', '', 4, 1, 0),
(42, 11, 'AdminContacts', '', 5, 1, 0),
(43, 11, 'AdminGenders', '', 6, 1, 0),
(44, 11, 'AdminOutstanding', '', 7, 0, 0),
(45, 12, 'AdminCartRules', '', 0, 1, 0),
(46, 12, 'AdminSpecificPriceRule', '', 1, 1, 0),
(47, 12, 'AdminMarketing', '', 2, 1, 0),
(48, 14, 'AdminCarriers', '', 0, 1, 0),
(49, 14, 'AdminShipping', '', 1, 1, 0),
(50, 14, 'AdminCarrierWizard', '', 2, 1, 0),
(51, 15, 'AdminLocalization', '', 0, 1, 0),
(52, 15, 'AdminLanguages', '', 1, 1, 0),
(53, 15, 'AdminZones', '', 2, 1, 0),
(54, 15, 'AdminCountries', '', 3, 1, 0),
(55, 15, 'AdminStates', '', 4, 1, 0),
(56, 15, 'AdminCurrencies', '', 5, 1, 0),
(57, 15, 'AdminTaxes', '', 6, 1, 0),
(58, 15, 'AdminTaxRulesGroup', '', 7, 1, 0),
(59, 15, 'AdminTranslations', '', 8, 1, 0),
(60, 13, 'AdminModules', '', 0, 1, 0),
(61, 13, 'AdminAddonsCatalog', '', 1, 1, 0),
(62, 13, 'AdminModulesPositions', '', 2, 1, 0),
(63, 13, 'AdminPayment', '', 3, 1, 0),
(64, 16, 'AdminPreferences', '', 0, 1, 0),
(65, 16, 'AdminOrderPreferences', '', 1, 1, 0),
(66, 16, 'AdminPPreferences', '', 2, 1, 0),
(67, 16, 'AdminCustomerPreferences', '', 3, 1, 0),
(68, 16, 'AdminThemes', '', 4, 1, 0),
(69, 16, 'AdminMeta', '', 5, 1, 0),
(70, 16, 'AdminCmsContent', '', 6, 1, 0),
(71, 16, 'AdminImages', '', 7, 1, 0),
(72, 16, 'AdminStores', '', 8, 1, 0),
(73, 16, 'AdminSearchConf', '', 9, 1, 0),
(74, 16, 'AdminMaintenance', '', 10, 1, 0),
(75, 16, 'AdminGeolocation', '', 11, 1, 0),
(76, 17, 'AdminInformation', '', 0, 1, 0),
(77, 17, 'AdminPerformance', '', 1, 1, 0),
(78, 17, 'AdminEmails', '', 2, 1, 0),
(79, 17, 'AdminShopGroup', '', 3, 0, 0),
(80, 17, 'AdminImport', '', 4, 1, 0),
(81, 17, 'AdminBackup', '', 5, 1, 0),
(82, 17, 'AdminRequestSql', '', 6, 1, 0),
(83, 17, 'AdminLogs', '', 7, 1, 0),
(84, 17, 'AdminWebservice', '', 8, 1, 0),
(85, 18, 'AdminAdminPreferences', '', 0, 1, 0),
(86, 18, 'AdminQuickAccesses', '', 1, 1, 0),
(87, 18, 'AdminEmployees', '', 2, 1, 0),
(88, 18, 'AdminProfiles', '', 3, 1, 0),
(89, 18, 'AdminAccess', '', 4, 1, 0),
(90, 18, 'AdminTabs', '', 5, 1, 0),
(91, 19, 'AdminStats', '', 0, 1, 0),
(92, 19, 'AdminSearchEngines', '', 1, 1, 0),
(93, 19, 'AdminReferrers', '', 2, 1, 0),
(94, 20, 'AdminWarehouses', '', 0, 1, 0),
(95, 20, 'AdminStockManagement', '', 1, 1, 0),
(96, 20, 'AdminStockMvt', '', 2, 1, 0),
(97, 20, 'AdminStockInstantState', '', 3, 1, 0),
(98, 20, 'AdminStockCover', '', 4, 1, 0),
(99, 20, 'AdminSupplyOrders', '', 5, 1, 0),
(100, 20, 'AdminStockConfiguration', '', 6, 1, 0),
(101, -1, 'AdminBlockCategories', 'blockcategories', 7, 1, 0),
(102, -1, 'AdminDashgoals', 'dashgoals', 8, 1, 0),
(103, -1, 'AdminThemeConfigurator', 'themeconfigurator', 9, 1, 0),
(104, 18, 'AdminGamification', 'gamification', 6, 1, 0),
(105, -1, 'AdminCronJobs', 'cronjobs', 10, 1, 0),
(106, 99999, 'AdminOnboarding', 'onboarding', 1, 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_tab_advice`
--

CREATE TABLE IF NOT EXISTS `ps_tab_advice` (
  `id_tab` int(11) NOT NULL,
  `id_advice` int(11) NOT NULL,
  PRIMARY KEY (`id_tab`,`id_advice`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ps_tab_advice`
--

INSERT INTO `ps_tab_advice` (`id_tab`, `id_advice`) VALUES
(0, 4),
(0, 24),
(0, 44),
(0, 64),
(0, 84),
(0, 104),
(0, 124),
(1, 3),
(1, 6),
(1, 7),
(1, 11),
(1, 12),
(1, 13),
(1, 17),
(1, 18),
(1, 19),
(1, 20),
(1, 23),
(1, 26),
(1, 27),
(1, 31),
(1, 32),
(1, 33),
(1, 37),
(1, 38),
(1, 39),
(1, 40),
(1, 43),
(1, 46),
(1, 47),
(1, 51),
(1, 52),
(1, 53),
(1, 57),
(1, 58),
(1, 59),
(1, 60),
(1, 63),
(1, 66),
(1, 67),
(1, 71),
(1, 72),
(1, 73),
(1, 77),
(1, 78),
(1, 79),
(1, 80),
(1, 83),
(1, 86),
(1, 87),
(1, 91),
(1, 92),
(1, 93),
(1, 97),
(1, 98),
(1, 99),
(1, 100),
(1, 103),
(1, 106),
(1, 107),
(1, 111),
(1, 112),
(1, 113),
(1, 117),
(1, 118),
(1, 119),
(1, 120),
(1, 123),
(1, 126),
(1, 127),
(1, 131),
(1, 132),
(1, 133),
(1, 137),
(1, 138),
(1, 139),
(1, 140),
(9, 14),
(9, 34),
(9, 54),
(9, 74),
(9, 94),
(9, 114),
(9, 134),
(21, 1),
(21, 5),
(21, 9),
(21, 10),
(21, 21),
(21, 25),
(21, 29),
(21, 30),
(21, 41),
(21, 45),
(21, 49),
(21, 50),
(21, 61),
(21, 65),
(21, 69),
(21, 70),
(21, 81),
(21, 85),
(21, 89),
(21, 90),
(21, 101),
(21, 105),
(21, 109),
(21, 110),
(21, 121),
(21, 125),
(21, 129),
(21, 130),
(22, 1),
(22, 21),
(22, 41),
(22, 61),
(22, 81),
(22, 101),
(22, 121),
(30, 9),
(30, 29),
(30, 49),
(30, 69),
(30, 89),
(30, 109),
(30, 129),
(31, 1),
(31, 21),
(31, 41),
(31, 61),
(31, 81),
(31, 101),
(31, 121),
(37, 8),
(37, 14),
(37, 28),
(37, 34),
(37, 48),
(37, 54),
(37, 68),
(37, 74),
(37, 88),
(37, 94),
(37, 108),
(37, 114),
(37, 128),
(37, 134),
(38, 15),
(38, 16),
(38, 35),
(38, 36),
(38, 55),
(38, 56),
(38, 75),
(38, 76),
(38, 95),
(38, 96),
(38, 115),
(38, 116),
(38, 135),
(38, 136),
(39, 14),
(39, 34),
(39, 54),
(39, 74),
(39, 94),
(39, 114),
(39, 134),
(41, 8),
(41, 15),
(41, 16),
(41, 28),
(41, 35),
(41, 36),
(41, 48),
(41, 55),
(41, 56),
(41, 68),
(41, 75),
(41, 76),
(41, 88),
(41, 95),
(41, 96),
(41, 108),
(41, 115),
(41, 116),
(41, 128),
(41, 135),
(41, 136),
(59, 2),
(59, 22),
(59, 42),
(59, 62),
(59, 82),
(59, 102),
(59, 122),
(72, 1),
(72, 21),
(72, 41),
(72, 61),
(72, 81),
(72, 101),
(72, 121);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_tab_lang`
--

CREATE TABLE IF NOT EXISTS `ps_tab_lang` (
  `id_tab` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id_tab`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ps_tab_lang`
--

INSERT INTO `ps_tab_lang` (`id_tab`, `id_lang`, `name`) VALUES
(1, 1, 'Inicio'),
(2, 1, 'Páginas estáticas/CMS'),
(3, 1, 'Categorías CMS'),
(4, 1, 'Generador de Combinaciones'),
(5, 1, 'Buscar'),
(6, 1, 'Identifíquese'),
(7, 1, 'Tiendas'),
(8, 1, 'URLs/Direcciones de la tienda'),
(9, 1, 'Catálogo'),
(10, 1, 'Pedidos'),
(11, 1, 'Clientes'),
(12, 1, 'Reglas de Descuentos'),
(13, 1, 'Módulos'),
(14, 1, 'Transporte'),
(15, 1, 'Localización'),
(16, 1, 'Preferencias'),
(17, 1, 'Parámetros Avanzados'),
(18, 1, 'Administración'),
(19, 1, 'Estadísticas'),
(20, 1, 'Existencias'),
(21, 1, 'Productos'),
(22, 1, 'Categorías'),
(23, 1, 'Monitoreo'),
(24, 1, 'Atributos de productos'),
(25, 1, 'Características de productos'),
(26, 1, 'Fabricantes'),
(27, 1, 'Proveedores'),
(28, 1, 'Etiquetas'),
(29, 1, 'Adjuntos'),
(30, 1, 'Pedidos'),
(31, 1, 'Facturas'),
(32, 1, 'Devoluciones de mercancía'),
(33, 1, 'Albaranes de entrega'),
(34, 1, 'Notas de Crédito'),
(35, 1, 'Estados'),
(36, 1, 'Mensajes de Pedidos'),
(37, 1, 'Clientes'),
(38, 1, 'Direcciones'),
(39, 1, 'Grupos'),
(40, 1, 'Carros de compra'),
(41, 1, 'Servicio al cliente'),
(42, 1, 'Contacto'),
(43, 1, 'Tratamientos'),
(44, 1, 'Sorprendente'),
(45, 1, 'Vales descuento'),
(46, 1, 'Reglas del catálogo'),
(47, 1, 'Márketing'),
(48, 1, 'Transportistas'),
(49, 1, 'Preferencias'),
(50, 1, 'Transportista'),
(51, 1, 'Localización'),
(52, 1, 'Idiomas'),
(53, 1, 'Zona'),
(54, 1, 'Países'),
(55, 1, 'Provincias'),
(56, 1, 'Monedas'),
(57, 1, 'Impuestos'),
(58, 1, 'Reglas de impuestos'),
(59, 1, 'Traducciones'),
(60, 1, 'Módulos'),
(61, 1, 'Catálogo de Módulos y Temas'),
(62, 1, 'Posiciones de los módulos'),
(63, 1, 'Pago'),
(64, 1, 'Configuración'),
(65, 1, 'Pedidos'),
(66, 1, 'Productos'),
(67, 1, 'Clientes'),
(68, 1, 'Temas'),
(69, 1, 'SEO + URLs'),
(70, 1, 'CMS'),
(71, 1, 'Imágenes'),
(72, 1, 'Contactos de la tienda'),
(73, 1, 'Buscar'),
(74, 1, 'Mantenimiento'),
(75, 1, 'Geolocalización'),
(76, 1, 'Información'),
(77, 1, 'Rendimiento'),
(78, 1, 'Correo Electrónico'),
(79, 1, 'Multitienda'),
(80, 1, 'Importar CSV'),
(81, 1, 'Respaldar BD'),
(82, 1, 'Gestor SQL'),
(83, 1, 'Registros/Logs'),
(84, 1, 'Webservice'),
(85, 1, 'Preferencias'),
(86, 1, 'Acceso rápido'),
(87, 1, 'Empleados'),
(88, 1, 'Perfiles'),
(89, 1, 'Permisos'),
(90, 1, 'Menús'),
(91, 1, 'Estadísticas'),
(92, 1, 'Motores de búsqueda'),
(93, 1, 'Afiliados'),
(94, 1, 'Almacenes'),
(95, 1, 'Gestión de existencias'),
(96, 1, 'Movimiento de Stock'),
(97, 1, 'Estado inmediato de existencias'),
(98, 1, 'Cobertura de stock'),
(99, 1, 'Pedidos de materiales'),
(100, 1, 'Configuración'),
(101, 1, 'BlockCategories'),
(102, 1, 'Dashgoals'),
(103, 1, 'themeconfigurator'),
(104, 1, 'Merchant Expertise'),
(105, 1, 'Cron Jobs'),
(106, 1, 'Onboarding');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_tab_module_preference`
--

CREATE TABLE IF NOT EXISTS `ps_tab_module_preference` (
  `id_tab_module_preference` int(11) NOT NULL AUTO_INCREMENT,
  `id_employee` int(11) NOT NULL,
  `id_tab` int(11) NOT NULL,
  `module` varchar(255) NOT NULL,
  PRIMARY KEY (`id_tab_module_preference`),
  UNIQUE KEY `employee_module` (`id_employee`,`id_tab`,`module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_tag`
--

CREATE TABLE IF NOT EXISTS `ps_tag` (
  `id_tag` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id_tag`),
  KEY `tag_name` (`name`),
  KEY `id_lang` (`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_tax`
--

CREATE TABLE IF NOT EXISTS `ps_tax` (
  `id_tax` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rate` decimal(10,3) NOT NULL,
  `active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_tax`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `ps_tax`
--

INSERT INTO `ps_tax` (`id_tax`, `rate`, `active`, `deleted`) VALUES
(1, 16.000, 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_tax_lang`
--

CREATE TABLE IF NOT EXISTS `ps_tax_lang` (
  `id_tax` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id_tax`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ps_tax_lang`
--

INSERT INTO `ps_tax_lang` (`id_tax`, `id_lang`, `name`) VALUES
(1, 1, 'IVA CO 16%');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_tax_rule`
--

CREATE TABLE IF NOT EXISTS `ps_tax_rule` (
  `id_tax_rule` int(11) NOT NULL AUTO_INCREMENT,
  `id_tax_rules_group` int(11) NOT NULL,
  `id_country` int(11) NOT NULL,
  `id_state` int(11) NOT NULL,
  `zipcode_from` varchar(12) NOT NULL,
  `zipcode_to` varchar(12) NOT NULL,
  `id_tax` int(11) NOT NULL,
  `behavior` int(11) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id_tax_rule`),
  KEY `id_tax_rules_group` (`id_tax_rules_group`),
  KEY `id_tax` (`id_tax`),
  KEY `category_getproducts` (`id_tax_rules_group`,`id_country`,`id_state`,`zipcode_from`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `ps_tax_rule`
--

INSERT INTO `ps_tax_rule` (`id_tax_rule`, `id_tax_rules_group`, `id_country`, `id_state`, `zipcode_from`, `zipcode_to`, `id_tax`, `behavior`, `description`) VALUES
(1, 1, 69, 0, '0', '0', 1, 0, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_tax_rules_group`
--

CREATE TABLE IF NOT EXISTS `ps_tax_rules_group` (
  `id_tax_rules_group` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `active` int(11) NOT NULL,
  `deleted` tinyint(1) unsigned NOT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_tax_rules_group`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `ps_tax_rules_group`
--

INSERT INTO `ps_tax_rules_group` (`id_tax_rules_group`, `name`, `active`, `deleted`, `date_add`, `date_upd`) VALUES
(1, 'CO Standard Rate (16%)', 1, 0, '2015-06-22 10:29:08', '2015-06-22 10:29:08');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_tax_rules_group_shop`
--

CREATE TABLE IF NOT EXISTS `ps_tax_rules_group_shop` (
  `id_tax_rules_group` int(11) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_tax_rules_group`,`id_shop`),
  KEY `id_shop` (`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ps_tax_rules_group_shop`
--

INSERT INTO `ps_tax_rules_group_shop` (`id_tax_rules_group`, `id_shop`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_testimonialswithavatars`
--

CREATE TABLE IF NOT EXISTS `ps_testimonialswithavatars` (
  `id_post` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_shop` int(10) NOT NULL,
  `position` int(10) NOT NULL,
  `avatar` varchar(128) DEFAULT '0',
  `customer_name` varchar(128) DEFAULT NULL,
  `subject` varchar(128) DEFAULT NULL,
  `rating` int(2) DEFAULT '5',
  `content` text,
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `visitor_ip` varchar(128) NOT NULL,
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_post`),
  KEY `visitor_ip` (`visitor_ip`),
  KEY `avatar` (`avatar`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `ps_testimonialswithavatars`
--

INSERT INTO `ps_testimonialswithavatars` (`id_post`, `id_shop`, `position`, `avatar`, `customer_name`, `subject`, `rating`, `content`, `active`, `visitor_ip`, `date_add`) VALUES
(1, 1, 1, 'a2', 'Pat Libertson', 'Simply Amazing', 5, 'With desktop dolor repellendus.\n			Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae', 1, '11.11.111.111', '2015-09-21 00:03:46'),
(2, 1, 2, 'a5', 'Star Parov', 'So fantastic', 5, 'Tell them who voluptatem sequi nesciunt.\n			Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius', 1, '11.11.111.111', '2015-09-23 22:24:26'),
(3, 1, 3, 'a4', 'Pretty lady', 'Remainally unchanged', 5, 'It wantly Leatrre includus sum sages,\n			and more recently with desktop publre inclu ding Aldus sum passages, and more recently [u]with desktop puet[/u]', 1, '11.11.111.111', '2015-09-29 09:04:26'),
(4, 1, 4, 'a1', 'Smith Vazovsky', 'High for this', 5, 'Typesetting, remainally unchanged.\n			It wantly elease of Letraset sheets containing Lorem IpsuIpsum passages hing typeare incl', 1, '11.11.111.111', '2015-10-01 11:41:11'),
(5, 1, 5, 'a3', 'John Till', 'Like it very much!', 5, 'ofessen tiadus sum, ally ucnd recently dktop publishtting, remainingdus\n			Pntly with des[img]http://tinymce.cachefly.net/4/plugins/emoticons/img/smiley-cool.gif[/img]', 1, '11.11.111.111', '2015-10-16 12:24:29'),
(6, 1, 6, 'a6', 'Feri Vergi', 'What is see is what you get', 5, 'ves or pursues or desires to obtain pain of itself\n			but because occasionally circumstances occur in which toil and pain can procure him some great pleasure', 1, '11.11.111.111', '2015-10-16 16:42:12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_theme`
--

CREATE TABLE IF NOT EXISTS `ps_theme` (
  `id_theme` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `directory` varchar(64) NOT NULL,
  `responsive` tinyint(1) NOT NULL DEFAULT '0',
  `default_left_column` tinyint(1) NOT NULL DEFAULT '0',
  `default_right_column` tinyint(1) NOT NULL DEFAULT '0',
  `product_per_page` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_theme`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `ps_theme`
--

INSERT INTO `ps_theme` (`id_theme`, `name`, `directory`, `responsive`, `default_left_column`, `default_right_column`, `product_per_page`) VALUES
(1, 'default-bootstrap', 'default-bootstrap', 1, 1, 0, 12),
(2, 'Matisses', 'matisses', 0, 1, 0, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_themeconfigurator`
--

CREATE TABLE IF NOT EXISTS `ps_themeconfigurator` (
  `id_item` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_shop` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `item_order` int(10) unsigned NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `title_use` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `hook` varchar(100) DEFAULT NULL,
  `url` text,
  `target` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `image` varchar(100) DEFAULT NULL,
  `image_w` varchar(10) DEFAULT NULL,
  `image_h` varchar(10) DEFAULT NULL,
  `html` text,
  `active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_item`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `ps_themeconfigurator`
--

INSERT INTO `ps_themeconfigurator` (`id_item`, `id_shop`, `id_lang`, `item_order`, `title`, `title_use`, `hook`, `url`, `target`, `image`, `image_w`, `image_h`, `html`, `active`) VALUES
(1, 1, 1, 1, '', 0, 'home', 'http://www.prestashop.com/', 0, 'banner-img1.jpg', '383', '267', '', 1),
(2, 1, 1, 2, '', 0, 'home', 'http://www.prestashop.com/', 0, 'banner-img2.jpg', '383', '267', '', 1),
(3, 1, 1, 3, '', 0, 'home', 'http://www.prestashop.com/', 0, 'banner-img3.jpg', '383', '267', '', 1),
(4, 1, 1, 4, '', 0, 'home', 'http://www.prestashop.com/', 0, 'banner-img4.jpg', '383', '142', '', 1),
(5, 1, 1, 5, '', 0, 'home', 'http://www.prestashop.com/', 0, 'banner-img5.jpg', '777', '142', '', 1),
(6, 1, 1, 6, '', 0, 'top', 'http://www.prestashop.com/', 0, 'banner-img6.jpg', '381', '219', '', 1),
(7, 1, 1, 7, '', 0, 'top', 'http://www.prestashop.com/', 0, 'banner-img7.jpg', '381', '219', '', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_theme_meta`
--

CREATE TABLE IF NOT EXISTS `ps_theme_meta` (
  `id_theme_meta` int(11) NOT NULL AUTO_INCREMENT,
  `id_theme` int(11) NOT NULL,
  `id_meta` int(10) unsigned NOT NULL,
  `left_column` tinyint(1) NOT NULL DEFAULT '1',
  `right_column` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_theme_meta`),
  UNIQUE KEY `id_theme_2` (`id_theme`,`id_meta`),
  KEY `id_theme` (`id_theme`),
  KEY `id_meta` (`id_meta`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=89 ;

--
-- Volcado de datos para la tabla `ps_theme_meta`
--

INSERT INTO `ps_theme_meta` (`id_theme_meta`, `id_theme`, `id_meta`, `left_column`, `right_column`) VALUES
(1, 1, 1, 0, 0),
(2, 1, 2, 1, 0),
(3, 1, 3, 0, 0),
(4, 1, 4, 0, 0),
(5, 1, 5, 1, 0),
(6, 1, 6, 1, 0),
(7, 1, 7, 0, 0),
(8, 1, 8, 1, 0),
(9, 1, 9, 1, 0),
(10, 1, 10, 0, 0),
(11, 1, 11, 0, 0),
(12, 1, 12, 0, 0),
(13, 1, 13, 0, 0),
(14, 1, 14, 0, 0),
(15, 1, 15, 0, 0),
(16, 1, 16, 0, 0),
(17, 1, 17, 0, 0),
(18, 1, 18, 0, 0),
(19, 1, 19, 0, 0),
(20, 1, 20, 0, 0),
(21, 1, 21, 0, 0),
(22, 1, 22, 1, 0),
(23, 1, 23, 0, 0),
(24, 1, 24, 0, 0),
(25, 1, 25, 0, 0),
(26, 1, 26, 0, 0),
(27, 1, 28, 1, 0),
(28, 1, 29, 0, 0),
(29, 1, 27, 0, 0),
(30, 1, 30, 0, 0),
(31, 1, 31, 0, 0),
(32, 1, 32, 0, 0),
(33, 1, 33, 0, 0),
(34, 1, 34, 0, 0),
(38, 1, 38, 1, 0),
(39, 2, 1, 0, 0),
(40, 2, 11, 0, 0),
(41, 2, 12, 0, 0),
(42, 2, 13, 0, 0),
(43, 2, 2, 1, 0),
(44, 2, 14, 0, 0),
(45, 2, 28, 1, 0),
(46, 2, 29, 1, 0),
(47, 2, 3, 0, 0),
(48, 2, 15, 1, 0),
(49, 2, 25, 0, 0),
(50, 2, 16, 0, 0),
(51, 2, 17, 0, 0),
(52, 2, 4, 0, 0),
(53, 2, 5, 1, 0),
(54, 2, 18, 0, 0),
(55, 2, 6, 1, 0),
(56, 2, 21, 0, 0),
(57, 2, 26, 0, 0),
(58, 2, 19, 0, 0),
(59, 2, 24, 0, 0),
(60, 2, 20, 0, 0),
(61, 2, 7, 0, 0),
(62, 2, 8, 1, 0),
(63, 2, 27, 0, 0),
(64, 2, 34, 0, 0),
(65, 2, 22, 0, 0),
(66, 2, 9, 1, 0),
(67, 2, 23, 1, 0),
(68, 2, 10, 1, 0),
(69, 2, 33, 0, 0),
(70, 2, 32, 0, 0),
(71, 2, 30, 0, 0),
(72, 2, 31, 0, 0),
(76, 2, 38, 1, 0),
(77, 1, 39, 1, 0),
(78, 2, 39, 1, 0),
(79, 1, 40, 1, 0),
(80, 2, 40, 1, 0),
(81, 1, 41, 1, 0),
(82, 2, 41, 1, 0),
(87, 1, 42, 1, 0),
(88, 2, 42, 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_theme_specific`
--

CREATE TABLE IF NOT EXISTS `ps_theme_specific` (
  `id_theme` int(11) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL,
  `entity` int(11) unsigned NOT NULL,
  `id_object` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_theme`,`id_shop`,`entity`,`id_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_timezone`
--

CREATE TABLE IF NOT EXISTS `ps_timezone` (
  `id_timezone` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id_timezone`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=561 ;

--
-- Volcado de datos para la tabla `ps_timezone`
--

INSERT INTO `ps_timezone` (`id_timezone`, `name`) VALUES
(1, 'Africa/Abidjan'),
(2, 'Africa/Accra'),
(3, 'Africa/Addis_Ababa'),
(4, 'Africa/Algiers'),
(5, 'Africa/Asmara'),
(6, 'Africa/Asmera'),
(7, 'Africa/Bamako'),
(8, 'Africa/Bangui'),
(9, 'Africa/Banjul'),
(10, 'Africa/Bissau'),
(11, 'Africa/Blantyre'),
(12, 'Africa/Brazzaville'),
(13, 'Africa/Bujumbura'),
(14, 'Africa/Cairo'),
(15, 'Africa/Casablanca'),
(16, 'Africa/Ceuta'),
(17, 'Africa/Conakry'),
(18, 'Africa/Dakar'),
(19, 'Africa/Dar_es_Salaam'),
(20, 'Africa/Djibouti'),
(21, 'Africa/Douala'),
(22, 'Africa/El_Aaiun'),
(23, 'Africa/Freetown'),
(24, 'Africa/Gaborone'),
(25, 'Africa/Harare'),
(26, 'Africa/Johannesburg'),
(27, 'Africa/Kampala'),
(28, 'Africa/Khartoum'),
(29, 'Africa/Kigali'),
(30, 'Africa/Kinshasa'),
(31, 'Africa/Lagos'),
(32, 'Africa/Libreville'),
(33, 'Africa/Lome'),
(34, 'Africa/Luanda'),
(35, 'Africa/Lubumbashi'),
(36, 'Africa/Lusaka'),
(37, 'Africa/Malabo'),
(38, 'Africa/Maputo'),
(39, 'Africa/Maseru'),
(40, 'Africa/Mbabane'),
(41, 'Africa/Mogadishu'),
(42, 'Africa/Monrovia'),
(43, 'Africa/Nairobi'),
(44, 'Africa/Ndjamena'),
(45, 'Africa/Niamey'),
(46, 'Africa/Nouakchott'),
(47, 'Africa/Ouagadougou'),
(48, 'Africa/Porto-Novo'),
(49, 'Africa/Sao_Tome'),
(50, 'Africa/Timbuktu'),
(51, 'Africa/Tripoli'),
(52, 'Africa/Tunis'),
(53, 'Africa/Windhoek'),
(54, 'America/Adak'),
(55, 'America/Anchorage '),
(56, 'America/Anguilla'),
(57, 'America/Antigua'),
(58, 'America/Araguaina'),
(59, 'America/Argentina/Buenos_Aires'),
(60, 'America/Argentina/Catamarca'),
(61, 'America/Argentina/ComodRivadavia'),
(62, 'America/Argentina/Cordoba'),
(63, 'America/Argentina/Jujuy'),
(64, 'America/Argentina/La_Rioja'),
(65, 'America/Argentina/Mendoza'),
(66, 'America/Argentina/Rio_Gallegos'),
(67, 'America/Argentina/Salta'),
(68, 'America/Argentina/San_Juan'),
(69, 'America/Argentina/San_Luis'),
(70, 'America/Argentina/Tucuman'),
(71, 'America/Argentina/Ushuaia'),
(72, 'America/Aruba'),
(73, 'America/Asuncion'),
(74, 'America/Atikokan'),
(75, 'America/Atka'),
(76, 'America/Bahia'),
(77, 'America/Barbados'),
(78, 'America/Belem'),
(79, 'America/Belize'),
(80, 'America/Blanc-Sablon'),
(81, 'America/Boa_Vista'),
(82, 'America/Bogota'),
(83, 'America/Boise'),
(84, 'America/Buenos_Aires'),
(85, 'America/Cambridge_Bay'),
(86, 'America/Campo_Grande'),
(87, 'America/Cancun'),
(88, 'America/Caracas'),
(89, 'America/Catamarca'),
(90, 'America/Cayenne'),
(91, 'America/Cayman'),
(92, 'America/Chicago'),
(93, 'America/Chihuahua'),
(94, 'America/Coral_Harbour'),
(95, 'America/Cordoba'),
(96, 'America/Costa_Rica'),
(97, 'America/Cuiaba'),
(98, 'America/Curacao'),
(99, 'America/Danmarkshavn'),
(100, 'America/Dawson'),
(101, 'America/Dawson_Creek'),
(102, 'America/Denver'),
(103, 'America/Detroit'),
(104, 'America/Dominica'),
(105, 'America/Edmonton'),
(106, 'America/Eirunepe'),
(107, 'America/El_Salvador'),
(108, 'America/Ensenada'),
(109, 'America/Fort_Wayne'),
(110, 'America/Fortaleza'),
(111, 'America/Glace_Bay'),
(112, 'America/Godthab'),
(113, 'America/Goose_Bay'),
(114, 'America/Grand_Turk'),
(115, 'America/Grenada'),
(116, 'America/Guadeloupe'),
(117, 'America/Guatemala'),
(118, 'America/Guayaquil'),
(119, 'America/Guyana'),
(120, 'America/Halifax'),
(121, 'America/Havana'),
(122, 'America/Hermosillo'),
(123, 'America/Indiana/Indianapolis'),
(124, 'America/Indiana/Knox'),
(125, 'America/Indiana/Marengo'),
(126, 'America/Indiana/Petersburg'),
(127, 'America/Indiana/Tell_City'),
(128, 'America/Indiana/Vevay'),
(129, 'America/Indiana/Vincennes'),
(130, 'America/Indiana/Winamac'),
(131, 'America/Indianapolis'),
(132, 'America/Inuvik'),
(133, 'America/Iqaluit'),
(134, 'America/Jamaica'),
(135, 'America/Jujuy'),
(136, 'America/Juneau'),
(137, 'America/Kentucky/Louisville'),
(138, 'America/Kentucky/Monticello'),
(139, 'America/Knox_IN'),
(140, 'America/La_Paz'),
(141, 'America/Lima'),
(142, 'America/Los_Angeles'),
(143, 'America/Louisville'),
(144, 'America/Maceio'),
(145, 'America/Managua'),
(146, 'America/Manaus'),
(147, 'America/Marigot'),
(148, 'America/Martinique'),
(149, 'America/Mazatlan'),
(150, 'America/Mendoza'),
(151, 'America/Menominee'),
(152, 'America/Merida'),
(153, 'America/Mexico_City'),
(154, 'America/Miquelon'),
(155, 'America/Moncton'),
(156, 'America/Monterrey'),
(157, 'America/Montevideo'),
(158, 'America/Montreal'),
(159, 'America/Montserrat'),
(160, 'America/Nassau'),
(161, 'America/New_York'),
(162, 'America/Nipigon'),
(163, 'America/Nome'),
(164, 'America/Noronha'),
(165, 'America/North_Dakota/Center'),
(166, 'America/North_Dakota/New_Salem'),
(167, 'America/Panama'),
(168, 'America/Pangnirtung'),
(169, 'America/Paramaribo'),
(170, 'America/Phoenix'),
(171, 'America/Port-au-Prince'),
(172, 'America/Port_of_Spain'),
(173, 'America/Porto_Acre'),
(174, 'America/Porto_Velho'),
(175, 'America/Puerto_Rico'),
(176, 'America/Rainy_River'),
(177, 'America/Rankin_Inlet'),
(178, 'America/Recife'),
(179, 'America/Regina'),
(180, 'America/Resolute'),
(181, 'America/Rio_Branco'),
(182, 'America/Rosario'),
(183, 'America/Santarem'),
(184, 'America/Santiago'),
(185, 'America/Santo_Domingo'),
(186, 'America/Sao_Paulo'),
(187, 'America/Scoresbysund'),
(188, 'America/Shiprock'),
(189, 'America/St_Barthelemy'),
(190, 'America/St_Johns'),
(191, 'America/St_Kitts'),
(192, 'America/St_Lucia'),
(193, 'America/St_Thomas'),
(194, 'America/St_Vincent'),
(195, 'America/Swift_Current'),
(196, 'America/Tegucigalpa'),
(197, 'America/Thule'),
(198, 'America/Thunder_Bay'),
(199, 'America/Tijuana'),
(200, 'America/Toronto'),
(201, 'America/Tortola'),
(202, 'America/Vancouver'),
(203, 'America/Virgin'),
(204, 'America/Whitehorse'),
(205, 'America/Winnipeg'),
(206, 'America/Yakutat'),
(207, 'America/Yellowknife'),
(208, 'Antarctica/Casey'),
(209, 'Antarctica/Davis'),
(210, 'Antarctica/DumontDUrville'),
(211, 'Antarctica/Mawson'),
(212, 'Antarctica/McMurdo'),
(213, 'Antarctica/Palmer'),
(214, 'Antarctica/Rothera'),
(215, 'Antarctica/South_Pole'),
(216, 'Antarctica/Syowa'),
(217, 'Antarctica/Vostok'),
(218, 'Arctic/Longyearbyen'),
(219, 'Asia/Aden'),
(220, 'Asia/Almaty'),
(221, 'Asia/Amman'),
(222, 'Asia/Anadyr'),
(223, 'Asia/Aqtau'),
(224, 'Asia/Aqtobe'),
(225, 'Asia/Ashgabat'),
(226, 'Asia/Ashkhabad'),
(227, 'Asia/Baghdad'),
(228, 'Asia/Bahrain'),
(229, 'Asia/Baku'),
(230, 'Asia/Bangkok'),
(231, 'Asia/Beirut'),
(232, 'Asia/Bishkek'),
(233, 'Asia/Brunei'),
(234, 'Asia/Calcutta'),
(235, 'Asia/Choibalsan'),
(236, 'Asia/Chongqing'),
(237, 'Asia/Chungking'),
(238, 'Asia/Colombo'),
(239, 'Asia/Dacca'),
(240, 'Asia/Damascus'),
(241, 'Asia/Dhaka'),
(242, 'Asia/Dili'),
(243, 'Asia/Dubai'),
(244, 'Asia/Dushanbe'),
(245, 'Asia/Gaza'),
(246, 'Asia/Harbin'),
(247, 'Asia/Ho_Chi_Minh'),
(248, 'Asia/Hong_Kong'),
(249, 'Asia/Hovd'),
(250, 'Asia/Irkutsk'),
(251, 'Asia/Istanbul'),
(252, 'Asia/Jakarta'),
(253, 'Asia/Jayapura'),
(254, 'Asia/Jerusalem'),
(255, 'Asia/Kabul'),
(256, 'Asia/Kamchatka'),
(257, 'Asia/Karachi'),
(258, 'Asia/Kashgar'),
(259, 'Asia/Kathmandu'),
(260, 'Asia/Katmandu'),
(261, 'Asia/Kolkata'),
(262, 'Asia/Krasnoyarsk'),
(263, 'Asia/Kuala_Lumpur'),
(264, 'Asia/Kuching'),
(265, 'Asia/Kuwait'),
(266, 'Asia/Macao'),
(267, 'Asia/Macau'),
(268, 'Asia/Magadan'),
(269, 'Asia/Makassar'),
(270, 'Asia/Manila'),
(271, 'Asia/Muscat'),
(272, 'Asia/Nicosia'),
(273, 'Asia/Novosibirsk'),
(274, 'Asia/Omsk'),
(275, 'Asia/Oral'),
(276, 'Asia/Phnom_Penh'),
(277, 'Asia/Pontianak'),
(278, 'Asia/Pyongyang'),
(279, 'Asia/Qatar'),
(280, 'Asia/Qyzylorda'),
(281, 'Asia/Rangoon'),
(282, 'Asia/Riyadh'),
(283, 'Asia/Saigon'),
(284, 'Asia/Sakhalin'),
(285, 'Asia/Samarkand'),
(286, 'Asia/Seoul'),
(287, 'Asia/Shanghai'),
(288, 'Asia/Singapore'),
(289, 'Asia/Taipei'),
(290, 'Asia/Tashkent'),
(291, 'Asia/Tbilisi'),
(292, 'Asia/Tehran'),
(293, 'Asia/Tel_Aviv'),
(294, 'Asia/Thimbu'),
(295, 'Asia/Thimphu'),
(296, 'Asia/Tokyo'),
(297, 'Asia/Ujung_Pandang'),
(298, 'Asia/Ulaanbaatar'),
(299, 'Asia/Ulan_Bator'),
(300, 'Asia/Urumqi'),
(301, 'Asia/Vientiane'),
(302, 'Asia/Vladivostok'),
(303, 'Asia/Yakutsk'),
(304, 'Asia/Yekaterinburg'),
(305, 'Asia/Yerevan'),
(306, 'Atlantic/Azores'),
(307, 'Atlantic/Bermuda'),
(308, 'Atlantic/Canary'),
(309, 'Atlantic/Cape_Verde'),
(310, 'Atlantic/Faeroe'),
(311, 'Atlantic/Faroe'),
(312, 'Atlantic/Jan_Mayen'),
(313, 'Atlantic/Madeira'),
(314, 'Atlantic/Reykjavik'),
(315, 'Atlantic/South_Georgia'),
(316, 'Atlantic/St_Helena'),
(317, 'Atlantic/Stanley'),
(318, 'Australia/ACT'),
(319, 'Australia/Adelaide'),
(320, 'Australia/Brisbane'),
(321, 'Australia/Broken_Hill'),
(322, 'Australia/Canberra'),
(323, 'Australia/Currie'),
(324, 'Australia/Darwin'),
(325, 'Australia/Eucla'),
(326, 'Australia/Hobart'),
(327, 'Australia/LHI'),
(328, 'Australia/Lindeman'),
(329, 'Australia/Lord_Howe'),
(330, 'Australia/Melbourne'),
(331, 'Australia/North'),
(332, 'Australia/NSW'),
(333, 'Australia/Perth'),
(334, 'Australia/Queensland'),
(335, 'Australia/South'),
(336, 'Australia/Sydney'),
(337, 'Australia/Tasmania'),
(338, 'Australia/Victoria'),
(339, 'Australia/West'),
(340, 'Australia/Yancowinna'),
(341, 'Europe/Amsterdam'),
(342, 'Europe/Andorra'),
(343, 'Europe/Athens'),
(344, 'Europe/Belfast'),
(345, 'Europe/Belgrade'),
(346, 'Europe/Berlin'),
(347, 'Europe/Bratislava'),
(348, 'Europe/Brussels'),
(349, 'Europe/Bucharest'),
(350, 'Europe/Budapest'),
(351, 'Europe/Chisinau'),
(352, 'Europe/Copenhagen'),
(353, 'Europe/Dublin'),
(354, 'Europe/Gibraltar'),
(355, 'Europe/Guernsey'),
(356, 'Europe/Helsinki'),
(357, 'Europe/Isle_of_Man'),
(358, 'Europe/Istanbul'),
(359, 'Europe/Jersey'),
(360, 'Europe/Kaliningrad'),
(361, 'Europe/Kiev'),
(362, 'Europe/Lisbon'),
(363, 'Europe/Ljubljana'),
(364, 'Europe/London'),
(365, 'Europe/Luxembourg'),
(366, 'Europe/Madrid'),
(367, 'Europe/Malta'),
(368, 'Europe/Mariehamn'),
(369, 'Europe/Minsk'),
(370, 'Europe/Monaco'),
(371, 'Europe/Moscow'),
(372, 'Europe/Nicosia'),
(373, 'Europe/Oslo'),
(374, 'Europe/Paris'),
(375, 'Europe/Podgorica'),
(376, 'Europe/Prague'),
(377, 'Europe/Riga'),
(378, 'Europe/Rome'),
(379, 'Europe/Samara'),
(380, 'Europe/San_Marino'),
(381, 'Europe/Sarajevo'),
(382, 'Europe/Simferopol'),
(383, 'Europe/Skopje'),
(384, 'Europe/Sofia'),
(385, 'Europe/Stockholm'),
(386, 'Europe/Tallinn'),
(387, 'Europe/Tirane'),
(388, 'Europe/Tiraspol'),
(389, 'Europe/Uzhgorod'),
(390, 'Europe/Vaduz'),
(391, 'Europe/Vatican'),
(392, 'Europe/Vienna'),
(393, 'Europe/Vilnius'),
(394, 'Europe/Volgograd'),
(395, 'Europe/Warsaw'),
(396, 'Europe/Zagreb'),
(397, 'Europe/Zaporozhye'),
(398, 'Europe/Zurich'),
(399, 'Indian/Antananarivo'),
(400, 'Indian/Chagos'),
(401, 'Indian/Christmas'),
(402, 'Indian/Cocos'),
(403, 'Indian/Comoro'),
(404, 'Indian/Kerguelen'),
(405, 'Indian/Mahe'),
(406, 'Indian/Maldives'),
(407, 'Indian/Mauritius'),
(408, 'Indian/Mayotte'),
(409, 'Indian/Reunion'),
(410, 'Pacific/Apia'),
(411, 'Pacific/Auckland'),
(412, 'Pacific/Chatham'),
(413, 'Pacific/Easter'),
(414, 'Pacific/Efate'),
(415, 'Pacific/Enderbury'),
(416, 'Pacific/Fakaofo'),
(417, 'Pacific/Fiji'),
(418, 'Pacific/Funafuti'),
(419, 'Pacific/Galapagos'),
(420, 'Pacific/Gambier'),
(421, 'Pacific/Guadalcanal'),
(422, 'Pacific/Guam'),
(423, 'Pacific/Honolulu'),
(424, 'Pacific/Johnston'),
(425, 'Pacific/Kiritimati'),
(426, 'Pacific/Kosrae'),
(427, 'Pacific/Kwajalein'),
(428, 'Pacific/Majuro'),
(429, 'Pacific/Marquesas'),
(430, 'Pacific/Midway'),
(431, 'Pacific/Nauru'),
(432, 'Pacific/Niue'),
(433, 'Pacific/Norfolk'),
(434, 'Pacific/Noumea'),
(435, 'Pacific/Pago_Pago'),
(436, 'Pacific/Palau'),
(437, 'Pacific/Pitcairn'),
(438, 'Pacific/Ponape'),
(439, 'Pacific/Port_Moresby'),
(440, 'Pacific/Rarotonga'),
(441, 'Pacific/Saipan'),
(442, 'Pacific/Samoa'),
(443, 'Pacific/Tahiti'),
(444, 'Pacific/Tarawa'),
(445, 'Pacific/Tongatapu'),
(446, 'Pacific/Truk'),
(447, 'Pacific/Wake'),
(448, 'Pacific/Wallis'),
(449, 'Pacific/Yap'),
(450, 'Brazil/Acre'),
(451, 'Brazil/DeNoronha'),
(452, 'Brazil/East'),
(453, 'Brazil/West'),
(454, 'Canada/Atlantic'),
(455, 'Canada/Central'),
(456, 'Canada/East-Saskatchewan'),
(457, 'Canada/Eastern'),
(458, 'Canada/Mountain'),
(459, 'Canada/Newfoundland'),
(460, 'Canada/Pacific'),
(461, 'Canada/Saskatchewan'),
(462, 'Canada/Yukon'),
(463, 'CET'),
(464, 'Chile/Continental'),
(465, 'Chile/EasterIsland'),
(466, 'CST6CDT'),
(467, 'Cuba'),
(468, 'EET'),
(469, 'Egypt'),
(470, 'Eire'),
(471, 'EST'),
(472, 'EST5EDT'),
(473, 'Etc/GMT'),
(474, 'Etc/GMT+0'),
(475, 'Etc/GMT+1'),
(476, 'Etc/GMT+10'),
(477, 'Etc/GMT+11'),
(478, 'Etc/GMT+12'),
(479, 'Etc/GMT+2'),
(480, 'Etc/GMT+3'),
(481, 'Etc/GMT+4'),
(482, 'Etc/GMT+5'),
(483, 'Etc/GMT+6'),
(484, 'Etc/GMT+7'),
(485, 'Etc/GMT+8'),
(486, 'Etc/GMT+9'),
(487, 'Etc/GMT-0'),
(488, 'Etc/GMT-1'),
(489, 'Etc/GMT-10'),
(490, 'Etc/GMT-11'),
(491, 'Etc/GMT-12'),
(492, 'Etc/GMT-13'),
(493, 'Etc/GMT-14'),
(494, 'Etc/GMT-2'),
(495, 'Etc/GMT-3'),
(496, 'Etc/GMT-4'),
(497, 'Etc/GMT-5'),
(498, 'Etc/GMT-6'),
(499, 'Etc/GMT-7'),
(500, 'Etc/GMT-8'),
(501, 'Etc/GMT-9'),
(502, 'Etc/GMT0'),
(503, 'Etc/Greenwich'),
(504, 'Etc/UCT'),
(505, 'Etc/Universal'),
(506, 'Etc/UTC'),
(507, 'Etc/Zulu'),
(508, 'Factory'),
(509, 'GB'),
(510, 'GB-Eire'),
(511, 'GMT'),
(512, 'GMT+0'),
(513, 'GMT-0'),
(514, 'GMT0'),
(515, 'Greenwich'),
(516, 'Hongkong'),
(517, 'HST'),
(518, 'Iceland'),
(519, 'Iran'),
(520, 'Israel'),
(521, 'Jamaica'),
(522, 'Japan'),
(523, 'Kwajalein'),
(524, 'Libya'),
(525, 'MET'),
(526, 'Mexico/BajaNorte'),
(527, 'Mexico/BajaSur'),
(528, 'Mexico/General'),
(529, 'MST'),
(530, 'MST7MDT'),
(531, 'Navajo'),
(532, 'NZ'),
(533, 'NZ-CHAT'),
(534, 'Poland'),
(535, 'Portugal'),
(536, 'PRC'),
(537, 'PST8PDT'),
(538, 'ROC'),
(539, 'ROK'),
(540, 'Singapore'),
(541, 'Turkey'),
(542, 'UCT'),
(543, 'Universal'),
(544, 'US/Alaska'),
(545, 'US/Aleutian'),
(546, 'US/Arizona'),
(547, 'US/Central'),
(548, 'US/East-Indiana'),
(549, 'US/Eastern'),
(550, 'US/Hawaii'),
(551, 'US/Indiana-Starke'),
(552, 'US/Michigan'),
(553, 'US/Mountain'),
(554, 'US/Pacific'),
(555, 'US/Pacific-New'),
(556, 'US/Samoa'),
(557, 'UTC'),
(558, 'W-SU'),
(559, 'WET'),
(560, 'Zulu');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_warehouse`
--

CREATE TABLE IF NOT EXISTS `ps_warehouse` (
  `id_warehouse` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_currency` int(11) unsigned NOT NULL,
  `id_address` int(11) unsigned NOT NULL,
  `id_employee` int(11) unsigned NOT NULL,
  `reference` varchar(32) DEFAULT NULL,
  `name` varchar(45) NOT NULL,
  `management_type` enum('WA','FIFO','LIFO') NOT NULL DEFAULT 'WA',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_warehouse`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_warehouse_carrier`
--

CREATE TABLE IF NOT EXISTS `ps_warehouse_carrier` (
  `id_carrier` int(11) unsigned NOT NULL,
  `id_warehouse` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_warehouse`,`id_carrier`),
  KEY `id_warehouse` (`id_warehouse`),
  KEY `id_carrier` (`id_carrier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_warehouse_product_location`
--

CREATE TABLE IF NOT EXISTS `ps_warehouse_product_location` (
  `id_warehouse_product_location` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_product` int(11) unsigned NOT NULL,
  `id_product_attribute` int(11) unsigned NOT NULL,
  `id_warehouse` int(11) unsigned NOT NULL,
  `location` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id_warehouse_product_location`),
  UNIQUE KEY `id_product` (`id_product`,`id_product_attribute`,`id_warehouse`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_warehouse_shop`
--

CREATE TABLE IF NOT EXISTS `ps_warehouse_shop` (
  `id_shop` int(11) unsigned NOT NULL,
  `id_warehouse` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_warehouse`,`id_shop`),
  KEY `id_warehouse` (`id_warehouse`),
  KEY `id_shop` (`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_webservice_account`
--

CREATE TABLE IF NOT EXISTS `ps_webservice_account` (
  `id_webservice_account` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(32) NOT NULL,
  `description` text,
  `class_name` varchar(50) NOT NULL DEFAULT 'WebserviceRequest',
  `is_module` tinyint(2) NOT NULL DEFAULT '0',
  `module_name` varchar(50) DEFAULT NULL,
  `active` tinyint(2) NOT NULL,
  PRIMARY KEY (`id_webservice_account`),
  KEY `key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_webservice_account_shop`
--

CREATE TABLE IF NOT EXISTS `ps_webservice_account_shop` (
  `id_webservice_account` int(11) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_webservice_account`,`id_shop`),
  KEY `id_shop` (`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_webservice_permission`
--

CREATE TABLE IF NOT EXISTS `ps_webservice_permission` (
  `id_webservice_permission` int(11) NOT NULL AUTO_INCREMENT,
  `resource` varchar(50) NOT NULL,
  `method` enum('GET','POST','PUT','DELETE','HEAD') NOT NULL,
  `id_webservice_account` int(11) NOT NULL,
  PRIMARY KEY (`id_webservice_permission`),
  UNIQUE KEY `resource_2` (`resource`,`method`,`id_webservice_account`),
  KEY `resource` (`resource`),
  KEY `method` (`method`),
  KEY `id_webservice_account` (`id_webservice_account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_web_browser`
--

CREATE TABLE IF NOT EXISTS `ps_web_browser` (
  `id_web_browser` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id_web_browser`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Volcado de datos para la tabla `ps_web_browser`
--

INSERT INTO `ps_web_browser` (`id_web_browser`, `name`) VALUES
(1, 'Safari'),
(2, 'Safari iPad'),
(3, 'Firefox'),
(4, 'Opera'),
(5, 'IE 6'),
(6, 'IE 7'),
(7, 'IE 8'),
(8, 'IE 9'),
(9, 'IE 10'),
(10, 'IE 11'),
(11, 'Chrome');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_wishlist`
--

CREATE TABLE IF NOT EXISTS `ps_wishlist` (
  `id_wishlist` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_customer` int(10) unsigned NOT NULL,
  `token` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `counter` int(10) unsigned DEFAULT NULL,
  `id_shop` int(10) unsigned DEFAULT '1',
  `id_shop_group` int(10) unsigned DEFAULT '1',
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  `default` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id_wishlist`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_wishlist_email`
--

CREATE TABLE IF NOT EXISTS `ps_wishlist_email` (
  `id_wishlist` int(10) unsigned NOT NULL,
  `email` varchar(128) NOT NULL,
  `date_add` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_wishlist_product`
--

CREATE TABLE IF NOT EXISTS `ps_wishlist_product` (
  `id_wishlist_product` int(10) NOT NULL AUTO_INCREMENT,
  `id_wishlist` int(10) unsigned NOT NULL,
  `id_product` int(10) unsigned NOT NULL,
  `id_product_attribute` int(10) unsigned NOT NULL,
  `quantity` int(10) unsigned NOT NULL,
  `priority` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_wishlist_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_wishlist_product_cart`
--

CREATE TABLE IF NOT EXISTS `ps_wishlist_product_cart` (
  `id_wishlist_product` int(10) unsigned NOT NULL,
  `id_cart` int(10) unsigned NOT NULL,
  `quantity` int(10) unsigned NOT NULL,
  `date_add` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_zone`
--

CREATE TABLE IF NOT EXISTS `ps_zone` (
  `id_zone` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_zone`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Volcado de datos para la tabla `ps_zone`
--

INSERT INTO `ps_zone` (`id_zone`, `name`, `active`) VALUES
(1, 'Europe', 1),
(2, 'North America', 1),
(3, 'Asia', 1),
(4, 'Africa', 1),
(5, 'Oceania', 1),
(6, 'South America', 1),
(7, 'Europe (non-EU)', 1),
(8, 'Central America/Antilla', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_zone_shop`
--

CREATE TABLE IF NOT EXISTS `ps_zone_shop` (
  `id_zone` int(11) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_zone`,`id_shop`),
  KEY `id_shop` (`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ps_zone_shop`
--

INSERT INTO `ps_zone_shop` (`id_zone`, `id_shop`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-04-2016 a las 19:11:27
-- Versión del servidor: 10.1.10-MariaDB
-- Versión de PHP: 5.6.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cooperativa`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `afiliado`
--

CREATE TABLE `afiliado` (
  `id_afiliado` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `identificacion` int(11) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `telefono` float DEFAULT NULL,
  `id_asesor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `afp`
--

CREATE TABLE `afp` (
  `id_afp` int(11) NOT NULL,
  `nit_afp` float DEFAULT NULL,
  `nombre_afp` varchar(200) DEFAULT NULL,
  `id_cooperativa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `arl`
--

CREATE TABLE `arl` (
  `id_arl` int(11) NOT NULL,
  `nit_arl` float DEFAULT NULL,
  `nombre_arl` varchar(200) DEFAULT NULL,
  `id_cooperativa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asesor`
--

CREATE TABLE `asesor` (
  `id_asesor` int(11) NOT NULL,
  `nombre` varchar(200) DEFAULT NULL,
  `apellido` varchar(200) DEFAULT NULL,
  `identificacion` int(11) DEFAULT NULL,
  `id_grupo_afiliados` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cooperativa`
--

CREATE TABLE `cooperativa` (
  `id_cooperativa` int(11) NOT NULL,
  `nom_cooperativa` varchar(100) DEFAULT NULL,
  `detalles` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eps`
--

CREATE TABLE `eps` (
  `id_eps` int(11) NOT NULL,
  `nit_eps` float DEFAULT NULL,
  `nombre_eps` varchar(100) DEFAULT NULL,
  `id_cooperativa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo_de_afiliados`
--

CREATE TABLE `grupo_de_afiliados` (
  `id_grupo_afiliados` int(11) NOT NULL,
  `pensiones` varchar(100) DEFAULT NULL,
  `riesgos_profesionales` varchar(200) DEFAULT NULL,
  `id_cooperativa` int(11) NOT NULL,
  `id_afiliado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `novedades`
--

CREATE TABLE `novedades` (
  `id_novedades` int(11) NOT NULL,
  `incapacidad` varchar(200) DEFAULT NULL,
  `embarazo` varchar(200) DEFAULT NULL,
  `retiro` varchar(200) DEFAULT NULL,
  `pension` varchar(200) DEFAULT NULL,
  `salud` varchar(200) DEFAULT NULL,
  `id_afiliado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `id_pagos` int(11) NOT NULL,
  `total_a_pagar` float DEFAULT NULL,
  `descuentos` int(11) DEFAULT NULL,
  `id_afiliado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `afiliado`
--
ALTER TABLE `afiliado`
  ADD PRIMARY KEY (`id_afiliado`),
  ADD KEY `R_11` (`id_asesor`);

--
-- Indices de la tabla `afp`
--
ALTER TABLE `afp`
  ADD PRIMARY KEY (`id_afp`),
  ADD KEY `R_4` (`id_cooperativa`);

--
-- Indices de la tabla `arl`
--
ALTER TABLE `arl`
  ADD PRIMARY KEY (`id_arl`),
  ADD KEY `R_3` (`id_cooperativa`);

--
-- Indices de la tabla `asesor`
--
ALTER TABLE `asesor`
  ADD PRIMARY KEY (`id_asesor`),
  ADD KEY `R_6` (`id_grupo_afiliados`);

--
-- Indices de la tabla `cooperativa`
--
ALTER TABLE `cooperativa`
  ADD PRIMARY KEY (`id_cooperativa`);

--
-- Indices de la tabla `eps`
--
ALTER TABLE `eps`
  ADD PRIMARY KEY (`id_eps`),
  ADD KEY `R_2` (`id_cooperativa`);

--
-- Indices de la tabla `grupo_de_afiliados`
--
ALTER TABLE `grupo_de_afiliados`
  ADD PRIMARY KEY (`id_grupo_afiliados`),
  ADD KEY `R_5` (`id_cooperativa`),
  ADD KEY `R_9` (`id_afiliado`);

--
-- Indices de la tabla `novedades`
--
ALTER TABLE `novedades`
  ADD PRIMARY KEY (`id_novedades`),
  ADD KEY `R_12` (`id_afiliado`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`id_pagos`),
  ADD KEY `R_8` (`id_afiliado`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `afiliado`
--
ALTER TABLE `afiliado`
  ADD CONSTRAINT `R_11` FOREIGN KEY (`id_asesor`) REFERENCES `asesor` (`id_asesor`);

--
-- Filtros para la tabla `afp`
--
ALTER TABLE `afp`
  ADD CONSTRAINT `R_4` FOREIGN KEY (`id_cooperativa`) REFERENCES `cooperativa` (`id_cooperativa`);

--
-- Filtros para la tabla `arl`
--
ALTER TABLE `arl`
  ADD CONSTRAINT `R_3` FOREIGN KEY (`id_cooperativa`) REFERENCES `cooperativa` (`id_cooperativa`);

--
-- Filtros para la tabla `asesor`
--
ALTER TABLE `asesor`
  ADD CONSTRAINT `R_6` FOREIGN KEY (`id_grupo_afiliados`) REFERENCES `grupo_de_afiliados` (`id_grupo_afiliados`);

--
-- Filtros para la tabla `eps`
--
ALTER TABLE `eps`
  ADD CONSTRAINT `R_2` FOREIGN KEY (`id_cooperativa`) REFERENCES `cooperativa` (`id_cooperativa`);

--
-- Filtros para la tabla `grupo_de_afiliados`
--
ALTER TABLE `grupo_de_afiliados`
  ADD CONSTRAINT `R_5` FOREIGN KEY (`id_cooperativa`) REFERENCES `cooperativa` (`id_cooperativa`),
  ADD CONSTRAINT `R_9` FOREIGN KEY (`id_afiliado`) REFERENCES `afiliado` (`id_afiliado`);

--
-- Filtros para la tabla `novedades`
--
ALTER TABLE `novedades`
  ADD CONSTRAINT `R_12` FOREIGN KEY (`id_afiliado`) REFERENCES `afiliado` (`id_afiliado`);

--
-- Filtros para la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD CONSTRAINT `R_8` FOREIGN KEY (`id_afiliado`) REFERENCES `afiliado` (`id_afiliado`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

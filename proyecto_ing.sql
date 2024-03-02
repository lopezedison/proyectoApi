-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-03-2024 a las 01:58:47
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyecto_ing`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignacionproyectousuario`
--

CREATE TABLE `asignacionproyectousuario` (
  `AsignacionID` int(11) NOT NULL,
  `UsuarioID` int(11) DEFAULT NULL,
  `ProyectoID` int(11) DEFAULT NULL,
  `RolUsuario` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cambiosestadohistoria`
--

CREATE TABLE `cambiosestadohistoria` (
  `CambioHistoriaID` int(11) NOT NULL,
  `HistoriaID` int(11) DEFAULT NULL,
  `NuevoEstado` int(11) DEFAULT NULL,
  `UsuarioID` int(11) DEFAULT NULL,
  `FechaHoraCambio` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cambiosestadotarea`
--

CREATE TABLE `cambiosestadotarea` (
  `CambioTareaID` int(11) NOT NULL,
  `TareaID` int(11) DEFAULT NULL,
  `NuevoEstadoTarea` int(11) DEFAULT NULL,
  `UsuarioID` int(11) DEFAULT NULL,
  `FechaHoraCambio` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `EstadoID` int(11) NOT NULL,
  `NombreEstado` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historiausuario`
--

CREATE TABLE `historiausuario` (
  `HistoriaID` int(11) NOT NULL,
  `DetallesHistoria` text DEFAULT NULL,
  `CriteriosAceptacion` text DEFAULT NULL,
  `Estado` varchar(20) DEFAULT NULL,
  `ProyectoID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyecto`
--

CREATE TABLE `proyecto` (
  `ProyectoID` int(11) NOT NULL,
  `Nombre` varchar(100) DEFAULT NULL,
  `Descripcion` text DEFAULT NULL,
  `FechaInicio` date DEFAULT NULL,
  `GerenteID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `RolID` int(11) NOT NULL,
  `NombreRol` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`RolID`, `NombreRol`) VALUES
(1, 'Gerente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarea`
--

CREATE TABLE `tarea` (
  `TareaID` int(11) NOT NULL,
  `DescripcionTarea` text DEFAULT NULL,
  `EstadoTarea` varchar(20) DEFAULT NULL,
  `HistoriaID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `UserID` int(11) NOT NULL,
  `NombreUsuario` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Contrasena` varchar(100) DEFAULT NULL,
  `TipoUsuario` varchar(20) DEFAULT NULL,
  `RolID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`UserID`, `NombreUsuario`, `Email`, `Contrasena`, `TipoUsuario`, `RolID`) VALUES
(1, 'Luis Arias', 'gerente@gmail.com', '12345', 'Tipo de Usuario', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asignacionproyectousuario`
--
ALTER TABLE `asignacionproyectousuario`
  ADD PRIMARY KEY (`AsignacionID`),
  ADD KEY `UsuarioID` (`UsuarioID`),
  ADD KEY `ProyectoID` (`ProyectoID`);

--
-- Indices de la tabla `cambiosestadohistoria`
--
ALTER TABLE `cambiosestadohistoria`
  ADD PRIMARY KEY (`CambioHistoriaID`),
  ADD KEY `HistoriaID` (`HistoriaID`),
  ADD KEY `UsuarioID` (`UsuarioID`),
  ADD KEY `NuevoEstado` (`NuevoEstado`);

--
-- Indices de la tabla `cambiosestadotarea`
--
ALTER TABLE `cambiosestadotarea`
  ADD PRIMARY KEY (`CambioTareaID`),
  ADD KEY `TareaID` (`TareaID`),
  ADD KEY `UsuarioID` (`UsuarioID`),
  ADD KEY `NuevoEstadoTarea` (`NuevoEstadoTarea`);

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`EstadoID`);

--
-- Indices de la tabla `historiausuario`
--
ALTER TABLE `historiausuario`
  ADD PRIMARY KEY (`HistoriaID`),
  ADD KEY `ProyectoID` (`ProyectoID`);

--
-- Indices de la tabla `proyecto`
--
ALTER TABLE `proyecto`
  ADD PRIMARY KEY (`ProyectoID`),
  ADD KEY `GerenteID` (`GerenteID`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`RolID`);

--
-- Indices de la tabla `tarea`
--
ALTER TABLE `tarea`
  ADD PRIMARY KEY (`TareaID`),
  ADD KEY `HistoriaID` (`HistoriaID`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`UserID`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD KEY `RolID` (`RolID`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asignacionproyectousuario`
--
ALTER TABLE `asignacionproyectousuario`
  ADD CONSTRAINT `asignacionproyectousuario_ibfk_1` FOREIGN KEY (`UsuarioID`) REFERENCES `usuario` (`UserID`),
  ADD CONSTRAINT `asignacionproyectousuario_ibfk_2` FOREIGN KEY (`ProyectoID`) REFERENCES `proyecto` (`ProyectoID`);

--
-- Filtros para la tabla `cambiosestadohistoria`
--
ALTER TABLE `cambiosestadohistoria`
  ADD CONSTRAINT `cambiosestadohistoria_ibfk_1` FOREIGN KEY (`HistoriaID`) REFERENCES `historiausuario` (`HistoriaID`),
  ADD CONSTRAINT `cambiosestadohistoria_ibfk_2` FOREIGN KEY (`UsuarioID`) REFERENCES `usuario` (`UserID`),
  ADD CONSTRAINT `cambiosestadohistoria_ibfk_3` FOREIGN KEY (`NuevoEstado`) REFERENCES `estado` (`EstadoID`);

--
-- Filtros para la tabla `cambiosestadotarea`
--
ALTER TABLE `cambiosestadotarea`
  ADD CONSTRAINT `cambiosestadotarea_ibfk_1` FOREIGN KEY (`TareaID`) REFERENCES `tarea` (`TareaID`),
  ADD CONSTRAINT `cambiosestadotarea_ibfk_2` FOREIGN KEY (`UsuarioID`) REFERENCES `usuario` (`UserID`),
  ADD CONSTRAINT `cambiosestadotarea_ibfk_3` FOREIGN KEY (`NuevoEstadoTarea`) REFERENCES `estado` (`EstadoID`);

--
-- Filtros para la tabla `historiausuario`
--
ALTER TABLE `historiausuario`
  ADD CONSTRAINT `historiausuario_ibfk_1` FOREIGN KEY (`ProyectoID`) REFERENCES `proyecto` (`ProyectoID`);

--
-- Filtros para la tabla `proyecto`
--
ALTER TABLE `proyecto`
  ADD CONSTRAINT `proyecto_ibfk_1` FOREIGN KEY (`GerenteID`) REFERENCES `usuario` (`UserID`);

--
-- Filtros para la tabla `tarea`
--
ALTER TABLE `tarea`
  ADD CONSTRAINT `tarea_ibfk_1` FOREIGN KEY (`HistoriaID`) REFERENCES `historiausuario` (`HistoriaID`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`RolID`) REFERENCES `roles` (`RolID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-07-2018 a las 20:32:36
-- Versión del servidor: 10.1.32-MariaDB
-- Versión de PHP: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `aspu`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentario`
--

CREATE TABLE `comentario` (
  `id` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `mensaje` varchar(250) DEFAULT NULL,
  `noticia_id` int(11) NOT NULL,
  `usuario_usuario` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `comentario`
--

INSERT INTO `comentario` (`id`, `fecha`, `mensaje`, `noticia_id`, `usuario_usuario`) VALUES
(24, '2018-06-23', 'Yo queria que petro ganara ', 63, 'jose'),
(39, '2018-06-26', ' Soy daQuin creador de esta pagina...', 65, 'daQuin'),
(40, '2018-06-26', 'Vamos tigre Falcao..!!', 65, 'jose'),
(44, '2018-06-27', 'Duque el mejor presidente de Colombiaa', 62, 'jose'),
(46, '2018-06-27', 'SOY DAQUIN CREADOR DE ESTA PAGINA', 62, 'daQuin'),
(47, '2018-06-27', 'Duque es el presidente que necesita el pais', 62, 'Sebastian'),
(49, '2018-06-27', 'Las propuestas del presidente para la educacion del pais son muy Buenas', 62, 'maria'),
(51, '2018-06-27', 'msamaosd', 65, 'maria');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evidencia`
--

CREATE TABLE `evidencia` (
  `id` int(11) NOT NULL,
  `nombre` varchar(500) DEFAULT NULL,
  `ruta` varchar(200) DEFAULT NULL,
  `tipo` varchar(10) NOT NULL,
  `descripcion` varchar(1000) DEFAULT NULL,
  `noticia_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `miembros`
--

CREATE TABLE `miembros` (
  `id` int(11) NOT NULL,
  `nombres` varchar(45) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `titulo` varchar(55) NOT NULL,
  `descripcion` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `miembros`
--

INSERT INTO `miembros` (`id`, `nombres`, `email`, `fecha`, `telefono`, `titulo`, `descripcion`) VALUES
(1, 'Monica Ovallos', 'monica_ovallos@hotmail.com', '2018-07-18', '3212118813', 'Ing Sistemas ', 'Ingeniera de sistemas de la UFPS'),
(2, 'Daniel', 'daniiel13.com@hotmail.com', '2018-06-14', '3212118812', 'Ing Sistemas ', 'Ingeniero de sistemas de la UFPS'),
(3, 'Sebastian Ovallos', 'sebastianOd@gamil.com', '2018-06-15', '321 7671 882', 'Ing Sistemas ', 'Ingeniero de sistemas Primer semestre'),
(4, 'Tomas', 'tomas@gmail.com', '2018-06-20', '3212118813', 'Sargento segundo', 'Profesor de mantenmiento de casa'),
(6, 'Keyly Ovallos', 'keyly@hotmail.com', '2018-06-20', '3212118812', 'Ing Sistemas ', 'Ingeniera de Sistemas con expecializacion en Aministracion de proyectos'),
(8, 'Leonardo Amaya', 'leonardoAmaya@ufps.edu.co', '2018-06-27', '3212118813', 'Estudiante pregrado', 'Estudiante programacion web');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `noticia`
--

CREATE TABLE `noticia` (
  `id` int(11) NOT NULL,
  `titulo` varchar(200) DEFAULT NULL,
  `descripcion` varchar(900) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `autor` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `noticia`
--

INSERT INTO `noticia` (`id`, `titulo`, `descripcion`, `fecha`, `autor`) VALUES
(62, 'Duque presidente', 'Duque presidente de colombia', '2018-06-18', 'Monica Ovallos'),
(63, 'Petro Senador ', 'Petro Senador de colombia', '2018-06-18', 'Monica Ovallos'),
(65, 'Colombia en el mundial', 'Colombia pierde su primer partido frente a Japon, debe ganar el domingo par tener esperanzas', '2018-06-20', 'Sebastian Ovallos'),
(72, 'Sustentacion de Web', 'El ingemiero Rene rajo muchos estudiantes ', '2018-06-27', 'Daniel Quintero');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id`, `descripcion`) VALUES
(1, 'Administrador'),
(2, 'Usuario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `usuario` varchar(45) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `rol_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`usuario`, `nombre`, `apellido`, `password`, `email`, `rol_id`) VALUES
('aleja', 'Alejandra', 'Ovallos', 'pass', '', 2),
('daQuin', 'Daniel', 'Quintero S', 'pass', 'jesusdaniel132010@hotmail.com', 1),
('jose', 'Jose David', 'Perez Sanchez', 'pass', 'daniielquiinteros@gmail.com', 2),
('maria', 'Maria', 'Gomez', 'pass', 'maria@gmail.com', 2),
('Sebastian', 'Sebastian', 'Ovallos Diaz', 'pass', 'sebastianOd@gamil.com', 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `comentario`
--
ALTER TABLE `comentario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_comentario_noticia1_idx` (`noticia_id`),
  ADD KEY `fk_comentario_usuario1_idx` (`usuario_usuario`);

--
-- Indices de la tabla `evidencia`
--
ALTER TABLE `evidencia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_evidencia_noticia1_idx` (`noticia_id`);

--
-- Indices de la tabla `miembros`
--
ALTER TABLE `miembros`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `noticia`
--
ALTER TABLE `noticia`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`usuario`),
  ADD KEY `fk_usuario_rol_idx` (`rol_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `comentario`
--
ALTER TABLE `comentario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT de la tabla `evidencia`
--
ALTER TABLE `evidencia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `miembros`
--
ALTER TABLE `miembros`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `noticia`
--
ALTER TABLE `noticia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comentario`
--
ALTER TABLE `comentario`
  ADD CONSTRAINT `fk_comentario_noticia1` FOREIGN KEY (`noticia_id`) REFERENCES `noticia` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_comentario_usuario1` FOREIGN KEY (`usuario_usuario`) REFERENCES `usuario` (`usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `evidencia`
--
ALTER TABLE `evidencia`
  ADD CONSTRAINT `fk_evidencia_noticia1` FOREIGN KEY (`noticia_id`) REFERENCES `noticia` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_usuario_rol` FOREIGN KEY (`rol_id`) REFERENCES `rol` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

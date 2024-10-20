-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: agencia
-- ------------------------------------------------------
-- Server version	8.0.35

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `viajes_acomodacion`
--

DROP TABLE IF EXISTS `viajes_acomodacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `viajes_acomodacion` (
  `id_acomodacion` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(300) NOT NULL,
  `descripcion` longtext NOT NULL,
  `estado` int NOT NULL,
  `capacidad` int NOT NULL,
  PRIMARY KEY (`id_acomodacion`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `viajes_acomodacion`
--

LOCK TABLES `viajes_acomodacion` WRITE;
/*!40000 ALTER TABLE `viajes_acomodacion` DISABLE KEYS */;
INSERT INTO `viajes_acomodacion` VALUES (1,'Habitación Simple','cama sencilla de 1.20',1,1),(2,'Habitación Doble','Cama de 1.40, kim',1,2),(3,'Habitación Múltiple','3 o mas camas de 100',1,4);
/*!40000 ALTER TABLE `viajes_acomodacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `viajes_adicion`
--

DROP TABLE IF EXISTS `viajes_adicion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `viajes_adicion` (
  `id_adicion` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  `descripcion` longtext NOT NULL,
  `costo` double NOT NULL,
  `estado` int NOT NULL,
  PRIMARY KEY (`id_adicion`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `viajes_adicion`
--

LOCK TABLES `viajes_adicion` WRITE;
/*!40000 ALTER TABLE `viajes_adicion` DISABLE KEYS */;
INSERT INTO `viajes_adicion` VALUES (1,'Autos','Variedad de marcas de Autos para su comodidad',300000,1),(2,'Alimentación','Cualquier tipo de alimento no incluido en el paquete',60000,1),(3,'Noches Romanticas','Salidas o cenas romanticas',400000,1),(4,'Alojamiento','Cualquier tipo de alojamiento que se encuentre disponible',200000,1),(5,'Bicicletas','Para cualquier edad',10000,1);
/*!40000 ALTER TABLE `viajes_adicion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `viajes_cliente`
--

DROP TABLE IF EXISTS `viajes_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `viajes_cliente` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `tipo_doc` varchar(20) NOT NULL,
  `documento` varchar(20) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `correo` varchar(200) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `estado` int NOT NULL,
  `id_destino` int NOT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `documento` (`documento`),
  KEY `viajes_cliente_id_destino_ebeaf204_fk_viajes_destino_id_destino` (`id_destino`),
  CONSTRAINT `viajes_cliente_id_destino_ebeaf204_fk_viajes_destino_id_destino` FOREIGN KEY (`id_destino`) REFERENCES `viajes_destino` (`id_destino`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `viajes_cliente`
--

LOCK TABLES `viajes_cliente` WRITE;
/*!40000 ALTER TABLE `viajes_cliente` DISABLE KEYS */;
INSERT INTO `viajes_cliente` VALUES (1,'Marisol','Cédula','1010897899','29303938','lamejor@hotmail.com','medrano',1,1),(2,'Camilo','Cédula','19283746590','625484745','elmejor@hotmail.com','silencio',1,2),(3,'Samanta','Cédula','1107798647','537484874','correr@gmail.com','porvenir',1,3),(4,'Samara Perea','Cédula','1009384765','9103837464','ejemplos@hotmail.com','cabi',1,4),(5,'Jose Gabriel','Cédula','102938463537','6738364','estenoes@gmacil.com','Esmeralda',1,5);
/*!40000 ALTER TABLE `viajes_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `viajes_destino`
--

DROP TABLE IF EXISTS `viajes_destino`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `viajes_destino` (
  `id_destino` int NOT NULL AUTO_INCREMENT,
  `destino` varchar(200) NOT NULL,
  `estado` int NOT NULL,
  PRIMARY KEY (`id_destino`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `viajes_destino`
--

LOCK TABLES `viajes_destino` WRITE;
/*!40000 ALTER TABLE `viajes_destino` DISABLE KEYS */;
INSERT INTO `viajes_destino` VALUES (1,'Eje Cafetero',1),(2,'Panamá',1),(3,'Nuqui',1),(4,'Bahía Solano',1),(5,'Cartagena',1);
/*!40000 ALTER TABLE `viajes_destino` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `viajes_detallereserva`
--

DROP TABLE IF EXISTS `viajes_detallereserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `viajes_detallereserva` (
  `id_detalle_reserva` int NOT NULL AUTO_INCREMENT,
  `habitaciones` int NOT NULL,
  `adulto` int NOT NULL,
  `infante` int NOT NULL,
  `comentarios` varchar(500) DEFAULT NULL,
  `id_acomodacion` int DEFAULT NULL,
  `id_adicion` int DEFAULT NULL,
  `id_paquete_tour` int DEFAULT NULL,
  `id_reserva` int NOT NULL,
  PRIMARY KEY (`id_detalle_reserva`),
  KEY `viajes_detallereserv_id_acomodacion_0e9a628a_fk_viajes_ac` (`id_acomodacion`),
  KEY `viajes_detallereserv_id_adicion_490f61e4_fk_viajes_ad` (`id_adicion`),
  KEY `viajes_detallereserv_id_paquete_tour_723793a0_fk_viajes_pa` (`id_paquete_tour`),
  KEY `viajes_detallereserv_id_reserva_df9ffbc7_fk_viajes_re` (`id_reserva`),
  CONSTRAINT `viajes_detallereserv_id_acomodacion_0e9a628a_fk_viajes_ac` FOREIGN KEY (`id_acomodacion`) REFERENCES `viajes_acomodacion` (`id_acomodacion`),
  CONSTRAINT `viajes_detallereserv_id_adicion_490f61e4_fk_viajes_ad` FOREIGN KEY (`id_adicion`) REFERENCES `viajes_adicion` (`id_adicion`),
  CONSTRAINT `viajes_detallereserv_id_paquete_tour_723793a0_fk_viajes_pa` FOREIGN KEY (`id_paquete_tour`) REFERENCES `viajes_paquetetour` (`id_paquete_tour`),
  CONSTRAINT `viajes_detallereserv_id_reserva_df9ffbc7_fk_viajes_re` FOREIGN KEY (`id_reserva`) REFERENCES `viajes_reserva` (`id_reserva`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `viajes_detallereserva`
--

LOCK TABLES `viajes_detallereserva` WRITE;
/*!40000 ALTER TABLE `viajes_detallereserva` DISABLE KEYS */;
INSERT INTO `viajes_detallereserva` VALUES (1,1,2,0,NULL,1,1,1,1),(2,1,2,2,NULL,2,2,2,2),(3,2,3,2,NULL,3,3,3,3),(5,1,2,0,NULL,2,1,5,5);
/*!40000 ALTER TABLE `viajes_detallereserva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `viajes_hospedaje`
--

DROP TABLE IF EXISTS `viajes_hospedaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `viajes_hospedaje` (
  `id_hospedaje` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `correo` varchar(30) NOT NULL,
  `tipo_hospedaje` varchar(30) NOT NULL,
  `descripcion` longtext NOT NULL,
  `tarifa_base` double NOT NULL,
  `estado` int NOT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  `id_destino` int NOT NULL,
  `telefono` varchar(50) NOT NULL,
  PRIMARY KEY (`id_hospedaje`),
  KEY `viajes_hospedaje_id_destino_70de6455_fk_viajes_de` (`id_destino`),
  CONSTRAINT `viajes_hospedaje_id_destino_70de6455_fk_viajes_de` FOREIGN KEY (`id_destino`) REFERENCES `viajes_destino` (`id_destino`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `viajes_hospedaje`
--

LOCK TABLES `viajes_hospedaje` WRITE;
/*!40000 ALTER TABLE `viajes_hospedaje` DISABLE KEYS */;
INSERT INTO `viajes_hospedaje` VALUES (1,'Hotel San Pedro','nuqui-choco','lamejor@hotmail.com','hotel','Desayuno incluido',282353,1,'relative/path/to/upload/500531530.jpg',5,'29303938'),(2,'Hotel Playa Blanca','nuqui-choco','elmejor@hotmail.com','Posada','Posada Turística Rocas De Cabo Marzo está en Bahía Solano, a 17 min a pie de Playa de El Almejal',500000,1,'relative/path/to/upload/500531530.jpg',4,'29303938'),(3,'Hotel Pacífico','nuqui-choco','correr@gmail.com','hotel','El Hotel OBEGA PACIFIC ofrece alojamiento en Nuquí. El establecimiento cuenta con recepción 24 horas',230000,1,'relative/path/to/upload/246570451.jpg',3,'29303938'),(4,'Hotel San Antonio','nuqui-choco','ejemplos@hotmail.com','hotel','El hotel ofrece habitaciones con aire acondicionado, escritorio, caja fuerte, TV de pantalla plana',6843480,1,'relative/path/to/upload/504329959.jpg',2,'29303938'),(5,'Hotel Mariam','nuqui-choco','estenoes@gmacil.com','Casa de Campo','CASA DE CAMPO VILLA OLI!! - Un paraiso natural en la ciudad, que cuenta con vistas al lago',10857000,1,'relative/path/to/upload/423861997.jpg',1,'29303938'),(6,'Hotel Carmeleño','Panamá','correr@gmail.com','Finca','finca',2000000,1,'',3,'29303938'),(7,'Hotel Panamá','Panamá','correr@gmail.com','hotel','Este es un destino donde podrás disfrutar de una maravillosa vista al mar y de espectaculares vistas en paseos en bote',500000,1,'',2,'29303938'),(8,'Hotel Playa Dorada','Panamá','correr@gmail.com','hotel','Este es un excelente hotel para que experimentes diferentes aventuras.',600000,1,'',2,'29303938'),(9,'Hotel Los Cristales','Panamá','correr@gmail.com','hotel','En este viaje vas a experimentar las mas fascinantes aventuras en bote.',800000,1,'',2,'29303938'),(10,'Hotel Playa Mar','Panamá','correr@gmail.com','hotel','Este viaje te conducirá a recorrer por las playas mas emblemática de Panamá, la experiencia de tu vida.',9900000,1,'',2,'29303938'),(11,'Finca Mirador','Eje Cafetero','lamejor@hotmail.com','Finca','Disfruta de una estadía sorprendente rodeado de la flora y la fauna de la región que te cautivará.',700000,1,'',1,'9103837464'),(12,'Finca La Hermosa','Eje Cafetero','lamejor@hotmail.com','Finca','En este viaje podrás visitar los mas sorprendentes zoológicos de animales típicos de la región un contacto único con la naturaleza.',890000,1,'',1,'9103837464'),(13,'Casa Campo La Niña','Eje Cafetero','lamejor@hotmail.com','Casa de Campo','Visita nuestra casa Campo y disfruta de una estadía única donde te atenderemos como a un rey.',500000,1,'',1,'9103837464'),(14,'Posada Turística Villa Lopez','Eje Cafetero','lamejor@hotmail.com','Posada','Nuestra posada es reconocida por orecer las mejores experiencias para nuestros invitados, disfruta de recorridos campestres, paseos y caminatas por el bosque que te darán años de vida.',990000,1,'',1,'9103837464'),(15,'Hotel La María','Eje Cafetero','ejemplos@hotmail.com','hotel','Aqui podras disfrutar de un hospedaje único con servicio a la habitación, recorridos por la ciudad en bus para visitar los lugares culturales de la región.',700000,1,'',1,'9103837464'),(16,'Casa Campo La Hermosa','Bahía Solano','Babilon@gmacil.com','Casa de Campo','Visitanos para disfrutar de: recorridos por el pueblo, paseos en bote a las playas de Bahía, y mucho más.',900000,1,'',4,'6738364'),(17,'Hotel El Mirador','Bahía Solano','Babilon@gmacil.com','hotel','Nuestro hotel es reconocido para ofrecer las mejores experiencias como: paseos por la playa, recorridos en canoa, visitas a los lugares donde podrás conocer la cultura de la region.',890000,1,'',4,'6738364'),(18,'Finca Los Mares','Bahía Solano','Babilon@gmacil.com','Finca','Aquí te ofrecemos contacto total con la naturaleza, desde buceo marino, hasta recorridos por zoológicos de la región, visitanos y viviras una experiencia única.',1000000,1,'',4,'6738364'),(19,'Hotel Salamanca','Bahía Solano','Babilon@gmacil.com','hotel','Te ofrecemos: buceo, paseos por la playa, recorrido por la ciudad, y mucho más, visítanos será una experiencia para recordar.',780000,1,'',4,'6738364'),(20,'Casa Campo María Bonita','Bahía Solano','Babilon@gmacil.com','Casa de Campo','Nuestra casa campo te llevará a pasear en canoa por los diferentes balnearios del lugar, podrás experimentar contacto con la fauna y la flora a través de  nuestro recorrido campestre.',900000,1,'',4,'6738364'),(21,'Hote Sonesta','Cartagena','lamejor@hotmail.com','hotel','Contamos con 3 piscinas rodeadas de hermosas palmeras para que disfrutar tardes al sol, servicio a la habitación, recorrido por la ciudad y mucho más.',1000000,1,'',5,'6738364'),(22,'Hotel Summer','Cartagena','lamejor@hotmail.com','hotel','Te ofrecemos alojamiento frente a la playa, tardes en nuestras 3 piscinas, buceo monitoreado por nuestros buceadores profesionales.',900000,1,'',5,'6738364'),(23,'Casa de Campo India Catalina','Cartagena','lamejor@hotmail.com','Casa de Campo','Estamos ubicados en la hermosa ciudad amurallada de Cartagena de Indias, es un hermoso edificio con aire acondicionado, servicio a la habitación, paseo turístico en bus por la ciudad y mucho más.',800000,1,'',5,'6738364'),(24,'Hotel Ákel House','Cartagena','lamejor@hotmail.com','hotel','Tenemos un hermoso Hotel con terraza vista al mal, instalaciones con concepto abierto, 1 piscina para niños, y 2 para adultos, tambien te llevaremos a recorrer la ciudad.',790000,1,'',5,'6738364'),(25,'Hotel El Dorado','Cartagena','lamejor@hotmail.com','hotel','Te ofrecemos: buceo monitoreado por nuestros profesionales, recorrido por los balnearios de la región, piscina para niños y adultos, recorrido turístico por la ciudad y mucho más, visítanos para darnos el gusto de atenderte.',900000,1,'',5,'6738364');
/*!40000 ALTER TABLE `viajes_hospedaje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `viajes_hospedajeacomodacion`
--

DROP TABLE IF EXISTS `viajes_hospedajeacomodacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `viajes_hospedajeacomodacion` (
  `id_hospedaje_acomodacion` int NOT NULL AUTO_INCREMENT,
  `temporada` varchar(20) NOT NULL,
  `tarifa_agencia` double NOT NULL,
  `tarifa` double NOT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  `id_acomodacion` int NOT NULL,
  `id_hospedaje` int NOT NULL,
  PRIMARY KEY (`id_hospedaje_acomodacion`),
  KEY `viajes_hospedajeacom_id_acomodacion_3167e57a_fk_viajes_ac` (`id_acomodacion`),
  KEY `viajes_hospedajeacom_id_hospedaje_5e6ec122_fk_viajes_ho` (`id_hospedaje`),
  CONSTRAINT `viajes_hospedajeacom_id_acomodacion_3167e57a_fk_viajes_ac` FOREIGN KEY (`id_acomodacion`) REFERENCES `viajes_acomodacion` (`id_acomodacion`),
  CONSTRAINT `viajes_hospedajeacom_id_hospedaje_5e6ec122_fk_viajes_ho` FOREIGN KEY (`id_hospedaje`) REFERENCES `viajes_hospedaje` (`id_hospedaje`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `viajes_hospedajeacomodacion`
--

LOCK TABLES `viajes_hospedajeacomodacion` WRITE;
/*!40000 ALTER TABLE `viajes_hospedajeacomodacion` DISABLE KEYS */;
INSERT INTO `viajes_hospedajeacomodacion` VALUES (1,'Baja',500000,800000,'assets/img/R_EtfEFxl.jpeg',2,1),(2,'Alta',1000000,1500000,'relative/path/to/upload/multiple.jpg',3,2),(3,'Baja',800000,1000000,'relative/path/to/upload/multiple_aVDrvox.jpg',3,3),(4,'Alta',10000000,10500000,'relative/path/to/upload/sencilla.jpg',1,4),(5,'Alta',2400000,3000000,'assets/img/R_bJW82LX.jpeg',2,5),(6,'Alta',2000000,2400000,'',3,6);
/*!40000 ALTER TABLE `viajes_hospedajeacomodacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `viajes_paquete`
--

DROP TABLE IF EXISTS `viajes_paquete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `viajes_paquete` (
  `id_paquete` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `descripcion` longtext NOT NULL,
  `vigencia_inicio` date NOT NULL,
  `vigencia_fin` date NOT NULL,
  `noche` int NOT NULL,
  `incluye` longtext NOT NULL,
  `no_incluye` longtext NOT NULL,
  `costo` double NOT NULL,
  `disponibilidad` varchar(50) NOT NULL,
  `estado` int NOT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_paquete`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `viajes_paquete`
--

LOCK TABLES `viajes_paquete` WRITE;
/*!40000 ALTER TABLE `viajes_paquete` DISABLE KEYS */;
INSERT INTO `viajes_paquete` VALUES (1,'Ciudad de Panamá-Mirador de Cristel','Disfruta de Ciudad de Panamá, un destino con muchos que ofrece a sus habitantes los atractivos turisticos y conozca el mirador de Cristal','2025-08-11','2024-10-19',3,'alojamiento por 3 noches en hotel seleccionado, habitación estándar, desayuno diario, cortesía café panameño','Tiquetes aereos e impuestos, tasas o contribuciones com IVA, tasa aeroportuaria, impuestos combustibles',10000000,'3 meses',1,'assets/img/pana5.jpg'),(2,'Cartagena-Santo Manglar Life Wellness Spa Hotel','En Santo Manglar podrá disfrutar de bienestar, gastronomía y relajación, conectando con la esencia de lo natural y','2025-08-09','2025-01-09',4,'Traslados Aeropuesto-Hote-Aeropuerto en servicio privado (horario de 7am-6pm), alojamiento, alimentación desayuno americano servido en el restaurante Kibu de 7am a 10:00am, internet Wi-Fi','Tiquetes, tasa aeroportuaria, tarifa administrativa, registro',500000,'5 meses',1,'assets/img/carta5.jpg'),(3,'Nuquí-Avistamiento de Ballenas','Experiencia Turística que se enfoca en el aprovechamiento de los recursos naturales, ecosistémicos y la cultura, donde realizamos diferentes actividades durante cuatro temporadas del año: Mar y Selva, Tradición gastronómica del Pacífico, Temporada de Ballenas y Temporada de Conservación','2025-08-13','2025-02-15',5,'Lancha Pangui-reserva Natural Selva Mojada-Pangui, 4 noches en habitaciones privadas en las playas privadas de Pangui, 4 almuerzos, 4 cenas y 4 desayunos, Cfpe y agua, recorrido por el Manglar','Transporte desde la ciudad de origen y regreso, tasa ingreso al turista, gastos personales',2385600,'6 meses',1,'assets/img/nuqui2.jpg'),(4,'Bahía Solano-Hotel Playa de Oro-Temporada de Ballenas','Disfruta del avistamiento de ballenas Yurbartas en el Océano Pacífico Colombiano; Bahía Solano es uno de los lugares favoritos para tener esta experiencia en medio de pasajes y biodiversidad','2025-08-16','2024-11-15',4,'Traslados aeropuerto-hotel-aeropuerto en Bahía Solano, Recepción y manejo de equipaje, refrescos de bienvenida, alojamiento, desayuno,almuerzo y cena, 2 salidas al avistamiento de ballenas','Ingresos a las caminatas, registro de entrada en el hotel después de la hora prevista, tiquetes aéreos e impuesto, gastos personales',1489000,'4 meses',1,'assets/img/bahia4.jpg'),(5,'ROKATUR-Eje Cafetero Terrestre','Parque nacional Recuca, parque Nacional del Eje Cafetero, Valle del Cocora/Salento/Filandia','2025-12-11','2025-01-27',5,'Transporte en bus, alojamiento en acomodación múltiple, hotel con piscina, sendero ecológico, sala de juegos, entrada a los diferentes parques, tarjeta de asistencia médica','Comidas por carretera, almuerzos',9000000,'6 meses',1,'assets/img/eje5.jpg'),(7,'Panamá Pelícanos','Alojamiento, desayunos diarios y traslados.\r\nSalidas diarias!','2025-08-17','2025-06-17',3,'2 noches de alojamiento en el hotel seleccionado Desayunos diarios Traslados Aeropuerto, Hotel, Aeropuerto Servicios en compartido','Trámite administrativo de divisas del 2% sobre el valor del plan, Tiquete Aéreo e impuestos Gastos no especificados en el programa Bebidas y extras personales en los hoteles y restaurantes Propinas',557.971,'10 meses',1,'assets/img/pana4.jpg'),(8,'AVENTURA EN PANAMÁ BLUETOURS','PANAMÁ TURÍSTICO Sumérjase en una inolvidable gira por la ciudad de Panamá y el canal, culminando en una experiencia de compras en el emblemático Albrook Mall.','2025-08-20','2025-01-20',4,'hospedaje con desayuno, Traslados aeropuerto, hotel,  aeropuerto (servicio en compartido), Gira de cuidad & canal, finalizando en Albrook Mall, Degustación de cervezas artesanales','Trámite administrativo de divisas del 2% sobre el valor del plan + IVA, valor cobrado por pago en efectivo en moneda extranjera no reembolsable, Tiquetes aéreos internacionales o locales e impuestos',955.374,'5 meses',1,'assets/img/pana3.jpg'),(9,'Panamá, Riu Playa Blanca, Riu Plaza','Disfrute del combinado de playa y ciudad en Panamá, y disfrute de un descanso con alimentación, todo incluido en el Hotel Riu Playa Blanca y alojamiento con desayuno en el Hotel Riu Plaza Panamá. Tarifas sujetas a cambios y disponibilidad sin previo aviso.','2025-08-21','2025-02-21',3,'Traslado aeropuerto de Tocumen - hotel de playa / hotel de ciudad - aeropuerto de Tocumen en servicio compartido en horarios establecidos (ver en información para el viajero), Traslados Hotel Riu Play','Trámite administrativo de divisas del 2% más IVA sobre el valor del plan, valor cobrado por pago en efectivo en moneda extranjera no reembolsable, Registro de entrada en hoteles antes de la hora',1.168126,'6 meses',1,'assets/img/pana1.jpg'),(10,'Panamá - Riu Playa Blanca','Disfrute del combinado de playa y ciudad en Panamá, y disfrute de un descanso con alimentación, todo incluido en el Hotel Riu Playa Blanca y alojamiento con desayuno en el Hotel Riu Plaza Panamá, y conozca los lugares de interés en la Ciudad de Panamá y visite el Canal. Tarifas sujetas a cambios y disponibilidad sin previo aviso.','2025-10-16','2025-03-16',3,'Traslado aeropuerto de Tocumen - hotel de playa / hotel de ciudad, aeropuerto de Tocumen en servicio compartido en horarios establecidos (ver en información para el viajero), Traslados Hotel Riu Play','Trámite administrativo de divisas del 3% más IVA sobre el valor del plan, valor cobrado por pago en efectivo en moneda extranjera no reembolsable Registro de entrada en hoteles antes de la hora previs',1.288551,'5 meses',1,'assets/img/pana2.jpg'),(11,'Cartagena - Hotel PradoMar','El Hotel Pradomar, están ubicados en la primera línea de la playa en Puerto Colombia, en la vía al mar a solo 20 minutos de Barranquilla en un ambiente de brisa, arena, mar y tranquilidad. Ubicado en la Calle 2 # 22 – 61. A 50 minutos del aeropuerto de Barranquilla de Ernesto Cortissoz. Tarifas sujetas a cambio y disponibilidad sin previo aviso','2025-08-16','2025-01-16',3,'Alojamiento 2 noches en habitación seleccionada Desayuno Acceso a club playa y piscina El check in se realiza a las 3:00 pm y check out 12:00 medio día Impuestos gubernamentales (IVA 19%)','Tiquetes aéreos e impuestos, tasas o contribuciones que los graven tales como: IVA, tasa aeroportuaria, impuestos de combustible, tarifa administrativa, impuestos de aeropuertos y otros cargos',242,'5 meses',1,'assets/img/carta4.jpg'),(12,'Cartagena - Hotel PradoMar - Semana de Receso','El Hotel Pradomar, están ubicados en la primera línea de la playa en Puerto Colombia, en la vía al mar a solo 20 minutos de Barranquilla en un ambiente de brisa, arena, mar y tranquilidad. Ubicado en la Calle 2 # 22 – 61. A 50 minutos del aeropuerto de Barranquilla de Ernesto Cortissoz.','2025-08-23','2024-08-30',3,'Alojamiento 2 noches en habitación seleccionada Desayuno Acceso a club playa y piscina El check in se realiza a las 3:00 pm y check out 12:00 medio día Impuestos gubernamentales (IVA 19%)','Tiquetes aéreos e impuestos, tasas o contribuciones que los graven tales como: IVA, tasa aeroportuaria, impuestos de combustible, tarifa administrativa, impuestos de aeropuertos y otros cargos',294.001,'1 semana',1,'assets/img/carta3.jpg'),(13,'Cartagena - Organización Dorado Plaza - Hotel Centro Histórico','Hotel Dorado Plaza Centro Histórico, es privilegiado en su ubicación enmarcada dentro del contorno histórico del corralito de piedra que colinda con la parte moderna de La Matuna. Tarifas sujetas a cambios y disponibilidad sin previo aviso.','2025-09-11','2025-09-11',3,'Alojamiento: desde 2 noches de acuerdo a la acomodación seleccionada, Alimentación: Desayuno, Impuestos gubernamentales (IVA 19)','Tiquetes aéreos e impuestos, tasas o contribuciones que los graven, tales como: IVA, tasa aeroportuaria, impuestos de combustible, tarifa administrativa, impuestos de aeropuertos y otros cargos',461.125,'1 año',1,'assets/img/carta2.jpg'),(14,'Cartagena - Hotel Capilla del Mar','Hotel Capilla del Mar, disfrute el encanto y la historia de la ciudad vieja de Cartagena de Indias, a solo 10 minutos de distancia del hotel y a su llegada a 15 minutos del aeropuerto.','2025-09-04','2025-03-04',3,'Alojamiento: desde 3 noches de acuerdo a la acomodación seleccionada.  Alimentación: de acuerdo al plan seleccionado (PC: desayuno buffet diario.) WI-FI de cortesía en todo el Hotel. Impuestos guberna','Tiquetes aéreos no estipulados. Traslados Aeropuerto - Hotel - Aeropuerto. Consumos de minibar, room service, lavandería, llamadas telefónicas ni consumos en la barra de café del lobby,Gastos personal',530,'6 meses',1,'assets/img/carta1.jpg'),(15,'Nuquí Paraíso Terrenal','Lugar para disfrutar de la brisa del mar y de la hermosa naturaleza con una total privacidad y comodidad, tanto como para descubrir  de Nuqui a través de su gastronomía, sus paisajes y su gente. Embarquese en esta experiencia única y descubra el Pacifico colombiano tras pasear por la jungla y disfrutar de sus refrescantes aguas. Plan de 3 noches 4 días:\r\nActividades: \r\ncaminata por playa a la cascada del Amor (30 minutos por trayecto)\r\ncaminata por playa al poblado de Termales (1 hora aprox por trayecto)','2025-07-03','2025-01-01',3,'3 Noches de alojamiento en habitación con baño privado en el hotel la Bayka Alimentación completa: 3 desayunos, 3 almuerzos, 3 cenas. Café y agua en el hotel. Traslado en lancha Nuquí - hotel - Nuquí.','Impuestos locales de ingreso a Nuquì: 30.000 pesos por persona. Valor sujeto a cambios en el nuevo año. Se paga en efectivo en pesos colombianos a la llegada del huésped en el aeropuerto',1.084,'6 meses',1,'assets/img/nuqui3.jpg'),(16,'Nuquí-Soleado','El Hotel La Bayka y Hotel Nichila están ubicados en la Playa Guachalito, a 1 hora en lancha (Dependiendo de la marea) desde el muelle de Nuquí. A una hora caminando de los poblados nativos de Termales y Jovi.','2025-09-02','2024-09-08',4,'Transporte: Tiquete aéreo Bogotá - Nuquí - Bogotá (escala en Medellín o Quibdó) vía Satena en clase M *Aplica suplemento en otra clase.* Recepción en el aeropuerto de Nuquí. Alojamiento: 4 noches','Impuesto de turismo en Nuquí COP $30.000 por persona. Entrada a los baños termales COP $17.000 por persona.',2.319001,'1 semana',1,'assets/img/nuqui5.jpg'),(17,'Nuquí','Nuquí es mar, selva y comunidad. Su comida, su gente y su fauna y flora forman un paisaje y destino único. Viaje auténtico, cargado de emociones y vivencias transformadoras para la vida. Van a tener la oportunidad de compartir con locales, disfrutando de sus tradiciones culturales y ancestrales.','2025-10-07','2024-10-13',3,'Transporte terrestre y fluvial privado Alojamiento Posada Vientos de Yubarta Alojamiento Posada Chachita','Vuelo ida y regreso a Nuquí Gastos no especificados Bebidas alcohólicas',2.42353,'1 semana',1,'assets/img/nuqui1.jpg'),(18,'Nuquí Temporada Baja','Nuquí es mar, selva y comunidad. Su comida, su gente y su fauna y flora forman un paisaje y destino único. Las ballenas viajan de julio a octubre a dar luz y enseñarle a nadar a sus ballenatos. Nuestras experiencias han sido creadas de la mano de la comunidad para ofrecerles un viaje auténtico, cargado de emociones y vivencias transformadoras para la vida. Nuestros planes son experienciales y no convencionales. Vas a tener la oportunidad de compartir con locales, disfrutando de sus tradiciones culturales y ancestrales.','2025-08-27','2025-01-27',3,'Transporte terrestre y fluvial privado Alojamiento Posada Vientos de Yubarta Alojamiento Posada Chachita','Vuelo ida y regreso a Nuquí Gastos no especificados Bebidas alcohólicas',2.470589,'5 meses',1,'assets/img/nuqui4.jpg'),(19,'BAHÍA SOLANO - PLAN TORTUGA','Este programa pretende contribuir a la conservación de las tortugas marinas categorizadas en vía de extinción a través del desarrollo de planes turísticos que involucran especies o ecosistemas vulnerables usando el ecoturismo como herramienta de conservación y apoyo a grupos organizados de la comunidad local.','2025-08-21','2026-08-21',3,'Traslados aeropuerto –Hotel  ALMEJAL – aeropuerto en Bahía. Alojamiento en cabaña Familiar.','Tiquetes aéreos  Bebidas, licores, imprevistos, propinas   Tasa de ingreso proturismo $30.000, menores de 11 a 18 años $ 12.000 (sujeto a cambio)',1.055,'2 años',1,'assets/img/bahia3.jpg'),(20,'BAHIA SOLANO - HOTEL KIPARA','Bahía Solano es un destino turístico ideal para aquellos que buscan una experiencia única de avistamiento de ballenas, ranas y descanso en las playas en el Valle. La región del Chocó es conocida por su biodiversidad y belleza natural, y este alojamiento te ofrece una experiencia inolvidable para aquellos que quieran explorarla. Esta experiencia NO es recomendable para niños menores de 7 años o personas con movilidad reducida.','2025-08-21','2024-10-21',4,'Transporte: Transporte terrestre aeropuerto de Bahía Solano – hotel – aeropuerto de Bahía Solano. Alojamiento: 3 noches en hotel en la zona de playa de El Valle.  Acomodación doble, triple, cuádruple','Transportes: Tiquetes aéreos desde su ciudad de origen. Tasa aeroportuaria Bahía Solano: 8.000 COP por persona. Alojamiento: Noches previas o posteriores a la experiencia. Alimentación: Desayuno',1.479,'3 meses',1,'assets/img/bahia2.jpg'),(21,'NATVIA - CHOCO - BAHIA SOLANO - EL ARCA','Este inolvidable plan es recomendado para todas las personas, menores y mayores de edad. Es una gran oportunidad de conocer las razones por las cuales la tortugas llegan a estas playas del pacífico chocoano. Conocerán su conservación y el papel que juegan las organizaciones comunitarias en su liberación.\r\nVisitarán lugares increíbles como la Cascada de Nabugá, ubicada en la Comunidad Indígena Emberá de Nabugá, el río Tundó y además la Reserva Natural Comunidad de Mecana, uno de los lugares más biodiversos del planeta, allí se encuentra el Águila Arpía una de las águilas más grandes y poderosas.','2025-11-05','2025-01-05',3,'Seguro hotelero. Kayac ilimitado (contamos con 2 kayac para 4 personas). Wi-Fi gratis.','Entradas a los sitios turísticos: $20.000 Ensenada de Utrìa. Propinas dentro del Ecolodge. Impuestos y demás cargos no considerados en el plan.',1.6184,'3 meses',1,'assets/img/bahia1.jpg'),(22,'BAHIA SOLANO - HOTEL KIPARA-BALLENAS-4 noches','Bahía Solano es un destino turístico ideal para aquellos que buscan una experiencia única de avistamiento de ballenas, ranas y descanso en las playas en el Valle. La región del Chocó es conocida por su biodiversidad y belleza natural, y este alojamiento te ofrece una experiencia inolvidable para aquellos que quieran explorarla. Esta experiencia NO es recomendable para niños menores de 7 años o personas con movilidad reducida.','2025-08-21','2024-10-21',4,'Transporte: Transporte terrestre aeropuerto de Bahía Solano – hotel – aeropuerto de Bahía Solano. Alojamiento: 3 noches en hotel en la zona de playa de El Valle.  Acomodación doble, triple, cuádruple','Transportes: Tiquetes aéreos desde su ciudad de origen. Tasa aeroportuaria Bahía Solano: 8.000 COP por persona. Alojamiento: Noches previas o posteriores a la experiencia. Alimentación: Desayuno',1.479,'3 meses',1,'assets/img/bahia5.jpeg'),(23,'Eje Cafetero- Quindío - Hotel Mi Monaco','Hostería Mi Mónaco está ubicada a lo largo de la carretera que conecta la ciudad de Armenia con el corregimiento de Pueblo Tapao, brindando fácil acceso tanto mediante transporte público como en vehículo particular.\r\n\r\nUbicados a tan solo 5 minutos del corregimiento de Pueblo Tapao, donde encontraran una variada oferta gastronómica, supermercado y tiendas locales. Además, están a solo 10 minutos del Parque del Café, y a solo 14 minutos de la ciudad de Armenia.','2025-08-21','2024-12-21',4,'Alojamiento: desde 2 noches de acuerdo a la acomodación y tipo de habitación seleccionada. Alimentación: Desayuno.','Tiquetes aéreos e impuestos, tasas o contribuciones que los graven, tales como: IVA, tasa aeroportuaria, impuestos de combustible, tarifa administrativa, impuestos de aeropuertos y otros cargos.',193.001,'4 meses',1,'assets/img/eje3.jpg'),(24,'EJE CAFETERO-GLAMPING ENTRE RIOS','El Glamping Entre Ríos lo invita a dormir, soñar y descansar entre ríos, con un tipo tienda Safari con todas las comodidades de un hotel de lujo, rodeado y en contacto directo con la naturaleza.\r\n\r\nDurante su estadía los sonidos que prevalecerán son los de los ríos y el canto de las aves.','2025-08-21','2024-11-21',3,'El programa incluye: Alojamiento por el número de noches seleccionadas en el Glamping Entre Ríos, ubicado en el municipio de Calarcá, Quindío. Desayuno','Tiquetes aéreos e impuestos, tasas o contribuciones que los graven tales como: IVA, tasa aeroportuaria, impuestos de combustible, tarifa administrativa, impuestos de aeropuerto y otros cargos.',424.262,'3 meses',1,'assets/img/eje1.jpg'),(25,'Excursión Terrestre al Eje Cafetero','Excursión terrestre saliendo de Medellín, al Eje Cafetero, disfrute del verde de sus paisajes y diferentes atracciones. \r\n\r\nTransporte compartido, alojamiento, alimentación, tours, tarjeta de asistencia.\r\n\r\n\r\n*Salida mínima con 12 personas, salidas grupales.','2025-10-16','2024-10-22',6,'Transporte de turismo de acuerdo al número de personas. Alojamiento 3 noches en Finca - Hotel con piscina.','Gastos y alimentación no especificada. Gastos extras por posibles retrasos. Ingreso a Panaca.',600,'1 semana',1,'assets/img/eje4.jpg'),(26,'Eje Cafetero - Hotel Campestre Las Camelias','Hotel Campestre Las Camelias, con 202 habitaciones, parque de aguas, rio lento, 3 piscinas para adultos, 2 piscinas para niños, canchas múltiples, 2 canchas de tenis, zona de juegos infantiles, centro de convenciones con capacidad para 1.000 personas y salones adicionales con capacidad hasta de 470 personas.\r\n\r\n\r\n* Tarifas sujetas a cambios y disponibilidad sin previo aviso.\r\nIncluye','2025-08-21','2025-08-21',2,'Traslados Aeropuerto - Hotel - Aeropuerto, en servicio privado. Alojamiento: desde 2 noches de acuerdo a la acomodación y tipo de habitación seleccionada.','Tiquetes aéreos e impuestos, tasas o contribuciones que los graven, tales como: IVA, tasa aeroportuaria, impuestos de combustible, tarifa administrativa, impuestos de aeropuertos y otros cargos.',873.14,'1 año',1,'assets/img/eje2.png');
/*!40000 ALTER TABLE `viajes_paquete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `viajes_paquetetour`
--

DROP TABLE IF EXISTS `viajes_paquetetour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `viajes_paquetetour` (
  `id_paquete_tour` int NOT NULL AUTO_INCREMENT,
  `id_paquete` int NOT NULL,
  `id_hospedaje_acomodacion` int NOT NULL,
  PRIMARY KEY (`id_paquete_tour`),
  KEY `viajes_paquetetour_id_paquete_11483777_fk_viajes_pa` (`id_paquete`),
  KEY `viajes_paquetetour_id_hospedaje_acomoda_e646b972_fk_viajes_ho` (`id_hospedaje_acomodacion`),
  CONSTRAINT `viajes_paquetetour_id_hospedaje_acomoda_e646b972_fk_viajes_ho` FOREIGN KEY (`id_hospedaje_acomodacion`) REFERENCES `viajes_hospedajeacomodacion` (`id_hospedaje_acomodacion`),
  CONSTRAINT `viajes_paquetetour_id_paquete_11483777_fk_viajes_pa` FOREIGN KEY (`id_paquete`) REFERENCES `viajes_paquete` (`id_paquete`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `viajes_paquetetour`
--

LOCK TABLES `viajes_paquetetour` WRITE;
/*!40000 ALTER TABLE `viajes_paquetetour` DISABLE KEYS */;
INSERT INTO `viajes_paquetetour` VALUES (1,1,1),(2,5,1),(3,2,1),(4,3,1),(5,4,1),(7,11,3),(10,15,2),(12,16,4),(13,18,3),(14,17,5),(17,7,2),(18,9,3),(19,8,4),(20,10,5),(21,19,2),(22,20,3),(23,21,4),(24,22,5),(26,12,3),(27,13,4),(29,14,5),(30,23,2),(31,24,3),(32,25,4),(33,26,5);
/*!40000 ALTER TABLE `viajes_paquetetour` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `viajes_reserva`
--

DROP TABLE IF EXISTS `viajes_reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `viajes_reserva` (
  `id_reserva` int NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `cantidad` int NOT NULL,
  `total` double NOT NULL,
  `estado_reserva` varchar(20) NOT NULL,
  `metodo_pago` varchar(20) NOT NULL,
  `estado` int NOT NULL,
  `id_cliente` int NOT NULL,
  PRIMARY KEY (`id_reserva`),
  KEY `viajes_reserva_id_cliente_7981e356_fk_viajes_cliente_id_cliente` (`id_cliente`),
  CONSTRAINT `viajes_reserva_id_cliente_7981e356_fk_viajes_cliente_id_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `viajes_cliente` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `viajes_reserva`
--

LOCK TABLES `viajes_reserva` WRITE;
/*!40000 ALTER TABLE `viajes_reserva` DISABLE KEYS */;
INSERT INTO `viajes_reserva` VALUES (1,'2024-08-16','2024-08-30','2024-09-05',4,36000000,'Activo','Efectivo',1,1),(2,'2024-08-01','2024-09-12','2024-09-17',2,20000000,'Activo','PSE',1,2),(3,'2024-09-12','2024-11-14','2024-11-19',3,7156800,'Activo','Transacción',1,3),(4,'2024-08-09','2025-01-09','2025-01-13',1,3000000,'Activo','Efectivo',1,4),(5,'2024-08-14','2024-10-19','2024-10-24',5,2500000,'Activo','PSE',1,5);
/*!40000 ALTER TABLE `viajes_reserva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'agencia'
--

--
-- Dumping routines for database 'agencia'
--
/*!50003 DROP PROCEDURE IF EXISTS `consultar_acomodacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `consultar_acomodacion`(in valor int)
BEGIN
select j.id_hospedaje_acomodacion, j.temporada 'Temporada', a.id_acomodacion, a.nombre 'Acomodacion', h.id_hospedaje, h.nombre 'Hospedaje' from viajes_hospedajeacomodacion j inner join viajes_acomodacion a on a.id_acomodacion = j.id_acomodacion inner join viajes_hospedaje h on h.id_hospedaje = j.id_hospedaje WHERE j.id_hospedaje_acomodacion = valor and h.estado= 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `consultar_destino` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `consultar_destino`(in valor varchar(100))
BEGIN
SELECT id_destino, destino from viajes_destino WHERE destino LIKE CONCAT('%', valor, '%')  and estado='1';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `consultar_detalle_paquete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `consultar_detalle_paquete`(in valor int)
BEGIN
select t.id_paquete_tour, concat(p.nombre,'   -   ', h.nombre,'   -   ', h.tipo_hospedaje) as 'Paquete', d.destino as 'Destino', p.nombre as 'Nombre_del_Paquete', p.descripcion as 'descripcion_paquete', p.vigencia_inicio, p.vigencia_fin, p.noche 'Noche', p.noche + 1 'Día', p.incluye, p.no_incluye, p.costo, j.tarifa, p.disponibilidad, p.imagen as 'Imagen_Paquete', h.nombre as 'Nombre_del_Hospedaje', h.direccion, h.correo, h.telefono, h.tipo_hospedaje, h.descripcion, h.tarifa_base, h.imagen, a.nombre as 'Nombre_Acomodación', a.descripcion, a.capacidad from viajes_paquetetour t inner join viajes_paquete p on p.id_paquete = t.id_paquete inner join viajes_hospedajeacomodacion j on t.id_hospedaje_acomodacion = j.id_hospedaje_acomodacion inner join viajes_hospedaje h on h.id_hospedaje = j.id_hospedaje inner join viajes_destino d on d.id_destino = h.id_destino inner join viajes_acomodacion a on j.id_acomodacion = a.id_acomodacion WHERE t.id_paquete_tour = valor and p.estado= 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `consultar_paquete_tour` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `consultar_paquete_tour`(in valor varchar(100))
BEGIN
select t.id_paquete_tour, concat(p.nombre,'   -   ', h.nombre,'   -   ', h.tipo_hospedaje) as 'Paquete', d.destino as 'Destino', p.nombre as 'Nombre_del_Paquete', p.descripcion as 'descripcion_paquete', p.vigencia_inicio, p.vigencia_fin, p.noche 'Noche', p.noche + 1 'Día', p.incluye, p.no_incluye, p.costo, j.tarifa, p.disponibilidad, p.imagen as 'Imagen_Paquete', h.nombre as 'Nombre_del_Hospedaje', h.direccion, h.correo, h.telefono, h.tipo_hospedaje, h.descripcion, h.tarifa_base, h.imagen, a.nombre as 'Nombre_Acomodación', a.descripcion, a.capacidad from viajes_paquetetour t inner join viajes_paquete p on p.id_paquete = t.id_paquete inner join viajes_hospedajeacomodacion j on t.id_hospedaje_acomodacion = j.id_hospedaje_acomodacion inner join viajes_hospedaje h on h.id_hospedaje = j.id_hospedaje inner join viajes_destino d on d.id_destino = h.id_destino inner join viajes_acomodacion a on j.id_acomodacion = a.id_acomodacion  WHERE d.destino LIKE CONCAT('%', valor, '%') and p.vigencia_inicio >= current_date() and d.estado='1';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-18 20:39:20

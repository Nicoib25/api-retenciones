-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         12.3.2-MariaDB - MariaDB Server
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.17.0.7270
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Volcando estructura para tabla retenciones_sifen.configuracion
CREATE TABLE IF NOT EXISTS `configuracion` (
  `clave` varchar(50) NOT NULL,
  `valor` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`clave`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Volcando datos para la tabla retenciones_sifen.configuracion: ~6 rows (aproximadamente)
INSERT INTO `configuracion` (`clave`, `valor`) VALUES
	('establecimiento', '001'),
	('punto_expedicion', '001'),
	('razon_social', 'DUTRIEC SA'),
	('ruc_empresa', '80015056'),
	('url_sifen_prod', 'https://sifen.set.gov.py'),
	('url_sifen_test', 'https://sifen-test.set.gov.py');

-- Volcando estructura para tabla retenciones_sifen.log_envios
CREATE TABLE IF NOT EXISTS `log_envios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_retencion` int(11) DEFAULT NULL,
  `fecha_intento` datetime DEFAULT current_timestamp(),
  `resultado` varchar(20) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `xml_enviado` text DEFAULT NULL,
  `xml_respuesta` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Volcando datos para la tabla retenciones_sifen.log_envios: ~0 rows (aproximadamente)

-- Volcando estructura para tabla retenciones_sifen.retenciones_enviadas
CREATE TABLE IF NOT EXISTS `retenciones_enviadas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_factura_orig` bigint(20) DEFAULT NULL,
  `nro_comprobante` varchar(50) DEFAULT NULL,
  `ruc_proveedor` varchar(20) DEFAULT NULL,
  `razon_social` varchar(200) DEFAULT NULL,
  `fecha_factura` date DEFAULT NULL,
  `monto` decimal(18,2) DEFAULT NULL,
  `moneda` varchar(5) DEFAULT NULL,
  `retencion` decimal(18,2) DEFAULT NULL,
  `estado` varchar(30) DEFAULT NULL,
  `cdc` varchar(100) DEFAULT NULL,
  `motivo_rechazo` text DEFAULT NULL,
  `fecha_envio` datetime DEFAULT NULL,
  `usuario` varchar(50) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Volcando datos para la tabla retenciones_sifen.retenciones_enviadas: ~6 rows (aproximadamente)
INSERT INTO `retenciones_enviadas` (`id`, `id_factura_orig`, `nro_comprobante`, `ruc_proveedor`, `razon_social`, `fecha_factura`, `monto`, `moneda`, `retencion`, `estado`, `cdc`, `motivo_rechazo`, `fecha_envio`, `usuario`, `fecha_creacion`) VALUES
	(1, 6012, '0010010000555', '2088322 - 6', 'JUAN ORTEGA RUIZ DIAZ', NULL, 2454545.00, 'GS', 73636.50, 'APROBADO', '07800150566001001601220260604', NULL, '2026-06-05 11:23:02', NULL, '2026-06-05 11:23:02'),
	(2, 6013, '0010020007400', '4196706-2', 'FARYD KARIM', NULL, 909091.00, 'GS', 27272.70, 'APROBADO', '07800150566001001601320260604', NULL, '2026-06-05 11:23:02', NULL, '2026-06-05 11:23:02'),
	(3, 1001, '001-001-0000101', '80098765-4', 'IMPORTADORA ABC SRL', '2026-06-09', 5000000.00, 'GS', 1500000.00, 'ENVIADO', '01800695630010010000010620260609000000000012', NULL, '2026-06-10 16:10:46', 'admin', '2026-06-10 16:10:46'),
	(4, 1002, '001-001-0000102', '80055555-3', 'DISTRIBUIDORA XYZ SA', '2026-06-09', 3000000.00, 'GS', 900000.00, 'ERROR', '01800695630010010000020620260609000000000029', 'dCodRes: 0422 — CDC no encontrado en el sistema SIFEN', '2026-06-10 16:10:46', 'admin', '2026-06-10 16:10:46'),
	(5, 1003, '001-001-0000103', '80012345-6', 'SERVICIOS TECH SRL', '2026-06-09', 2000000.00, 'GS', 600000.00, 'FISICA_MANUAL', NULL, 'Factura física — retención manual requerida', '2026-06-10 16:10:46', 'admin', '2026-06-10 16:10:46'),
	(6, 1004, '001-001-0000104', '80033333-1', 'CONSTRUCTORA DEL SUR SA', '2026-06-10', 8000000.00, 'GS', 2400000.00, 'PENDIENTE', '01800695630010010000030620260610000000000036', NULL, NULL, 'admin', '2026-06-10 16:10:46');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

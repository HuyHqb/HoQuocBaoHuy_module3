-- MySQL dump 10.13  Distrib 8.0.25, for macos11.3 (x86_64)
--
-- Host: 127.0.0.1    Database: furama_resort
-- ------------------------------------------------------
-- Server version	8.0.25

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `furama_resort`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `furama_resort` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `furama_resort`;

--
-- Table structure for table `BoPhan`
--

DROP TABLE IF EXISTS `BoPhan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BoPhan` (
  `idBoPhan` int NOT NULL,
  `tenBoPhan` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idBoPhan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BoPhan`
--

LOCK TABLES `BoPhan` WRITE;
/*!40000 ALTER TABLE `BoPhan` DISABLE KEYS */;
INSERT INTO `BoPhan` VALUES (1,'Sale - Marketing'),(2,'Hanh Chinh'),(3,'Phuc Vu'),(4,'Quan Ly');
/*!40000 ALTER TABLE `BoPhan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DichVu`
--

DROP TABLE IF EXISTS `DichVu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DichVu` (
  `idDichVu` int NOT NULL,
  `tenDichVu` varchar(45) DEFAULT NULL,
  `dienTich` int DEFAULT NULL,
  `soTang` int DEFAULT NULL,
  `soNguoiToiDa` int DEFAULT NULL,
  `chiPhiThue` int DEFAULT NULL,
  `idKieuThue` int DEFAULT NULL,
  `idLoaiDichVu` int DEFAULT NULL,
  `trangThai` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idDichVu`),
  KEY `idKieuThue` (`idKieuThue`),
  KEY `idLoaiDichVu` (`idLoaiDichVu`),
  CONSTRAINT `DichVu_ibfk_1` FOREIGN KEY (`idKieuThue`) REFERENCES `KieuThue` (`idKieuThue`),
  CONSTRAINT `DichVu_ibfk_2` FOREIGN KEY (`idLoaiDichVu`) REFERENCES `LoaiDichVu` (`idLoaiDichVu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DichVu`
--

LOCK TABLES `DichVu` WRITE;
/*!40000 ALTER TABLE `DichVu` DISABLE KEYS */;
/*!40000 ALTER TABLE `DichVu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DichVuDiKem`
--

DROP TABLE IF EXISTS `DichVuDiKem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DichVuDiKem` (
  `idDichViDiKem` int NOT NULL,
  `tenDichVuDiKem` varchar(45) DEFAULT NULL,
  `gia` int DEFAULT NULL,
  `donVi` int DEFAULT NULL,
  `trangThaiKhaDung` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idDichViDiKem`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DichVuDiKem`
--

LOCK TABLES `DichVuDiKem` WRITE;
/*!40000 ALTER TABLE `DichVuDiKem` DISABLE KEYS */;
INSERT INTO `DichVuDiKem` VALUES (1,'Massage',50,1,'San sang'),(2,'Karaoke',20,1,'San sang'),(3,'Food',50,1,'San sang'),(4,'Car',70,1,'Chua san sang');
/*!40000 ALTER TABLE `DichVuDiKem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HopDong`
--

DROP TABLE IF EXISTS `HopDong`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `HopDong` (
  `idHopDong` int NOT NULL,
  `idNhanVien` int DEFAULT NULL,
  `idKhachHang` int DEFAULT NULL,
  `idDichVu` int DEFAULT NULL,
  `ngayLapHopDong` date DEFAULT NULL,
  `ngayKetThuc` date DEFAULT NULL,
  `tienDatCoc` int DEFAULT NULL,
  `tongTien` int DEFAULT NULL,
  PRIMARY KEY (`idHopDong`),
  KEY `idNhanVien` (`idNhanVien`),
  KEY `idKhachHang` (`idKhachHang`),
  KEY `idDichVu` (`idDichVu`),
  CONSTRAINT `HopDong_ibfk_1` FOREIGN KEY (`idNhanVien`) REFERENCES `NhanVien` (`idNhanVien`),
  CONSTRAINT `HopDong_ibfk_2` FOREIGN KEY (`idKhachHang`) REFERENCES `KhachHang` (`idKhachHang`),
  CONSTRAINT `HopDong_ibfk_3` FOREIGN KEY (`idDichVu`) REFERENCES `DichVu` (`idDichVu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HopDong`
--

LOCK TABLES `HopDong` WRITE;
/*!40000 ALTER TABLE `HopDong` DISABLE KEYS */;
/*!40000 ALTER TABLE `HopDong` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HopDongChiTiet`
--

DROP TABLE IF EXISTS `HopDongChiTiet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `HopDongChiTiet` (
  `idHopDongChiTiet` int NOT NULL,
  `idHopDong` int DEFAULT NULL,
  `idDichVuDiKem` int DEFAULT NULL,
  `soLuong` int DEFAULT NULL,
  PRIMARY KEY (`idHopDongChiTiet`),
  KEY `idHopDong` (`idHopDong`),
  KEY `idDichVuDiKem` (`idDichVuDiKem`),
  CONSTRAINT `HopDongChiTiet_ibfk_1` FOREIGN KEY (`idHopDong`) REFERENCES `HopDong` (`idHopDong`),
  CONSTRAINT `HopDongChiTiet_ibfk_2` FOREIGN KEY (`idDichVuDiKem`) REFERENCES `DichVuDiKem` (idDichVuDiKem)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HopDongChiTiet`
--

LOCK TABLES `HopDongChiTiet` WRITE;
/*!40000 ALTER TABLE `HopDongChiTiet` DISABLE KEYS */;
/*!40000 ALTER TABLE `HopDongChiTiet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KhachHang`
--

DROP TABLE IF EXISTS `KhachHang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `KhachHang` (
  `idKhachHang` int NOT NULL,
  `idLoaiKhach` int DEFAULT NULL,
  `hoTen` varchar(45) DEFAULT NULL,
  `ngaySinh` date DEFAULT NULL,
  `soCMND` varchar(45) DEFAULT NULL,
  `sdt` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `diaChi` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idKhachHang`),
  UNIQUE KEY `KhachHang_soCMND_uindex` (`soCMND`),
  KEY `idLoaiKhach` (`idLoaiKhach`),
  CONSTRAINT `KhachHang_ibfk_1` FOREIGN KEY (`idLoaiKhach`) REFERENCES `LoaiKhach` (`idLoaiKhach`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KhachHang`
--

LOCK TABLES `KhachHang` WRITE;
/*!40000 ALTER TABLE `KhachHang` DISABLE KEYS */;
/*!40000 ALTER TABLE `KhachHang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KieuThue`
--

DROP TABLE IF EXISTS `KieuThue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `KieuThue` (
  `idKieuThue` int NOT NULL,
  `tenKieuThue` varchar(45) DEFAULT NULL,
  `gia` int DEFAULT NULL,
  PRIMARY KEY (`idKieuThue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KieuThue`
--

LOCK TABLES `KieuThue` WRITE;
/*!40000 ALTER TABLE `KieuThue` DISABLE KEYS */;
INSERT INTO `KieuThue` VALUES (1,'Gio',100),(2,'Ngay',2000),(3,'Thang',10000),(4,'Nam',99999);
/*!40000 ALTER TABLE `KieuThue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LoaiDichVu`
--

DROP TABLE IF EXISTS `LoaiDichVu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LoaiDichVu` (
  `idLoaiDichVu` int NOT NULL,
  `tenLoaiDichVu` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idLoaiDichVu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LoaiDichVu`
--

LOCK TABLES `LoaiDichVu` WRITE;
/*!40000 ALTER TABLE `LoaiDichVu` DISABLE KEYS */;
INSERT INTO `LoaiDichVu` VALUES (1,'Room'),(2,'House'),(3,'Villa');
/*!40000 ALTER TABLE `LoaiDichVu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LoaiKhach`
--

DROP TABLE IF EXISTS `LoaiKhach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LoaiKhach` (
  `idLoaiKhach` int NOT NULL,
  `tenLoaiKhach` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idLoaiKhach`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LoaiKhach`
--

LOCK TABLES `LoaiKhach` WRITE;
/*!40000 ALTER TABLE `LoaiKhach` DISABLE KEYS */;
INSERT INTO `LoaiKhach` VALUES (1,'Member'),(2,'Silver'),(3,'Gold'),(4,'Platinum'),(5,'Diamond');
/*!40000 ALTER TABLE `LoaiKhach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NhanVien`
--

DROP TABLE IF EXISTS `NhanVien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `NhanVien` (
  `idNhanVien` int NOT NULL,
  `hoTen` varchar(45) DEFAULT NULL,
  `idViTri` int DEFAULT NULL,
  `idTrinhDo` int DEFAULT NULL,
  `idBoPhan` int DEFAULT NULL,
  `ngaySinh` date DEFAULT NULL,
  `soCMND` varchar(45) DEFAULT NULL,
  `luong` int DEFAULT NULL,
  `sdt` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `diaChi` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idNhanVien`),
  UNIQUE KEY `NhanVien_soCMND_uindex` (`soCMND`),
  KEY `idViTri` (`idViTri`),
  KEY `idTrinhDo` (`idTrinhDo`),
  KEY `idBoPhan` (`idBoPhan`),
  CONSTRAINT `NhanVien_ibfk_1` FOREIGN KEY (`idViTri`) REFERENCES `ViTri` (`idViTri`),
  CONSTRAINT `NhanVien_ibfk_2` FOREIGN KEY (`idTrinhDo`) REFERENCES `TrinhDo` (`idTrinhDo`),
  CONSTRAINT `NhanVien_ibfk_3` FOREIGN KEY (`idBoPhan`) REFERENCES `BoPhan` (`idBoPhan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NhanVien`
--

LOCK TABLES `NhanVien` WRITE;
/*!40000 ALTER TABLE `NhanVien` DISABLE KEYS */;
INSERT INTO `NhanVien` VALUES (1,'Thanh Bao',6,3,4,'1999-10-05','012345678',9999,'111222333','bao@mail.com','DN');
/*!40000 ALTER TABLE `NhanVien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TrinhDo`
--

DROP TABLE IF EXISTS `TrinhDo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TrinhDo` (
  `idTrinhDo` int NOT NULL,
  `trinhDo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idTrinhDo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TrinhDo`
--

LOCK TABLES `TrinhDo` WRITE;
/*!40000 ALTER TABLE `TrinhDo` DISABLE KEYS */;
INSERT INTO `TrinhDo` VALUES (1,'Trung Cap'),(2,'Cao Dang'),(3,'Dai Hoc'),(4,'Sau Dai Hoc');
/*!40000 ALTER TABLE `TrinhDo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ViTri`
--

DROP TABLE IF EXISTS `ViTri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ViTri` (
  `idViTri` int NOT NULL,
  `tenViTri` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idViTri`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ViTri`
--

LOCK TABLES `ViTri` WRITE;
/*!40000 ALTER TABLE `ViTri` DISABLE KEYS */;
INSERT INTO `ViTri` VALUES (1,'Le tan'),(2,'Phuc vu'),(3,'Chuyen vien'),(4,'Giam sat'),(5,'Quan ly'),(6,'Giam doc');
/*!40000 ALTER TABLE `ViTri` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-18 17:07:40

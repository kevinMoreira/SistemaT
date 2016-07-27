# ************************************************************
# Sequel Pro SQL dump
# Versão 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.6.21)
# Base de Dados: estoque
# Tempo de Geração: 2016-07-27 06:49:21 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump da tabela categoria
# ------------------------------------------------------------

DROP TABLE IF EXISTS `categoria`;

CREATE TABLE `categoria` (
  `idCategoria` int(11) NOT NULL AUTO_INCREMENT,
  `idOrganizacao` int(11) NOT NULL,
  `nomeCategoria` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1',
  `CadastroDataHora` datetime DEFAULT CURRENT_TIMESTAMP,
  `CadastroUsuarioId` int(11) DEFAULT NULL,
  `AtualizacaoDataHora` datetime DEFAULT NULL,
  `AtualizacaoUsuarioId` int(11) DEFAULT NULL,
  PRIMARY KEY (`idCategoria`),
  KEY `FK_categoria_idOrganizacao` (`idOrganizacao`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;

INSERT INTO `categoria` (`idCategoria`, `idOrganizacao`, `nomeCategoria`, `status`, `CadastroDataHora`, `CadastroUsuarioId`, `AtualizacaoDataHora`, `AtualizacaoUsuarioId`)
VALUES
	(22,1,'Salgados',b'1','2016-07-03 14:03:31',NULL,NULL,NULL),
	(23,1,'Doces',b'1','2016-07-03 14:03:38',NULL,NULL,NULL),
	(31,1,'asdsad',b'1','2016-07-27 03:39:38',NULL,NULL,NULL);

/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela cliente
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cliente`;

CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL AUTO_INCREMENT,
  `idOrganizacao` int(11) NOT NULL,
  `nome` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cpf` varchar(14) COLLATE utf8_unicode_ci NOT NULL,
  `data_nascimento` date NOT NULL,
  `telefone` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `celular` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cep` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `endereco` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `numero` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `complemento` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `bairro` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cidade` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `uf` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1',
  `CadastroDataHora` datetime DEFAULT CURRENT_TIMESTAMP,
  `CadastroUsuarioId` int(11) DEFAULT NULL,
  `AtualizacaoDataHora` datetime DEFAULT NULL,
  `AtualizacaoUsuarioId` int(11) DEFAULT NULL,
  PRIMARY KEY (`idCliente`),
  KEY `FK_cliente_idOrganizacao` (`idOrganizacao`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;

INSERT INTO `cliente` (`idCliente`, `idOrganizacao`, `nome`, `cpf`, `data_nascimento`, `telefone`, `celular`, `email`, `cep`, `endereco`, `numero`, `complemento`, `bairro`, `cidade`, `uf`, `status`, `CadastroDataHora`, `CadastroUsuarioId`, `AtualizacaoDataHora`, `AtualizacaoUsuarioId`)
VALUES
	(1,1,'nome','cpf','2011-01-01','tel','cel','email','cep','end','n','','bairro','cid','uf',b'1','2016-01-07 03:13:26',2,NULL,NULL),
	(2,1,'Carlos','1132','0000-00-00','123435','43321','car@los.com','1213','xxx','12','xxx','xx','xx','xx',b'1','2016-06-06 16:21:30',1,NULL,NULL),
	(3,1,'Kevin','1111','0000-00-00','111','112222','xxx','1212','xx','xx','xx','xxx','xx','xx',b'1','2016-06-06 16:44:12',1,NULL,NULL),
	(4,1,'Antonio','111111','0000-00-00','aaaaa','a','aaaaaa','a','aaa','aaa','aa','aa','aaaa','a',b'1','2016-06-06 16:46:18',1,NULL,NULL),
	(9,1,'b','b','2016-06-09','b','b','b','b','b','b','b','b','b','b',b'1','2016-06-06 18:30:07',1,NULL,NULL);

/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela conta
# ------------------------------------------------------------

DROP TABLE IF EXISTS `conta`;

CREATE TABLE `conta` (
  `idConta` int(11) NOT NULL AUTO_INCREMENT,
  `idCliente` int(11) NOT NULL,
  `saldoConta` decimal(10,2) NOT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1',
  `CadastroDataHora` datetime DEFAULT CURRENT_TIMESTAMP,
  `CadastroUsuarioId` int(11) DEFAULT NULL,
  `AtualizacaoDataHora` datetime DEFAULT NULL,
  `AtualizacaoUsuarioId` int(11) DEFAULT NULL,
  PRIMARY KEY (`idConta`),
  KEY `FK_conta_idCliente` (`idCliente`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump da tabela controle_menu
# ------------------------------------------------------------

DROP TABLE IF EXISTS `controle_menu`;

CREATE TABLE `controle_menu` (
  `idControlemenu` int(11) NOT NULL AUTO_INCREMENT,
  `idUsuario` int(11) NOT NULL,
  `idMenu` int(11) NOT NULL,
  `idOrganizacao` int(11) NOT NULL,
  `CadastroDataHora` datetime DEFAULT NULL,
  `CadastroUsuarioId` int(11) DEFAULT NULL,
  `AtualizacaoDataHora` datetime DEFAULT NULL,
  `AtualizacaoUsuarioId` int(11) DEFAULT NULL,
  PRIMARY KEY (`idControlemenu`),
  KEY `FK_controle_menu_idOrganizacao` (`idOrganizacao`),
  KEY `FK_controle_menu_idUsuario` (`idUsuario`),
  KEY `FK_controle_menu_idMenu` (`idMenu`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `controle_menu` WRITE;
/*!40000 ALTER TABLE `controle_menu` DISABLE KEYS */;

INSERT INTO `controle_menu` (`idControlemenu`, `idUsuario`, `idMenu`, `idOrganizacao`, `CadastroDataHora`, `CadastroUsuarioId`, `AtualizacaoDataHora`, `AtualizacaoUsuarioId`)
VALUES
	(221,2,7,1,NULL,NULL,NULL,NULL),
	(222,2,2,1,NULL,NULL,NULL,NULL),
	(223,2,6,1,NULL,NULL,NULL,NULL),
	(224,2,5,1,NULL,NULL,NULL,NULL),
	(225,2,9,1,NULL,NULL,NULL,NULL),
	(226,227,2,210,'2016-01-06 16:03:18',NULL,NULL,NULL),
	(227,227,4,210,'2016-01-06 16:03:18',NULL,NULL,NULL),
	(228,227,5,210,'2016-01-06 16:03:18',NULL,NULL,NULL),
	(229,227,6,210,'2016-01-06 16:03:18',NULL,NULL,NULL),
	(230,227,7,210,'2016-01-06 16:03:18',NULL,NULL,NULL),
	(231,227,8,210,'2016-01-06 16:03:18',NULL,NULL,NULL),
	(232,227,9,210,'2016-01-06 16:03:18',NULL,NULL,NULL),
	(233,254,2,1,NULL,NULL,NULL,NULL),
	(234,254,6,1,NULL,NULL,NULL,NULL),
	(235,255,2,1,NULL,NULL,NULL,NULL),
	(236,255,6,1,NULL,NULL,NULL,NULL),
	(237,257,2,226,'2016-07-06 21:44:07',NULL,NULL,NULL),
	(238,257,5,226,'2016-07-06 21:44:07',NULL,NULL,NULL),
	(239,257,6,226,'2016-07-06 21:44:07',NULL,NULL,NULL),
	(240,257,7,226,'2016-07-06 21:44:07',NULL,NULL,NULL),
	(241,257,9,226,'2016-07-06 21:44:07',NULL,NULL,NULL),
	(242,258,2,227,'2016-07-06 21:54:45',NULL,NULL,NULL),
	(243,258,5,227,'2016-07-06 21:54:45',NULL,NULL,NULL),
	(244,258,6,227,'2016-07-06 21:54:45',NULL,NULL,NULL),
	(245,258,7,227,'2016-07-06 21:54:45',NULL,NULL,NULL),
	(246,258,9,227,'2016-07-06 21:54:45',NULL,NULL,NULL),
	(247,259,2,228,'2016-07-06 22:13:59',NULL,NULL,NULL),
	(248,259,5,228,'2016-07-06 22:13:59',NULL,NULL,NULL),
	(249,259,6,228,'2016-07-06 22:13:59',NULL,NULL,NULL),
	(250,259,7,228,'2016-07-06 22:13:59',NULL,NULL,NULL),
	(251,259,9,228,'2016-07-06 22:13:59',NULL,NULL,NULL),
	(252,260,2,229,'2016-07-06 22:16:13',NULL,NULL,NULL),
	(253,260,5,229,'2016-07-06 22:16:13',NULL,NULL,NULL),
	(254,260,6,229,'2016-07-06 22:16:13',NULL,NULL,NULL),
	(255,260,7,229,'2016-07-06 22:16:13',NULL,NULL,NULL),
	(256,260,9,229,'2016-07-06 22:16:13',NULL,NULL,NULL);

/*!40000 ALTER TABLE `controle_menu` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela controle_submenu
# ------------------------------------------------------------

DROP TABLE IF EXISTS `controle_submenu`;

CREATE TABLE `controle_submenu` (
  `idControleSubMenu` int(11) NOT NULL AUTO_INCREMENT,
  `idUsuario` int(11) NOT NULL,
  `idSubMenu` int(11) NOT NULL,
  `idOrganizacao` int(11) NOT NULL,
  `CadastroDataHora` datetime DEFAULT CURRENT_TIMESTAMP,
  `CadastroUsuarioId` int(11) DEFAULT NULL,
  `AtualizacaoDataHora` datetime DEFAULT NULL,
  `AtualizacaoUsuarioId` int(11) DEFAULT NULL,
  PRIMARY KEY (`idControleSubMenu`),
  KEY `FK_controle_submenu_idOrganizacao` (`idOrganizacao`),
  KEY `FK_controle_submenu_idUsuario` (`idUsuario`),
  KEY `FK_controle_submenu_idSubMenu` (`idSubMenu`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `controle_submenu` WRITE;
/*!40000 ALTER TABLE `controle_submenu` DISABLE KEYS */;

INSERT INTO `controle_submenu` (`idControleSubMenu`, `idUsuario`, `idSubMenu`, `idOrganizacao`, `CadastroDataHora`, `CadastroUsuarioId`, `AtualizacaoDataHora`, `AtualizacaoUsuarioId`)
VALUES
	(406,2,1,1,NULL,NULL,NULL,NULL),
	(407,2,2,1,NULL,NULL,NULL,NULL),
	(408,2,3,1,NULL,NULL,NULL,NULL),
	(409,2,4,1,NULL,NULL,NULL,NULL),
	(410,2,6,1,NULL,NULL,NULL,NULL),
	(411,2,9,1,NULL,NULL,NULL,NULL),
	(412,2,7,1,NULL,NULL,NULL,NULL),
	(413,2,8,1,NULL,NULL,NULL,NULL),
	(414,2,10,1,NULL,NULL,NULL,NULL),
	(415,2,11,1,NULL,NULL,NULL,NULL),
	(416,2,12,1,NULL,NULL,NULL,NULL),
	(417,2,13,1,NULL,NULL,NULL,NULL),
	(418,2,14,1,NULL,NULL,NULL,NULL),
	(419,2,15,1,NULL,NULL,NULL,NULL),
	(420,227,1,210,'2016-01-06 16:03:18',NULL,NULL,NULL),
	(421,227,2,210,'2016-01-06 16:03:18',NULL,NULL,NULL),
	(422,227,3,210,'2016-01-06 16:03:18',NULL,NULL,NULL),
	(423,227,4,210,'2016-01-06 16:03:18',NULL,NULL,NULL),
	(424,227,5,210,'2016-01-06 16:03:18',NULL,NULL,NULL),
	(425,227,6,210,'2016-01-06 16:03:18',NULL,NULL,NULL),
	(426,227,7,210,'2016-01-06 16:03:18',NULL,NULL,NULL),
	(427,227,8,210,'2016-01-06 16:03:18',NULL,NULL,NULL),
	(428,227,9,210,'2016-01-06 16:03:18',NULL,NULL,NULL),
	(429,227,10,210,'2016-01-06 16:03:18',NULL,NULL,NULL),
	(430,227,11,210,'2016-01-06 16:03:18',NULL,NULL,NULL),
	(431,227,12,210,'2016-01-06 16:03:18',NULL,NULL,NULL),
	(432,227,13,210,'2016-01-06 16:03:18',NULL,NULL,NULL),
	(433,227,14,210,'2016-01-06 16:03:18',NULL,NULL,NULL),
	(434,227,15,210,'2016-01-06 16:03:18',NULL,NULL,NULL),
	(435,254,9,1,'2016-06-13 23:23:59',NULL,NULL,NULL),
	(436,255,9,1,'2016-06-13 23:27:15',NULL,NULL,NULL),
	(437,2,16,1,'2016-07-02 18:32:49',NULL,NULL,NULL),
	(438,2,17,1,'2016-07-02 18:33:40',NULL,NULL,NULL),
	(439,257,1,226,'2016-07-06 21:44:07',NULL,NULL,NULL),
	(440,257,2,226,'2016-07-06 21:44:07',NULL,NULL,NULL),
	(441,257,3,226,'2016-07-06 21:44:07',NULL,NULL,NULL),
	(442,257,4,226,'2016-07-06 21:44:07',NULL,NULL,NULL),
	(443,257,5,226,'2016-07-06 21:44:07',NULL,NULL,NULL),
	(444,257,6,226,'2016-07-06 21:44:07',NULL,NULL,NULL),
	(445,257,7,226,'2016-07-06 21:44:07',NULL,NULL,NULL),
	(446,257,8,226,'2016-07-06 21:44:07',NULL,NULL,NULL),
	(447,257,9,226,'2016-07-06 21:44:07',NULL,NULL,NULL),
	(448,257,10,226,'2016-07-06 21:44:07',NULL,NULL,NULL),
	(449,257,11,226,'2016-07-06 21:44:07',NULL,NULL,NULL),
	(450,257,12,226,'2016-07-06 21:44:07',NULL,NULL,NULL),
	(451,257,13,226,'2016-07-06 21:44:07',NULL,NULL,NULL),
	(452,257,14,226,'2016-07-06 21:44:07',NULL,NULL,NULL),
	(453,257,15,226,'2016-07-06 21:44:07',NULL,NULL,NULL),
	(454,257,16,226,'2016-07-06 21:44:07',NULL,NULL,NULL),
	(455,257,17,226,'2016-07-06 21:44:07',NULL,NULL,NULL),
	(456,258,1,227,'2016-07-06 21:54:45',NULL,NULL,NULL),
	(457,258,2,227,'2016-07-06 21:54:45',NULL,NULL,NULL),
	(458,258,3,227,'2016-07-06 21:54:45',NULL,NULL,NULL),
	(459,258,4,227,'2016-07-06 21:54:45',NULL,NULL,NULL),
	(460,258,5,227,'2016-07-06 21:54:45',NULL,NULL,NULL),
	(461,258,6,227,'2016-07-06 21:54:45',NULL,NULL,NULL),
	(462,258,7,227,'2016-07-06 21:54:45',NULL,NULL,NULL),
	(463,258,8,227,'2016-07-06 21:54:45',NULL,NULL,NULL),
	(464,258,9,227,'2016-07-06 21:54:45',NULL,NULL,NULL),
	(465,258,10,227,'2016-07-06 21:54:45',NULL,NULL,NULL),
	(466,258,11,227,'2016-07-06 21:54:45',NULL,NULL,NULL),
	(467,258,12,227,'2016-07-06 21:54:45',NULL,NULL,NULL),
	(468,258,13,227,'2016-07-06 21:54:45',NULL,NULL,NULL),
	(469,258,14,227,'2016-07-06 21:54:45',NULL,NULL,NULL),
	(470,258,15,227,'2016-07-06 21:54:45',NULL,NULL,NULL),
	(471,258,16,227,'2016-07-06 21:54:45',NULL,NULL,NULL),
	(472,258,17,227,'2016-07-06 21:54:45',NULL,NULL,NULL),
	(473,259,1,228,'2016-07-06 22:13:59',NULL,NULL,NULL),
	(474,259,2,228,'2016-07-06 22:13:59',NULL,NULL,NULL),
	(475,259,3,228,'2016-07-06 22:13:59',NULL,NULL,NULL),
	(476,259,4,228,'2016-07-06 22:13:59',NULL,NULL,NULL),
	(477,259,5,228,'2016-07-06 22:13:59',NULL,NULL,NULL),
	(478,259,6,228,'2016-07-06 22:13:59',NULL,NULL,NULL),
	(479,259,7,228,'2016-07-06 22:13:59',NULL,NULL,NULL),
	(480,259,8,228,'2016-07-06 22:13:59',NULL,NULL,NULL),
	(481,259,9,228,'2016-07-06 22:13:59',NULL,NULL,NULL),
	(482,259,10,228,'2016-07-06 22:13:59',NULL,NULL,NULL),
	(483,259,11,228,'2016-07-06 22:13:59',NULL,NULL,NULL),
	(484,259,12,228,'2016-07-06 22:13:59',NULL,NULL,NULL),
	(485,259,13,228,'2016-07-06 22:13:59',NULL,NULL,NULL),
	(486,259,14,228,'2016-07-06 22:13:59',NULL,NULL,NULL),
	(487,259,15,228,'2016-07-06 22:13:59',NULL,NULL,NULL),
	(488,259,16,228,'2016-07-06 22:13:59',NULL,NULL,NULL),
	(489,259,17,228,'2016-07-06 22:13:59',NULL,NULL,NULL),
	(490,260,1,229,'2016-07-06 22:16:13',NULL,NULL,NULL),
	(491,260,2,229,'2016-07-06 22:16:13',NULL,NULL,NULL),
	(492,260,3,229,'2016-07-06 22:16:13',NULL,NULL,NULL),
	(493,260,4,229,'2016-07-06 22:16:13',NULL,NULL,NULL),
	(494,260,5,229,'2016-07-06 22:16:13',NULL,NULL,NULL),
	(495,260,6,229,'2016-07-06 22:16:13',NULL,NULL,NULL),
	(496,260,7,229,'2016-07-06 22:16:13',NULL,NULL,NULL),
	(497,260,8,229,'2016-07-06 22:16:13',NULL,NULL,NULL),
	(498,260,9,229,'2016-07-06 22:16:13',NULL,NULL,NULL),
	(499,260,10,229,'2016-07-06 22:16:13',NULL,NULL,NULL),
	(500,260,11,229,'2016-07-06 22:16:13',NULL,NULL,NULL),
	(501,260,12,229,'2016-07-06 22:16:13',NULL,NULL,NULL),
	(502,260,13,229,'2016-07-06 22:16:13',NULL,NULL,NULL),
	(503,260,14,229,'2016-07-06 22:16:13',NULL,NULL,NULL),
	(504,260,15,229,'2016-07-06 22:16:13',NULL,NULL,NULL),
	(505,260,16,229,'2016-07-06 22:16:13',NULL,NULL,NULL),
	(506,260,17,229,'2016-07-06 22:16:13',NULL,NULL,NULL);

/*!40000 ALTER TABLE `controle_submenu` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela departamento
# ------------------------------------------------------------

DROP TABLE IF EXISTS `departamento`;

CREATE TABLE `departamento` (
  `idDepartamento` int(11) NOT NULL AUTO_INCREMENT,
  `idOrganizacao` int(11) NOT NULL,
  `nome` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1',
  `CadastroDataHora` datetime DEFAULT CURRENT_TIMESTAMP,
  `CadastroUsuarioId` int(11) DEFAULT NULL,
  `AtualizacaoDataHora` datetime DEFAULT NULL,
  `AtualizacaoUsuarioId` int(11) DEFAULT NULL,
  PRIMARY KEY (`idDepartamento`),
  KEY `FK_departamento_idOrganizacao` (`idOrganizacao`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;

INSERT INTO `departamento` (`idDepartamento`, `idOrganizacao`, `nome`, `status`, `CadastroDataHora`, `CadastroUsuarioId`, `AtualizacaoDataHora`, `AtualizacaoUsuarioId`)
VALUES
	(1,3,'Comercial',b'1',NULL,NULL,NULL,NULL),
	(2,3,'Outsourcing',b'1',NULL,NULL,NULL,NULL),
	(3,1,'Soluções',b'1',NULL,NULL,NULL,NULL),
	(4,3,'Infraestrutura',b'1',NULL,NULL,NULL,NULL),
	(5,3,'RH',b'1',NULL,NULL,NULL,NULL),
	(6,3,'Vendas',b'1',NULL,NULL,NULL,NULL),
	(7,1,'Comercial',b'1',NULL,NULL,NULL,NULL),
	(8,1,'Outsourcing',b'1',NULL,NULL,NULL,NULL),
	(9,1,'Soluções',b'1',NULL,NULL,NULL,NULL),
	(10,1,'RH',b'1',NULL,NULL,NULL,NULL),
	(11,1,'infraestrutura',b'1',NULL,NULL,NULL,NULL),
	(12,2,'Comercial',b'1',NULL,NULL,NULL,NULL),
	(13,2,'Outsourcing',b'1',NULL,NULL,NULL,NULL),
	(14,2,'Soluções',b'1',NULL,NULL,NULL,NULL),
	(15,2,'RH',b'1',NULL,NULL,NULL,NULL),
	(16,2,'infraestrutura',b'1',NULL,NULL,NULL,NULL);

/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela fornecedor
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fornecedor`;

CREATE TABLE `fornecedor` (
  `idFornecedor` int(11) NOT NULL AUTO_INCREMENT,
  `idOrganizacao` int(11) NOT NULL,
  `nome` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cnpj` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `telefone` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cep` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `endereco` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `numero` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `complemento` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `bairro` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `cidade` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `estado` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `status` bit(1) NOT NULL,
  `CadastroDataHora` datetime DEFAULT NULL,
  `CadastroUsuarioId` int(11) DEFAULT NULL,
  `AtualizacaoDataHora` datetime DEFAULT NULL,
  `AtualizacaoUsuarioId` int(11) DEFAULT NULL,
  PRIMARY KEY (`idFornecedor`),
  KEY `FK_fornecedor_idOrganizacao` (`idOrganizacao`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `fornecedor` WRITE;
/*!40000 ALTER TABLE `fornecedor` DISABLE KEYS */;

INSERT INTO `fornecedor` (`idFornecedor`, `idOrganizacao`, `nome`, `cnpj`, `telefone`, `email`, `cep`, `endereco`, `numero`, `complemento`, `bairro`, `cidade`, `estado`, `status`, `CadastroDataHora`, `CadastroUsuarioId`, `AtualizacaoDataHora`, `AtualizacaoUsuarioId`)
VALUES
	(1,210,'S','S','S','S','S','S','S','S','S','S','S',b'1','2016-01-07 05:47:54',227,NULL,NULL),
	(2,1,'a','a','a','a','a','a','a','a','a','a','a',b'1','2016-01-09 14:01:22',2,NULL,NULL),
	(3,1,'Doceria São João','121132323','43232143','sac@saojoao.com','123','Rua dos Palmares','23','','São Mateus','São Paulo','SP',b'1',NULL,NULL,NULL,NULL),
	(4,1,'Bombril','34576','12243','sac@bombril.com','1212312','Rua Sol','12','','Santa Adélia','São Paulo','SP',b'1',NULL,NULL,NULL,NULL),
	(5,1,'São Sergio','77.628.339/','99919991','sac@saosergio.com.br','098','Rua dos Palmares','21','','São Mateus','São Paulo','SP',b'1',NULL,NULL,NULL,NULL),
	(6,1,'José','1213','123','ze@ze.com','123','rua xxx','123','','São Mateus','São Paulo','Sp',b'1',NULL,NULL,NULL,NULL);

/*!40000 ALTER TABLE `fornecedor` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela item_venda
# ------------------------------------------------------------

DROP TABLE IF EXISTS `item_venda`;

CREATE TABLE `item_venda` (
  `idItem` int(11) NOT NULL AUTO_INCREMENT,
  `idVenda` int(11) NOT NULL,
  `idProduto` int(11) NOT NULL,
  `qtde` int(11) NOT NULL DEFAULT '1',
  `valorUnitario` float NOT NULL,
  `cancelado` bit(1) NOT NULL COMMENT 'se for 1 é cancelado',
  `CadastroDataHora` datetime DEFAULT CURRENT_TIMESTAMP,
  `CadastroUsuarioId` int(11) DEFAULT NULL,
  `AtualizacaoDataHora` datetime DEFAULT NULL,
  `AtualizacaoUsuarioId` int(11) DEFAULT NULL,
  PRIMARY KEY (`idItem`),
  KEY `FK_item_venda_idVenda` (`idVenda`),
  KEY `FK_item_venda_idProduto` (`idProduto`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `item_venda` WRITE;
/*!40000 ALTER TABLE `item_venda` DISABLE KEYS */;

INSERT INTO `item_venda` (`idItem`, `idVenda`, `idProduto`, `qtde`, `valorUnitario`, `cancelado`, `CadastroDataHora`, `CadastroUsuarioId`, `AtualizacaoDataHora`, `AtualizacaoUsuarioId`)
VALUES
	(154,169,30,10,5,b'0','2016-07-04 23:53:28',NULL,NULL,NULL),
	(153,168,30,100,5,b'0','2016-07-04 23:53:05',NULL,NULL,NULL),
	(152,167,31,60,30,b'0','2016-07-04 23:29:27',NULL,NULL,NULL),
	(151,166,30,51,5,b'0','2016-07-04 23:29:17',NULL,NULL,NULL),
	(150,165,30,38,5,b'0','2016-07-04 23:28:44',NULL,NULL,NULL),
	(149,164,30,10,5,b'0','2016-07-04 23:26:19',NULL,NULL,NULL),
	(148,163,30,30,5,b'0','2016-07-04 23:26:08',NULL,NULL,NULL),
	(147,162,30,33,5,b'0','2016-07-04 23:22:24',NULL,NULL,NULL),
	(146,161,30,50,5,b'0','2016-07-03 19:08:55',NULL,NULL,NULL),
	(145,160,30,49,5,b'0','2016-07-03 19:08:15',NULL,NULL,NULL),
	(144,159,30,2,5,b'0','2016-07-03 17:35:55',NULL,NULL,NULL),
	(143,158,30,49,5,b'0','2016-07-03 17:35:01',NULL,NULL,NULL);

/*!40000 ALTER TABLE `item_venda` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela ItemVendaLoteProdutos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ItemVendaLoteProdutos`;

CREATE TABLE `ItemVendaLoteProdutos` (
  `ItemVendaId` int(11) NOT NULL,
  `LoteProdutoId` int(11) NOT NULL,
  `Quantidade` int(11) NOT NULL,
  PRIMARY KEY (`ItemVendaId`,`LoteProdutoId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `ItemVendaLoteProdutos` WRITE;
/*!40000 ALTER TABLE `ItemVendaLoteProdutos` DISABLE KEYS */;

INSERT INTO `ItemVendaLoteProdutos` (`ItemVendaId`, `LoteProdutoId`, `Quantidade`)
VALUES
	(143,67,49),
	(144,66,1),
	(144,67,1),
	(145,66,49),
	(146,68,50),
	(147,70,33),
	(148,70,30),
	(149,70,10),
	(150,70,38),
	(151,69,51),
	(152,71,60),
	(153,69,49),
	(153,72,51),
	(154,72,10);

/*!40000 ALTER TABLE `ItemVendaLoteProdutos` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela logacessosusuarios
# ------------------------------------------------------------

DROP TABLE IF EXISTS `logacessosusuarios`;

CREATE TABLE `logacessosusuarios` (
  `LogAcessoUsuarioId` int(11) NOT NULL AUTO_INCREMENT,
  `UsuarioId` int(11) NOT NULL,
  `CadastroDataHora` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`LogAcessoUsuarioId`),
  KEY `FK_LogAcessosUsuarios_idUsuario` (`UsuarioId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `logacessosusuarios` WRITE;
/*!40000 ALTER TABLE `logacessosusuarios` DISABLE KEYS */;

INSERT INTO `logacessosusuarios` (`LogAcessoUsuarioId`, `UsuarioId`, `CadastroDataHora`)
VALUES
	(20,2,'2016-01-07 11:37:44'),
	(19,2,'2016-01-07 11:04:33'),
	(18,227,'2016-01-07 10:31:56'),
	(17,227,'2016-01-07 10:19:20'),
	(16,227,'2016-01-07 10:15:32'),
	(15,227,'2016-01-07 10:13:23'),
	(14,227,'2016-01-07 05:47:11'),
	(13,227,'2016-01-07 05:43:02'),
	(12,227,'2016-01-07 05:36:07'),
	(11,227,'2016-01-07 05:29:23'),
	(21,227,'2016-01-07 14:14:39'),
	(22,227,'2016-01-08 10:18:28'),
	(23,227,'2016-01-08 15:35:05'),
	(24,2,'2016-01-09 13:57:27');

/*!40000 ALTER TABLE `logacessosusuarios` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela loteprodutos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `loteprodutos`;

CREATE TABLE `loteprodutos` (
  `idLote` int(11) NOT NULL AUTO_INCREMENT,
  `idOrganizacao` int(11) NOT NULL,
  `idProduto` int(11) NOT NULL,
  `idFornecedor` int(11) NOT NULL,
  `valorCompra` float NOT NULL,
  `qtde` int(11) NOT NULL,
  `validade` date NOT NULL,
  `data` date NOT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1',
  `CadastroDataHora` datetime DEFAULT NULL,
  `CadastroUsuarioId` int(11) DEFAULT NULL,
  `AtualizacaoDataHora` datetime DEFAULT NULL,
  `AtualizacaoUsuarioId` int(11) DEFAULT NULL,
  PRIMARY KEY (`idLote`),
  KEY `FK_loteprodutos_idOrganizacao` (`idOrganizacao`),
  KEY `FK_loteprodutos_idFornecedor` (`idFornecedor`),
  KEY `FK_loteprodutos_idProduto` (`idProduto`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `loteprodutos` WRITE;
/*!40000 ALTER TABLE `loteprodutos` DISABLE KEYS */;

INSERT INTO `loteprodutos` (`idLote`, `idOrganizacao`, `idProduto`, `idFornecedor`, `valorCompra`, `qtde`, `validade`, `data`, `status`, `CadastroDataHora`, `CadastroUsuarioId`, `AtualizacaoDataHora`, `AtualizacaoUsuarioId`)
VALUES
	(72,1,30,3,1,100,'2016-11-11','2016-07-04',b'1',NULL,NULL,NULL,NULL),
	(71,1,31,3,11,133,'2016-07-29','2016-07-04',b'1',NULL,NULL,NULL,NULL),
	(70,1,30,5,2,111,'2016-07-13','2016-07-04',b'0',NULL,NULL,NULL,NULL),
	(69,1,30,3,1,100,'2016-09-06','2016-07-04',b'0',NULL,NULL,NULL,NULL),
	(68,1,30,4,2,50,'2016-11-21','2016-07-03',b'0',NULL,NULL,NULL,NULL),
	(67,1,30,4,2,50,'2016-08-16','2016-07-03',b'0',NULL,NULL,NULL,NULL),
	(66,1,30,3,1,50,'2016-09-06','2016-07-03',b'0',NULL,NULL,NULL,NULL),
	(73,1,30,3,1,10,'2016-11-23','2016-07-04',b'1',NULL,NULL,NULL,NULL),
	(74,1,31,3,9,10,'2016-07-03','2016-07-04',b'1',NULL,NULL,NULL,NULL);

/*!40000 ALTER TABLE `loteprodutos` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela loteprodutosbaixa
# ------------------------------------------------------------

DROP TABLE IF EXISTS `loteprodutosbaixa`;

CREATE TABLE `loteprodutosbaixa` (
  `LoteProdutoBaixaId` int(11) NOT NULL AUTO_INCREMENT,
  `LoteProdutosId` int(11) DEFAULT NULL,
  `Quantidade` int(11) NOT NULL DEFAULT '0',
  `CadastroDataHora` datetime DEFAULT CURRENT_TIMESTAMP,
  `CadastroUsuarioId` int(11) DEFAULT NULL,
  `FlagStatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`LoteProdutoBaixaId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `loteprodutosbaixa` WRITE;
/*!40000 ALTER TABLE `loteprodutosbaixa` DISABLE KEYS */;

INSERT INTO `loteprodutosbaixa` (`LoteProdutoBaixaId`, `LoteProdutosId`, `Quantidade`, `CadastroDataHora`, `CadastroUsuarioId`, `FlagStatus`)
VALUES
	(68,66,0,'2016-07-03 19:08:15',2,b'0'),
	(69,67,0,'2016-07-03 17:35:55',2,b'0'),
	(70,68,0,'2016-07-03 19:08:55',2,b'0'),
	(71,69,0,'2016-07-04 23:53:05',2,b'0'),
	(72,70,0,'2016-07-04 23:28:44',2,b'0'),
	(73,71,73,'2016-07-04 23:29:27',2,b'1'),
	(74,72,39,'2016-07-04 23:53:28',2,b'1'),
	(75,73,10,'2016-07-04 00:00:00',2,b'1'),
	(76,74,10,'2016-07-04 00:00:00',2,b'1');

/*!40000 ALTER TABLE `loteprodutosbaixa` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela menu
# ------------------------------------------------------------

DROP TABLE IF EXISTS `menu`;

CREATE TABLE `menu` (
  `idMenu` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) COLLATE utf8_unicode_ci DEFAULT '',
  `link` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `status` int(11) NOT NULL,
  `CadastroDataHora` datetime DEFAULT NULL,
  `CadastroUsuarioId` int(11) DEFAULT NULL,
  `AtualizacaoDataHora` datetime DEFAULT NULL,
  `AtualizacaoUsuarioId` int(11) DEFAULT NULL,
  PRIMARY KEY (`idMenu`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;

INSERT INTO `menu` (`idMenu`, `nome`, `link`, `status`, `CadastroDataHora`, `CadastroUsuarioId`, `AtualizacaoDataHora`, `AtualizacaoUsuarioId`)
VALUES
	(2,'Caixa','caixa.html',1,NULL,NULL,NULL,NULL),
	(5,'Relatórios','',1,NULL,NULL,NULL,NULL),
	(6,'Despesas','',1,NULL,NULL,NULL,NULL),
	(7,'Cadastros','',1,NULL,NULL,NULL,NULL),
	(8,'Contate o desenvolvedor','',0,NULL,NULL,NULL,NULL),
	(9,'Visualizar','',1,NULL,NULL,NULL,NULL);

/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela organizacao
# ------------------------------------------------------------

DROP TABLE IF EXISTS `organizacao`;

CREATE TABLE `organizacao` (
  `idOrganizacao` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `CadastroDataHora` datetime DEFAULT CURRENT_TIMESTAMP,
  `CadastroUsuarioId` int(11) DEFAULT NULL,
  `AtualizacaoDataHora` datetime DEFAULT NULL,
  `AtualizacaoUsuarioId` int(11) DEFAULT NULL,
  `Cnpj` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Telefone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Cep` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Complemento` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`idOrganizacao`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `organizacao` WRITE;
/*!40000 ALTER TABLE `organizacao` DISABLE KEYS */;

INSERT INTO `organizacao` (`idOrganizacao`, `nome`, `status`, `CadastroDataHora`, `CadastroUsuarioId`, `AtualizacaoDataHora`, `AtualizacaoUsuarioId`, `Cnpj`, `Telefone`, `Email`, `Cep`, `Complemento`)
VALUES
	(1,'Processor',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(2,'IBM',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(3,'Microsoft',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(210,'Gipentec',1,'2016-01-06 16:03:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(211,'São Sergio',1,'2016-06-05 13:51:55',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(212,'São Sergio',1,'2016-06-05 14:43:31',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(216,'z',1,'2016-06-05 17:09:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(217,'a',1,'2016-06-05 18:43:43',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(218,'a',1,'2016-06-05 18:44:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(219,'',1,'2016-06-05 19:59:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(220,'',1,'2016-06-05 20:00:35',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(221,'',1,'2016-06-05 20:05:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(222,'',1,'2016-06-05 20:05:57',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(223,'',1,'2016-06-05 20:08:43',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(224,'',1,'2016-06-05 20:11:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(225,'Teste 20160706',1,'2016-07-06 11:28:45',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(226,'kkkk',1,'2016-07-06 21:44:07',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(227,'sdfsdfs',1,'2016-07-06 21:54:45',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(228,'uu',1,'2016-07-06 22:13:59',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(229,'Teste 201607061142',1,'2016-07-06 22:16:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*!40000 ALTER TABLE `organizacao` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela pagamento
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pagamento`;

CREATE TABLE `pagamento` (
  `idPagamento` int(11) NOT NULL AUTO_INCREMENT,
  `idOrganizacao` int(11) NOT NULL,
  `idCliente` int(11) NOT NULL,
  `valor` float NOT NULL,
  `data` date NOT NULL,
  `hora` time NOT NULL,
  `CadastroDataHora` datetime DEFAULT NULL,
  `CadastroUsuarioId` int(11) DEFAULT NULL,
  `AtualizacaoDataHora` datetime DEFAULT NULL,
  `AtualizacaoUsuarioId` int(11) DEFAULT NULL,
  PRIMARY KEY (`idPagamento`),
  KEY `FK_pagamento_idOrganizacao` (`idOrganizacao`),
  KEY `FK_pagamento_idCliente` (`idCliente`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump da tabela perdas
# ------------------------------------------------------------

DROP TABLE IF EXISTS `perdas`;

CREATE TABLE `perdas` (
  `idPerda` int(11) NOT NULL AUTO_INCREMENT,
  `idOrganizacao` int(11) NOT NULL,
  `idLote` int(11) NOT NULL,
  `qtde` int(11) NOT NULL,
  `dataPerda` date NOT NULL,
  `motivoPerda` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CadastroDataHora` datetime DEFAULT NULL,
  `CadastroUsuarioId` int(11) DEFAULT NULL,
  `AtualizacaoDataHora` datetime DEFAULT NULL,
  `AtualizacaoUsuarioId` int(11) DEFAULT NULL,
  PRIMARY KEY (`idPerda`),
  KEY `FK_perdas_idOrganizacao` (`idOrganizacao`),
  KEY `FK_perdas_idLote` (`idLote`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump da tabela permissoes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `permissoes`;

CREATE TABLE `permissoes` (
  `idPermissao` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) COLLATE utf8_unicode_ci DEFAULT '',
  `ativo` bit(1) DEFAULT b'1',
  `CadastroDataHora` datetime DEFAULT CURRENT_TIMESTAMP,
  `CadastroUsuarioId` int(11) DEFAULT NULL,
  `AtualizacaoDataHora` datetime DEFAULT NULL,
  `AtualizacaoUsuarioId` int(11) DEFAULT NULL,
  PRIMARY KEY (`idPermissao`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `permissoes` WRITE;
/*!40000 ALTER TABLE `permissoes` DISABLE KEYS */;

INSERT INTO `permissoes` (`idPermissao`, `nome`, `ativo`, `CadastroDataHora`, `CadastroUsuarioId`, `AtualizacaoDataHora`, `AtualizacaoUsuarioId`)
VALUES
	(1,'Adm',b'1',NULL,NULL,NULL,NULL),
	(2,'User',b'1',NULL,NULL,NULL,NULL);

/*!40000 ALTER TABLE `permissoes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela produto
# ------------------------------------------------------------

DROP TABLE IF EXISTS `produto`;

CREATE TABLE `produto` (
  `idProduto` int(11) NOT NULL AUTO_INCREMENT,
  `idCategoria` int(11) NOT NULL,
  `nome` varchar(30) CHARACTER SET utf8 NOT NULL,
  `valorVenda` float NOT NULL,
  `status` bit(1) NOT NULL,
  `CadastroDataHora` datetime DEFAULT NULL,
  `CadastroUsuarioId` int(11) DEFAULT NULL,
  `DataMinimaAvisoVencimento` int(11) DEFAULT NULL,
  `QuantidadeMinima` int(11) DEFAULT NULL,
  `AtualizacaoDataHora` datetime DEFAULT NULL,
  `AtualizacaoUsuarioId` int(11) DEFAULT NULL,
  `CodigoDeBarras` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `idOrganizacao` int(11) NOT NULL,
  PRIMARY KEY (`idProduto`,`idOrganizacao`),
  KEY `FK_produto_idCategoria` (`idCategoria`),
  KEY `fk_produto_organizacao1_idx` (`idOrganizacao`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;

INSERT INTO `produto` (`idProduto`, `idCategoria`, `nome`, `valorVenda`, `status`, `CadastroDataHora`, `CadastroUsuarioId`, `DataMinimaAvisoVencimento`, `QuantidadeMinima`, `AtualizacaoDataHora`, `AtualizacaoUsuarioId`, `CodigoDeBarras`, `idOrganizacao`)
VALUES
	(30,22,'Coxinha',5,b'1','2016-07-03 14:04:02',NULL,NULL,NULL,NULL,NULL,'123',1),
	(31,23,'Torta',30,b'1','2016-07-03 14:04:34',NULL,NULL,NULL,'2016-07-03 14:09:49',NULL,'1234',1);

/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela sub_menu
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sub_menu`;

CREATE TABLE `sub_menu` (
  `idSubMenu` int(11) NOT NULL AUTO_INCREMENT,
  `idMenu` int(11) NOT NULL,
  `nome` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `link` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `status` int(11) NOT NULL,
  `CadastroDataHora` datetime DEFAULT NULL,
  `CadastroUsuarioId` int(11) DEFAULT NULL,
  `AtualizacaoDataHora` datetime DEFAULT NULL,
  `AtualizacaoUsuarioId` int(11) DEFAULT NULL,
  PRIMARY KEY (`idSubMenu`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sub_menu` WRITE;
/*!40000 ALTER TABLE `sub_menu` DISABLE KEYS */;

INSERT INTO `sub_menu` (`idSubMenu`, `idMenu`, `nome`, `link`, `status`, `CadastroDataHora`, `CadastroUsuarioId`, `AtualizacaoDataHora`, `AtualizacaoUsuarioId`)
VALUES
	(1,7,'Cadastro de Clientes','cadastro-de-clientes.html',1,NULL,NULL,NULL,NULL),
	(2,7,'Cadastro de Produtos','cadastro-de-produtos.html',1,NULL,NULL,NULL,NULL),
	(3,7,'Cadastro de Usuários','cadastro-de-usuarios.html',1,NULL,NULL,NULL,NULL),
	(4,7,'Cadastro de Fornecedores','cadastro-de-fornecedores.html',1,NULL,NULL,NULL,NULL),
	(5,7,'Cadastro de Serviços','cadastro-de-servicos.html',1,NULL,NULL,NULL,NULL),
	(6,7,'Cadastro de Categoria','cadastro-de-categorias.html',1,NULL,NULL,NULL,NULL),
	(7,5,'Relatório Diário','php/Relatorios/relatorioDiario.php',1,NULL,NULL,NULL,NULL),
	(8,5,'Relatório Semanal','php/Relatorios/relatorioSemanal.php',1,NULL,NULL,NULL,NULL),
	(9,6,'Compra de Produtos','compra-de-produtos.html',1,NULL,NULL,NULL,NULL),
	(10,9,'Clientes','listar-clientes.html',1,NULL,NULL,NULL,NULL),
	(11,9,'Usuários','listar-usuarios.html',1,NULL,NULL,NULL,NULL),
	(12,9,'Produtos','listar-produtos.html',1,NULL,NULL,NULL,NULL),
	(13,9,'Fornecedores','listar-fornecedores.html',1,NULL,NULL,NULL,NULL),
	(14,9,'Lotes','listar-lotes.html',1,NULL,NULL,NULL,NULL),
	(15,9,'Estoque','listar-estoque.html',1,NULL,NULL,NULL,NULL),
	(16,5,'Relatório Mensal','php/Relatorios/relatorioMensal.php',1,NULL,NULL,NULL,NULL),
	(17,5,'Relatório Personalizado','php/Relatorios/relatorioPersonalizado.php',1,NULL,NULL,NULL,NULL);

/*!40000 ALTER TABLE `sub_menu` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela SuperCategorias
# ------------------------------------------------------------

DROP TABLE IF EXISTS `SuperCategorias`;

CREATE TABLE `SuperCategorias` (
  `idSuperCategorias` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `QuantidadeMinima` int(11) DEFAULT NULL,
  `DataMinimaAvisoVencimento` int(11) DEFAULT NULL,
  PRIMARY KEY (`idSuperCategorias`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `SuperCategorias` WRITE;
/*!40000 ALTER TABLE `SuperCategorias` DISABLE KEYS */;

INSERT INTO `SuperCategorias` (`idSuperCategorias`, `nome`, `QuantidadeMinima`, `DataMinimaAvisoVencimento`)
VALUES
	(1,'Perecíveis',10,8),
	(2,'Não Perecíveis',100,60);

/*!40000 ALTER TABLE `SuperCategorias` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela SuperCategoriasCategorias
# ------------------------------------------------------------

DROP TABLE IF EXISTS `SuperCategoriasCategorias`;

CREATE TABLE `SuperCategoriasCategorias` (
  `idSuperCategoriasCategorias` int(11) NOT NULL AUTO_INCREMENT,
  `categoriaId` int(11) NOT NULL,
  `superCategoriaId` int(11) NOT NULL,
  PRIMARY KEY (`idSuperCategoriasCategorias`),
  KEY `fk_SuperCategoriasCategorias_SuperCategorias1_idx` (`superCategoriaId`),
  KEY `fk_SuperCategoriasCategorias_categoria1_idx` (`categoriaId`),
  CONSTRAINT `fk_SuperCategoriasCategorias_SuperCategorias1` FOREIGN KEY (`superCategoriaId`) REFERENCES `SuperCategorias` (`idSuperCategorias`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `SuperCategoriasCategorias` WRITE;
/*!40000 ALTER TABLE `SuperCategoriasCategorias` DISABLE KEYS */;

INSERT INTO `SuperCategoriasCategorias` (`idSuperCategoriasCategorias`, `categoriaId`, `superCategoriaId`)
VALUES
	(4,30,2),
	(5,31,2);

/*!40000 ALTER TABLE `SuperCategoriasCategorias` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela usuarios
# ------------------------------------------------------------

DROP TABLE IF EXISTS `usuarios`;

CREATE TABLE `usuarios` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `idOrganizacao` int(11) NOT NULL,
  `idDepartamento` int(11) DEFAULT NULL,
  `nome` varchar(200) COLLATE utf8_unicode_ci DEFAULT '',
  `cpf` varchar(14) COLLATE utf8_unicode_ci DEFAULT '',
  `data_nascimento` date DEFAULT NULL,
  `telefone` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `celular` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `cep` varchar(15) COLLATE utf8_unicode_ci DEFAULT '',
  `endereco` varchar(200) COLLATE utf8_unicode_ci DEFAULT '',
  `numero` varchar(10) COLLATE utf8_unicode_ci DEFAULT '',
  `complemento` varchar(200) COLLATE utf8_unicode_ci DEFAULT '',
  `bairro` varchar(200) COLLATE utf8_unicode_ci DEFAULT '',
  `cidade` varchar(200) COLLATE utf8_unicode_ci DEFAULT '',
  `estado` varchar(10) COLLATE utf8_unicode_ci DEFAULT '',
  `email` varchar(200) COLLATE utf8_unicode_ci DEFAULT '',
  `login` varchar(200) COLLATE utf8_unicode_ci DEFAULT '',
  `senha` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `permissao` int(11) DEFAULT '0',
  `status` bit(1) DEFAULT b'1',
  `CadastroDataHora` datetime DEFAULT CURRENT_TIMESTAMP,
  `CadastroUsuarioId` int(11) DEFAULT NULL,
  `AtualizacaoDataHora` datetime DEFAULT NULL,
  `AtualizacaoUsuarioId` int(11) DEFAULT NULL,
  `token` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DataValidadeToken` datetime DEFAULT NULL,
  `FlagAtivacaoToken` bit(1) DEFAULT NULL,
  PRIMARY KEY (`idUsuario`),
  UNIQUE KEY `Token` (`token`),
  KEY `FK_usuario_idOrganizacao` (`idOrganizacao`),
  KEY `FK_usuario_idDepartamento` (`idDepartamento`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;

INSERT INTO `usuarios` (`idUsuario`, `idOrganizacao`, `idDepartamento`, `nome`, `cpf`, `data_nascimento`, `telefone`, `celular`, `cep`, `endereco`, `numero`, `complemento`, `bairro`, `cidade`, `estado`, `email`, `login`, `senha`, `permissao`, `status`, `CadastroDataHora`, `CadastroUsuarioId`, `AtualizacaoDataHora`, `AtualizacaoUsuarioId`, `token`, `DataValidadeToken`, `FlagAtivacaoToken`)
VALUES
	(2,1,3,'João Paulo','37896155877','1991-06-24','23370426','949096384','04255001','rua sao joao climaco','414','casa 3','sao joao climaco','sao paulo','sp','joaopaulo_391@hotmail.com','joao','a5fec3a88ceffd15fa9c2706c5df50b1',2,b'1',NULL,NULL,NULL,NULL,NULL,NULL,b'1'),
	(259,228,NULL,'qq',NULL,NULL,'qq','','','','','','','','','qq','qq','099b3b060154898840f0ebdfb46ec78f',2,b'1','2016-07-06 22:13:59',NULL,NULL,NULL,'884112abad0140a048d021c7d67b5fe8','2016-07-13 22:13:59',b'1'),
	(260,229,NULL,'ee',NULL,NULL,'22','','','','','','','','','joaopaulo_391@hotmail.com','joaopaulo_391@hotmail.com','6512bd43d9caa6e02c990b0a82652dca',2,b'1','2016-07-06 22:16:13',NULL,NULL,NULL,'aa6a411c7be811521c41713e18c00ce8','2016-07-13 22:16:13',b'1');

/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela venda
# ------------------------------------------------------------

DROP TABLE IF EXISTS `venda`;

CREATE TABLE `venda` (
  `idVenda` int(11) NOT NULL AUTO_INCREMENT,
  `idOrganizacao` int(11) NOT NULL,
  `idCliente` int(11) NOT NULL DEFAULT '0',
  `dataVenda` datetime DEFAULT CURRENT_TIMESTAMP,
  `horaVenda` time NOT NULL,
  `cancelado` bit(1) NOT NULL COMMENT 'se for 1 é cancelado',
  `CadastroDataHora` datetime DEFAULT CURRENT_TIMESTAMP,
  `CadastroUsuarioId` int(11) DEFAULT NULL,
  `AtualizacaoDataHora` datetime DEFAULT NULL,
  `AtualizacaoUsuarioId` int(11) DEFAULT NULL,
  PRIMARY KEY (`idVenda`),
  KEY `FK_venda_idOrganizacao` (`idOrganizacao`),
  KEY `FK_venda_idCliente` (`idCliente`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `venda` WRITE;
/*!40000 ALTER TABLE `venda` DISABLE KEYS */;

INSERT INTO `venda` (`idVenda`, `idOrganizacao`, `idCliente`, `dataVenda`, `horaVenda`, `cancelado`, `CadastroDataHora`, `CadastroUsuarioId`, `AtualizacaoDataHora`, `AtualizacaoUsuarioId`)
VALUES
	(169,1,0,'2016-07-04 23:53:28','23:53:28',b'0','2016-07-04 23:53:28',NULL,NULL,NULL),
	(168,1,0,'2016-07-04 23:53:05','23:53:05',b'0','2016-07-04 23:53:05',NULL,NULL,NULL),
	(167,1,0,'2016-07-04 23:29:27','23:29:27',b'0','2016-07-04 23:29:27',NULL,NULL,NULL),
	(166,1,0,'2016-07-04 23:29:17','23:29:17',b'0','2016-07-04 23:29:17',NULL,NULL,NULL),
	(165,1,0,'2016-07-04 23:28:44','23:28:44',b'0','2016-07-04 23:28:44',NULL,NULL,NULL),
	(164,1,0,'2016-07-04 23:26:19','23:26:19',b'0','2016-07-04 23:26:19',NULL,NULL,NULL),
	(163,1,0,'2016-07-04 23:26:08','23:26:08',b'0','2016-07-04 23:26:08',NULL,NULL,NULL),
	(162,1,0,'2016-07-04 23:22:24','23:22:24',b'0','2016-07-04 23:22:24',NULL,NULL,NULL),
	(161,1,0,'2016-07-03 19:08:55','19:08:55',b'0','2016-07-03 19:08:55',NULL,NULL,NULL),
	(160,1,0,'2016-07-03 19:08:15','19:08:15',b'0','2016-07-03 19:08:15',NULL,NULL,NULL),
	(159,1,0,'2016-07-03 17:35:55','17:35:55',b'0','2016-07-03 17:35:55',NULL,NULL,NULL),
	(158,1,0,'2016-07-03 17:35:01','17:35:01',b'0','2016-07-03 17:35:01',NULL,NULL,NULL);

/*!40000 ALTER TABLE `venda` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Dumping routines (PROCEDURE) for database 'estoque'
--
DELIMITER ;;

# Dump of PROCEDURE USP_INS_CADASTRO_USUARIO
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `USP_INS_CADASTRO_USUARIO` */;;
/*!50003 SET SESSION SQL_MODE="NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `USP_INS_CADASTRO_USUARIO`(
	ORGANIZACAO_ VARCHAR(300),
	NOME VARCHAR(300),
	TELEFONE VARCHAR(30),
	EMAIL VARCHAR(300),
	SENHA VARCHAR(300)	
)
BEGIN
	
    -- VERIFICA SE JÁ EXISTE UM USUÁRIO COM MESMO LOGIN, CASO NÃO CRIA UM NOVO USUÁRIO
	IF(NOT exists(SELECT * FROM usuarios AS USU WHERE USU.login = EMAIL and status=1))
    THEN
		-- CRIA ORGANZACAO
		INSERT INTO organizacao
		(
			nome,
			STATUS,
			CadastroDataHora
		)
		VALUES
		(
			ORGANIZACAO_,
			1,
			CURRENT_TIMESTAMP()
		);
		-- RECUPERA ID DA NOVA ORGANIZACAO
		SET @ID_ORGANIZACAO = LAST_INSERT_ID();
		-- CRIA USUÁRIO
		INSERT INTO usuarios
		(
			idOrganizacao,
			idDepartamento,
			nome,
			cpf,
			telefone,
			email,
			login,
			senha,
			permissao,
			STATUS,
			CadastroDataHora,
			Token,
			DataValidadeToken
		)
		VALUES
		(
			@ID_ORGANIZACAO,
			NULL,
			NOME,
			NULL,
			TELEFONE,
			EMAIL,
			EMAIL,
			MD5(SENHA),
			2,
			1,
			CURRENT_TIMESTAMP(),
			(SELECT md5(FLOOR(RAND() * 1000000))),-- TOKEN
			(select DATE_ADD(current_timestamp(), INTERVAL 7 DAY))-- DATA VALIDADE TOKEN DATA HOJE + 7 DIAS
		);
		-- RECUPERA ID DO NOVO USUÁRIO
		SET @ID_NOVO_USUARIO = LAST_INSERT_ID();

        -- LIBERACAO DE MENU
		INSERT controle_menu
		(
			idUsuario,
			idMenu,
			idOrganizacao,
			CadastroDataHora        
		)
		SELECT
			@ID_NOVO_USUARIO,
			idMenu,
			@ID_ORGANIZACAO,
			CURRENT_TIMESTAMP()
		FROM 
			menu
		WHERE
			status = 1;
			
		-- LIBERACAO DE SUB MENU
		INSERT controle_submenu
		(
			idUsuario,
			idSubMenu,
			idOrganizacao,
			CadastroDataHora        
		)
		SELECT
			@ID_NOVO_USUARIO,
			idSubMenu,
			@ID_ORGANIZACAO,
			CURRENT_TIMESTAMP()
		FROM 
			sub_menu
		WHERE
			status = 1;
		
        -- RECUPERA INFORMAÇÕES DO NOVO USUÁRIO
		SELECT 
				nome
			,	email
            ,	telefone
            ,	Token
            , 	CadastroDataHora
		FROM 
			usuarios
		WHERE
			idUsuario = @ID_NOVO_USUARIO;
	ELSE
		SELECT 0;
	END IF;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE USP_MANTER_CATEGORIAS
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `USP_MANTER_CATEGORIAS` */;;
/*!50003 SET SESSION SQL_MODE="NO_ENGINE_SUBSTITUTION"*/;;
drop PROCEDURE USP_MANTER_CATEGORIAS;
CREATE PROCEDURE `USP_MANTER_CATEGORIAS`(
	NOME_ VARCHAR(30),
    ID_ORGANIZACAO INT,
    ID_CATEGORIA INT,
    STATUS_ BIT,
    PESQUISA VARCHAR(50),
    ID_PARAMETRO_CONSULTA INT ,
     TIPO INT
)
BEGIN
	
	IF(ID_PARAMETRO_CONSULTA = 0)
	THEN

		INSERT INTO categoria
		(
			`idOrganizacao`,
			`nomeCategoria`,
			`status`,
			`CadastroDataHora`,
			`CadastroUsuarioId`,
			`AtualizacaoDataHora`,
			`AtualizacaoUsuarioId`
		)
		VALUES
		(
			ID_ORGANIZACAO,
			NOME_,
			1,
			current_timestamp(),
			NULL,
			NULL,
			NULL
        );
        
        
        SET @ID = LAST_INSERT_ID();

        INSERT INTO SuperCategoriasCategorias
        (
        	categoriaId,
        	SuperCategoriaId
        )
        values
        (
        	@ID,
        	TIPO
        );

	ELSEIF(ID_PARAMETRO_CONSULTA = 1)
    THEN
		UPDATE 
			`categoria`
		SET
			`nomeCategoria` = NOME_,
			`status` = STATUS_,
			`AtualizacaoDataHora` = current_timestamp()
		WHERE 
			`idCategoria` = ID_CATEGORIA
		AND
			`idOrganizacao`= ID_ORGANIZACAO;
            
	ELSEIF(ID_PARAMETRO_CONSULTA = 2)
    THEN
		UPDATE 
			`categoria`
		SET
			`status` = 0,
			`AtualizacaoDataHora` = current_timestamp()
		WHERE 
			`idCategoria` = ID_CATEGORIA
		AND
			`idOrganizacao`= ID_ORGANIZACAO;
	
    ELSEIF(ID_PARAMETRO_CONSULTA = 3)
    THEN
		SELECT 
				idCategoria 
			,	nomeCategoria
		FROM 
			categoria 
		WHERE
		-- 	(idCategoria= ID_CATEGORIA OR ID_CATEGORIA IS NULL)
         --   AND
         --   (nomeCategoria LIKE CONCAT('%', PESQUISA, '%') OR PESQUISA IS NULL)
		-- AND 
			status=1
		AND
			idOrganizacao = ID_ORGANIZACAO;
            
	END IF;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE USP_MANTER_CLIENTES
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `USP_MANTER_CLIENTES` */;;
/*!50003 SET SESSION SQL_MODE="NO_AUTO_VALUE_ON_ZERO"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `USP_MANTER_CLIENTES`(
	NOME_ VARCHAR(30),
    ID_ORGANIZACAO INT,
    ID_CATEGORIA INT,
    STATUS_ BIT,
    PESQUISA VARCHAR(50),
    CPF VARCHAR(20),
    DATA_NASC DATETIME,
    TELEFONE VARCHAR(20),
    CELULAR VARCHAR(20),
    EMAIL VARCHAR(50),
    CEP VARCHAR(12),
    ENDERECO VARCHAR(100),
    NUMERO VARCHAR(20),
    COMPLEMENT0 VARCHAR(20),	
    ID_CLIENTE INT,
    ID_PARAMETRO_CONSULTA INT 	
)
BEGIN
	
	IF(ID_PARAMETRO_CONSULTA = 0)
	THEN
		INSERT INTO `cliente`
		(
			`idOrganizacao`,
			`nome`,
			`cpf`,
			`data_nascimento`,
			`telefone`,
			`celular`,
			`email`,
			`cep`,
            `numero`,
			`complemento`,
			`status`,
			`CadastroDataHora`,
			`CadastroUsuarioId`,
			`AtualizacaoDataHora`,
			`AtualizacaoUsuarioId`
		)
        VALUES
		(
			ID_ORGANIZACAO,
			NOME_,
			CPF,
			DATA_NASC,
			TELEFONE,
			CELULAR,
			EMAIL,
			CEP,
			NUMERO,
            COMPLEMENTO,
			1,
			current_timestamp(),
			NULL,
			NULL,
			NULL
        );

	ELSEIF(ID_PARAMETRO_CONSULTA = 1)
    THEN
		UPDATE 
			cliente
		SET
			`telefone` = TELEFONE,
			`celular` = CELULAR,
			`email` = EMAIL,
			`cep` =  CEP,
            `numero` =  NUMERO,
            `complemento` = COMPLEMENTO,
			`AtualizacaoDataHora` = current_timestamp(),
			`AtualizacaoUsuarioId` = ID_USUARIO
		WHERE 
			`idCliente` = ID_CLIENTE
		AND
			`idOrganizacao`= ID_ORGANIZACAO;
            
	ELSEIF(ID_PARAMETRO_CONSULTA = 2)
    THEN
		UPDATE 
			cliente
		SET
			`status` = 0,
			`AtualizacaoDataHora` = current_timestamp(),
            `AtualizacaoUsuarioId` = ID_USUARIO
		WHERE 
			`idCliente` = ID_CLIENTE
		AND
			`idOrganizacao`= ID_ORGANIZACAO;
	
    ELSEIF(ID_PARAMETRO_CONSULTA = 3)
    THEN
		SELECT 
				nome
            ,	idCliente
			,	idOrganizacao
			,	nome
			,	cpf
			,	data_nascimento
			,	telefone
			,	celular
			,	email
			,	cep
			,	endereco
			,	numero
			,	complemento
			,	bairro
			,	cidade
			,	uf
			,	status
			,	CadastroDataHora
			,	CadastroUsuarioId
			,	AtualizacaoDataHora
			,	AtualizacaoUsuarioId
		FROM 
			cliente 
		WHERE
			(IDCLIENTE= ID_CLIENTE OR ID_CLIENTE IS NULL)
            AND
            (
				(NOME LIKE ('%'+PESQUISA+'%') OR PESQUISA IS NULL)
                OR
                (telefone LIKE ('%'+PESQUISA+'%') OR PESQUISA IS NULL)
			)
		AND 
			status=1
		AND
			idOrganizacao = ID_ORGANIZACAO;
            
	END IF;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE USP_MANTER_DEPARTAMENTOS
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `USP_MANTER_DEPARTAMENTOS` */;;
/*!50003 SET SESSION SQL_MODE="NO_AUTO_VALUE_ON_ZERO"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `USP_MANTER_DEPARTAMENTOS`(
	NOME_ VARCHAR(30),
    ID_ORGANIZACAO INT,
    ID_DEPARTAMENTO INT,
    STATUS_ BIT,
    PESQUISA VARCHAR(50),
    ID_PARAMETRO_CONSULTA INT 	
)
BEGIN

	IF(ID_PARAMETRO_CONSULTA = 0)
	THEN
		INSERT INTO `departamento`
		(
			idDepartamento,
			idOrganizacao,
			nome,
			status,
			CadastroDataHora,
			CadastroUsuarioId,
			AtualizacaoDataHora,
			AtualizacaoUsuarioId
		)
        VALUES
		(
			ID_DEPARTAMENTO,
			ID_ORGANIZACAO,
			NOME,
			1,
			current_timestamp(),
			ID_USUARIO,
			NULL,
			NULL
        );

	ELSEIF(ID_PARAMETRO_CONSULTA = 1)
    THEN
		UPDATE 
			departamento
		SET
			`nome` = NOME,
			`AtualizacaoDataHora` = current_timestamp(),
			`AtualizacaoUsuarioId` = ID_USUARIO
		WHERE 
			`idDepartamento` = ID_DEPARTAMENTO
		AND
			`idOrganizacao`= ID_ORGANIZACAO;
            
	ELSEIF(ID_PARAMETRO_CONSULTA = 2)
    THEN
		UPDATE 
			departamento
		SET
			`status` = 0,
			`AtualizacaoDataHora` = current_timestamp(),
            `AtualizacaoUsuarioId` = ID_USUARIO
		WHERE 
			`idDepartamento` = ID_DEPARTAMENTO
		AND
			`idOrganizacao`= ID_ORGANIZACAO;
	
    ELSEIF(ID_PARAMETRO_CONSULTA = 3)
    THEN
		SELECT 
				idDepartamento
			,	idOrganizacao
			,	nome
			,	status
			,	CadastroDataHora
			,	CadastroUsuarioId
			,	AtualizacaoDataHora
			,	AtualizacaoUsuarioId
		FROM 
			departamento 
		WHERE
			(idDepartamento= ID_DEPARTAMENTO OR ID_DEPARTAMENTO IS NULL)
		AND
			(nome LIKE ('%'+PESQUISA+'%') OR PESQUISA IS NULL)
		AND 
			status=1
		AND
			idOrganizacao = ID_ORGANIZACAO;
            
	END IF;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE USP_MANTER_FORNECEDORES
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `USP_MANTER_FORNECEDORES` */;;
/*!50003 SET SESSION SQL_MODE="NO_AUTO_VALUE_ON_ZERO"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `USP_MANTER_FORNECEDORES`(
	
    ID_ORGANIZACAO INT,
    ID_FORNECEDOR INT,
    STATUS_ BIT,
    PESQUISA VARCHAR(50),
	NOME_  VARCHAR(50),
	CNPJ_  VARCHAR(20),
	TELEFONE_  VARCHAR(20),
	EMAIL_  VARCHAR(50),
	CEP_  VARCHAR(10),
	ENDERECO_  VARCHAR(50),
	NUMERO_  INT,
	COMPLEMENTO_  VARCHAR(50),
	BAIRRO_  VARCHAR(50),
	CIDADE_  VARCHAR(50),
	ESTADO_  VARCHAR(50),
    ID_PARAMETRO_CONSULTA INT 	
)
BEGIN
	
	IF(ID_PARAMETRO_CONSULTA = 0)
	THEN

		INSERT INTO `fornecedor`
		(
			`idOrganizacao`,
			`nome`,
			`cnpj`,
			`telefone`,
			`email`,
			`cep`,
			`endereco`,
			`numero`,
			`complemento`,
			`bairro`,
			`cidade`,
			`estado`,
			`status`,
			`CadastroDataHora`,
			`CadastroUsuarioId`,
			`AtualizacaoDataHora`,
			`AtualizacaoUsuarioId`
		)
		VALUES
		(
			ID_ORGANIZACAO,
			NOME_,
			CNPJ_,
			TELEFONE_,
			EMAIL_,
			CEP_,
			ENDERECO_,
			NUMERO_,
			COMPLEMENTO_,
			BAIRRO_,
			CIDADE_,
			ESTADO_,
			1,
			current_timestamp(),
			NULL,
			NULL,
			NULL
        );

	ELSEIF(ID_PARAMETRO_CONSULTA = 1)
    THEN
		UPDATE 
			`fornecedor`
		SET
			`nome` = NOME_,
			`cnpj` = CNPJ_,
			`telefone` = TELEFONE_,
			`email` = EMAIL_,
			`cep` = CEP_,
			`endereco` = ENDERECO_,
			`numero` = NUMERO_,
			`complemento` = COMPLEMENTO_,
			`bairro` = BAIRRO_,
			`cidade` = CIDADE_,
			`estado` = ESTADO_,
			`status` = 1,
			`AtualizacaoDataHora` = current_timestamp()
		WHERE 
			`idFornecedor` = ID_FORNECEDOR
		AND
			`idOrganizacao` = ID_ORGANIZACAO;

	ELSEIF(ID_PARAMETRO_CONSULTA = 2)
    THEN
		UPDATE 
			`fornecedor`
		SET
			`status` = 0,
			`AtualizacaoDataHora` = current_timestamp()
		WHERE 
			`idFornecedor` = ID_FORNECEDOR
		AND
			`idOrganizacao` = ID_ORGANIZACAO;

	ELSEIF(ID_PARAMETRO_CONSULTA = 3)
    THEN
		SELECT 
			idFornecedor
		,	idOrganizacao
		,	nome
		,	cnpj
		,	telefone
		,	email
		,	cep
		,	endereco
		,	numero
		,	complemento
		,	bairro
		,	cidade
		,	estado
		,	status
		,	CadastroDataHora
		,	CadastroUsuarioId
		,	AtualizacaoDataHora
		,	AtualizacaoUsuarioId
		from 
			fornecedor 
		where 
			(nome LIKE CONCAT('%'+PESQUISA+'%') OR PESQUISA IS NULL)
		AND
			(telefone LIKE CONCAT('%'+PESQUISA+'%') OR PESQUISA IS NULL)
		AND
			(cnpj  LIKE CONCAT('%'+PESQUISA+'%') OR PESQUISA IS NULL)
		AND
			(idfornecedor LIKE ('%'+PESQUISA+'%') OR PESQUISA IS NULL)
		and 
			status=1 
		and 
			idOrganizacao = ID_ORGANIZACAO;
           
	END IF;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE USP_MANTER_ORGANIZACAO
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `USP_MANTER_ORGANIZACAO` */;;
/*!50003 SET SESSION SQL_MODE="NO_AUTO_VALUE_ON_ZERO"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `USP_MANTER_ORGANIZACAO`(
	NOME VARCHAR(30),
	ESTATUS  BIT,
    CNPJ VARCHAR(20),
    TELEFONE VARCHAR(20),
    EMAIL VARCHAR(50),
    CEP VARCHAR(20),
    COMPLEMENTO VARCHAR(50),
    ID_PARAMETRO_CONSULTA INT,
 	PESQUISA VARCHAR(30)
)
BEGIN
	
	IF(ID_PARAMETRO_CONSULTA = 0)
	THEN

		INSERT INTO organizacao
		(
			`nome`,
			`status`,
			`CadastroDataHora`,
			`CadastroUsuarioId`,
			`AtualizacaoDataHora`,
			`AtualizacaoUsuarioId`,
			`Cnpj`,
			`Telefone`,
			`Email`,
			`Cep`,
			`Comeplemento`

		)
		VALUES
		(
			NOME,
			1,
			current_timestamp(),
			NULL,
			NULL,
			NULL,
			CNPJ,
			TELEFONE,
			EMAIL,
			CEP,
			COMPLEMENTO
        );

	ELSEIF(ID_PARAMETRO_CONSULTA = 1)
    THEN
		UPDATE 
			`organizacao`
		SET
			`status` = 0,
			`AtualizacaoDataHora` = current_timestamp(),
			`Cnpj` = CNPJ,
			`Telefone` = TELEFONE,
			`Email` = Email,
			`Cep` = CEP,
			`Comeplemento` = COMPLEMENTO
		WHERE 
			`Cnpj` = CNPJ
		AND
			`nome`= NOME;
            
	ELSEIF(ID_PARAMETRO_CONSULTA = 2)
    THEN
		UPDATE 
			`categoria`
		SET
			`status` = 0,
			`AtualizacaoDataHora` = CURRENT_TIMESTAMP()
		WHERE 
			`Cnpj` = CNPJ
		AND
			`nome`= NOME;
	
    ELSEIF(ID_PARAMETRO_CONSULTA = 3)
    THEN
		SELECT 
				idOrganizacao
			,	nome
			,	status
			,	Cnpj
			,	Telefone
			,	Email
			,	Cep
			,	Complemento

		FROM 
			organizacao 
		WHERE
			(PESQUISA = CNPJ OR CNPJ IS NULL)
            AND
            (nome LIKE CONCAT('%', PESQUISA, '%') OR PESQUISA IS NULL);
		-- AND 
		-- 	status=1
		-- AND
		-- 	idOrganizacao = ID_ORGANIZACAO;
            
	END IF;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE USP_MANTER_PRODUTOS
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `USP_MANTER_PRODUTOS` */;;
/*!50003 SET SESSION SQL_MODE="NO_AUTO_VALUE_ON_ZERO"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `USP_MANTER_PRODUTOS`(
	NOME_ VARCHAR(30),
    ID_ORGANIZACAO INT,
    ID_CATEGORIA INT,
    STATUS_ BIT,
    ID_PRODUTO INT,
    VALOR_VENDA DECIMAL(10,2),
    CODIGO_BARRAS VARCHAR(20),
    PESQUISA VARCHAR(50),
    ID_PARAMETRO_CONSULTA INT 	
)
BEGIN
	
	IF(ID_PARAMETRO_CONSULTA = 0)
	THEN

		INSERT INTO `produto`
		(
			`idOrganizacao`,
			`idCategoria`,
			`nome`,
			`valorVenda`,
			`status`,
			`CadastroDataHora`,
			`CadastroUsuarioId`,
			`AtualizacaoDataHora`,
			`AtualizacaoUsuarioId`,
			`CodigoDeBarras`
        )
		VALUES
		(
			ID_ORGANIZACAO,
			ID_CATEGORIA,
			NOME_,
			VALOR_VENDA,
			1,
			CURRENT_TIMESTAMP(),
			NULL,
			NULL,
			NULL,
			CODIGO_BARRAS
        );


	ELSEIF(ID_PARAMETRO_CONSULTA = 1)
    THEN
		UPDATE 
			`produto`
		SET
			`idCategoria` = ID_CATEGORIA,
			`nome` = NOME_,
			`valorVenda` = VALOR_VENDA,
			`status` = STATUS_,
			`AtualizacaoDataHora` = CURRENT_TIMESTAMP()
		WHERE 
			`idProduto` =ID_PRODUTO
		AND
			`idOrganizacao` = ID_ORGANIZACAO;

	ELSEIF(ID_PARAMETRO_CONSULTA = 2)
    THEN
		UPDATE 
			`produto`
		SET
			`status` = 0,
			`AtualizacaoDataHora` = CURRENT_TIMESTAMP()
		WHERE 
			`idProduto` =ID_PRODUTO
		AND
			`idOrganizacao` = ID_ORGANIZACAO;

	ELSEIF(ID_PARAMETRO_CONSULTA = 3)
    THEN
		SELECT 
				p.idProduto AS ID_PRODUTO
			,	p.nome AS NOME 
			, 	p.valorVenda AS VALOR_VENDA 
			, 	p.idCategoria AS ID_CATEGORIA
			, 	c.nomeCategoria AS NOME_CATEGORIA
        FROM 
			produto p
		INNER JOIN 
			categoria c 
		ON 
			c.idCategoria = p.idCategoria
		WHERE 
		       (p.nome LIKE CONCAT('%','',PESQUISA,'','%'));
		-- and 
		--	p.status=1 
		-- and 
		-- 	p.idOrganizacao = ID_ORGANIZACAO
		-- and 
		-- 	c.status=1 
		-- and 
		--	c.idOrganizacao = ID_ORGANIZACAO;
            
	END IF;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE USP_MANTER_USUARIOS
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `USP_MANTER_USUARIOS` */;;
/*!50003 SET SESSION SQL_MODE="NO_AUTO_VALUE_ON_ZERO"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `USP_MANTER_USUARIOS`(
	NOME_ VARCHAR(30),
    ID_ORGANIZACAO INT,
    ID_DEPARTAMENTO INT,
    STATUS_ BIT,
    PESQUISA VARCHAR(50),
    CPF VARCHAR(20),
    DATA_NASC DATETIME,
    TELEFONE VARCHAR(20),
    CELULAR VARCHAR(20),
    EMAIL VARCHAR(50),
    CEP VARCHAR(12),
    ENDERECO VARCHAR(100),
    NUMERO VARCHAR(20),
    COMPLEMENT0 VARCHAR(20),	
    ID_USUARIO INT,
    LOGIN VARCHAR(15),
    SENHA VARCHAR(15),
    ID_PARAMETRO_CONSULTA INT 	
)
BEGIN
	
	IF(ID_PARAMETRO_CONSULTA = 0)
	THEN
		INSERT INTO `usuarios`
		(
			`idOrganizacao`,
            `idDepartamento`,
			`nome`,
			`cpf`,
			`data_nascimento`,
			`telefone`,
			`celular`,
			`email`,
			`cep`,
            `complemento`,
            `numero`,
			`status`,
			`CadastroDataHora`,
			`CadastroUsuarioId`,
			`AtualizacaoDataHora`,
			`AtualizacaoUsuarioId`,
            `login`,
            `senha`
		)
        VALUES
		(
			ID_ORGANIZACAO,
            ID_DEPARTAMENTO,
			NOME,
			CPF,
			DATA_NASC,
			TELEFONE,
			CELULAR,
			EMAIL,
			CEP,
            COMPLEMENTO,
            NUMERO,
			1,
			current_timestamp(),
			ID_USUARIO,
			NULL,
			NULL,
            LOGIN,
            SENHA
        );

	ELSEIF(ID_PARAMETRO_CONSULTA = 1)
    THEN
		UPDATE 
			usuarios
		SET
			`telefone` = TELEFONE,
			`celular` = CELULAR,
            `idDepartamento` = ID_DEPARTAMENTO,
			`email` = EMAIL,
			`cep` =  CEP,
            `numero` =  NUMERO,
            `complemento` = COMPLEMENTO,
			`AtualizacaoDataHora` = current_timestamp(),
			`AtualizacaoUsuarioId` = ID_USUARIO
		WHERE 
			`idUsuario` = ID_USUARIO
		AND
			`idOrganizacao`= ID_ORGANIZACAO;
            
	ELSEIF(ID_PARAMETRO_CONSULTA = 2)
    THEN
		UPDATE 
			usuarios
		SET
			`status` = 0,
			`AtualizacaoDataHora` = current_timestamp(),
            `AtualizacaoUsuarioId` = ID_USUARIO
		WHERE 
			`idUsuario` = ID_USUARIO
		AND
			`idOrganizacao`= ID_ORGANIZACAO;
	
    ELSEIF(ID_PARAMETRO_CONSULTA = 3)
    THEN
		SELECT 
				nome
            ,	idUsuario
			,	idOrganizacao
            ,	idDepartamento
			,	nome
			,	cpf
			,	data_nascimento
			,	telefone
			,	celular
			,	email
			,	cep
			,	numero
			,	complemento
			,	status
			,	CadastroDataHora
			,	CadastroUsuarioId
			,	AtualizacaoDataHora
			,	AtualizacaoUsuarioId
		FROM 
			usuarios 
		WHERE
			(idUsuario= ID_USUARIO OR ID_USUARIO IS NULL)
            AND
            (
				(nome LIKE ('%'+PESQUISA+'%') OR PESQUISA IS NULL)
                OR
                (telefone LIKE ('%'+PESQUISA+'%') OR PESQUISA IS NULL)
			)
		AND 
			status=1
		AND
			idOrganizacao = ID_ORGANIZACAO;
            
	END IF;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE USP_SEL_LOGIN
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `USP_SEL_LOGIN` */;;
/*!50003 SET SESSION SQL_MODE="NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `USP_SEL_LOGIN`(
	LOGIN_ VARCHAR(200),
	SENHA_ VARCHAR(200)
)
BEGIN
	 
	 IF (EXISTS(SELECT * FROM usuarios WHERE login = LOGIN_ AND senha = SENHA_ and `FlagAtivacaoToken` = 1))
	THEN                  
		-- RETORNA OS DADOS DO USUÁRIO
		SELECT 
				@USUARIO_ID := usu.idUsuario
			, 	@NOME_USU := usu.nome  
			,	@ORGANIZACAO_ID := org.idOrganizacao
			,	@NOME_ORG := org.nome AS nomeOrganizacao
			,	@PERMISSAO := usu.permissao AS permissao
		FROM 
			usuarios AS usu
			INNER JOIN organizacao AS org ON org.idOrganizacao = usu.idOrganizacao
		WHERE 
			login = LOGIN_ AND senha = SENHA_;
			
	INSERT INTO LogAcessosUsuarios
		(	
			IdUsuario
		)
		VALUES
		(
			@USUARIO_ID
		); 
		
		SELECT 
				@USUARIO_ID AS idUsuario
			,	@NOME_USU as nome
			,	@ORGANIZACAO_ID as idOrganizacao
			,	@NOME_ORG as nomeOrganizacao
			,	@PERMISSAO as permissao
		FROM DUAL;
			
	ELSE
		-- RETORNA ZERO CASO HAJA MAIS DE UMA CONTA COM O MESMO EMAIL
		SELECT 0;
	END IF;  
	
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE USP_SEL_VALIDA_TOKEN
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `USP_SEL_VALIDA_TOKEN` */;;
/*!50003 SET SESSION SQL_MODE="NO_AUTO_VALUE_ON_ZERO"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `USP_SEL_VALIDA_TOKEN`(
	TOKEN_ VARCHAR(500)
)
BEGIN       
        
     -- VERIFICA SE O TOKN EXISTE, SE EXISTIR RETORNA AS INFORMAÇOES DO USUÁRIO 
    IF(exists(SELECT * FROM usuarios WHERE TOKEN = TOKEN_ and FlagAtivacaoToken=0))
    THEN
	-- MARCA TOKEN UTILIZADO
		update
			usuarios
		SET
			FlagAtivacaoToken =1
		where
			Token = TOKEN_;
			
		SELECT 
				USU.idUsuario AS codUsuario
            ,	USU.nome AS nome
            ,	USU.permissao AS permissao
            ,	USU.idOrganizacao AS idOrganizacao
            ,	ORG.nome AS nomeOrganizacao
		FROM
			usuarios AS USU
		INNER JOIN
			organizacao AS ORG
		ON
			ORG.idOrganizacao = USU.idOrganizacao
		WHERE
			USU.Token= TOKEN_
		AND
			usu.DataValidadeToken >= current_timestamp()
		AND
			USU.status=1
		AND
			ORG.status=1;
            
		
	else
		SELECT 0;
	end if;
        
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE USP_UPD_ESQUECI_MINHA_SENHA
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `USP_UPD_ESQUECI_MINHA_SENHA` */;;
/*!50003 SET SESSION SQL_MODE="NO_AUTO_VALUE_ON_ZERO"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `USP_UPD_ESQUECI_MINHA_SENHA`(
	EMAIL_ VARCHAR(30)
)
BEGIN       
	-- VARIÁVEIS 
    DECLARE IdUsuarioAux INT;
    DECLARE COUNT_ INT;
	DECLARE NOVASENHA INT;
         
     -- RETORNA NUMERO DE CONTAS COM O MESMO EMAIL
    SELECT COUNT(*) INTO COUNT_ FROM usuarios WHERE login = EMAIL_;
	
    -- VERIFICA SE TEM MAIS DE UMA CONTA COM O MESMO EMAIL
    IF (COUNT_ = 1)
    THEN
		-- SELECIONA O ID DO USUÁRIO
		SELECT idUsuario INTO IdUsuarioAux FROM usuarios WHERE login = EMAIL_;
		-- GERA UMA SENHA 
		SELECT (FLOOR(RAND() * 1000000)) INTO NOVASENHA FROM DUAL;
        
		-- ATUALIZA COM A NOVA SENHA
		UPDATE
			usuarios
		SET
			SENHA = MD5(NOVASENHA)
		WHERE
			idUsuario = IdUsuarioAux;	
          
		-- RETORNA OS DADOS DO USUÁRIO
		SELECT 
				NOVASENHA as senha
			, 	usu.login as login 
            ,	org.nome as organizacao
            ,	usu.email as email
            ,	usu.nome as nome
        FROM 
			usuarios as usu
		INNER JOIN
			organizacao as org
		on
			org.idOrganizacao = usu.idOrganizacao
		WHERE 
			idUsuario = idUsuarioAux;
    else
		-- RETORNA ZERO CASO HAJA MAIS DE UMA CONTA COM O MESMO EMAIL
        SELECT 0;
	end if;     
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
DELIMITER ;

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

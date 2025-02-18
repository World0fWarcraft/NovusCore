/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE DATABASE IF NOT EXISTS `novuscore` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `novuscore`;

CREATE TABLE IF NOT EXISTS `accounts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL,
  `salt` varchar(8) NOT NULL,
  `verifier` varchar(512) NOT NULL,
  `key` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

DELETE FROM `accounts`;
INSERT INTO `accounts` (`id`, `username`, `salt`, `verifier`, `key`) VALUES
	(1, 'loadbalancer', '2c645642', '02b0e1d33988a85a8664a0706ab36a38cb452caf6a0e20cbefc32adff9bfe8d053c16deea3ef1573852a95ed27c9207f1a98e957ca8912a9e73d17556202ad5be35156c40e6f8bf2334681b8d72eaee499ca5666ad33a01600b847e9989c6088979019db4a1c41301778001d2f9bc1be4bd86f4a07777b3d1142ff385abb857cfeba2037fa300560293a2bbf5b34fbfb243fdd45a07d47c4c3ea7247cd383759a2d82257a4fec5c1b5f27503cceed92cf9e033421f6af54ab43e1aaf6e911ad42f93b7bc8688ef7c5ca129a7bc66044aa0ea515f5fbfc2a6f8663a3099bc2e494532a60bc5c6831b0d34f4afb7d55554dab0647609b20d1df181c401646a9b61', ''),
	(2, 'region', '51421ef8', 'a10464517ff7e0e985f8c3ca0338f773325aa415215c53aafdfcd3b325102191d21867b54182f7ef021620fcce238aa6f8b3a276a93d96c85a582edb0012521ba67bbeb61bffff7941dc64aac1ec99133cfa4571ae1efc560c848b82531acb79303fcd870cfef387345a12f24bfd8688412f53d4b789a0d26504ba890d95aad44681e9e480f8624df00fd08fe6daf0245932df5310d2c57310e6c7d7bb835e6cfb723d8d779f7c8f3ab51d471face56e572ef7fd1114d319c36c23aa4230b6139d4784c01b8625d59a88b6bab03b66063b180d1adaeef82309082841b4431f7dbd2f9fdf0972da39a20edce23d505ef3975dd9f47df3f6ddd811658cc03ba804', ''),
	(3, 'auth', '6aba8c9c', '253027352a332ec866f34dd39dbdc93458b5a8f4935c766165c52a7e0d1c941d921b5749f387d308d1b45c95e4984e9825c53615b1112847b15964422b4a037263a5c74e5447b8aa8dc465524b0b0621db1e867026cad78be717bd0e97e41288a053d7f656e1496630d1df7940cc7781628b3e96d1f79a80563d13f61564b2d6bfc39884011f30a027252e46ed71a892340ffe7e634d850a86937395d16a1f4b091bd37294d8fddd010fe0048327df1cb62abf7151af62ffd31f49cdc85647c2c3bc98dff3cc02b1eafbc6800f587c86cc4268c5b796a65bfbbfc33245cc2d19d49d0936c08b7f406837ac92f33b5274716dba8283dd86a35384837d0eeb230c', ''),
	(4, 'world', 'a047cedd', '39fd60db1c8d45ab4c47512470f7f1015af3d78b101aa92af4c4cb00cc1980638eade1b93b2b8bc112a83b9d71057f37c30cc93f5cf8e5ea104e02890347b66ab5a5882616b136c7ab4e254680452e212fd7952fcdc81bbd6a44623554b12a8a0f837ae4b2e56e310d14445d72befed2b8c7c275e8a5f67aa990e9b8581f7d46b05fc275c5e2013cd9a8f72be82ae433ffb85d0005e94262cc59e76b51be9a322c1d540fa76b964bddd0b395342f183b647e1ab1759ef5974dc36b17f9598f44b654c42fca200fdd8c740e581c7c1cc926fbb622b2a9acc7ff911ddc96cc9393e53f731c60b1588fd24abd4f8e49d2ca560786c6cb3a31648234c123e9e00596', ''),
	(5, 'test', '0b2cf582', '90a1d15600df81e061e687cc4e73efff19846e695005e620fc70b32f46c7d55eea0df398d57f80171c5171934a99fd91dc0a824b261f9e4a3b68e804ccad286fd13c4e2b79d88ad9b6ac78af8d3394ece38025bc4d81a91161536efd75fd0bbfb2b8eb14532ad8f1be6c172938f661a2f1478098baa1ee9bc3bec3d6dfdab710feed6d57522e5b31c78b00a8f2b99a92360d92a73bde9a5b153bf091d9ad117c2dc8ce49d0949a35a6c8436e772deb6938624029e451ce8e2647f674e347e5db1b97dc8f02df4a1c3c19500bd608dbf390497604c7beb288a8ecac3dad06ab271289171584cd2f7e2a4715595bda7869bc68406ba3d6a8415f84b1ffb92eeea1', '');

CREATE TABLE IF NOT EXISTS `creatures` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entryID` int(10) unsigned NOT NULL,
  `name` varchar(64) NOT NULL,
  `subName` varchar(64) NOT NULL,
  `displayID` int(10) unsigned NOT NULL,
  `scale` float NOT NULL DEFAULT '1',
  `positionX` float NOT NULL DEFAULT '0',
  `positionY` float NOT NULL DEFAULT '0',
  `positionZ` float NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `realmlist` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `flags` int(10) unsigned NOT NULL DEFAULT '0',
  `permissionMask` int(10) unsigned NOT NULL DEFAULT '0',
  `maxConnections` int(11) NOT NULL DEFAULT '-1',
  `population` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

DELETE FROM `realmlist`;
INSERT INTO `realmlist` (`id`, `name`, `type`, `flags`, `permissionMask`, `maxConnections`, `population`) VALUES
	(1, 'NovusCore', 0, 0, 0, -1, 0);

CREATE TABLE IF NOT EXISTS `teleportlocations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `mapId` smallint(5) unsigned NOT NULL,
  `positionX` float NOT NULL DEFAULT '0',
  `positionY` float NOT NULL DEFAULT '0',
  `positionZ` float NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

INSERT IGNORE INTO `teleportlocations` (`id`, `name`, `mapId`, `positionX`, `positionY`, `positionZ`, `orientation`) VALUES
	(1, 'origin', 65535, 0, 0, 0, 0),
	(2, 'bootybay', 65535, -14293.8, 463.518, 41.131, 2.92168),
	(3, 'gurubashiarena', 65535, -13292.1, 101.791, 23.2103, 1.10479),
	(4, 'stormwind', 65535, -9089.11, 417.299, 92.1885, 0.672816),
	(5, 'ironforge', 65535, -5032.11, -821.256, 495.127, 5.41402),
	(6, 'undercity', 65535, 1890.86, 237.348, 56.8859, 3.10232),
	(7, 'goldshire', 65535, -9439.99, 63.6899, 56.3293, 3.08225),
	(8, 'lakeshire', 65535, -9252.16, -2148.52, 63.9259, 3.14072),
	(9, 'darkshire', 65535, -10548.2, -1160.15, 27.8945, 3.22013),
	(10, 'westfall', 65535, -9823.06, 858.587, 25.751, 2.22879),
	(11, 'deadmines', 65535, -11070.3, 1526.56, 43.2962, 3.11105),
	(12, 'airfield', 65535, -4489.21, -1580.68, 509.005, 3.80744),
	(13, 'southshore', 65535, -702.827, -520.424, 25.403, 3.46449),
	(14, 'tarrenmill', 65535, 4.66147, -863.321, 58.1282, 3.54303),
	(15, 'shadowfangkeep', 65535, -246.676, 1531.12, 77.138, 1.21913),
	(16, 'brill', 65535, 2236.93, 251.953, 33.9996, 2.93915),
	(17, 'stratholm', 65535, 3279.93, -3379.93, 141.968, 6.27011),
	(18, 'lightshope', 65535, 2283.35, -5318.88, 88.7368, 2.1555),
	(19, 'hinterlands', 65535, 96.3628, -1959.85, 163.954, 4.83983),
	(20, 'lochmodan', 65535, -6030.44, -2493.12, 309.989, 5.68893);

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
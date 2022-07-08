/*  _____ _______         _                      _
 * |_   _|__   __|       | |                    | |
 *   | |    | |_ __   ___| |___      _____  _ __| | __  ___ ____
 *   | |    | | '_ \ / _ \ __\ \ /\ / / _ \| '__| |/ / / __|_  /
 *  _| |_   | | | | |  __/ |_ \ V  V / (_) | |  |   < | (__ / /
 * |_____|  |_|_| |_|\___|\__| \_/\_/ \___/|_|  |_|\_(_)___/___|
 *                                _
 *              ___ ___ ___ _____|_|_ _ _____
 *             | . |  _| -_|     | | | |     |
 *             |  _|_| |___|_|_|_|_|___|_|_|_|
 *             |_|                          _ _ _        LICENCE
 *        ___ ___    ___    ___ ___ ___ ___| | |_|___ ___
 *       |   | . |  |___|  |  _| -_|_ -| -_| | | |   | . |
 *       |_|_|___|         |_| |___|___|___|_|_|_|_|_|_  |
 *                                                   |___|
 *
 * IT ZPRAVODAJSTVÍ  <>  PROGRAMOVÁNÍ  <>  HW A SW  <>  KOMUNITA
 *
 * Tento zdrojový kód je součástí výukových seriálů na
 * IT sociální síti WWW.ITNETWORK.CZ
 *
 * Kód spadá pod licenci prémiového obsahu s omezeným
 * přeprodáváním a vznikl díky podpoře našich členů. Je určen
 * pouze pro osobní užití a nesmí být šířen. Může být použit
 * v jednom uzavřeném komerčním projektu, pro širší využití je
 * dostupná licence Premium commercial. Více informací na
 * http://www.itnetwork.cz/licence
 */

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `accounting_settings`
-- ----------------------------
DROP TABLE IF EXISTS `accounting_settings`;
CREATE TABLE `accounting_settings` (
  `settings_id` int(11) NOT NULL AUTO_INCREMENT,
  `valid_from` date NOT NULL,
  `valid_to` date NOT NULL,
  `vat` int(11) NOT NULL,
  `accountant_detail_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  PRIMARY KEY (`settings_id`),
  KEY `accountant_detail_id` (`accountant_detail_id`),
  KEY `seller_id` (`seller_id`),
  CONSTRAINT `accounting_settings_ibfk_1` FOREIGN KEY (`accountant_detail_id`) REFERENCES `person_detail` (`person_detail_id`),
  CONSTRAINT `accounting_settings_ibfk_2` FOREIGN KEY (`seller_id`) REFERENCES `person` (`person_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- ----------------------------
-- Records of accounting_settings
-- ----------------------------
INSERT INTO `accounting_settings` VALUES ('1', '2015-01-01', '2199-12-31', '21', '1', '1');

-- ----------------------------
-- Table structure for `address`
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `street` varchar(30) COLLATE utf8_czech_ci NOT NULL,
  `registry_number` int(11) NOT NULL,
  `house_number` int(11) NOT NULL,
  `city` varchar(30) COLLATE utf8_czech_ci NOT NULL,
  `zip` varchar(10) COLLATE utf8_czech_ci NOT NULL,
  `country_id` int(11) NOT NULL,
  PRIMARY KEY (`address_id`),
  KEY `country_id` (`country_id`),
  CONSTRAINT `address_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES ('1', 'Šikmá', '128', '5', 'Praha', '10000', '1');

-- ----------------------------
-- Table structure for `article`
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `article_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `content` text COLLATE utf8_czech_ci,
  `url` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  PRIMARY KEY (`article_id`),
  UNIQUE KEY `url` (`url`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('1', 'Úvod', '<div class=\"jumbotron\">\n<h1>Vítejte na našem webu!</h1>\n<p>Tento web je postaven na <strong>Nette frameworku</strong> v PHP podle tutoriálů ze sociální sítě ITnetwork.cz.</p>\n<p><a class=\"btn btn-primary btn-lg\" href=\"http://www.itnetwork.cz\">ITnetwork.cz</a></p>\n</div>', 'uvod', 'Úvodní článek na webu v Nette v PHP');
INSERT INTO `article` VALUES ('2', 'Stránka nebyla nalezena', '<p>Litujeme, ale požadovaná stránka nebyla nalezena. Zkontrolujte prosím URL adresu.</p>', 'chyba', 'Stránka nebyla nalezena.');

-- ----------------------------
-- Table structure for `bank_account`
-- ----------------------------
DROP TABLE IF EXISTS `bank_account`;
CREATE TABLE `bank_account` (
  `bank_account_id` int(11) NOT NULL AUTO_INCREMENT,
  `bank_code` varchar(4) COLLATE utf8_czech_ci NOT NULL,
  `account_number` varchar(20) COLLATE utf8_czech_ci NOT NULL,
  PRIMARY KEY (`bank_account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- ----------------------------
-- Records of bank_account
-- ----------------------------
INSERT INTO `bank_account` VALUES ('1', '0800', '1345987014');

-- ----------------------------
-- Table structure for `category`
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) COLLATE utf8_czech_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_czech_ci NOT NULL,
  `order_no` int(11) NOT NULL,
  `hidden` tinyint(4) NOT NULL,
  `parent_category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `url` (`url`),
  KEY `parent_category_id` (`parent_category_id`),
  CONSTRAINT `category_ibfk_1` FOREIGN KEY (`parent_category_id`) REFERENCES `category` (`category_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', 'obyvaci-pokoj', 'Obývací pokoj', '2', '0', null);
INSERT INTO `category` VALUES ('2', 'kvetinace', 'Květináče', '3', '0', '1');
INSERT INTO `category` VALUES ('3', 'zaclony', 'Záclony', '6', '0', '1');
INSERT INTO `category` VALUES ('4', 'sklenene-kvetinace', 'Skleněné květináče', '4', '0', '2');
INSERT INTO `category` VALUES ('5', 'kuchyne', 'Kuchyně', '8', '0', null);
INSERT INTO `category` VALUES ('8', 'koupelny', 'Koupelny', '12', '0', null);
INSERT INTO `category` VALUES ('9', 'loznice', 'Ložnice', '15', '0', null);
INSERT INTO `category` VALUES ('10', 'keramicke-kvetinace', 'Keramické květináče', '5', '0', '2');
INSERT INTO `category` VALUES ('11', 'nabytek', 'Nábytek', '7', '0', '1');
INSERT INTO `category` VALUES ('12', 'kuchynske-desky', 'Kuchyňské desky', '9', '0', '5');
INSERT INTO `category` VALUES ('13', 'odkapavace', 'Odkapávače', '10', '0', '5');
INSERT INTO `category` VALUES ('14', 'nadobi', 'Nádobí', '11', '0', '5');
INSERT INTO `category` VALUES ('15', 'povleceni', 'Povlečení', '16', '0', '9');
INSERT INTO `category` VALUES ('16', 'matrace', 'Matrace', '17', '0', '9');
INSERT INTO `category` VALUES ('17', 'umyvadla', 'Umyvadla', '13', '0', '8');
INSERT INTO `category` VALUES ('18', 'kosmetika', 'Kosmetika', '14', '0', '8');
INSERT INTO `category` VALUES ('19', 'nezarazeno', 'Nezařazeno', '18', '1', null);
INSERT INTO `category` VALUES ('20', 'zpusoby-dopravy', 'Způsoby dopravy', '19', '1', null);

-- ----------------------------
-- Table structure for `country`
-- ----------------------------
DROP TABLE IF EXISTS `country`;
CREATE TABLE `country` (
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_czech_ci NOT NULL,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- ----------------------------
-- Records of country
-- ----------------------------
INSERT INTO `country` VALUES ('1', 'Česká republika');
INSERT INTO `country` VALUES ('2', 'Slovenská republika');

-- ----------------------------
-- Table structure for `person`
-- ----------------------------
DROP TABLE IF EXISTS `person`;
CREATE TABLE `person` (
  `person_id` int(11) NOT NULL AUTO_INCREMENT,
  `person_detail_id` int(11) NOT NULL,
  `address_id` int(11) NOT NULL,
  `delivery_address_id` int(11) DEFAULT NULL,
  `bank_account_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`person_id`),
  KEY `user_id` (`user_id`),
  KEY `bank_account_id` (`bank_account_id`),
  KEY `delivery_address_id` (`delivery_address_id`),
  KEY `address_id` (`address_id`),
  KEY `person_detail_id` (`person_detail_id`),
  CONSTRAINT `person_ibfk_1` FOREIGN KEY (`person_detail_id`) REFERENCES `person_detail` (`person_detail_id`),
  CONSTRAINT `person_ibfk_2` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`),
  CONSTRAINT `person_ibfk_3` FOREIGN KEY (`delivery_address_id`) REFERENCES `address` (`address_id`),
  CONSTRAINT `person_ibfk_4` FOREIGN KEY (`bank_account_id`) REFERENCES `bank_account` (`bank_account_id`),
  CONSTRAINT `person_ibfk_5` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- ----------------------------
-- Records of person
-- ----------------------------
INSERT INTO `person` VALUES ('1', '1', '1', null, '1', '1');

-- ----------------------------
-- Table structure for `person_detail`
-- ----------------------------
DROP TABLE IF EXISTS `person_detail`;
CREATE TABLE `person_detail` (
  `person_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(30) COLLATE utf8_czech_ci DEFAULT NULL,
  `last_name` varchar(30) COLLATE utf8_czech_ci DEFAULT NULL,
  `company_name` varchar(50) COLLATE utf8_czech_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8_czech_ci NOT NULL,
  `fax` varchar(20) COLLATE utf8_czech_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_czech_ci NOT NULL,
  `tax_number` varchar(20) COLLATE utf8_czech_ci NOT NULL,
  `identification_number` int(15) DEFAULT NULL,
  `registry_entry` varchar(100) COLLATE utf8_czech_ci NOT NULL,
  PRIMARY KEY (`person_detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- ----------------------------
-- Records of person_detail
-- ----------------------------
INSERT INTO `person_detail` VALUES ('1', null, null, 'Localeshop s.r.o.', '+420 731 256 987', '', 'admin@localeshop.cz', 'CZ4369875214', '43581425', 'Firma je zapsaná do obchodního rejstříku vedeného krajským soudem v Praze, oddíl B, vložka 745982.');

-- ----------------------------
-- Table structure for `product`
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_czech_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_czech_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_czech_ci NOT NULL,
  `short_description` varchar(255) COLLATE utf8_czech_ci NOT NULL,
  `description` text COLLATE utf8_czech_ci NOT NULL,
  `price` decimal(10,1) NOT NULL,
  `old_price` decimal(10,1) NOT NULL,
  `rating_sum` int(11) NOT NULL DEFAULT 0,
  `ratings` int(11) NOT NULL DEFAULT 0,
  `stock` int(11) NOT NULL DEFAULT 0,
  `images_count` int(11) NOT NULL DEFAULT 0,
  `hidden` tinyint(4) NOT NULL DEFAULT FALSE,
  PRIMARY KEY (`product_id`),
  FULLTEXT KEY `title` (`title`),
  FULLTEXT KEY `fulltext_2` (`title`,`short_description`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', '1073913', '1-kvetinac-zero', 'Květináč zero', 'Květináč zero je kvalitní květináč z řady zero', 'Květináč zero je kvalitní květináč z řady zero', '554.0', '0.0', '0', '0', '33', '1', '0');
INSERT INTO `product` VALUES ('2', '7837220', '2-sklenicka-alfa', 'Sklenička alfa', 'Sklenička alfa je kvalitní sklenička z řady alfa', 'Sklenička alfa je kvalitní sklenička z řady alfa', '910.0', '0.0', '0', '0', '109', '1', '0');
INSERT INTO `product` VALUES ('3', '4244080', '3-sklenicka-alfa', 'Sklenička alfa', 'Sklenička alfa je kvalitní sklenička z řady alfa', 'Sklenička alfa je kvalitní sklenička z řady alfa', '786.0', '0.0', '0', '0', '151', '1', '0');
INSERT INTO `product` VALUES ('4', '3146057', '4-zaclona-ella', 'Záclona ella', 'Záclona ella je kvalitní záclona z řady ella', 'Záclona ella je kvalitní záclona z řady ella', '30.0', '0.0', '0', '0', '36', '1', '0');
INSERT INTO `product` VALUES ('5', '4582214', '5-sklenicka-sense', 'Sklenička sense', 'Sklenička sense je kvalitní sklenička z řady sense', 'Sklenička sense je kvalitní sklenička z řady sense', '705.0', '0.0', '0', '0', '13', '1', '0');
INSERT INTO `product` VALUES ('6', '8279114', '6-kvetinac-zour', 'Květináč zour', 'Květináč zour je kvalitní květináč z řady zour', 'Květináč zour je kvalitní květináč z řady zour', '349.0', '0.0', '0', '0', '148', '1', '0');
INSERT INTO `product` VALUES ('7', '6150818', '7-kvetinac-best', 'Květináč best', 'Květináč best je kvalitní květináč z řady best', 'Květináč best je kvalitní květináč z řady best', '216.0', '0.0', '0', '0', '177', '1', '0');
INSERT INTO `product` VALUES ('8', '4798889', '8-sklenicka-zero', 'Sklenička zero', 'Sklenička zero je kvalitní sklenička z řady zero', 'Sklenička zero je kvalitní sklenička z řady zero', '527.0', '0.0', '5', '1', '153', '1', '0');
INSERT INTO `product` VALUES ('9', '8012390', '9-zaclona-best', 'Záclona best', 'Záclona best je kvalitní záclona z řady best', 'Záclona best je kvalitní záclona z řady best', '724.0', '0.0', '0', '0', '98', '1', '0');
INSERT INTO `product` VALUES ('10', '9267884', '10-kvetinac-sense', 'Květináč sense', 'Květináč sense je kvalitní květináč z řady sense', 'Květináč sense je kvalitní květináč z řady sense', '717.0', '0.0', '0', '0', '55', '1', '0');
INSERT INTO `product` VALUES ('11', '4229431', '11-zaclona-zero', 'Záclona zero', 'Záclona zero je kvalitní záclona z řady zero', 'Záclona zero je kvalitní záclona z řady zero', '137.0', '0.0', '0', '0', '133', '1', '0');
INSERT INTO `product` VALUES ('12', '3248596', '12-kvetinac-zour', 'Květináč zour', 'Květináč zour je kvalitní květináč z řady zour', 'Květináč zour je kvalitní květináč z řady zour', '579.0', '0.0', '0', '0', '161', '1', '0');
INSERT INTO `product` VALUES ('13', '3864441', '13-sklenicka-alfa', 'Sklenička alfa', 'Sklenička alfa je kvalitní sklenička z řady alfa', 'Sklenička alfa je kvalitní sklenička z řady alfa', '860.0', '0.0', '0', '0', '137', '1', '0');
INSERT INTO `product` VALUES ('14', '3303528', '14-zaclona-best', 'Záclona best', 'Záclona best je kvalitní záclona z řady best', 'Záclona best je kvalitní záclona z řady best', '266.0', '0.0', '0', '0', '78', '1', '0');
INSERT INTO `product` VALUES ('15', '979919', '15-zaclona-zero', 'Záclona zero', 'Záclona zero je kvalitní záclona z řady zero', 'Záclona zero je kvalitní záclona z řady zero', '800.0', '0.0', '0', '0', '68', '1', '0');
INSERT INTO `product` VALUES ('16', '995178', '16-kvetinac-zour', 'Květináč zour', 'Květináč zour je kvalitní květináč z řady zour', 'Květináč zour je kvalitní květináč z řady zour', '435.0', '0.0', '0', '0', '112', '1', '0');
INSERT INTO `product` VALUES ('17', '4638367', '17-zaclona-kath', 'Záclona kath', 'Záclona kath je kvalitní záclona z řady kath', 'Záclona kath je kvalitní záclona z řady kath', '363.0', '0.0', '0', '0', '182', '1', '0');
INSERT INTO `product` VALUES ('18', '2886047', '18-zaclona-sense', 'Záclona sense', 'Záclona sense je kvalitní záclona z řady sense', 'Záclona sense je kvalitní záclona z řady sense', '244.0', '0.0', '0', '0', '69', '1', '0');
INSERT INTO `product` VALUES ('19', '8902283', '19-kvetinac-best', 'Květináč best', 'Květináč best je kvalitní květináč z řady best', 'Květináč best je kvalitní květináč z řady best', '456.0', '0.0', '0', '0', '34', '1', '0');
INSERT INTO `product` VALUES ('20', '538635', '20-zaclona-best', 'Záclona best', 'Záclona best je kvalitní záclona z řady best', 'Záclona best je kvalitní záclona z řady best', '347.0', '0.0', '0', '0', '55', '1', '0');
INSERT INTO `product` VALUES ('21', '2834167', '21-kvetinac-zour', 'Květináč zour', 'Květináč zour je kvalitní květináč z řady zour', 'Květináč zour je kvalitní květináč z řady zour', '484.0', '0.0', '0', '0', '81', '1', '0');
INSERT INTO `product` VALUES ('22', '515441', '22-sklenicka-best', 'Sklenička best', 'Sklenička best je kvalitní sklenička z řady best', 'Sklenička best je kvalitní sklenička z řady best', '901.0', '0.0', '0', '0', '77', '1', '0');
INSERT INTO `product` VALUES ('23', '496521', '23-sklenicka-zour', 'Sklenička zour', 'Sklenička zour je kvalitní sklenička z řady zour', 'Sklenička zour je kvalitní sklenička z řady zour', '353.0', '0.0', '0', '0', '79', '1', '0');
INSERT INTO `product` VALUES ('24', '4378967', '24-sklenicka-ella', 'Sklenička ella', 'Sklenička ella je kvalitní sklenička z řady ella', 'Sklenička ella je kvalitní sklenička z řady ella', '563.0', '0.0', '0', '0', '40', '1', '0');
INSERT INTO `product` VALUES ('25', '951843', '25-kvetinac-sense', 'Květináč sense', 'Květináč sense je kvalitní květináč z řady sense', 'Květináč sense je kvalitní květináč z řady sense', '471.0', '0.0', '0', '0', '84', '1', '0');
INSERT INTO `product` VALUES ('26', '8691712', '26-zaclona-alfa', 'Záclona alfa', 'Záclona alfa je kvalitní záclona z řady alfa', 'Záclona alfa je kvalitní záclona z řady alfa', '488.0', '0.0', '0', '0', '152', '1', '0');
INSERT INTO `product` VALUES ('27', '8262635', '27-sklenicka-zero', 'Sklenička zero', 'Sklenička zero je kvalitní sklenička z řady zero', 'Sklenička zero je kvalitní sklenička z řady zero', '743.0', '0.0', '0', '0', '53', '1', '0');
INSERT INTO `product` VALUES ('28', '5016174', '28-kvetinac-zour', 'Květináč zour', 'Květináč zour je kvalitní květináč z řady zour', 'Květináč zour je kvalitní květináč z řady zour', '334.0', '0.0', '0', '0', '118', '1', '0');
INSERT INTO `product` VALUES ('29', '1491394', '29-kvetinac-alfa', 'Květináč alfa', 'Květináč alfa je kvalitní květináč z řady alfa', 'Květináč alfa je kvalitní květináč z řady alfa', '576.0', '0.0', '0', '0', '42', '1', '0');
INSERT INTO `product` VALUES ('30', '9914856', '30-kvetinac-zour', 'Květináč zour', 'Květináč zour je kvalitní květináč z řady zour', 'Květináč zour je kvalitní květináč z řady zour', '255.0', '0.0', '0', '0', '144', '1', '0');
INSERT INTO `product` VALUES ('31', '4700623', '31-zaclona-sense', 'Záclona sense', 'Záclona sense je kvalitní záclona z řady sense', 'Záclona sense je kvalitní záclona z řady sense', '875.0', '0.0', '0', '0', '8', '1', '0');
INSERT INTO `product` VALUES ('32', '4950256', '32-sklenicka-sense', 'Sklenička sense', 'Sklenička sense je kvalitní sklenička z řady sense', 'Sklenička sense je kvalitní sklenička z řady sense', '909.0', '0.0', '0', '0', '137', '1', '0');
INSERT INTO `product` VALUES ('33', '6952820', '33-kvetinac-ella', 'Květináč ella', 'Květináč ella je kvalitní květináč z řady ella', 'Květináč ella je kvalitní květináč z řady ella', '48.0', '0.0', '0', '0', '5', '1', '0');
INSERT INTO `product` VALUES ('34', '6684876', '34-kvetinac-zero', 'Květináč zero', 'Květináč zero je kvalitní květináč z řady zero', 'Květináč zero je kvalitní květináč z řady zero', '452.0', '0.0', '0', '0', '103', '1', '0');
INSERT INTO `product` VALUES ('35', '2310486', '35-sklenicka-alfa', 'Sklenička alfa', 'Sklenička alfa je kvalitní sklenička z řady alfa', 'Sklenička alfa je kvalitní sklenička z řady alfa', '999.0', '0.0', '0', '0', '192', '1', '0');
INSERT INTO `product` VALUES ('36', '6681214', '36-sklenicka-ella', 'Sklenička ella', 'Sklenička ella je kvalitní sklenička z řady ella', 'Sklenička ella je kvalitní sklenička z řady ella', '539.0', '0.0', '0', '0', '149', '1', '0');
INSERT INTO `product` VALUES ('37', '9836121', '37-kvetinac-ella', 'Květináč ella', 'Květináč ella je kvalitní květináč z řady ella', 'Květináč ella je kvalitní květináč z řady ella', '137.0', '0.0', '0', '0', '23', '1', '0');
INSERT INTO `product` VALUES ('38', '1501770', '38-kvetinac-zero', 'Květináč zero', 'Květináč zero je kvalitní květináč z řady zero', 'Květináč zero je kvalitní květináč z řady zero', '328.0', '0.0', '0', '0', '80', '1', '0');
INSERT INTO `product` VALUES ('39', '3592224', '39-kvetinac-zour', 'Květináč zour', 'Květináč zour je kvalitní květináč z řady zour', 'Květináč zour je kvalitní květináč z řady zour', '366.0', '0.0', '0', '0', '55', '1', '0');
INSERT INTO `product` VALUES ('40', '2709045', '40-sklenicka-sense', 'Sklenička sense', 'Sklenička sense je kvalitní sklenička z řady sense', 'Sklenička sense je kvalitní sklenička z řady sense', '474.0', '0.0', '0', '0', '3', '1', '0');
INSERT INTO `product` VALUES ('41', '2641296', '41-sklenicka-zero', 'Sklenička zero', 'Sklenička zero je kvalitní sklenička z řady zero', 'Sklenička zero je kvalitní sklenička z řady zero', '94.0', '0.0', '0', '0', '145', '1', '0');
INSERT INTO `product` VALUES ('42', '6865540', '42-sklenicka-alfa', 'Sklenička alfa', 'Sklenička alfa je kvalitní sklenička z řady alfa', 'Sklenička alfa je kvalitní sklenička z řady alfa', '134.0', '0.0', '0', '0', '124', '1', '0');
INSERT INTO `product` VALUES ('43', '1045837', '43-sklenicka-ella', 'Sklenička ella', 'Sklenička ella je kvalitní sklenička z řady ella', 'Sklenička ella je kvalitní sklenička z řady ella', '225.0', '0.0', '0', '0', '49', '1', '0');
INSERT INTO `product` VALUES ('44', '5533752', '44-kvetinac-best', 'Květináč best', 'Květináč best je kvalitní květináč z řady best', 'Květináč best je kvalitní květináč z řady best', '963.0', '0.0', '0', '0', '149', '1', '0');
INSERT INTO `product` VALUES ('45', '7868347', '45-kvetinac-sense', 'Květináč sense', 'Květináč sense je kvalitní květináč z řady sense', 'Květináč sense je kvalitní květináč z řady sense', '167.0', '0.0', '0', '0', '22', '1', '0');
INSERT INTO `product` VALUES ('46', '5276184', '46-kvetinac-alfa', 'Květináč alfa', 'Květináč alfa je kvalitní květináč z řady alfa', 'Květináč alfa je kvalitní květináč z řady alfa', '120.0', '0.0', '0', '0', '85', '1', '0');
INSERT INTO `product` VALUES ('47', '7171326', '47-sklenicka-zero', 'Sklenička zero', 'Sklenička zero je kvalitní sklenička z řady zero', 'Sklenička zero je kvalitní sklenička z řady zero', '825.0', '0.0', '0', '0', '22', '1', '0');
INSERT INTO `product` VALUES ('48', '7655335', '48-zaclona-sense', 'Záclona sense', 'Záclona sense je kvalitní záclona z řady sense', 'Záclona sense je kvalitní záclona z řady sense', '258.0', '0.0', '0', '0', '37', '1', '0');
INSERT INTO `product` VALUES ('49', '8017273', '49-kvetinac-zour', 'Květináč zour', 'Květináč zour je kvalitní květináč z řady zour', 'Květináč zour je kvalitní květináč z řady zour', '607.0', '0.0', '0', '0', '104', '1', '0');
INSERT INTO `product` VALUES ('50', '9233704', '50-zaclona-best', 'Záclona best', 'Záclona best je kvalitní záclona z řady best', 'Záclona best je kvalitní záclona z řady best', '535.0', '0.0', '0', '0', '13', '1', '0');
INSERT INTO `product` VALUES ('51', '4468689', '51-sklenicka-alfa', 'Sklenička alfa', 'Sklenička alfa je kvalitní sklenička z řady alfa', 'Sklenička alfa je kvalitní sklenička z řady alfa', '419.0', '0.0', '0', '0', '25', '1', '0');
INSERT INTO `product` VALUES ('52', '1573791', '52-sklenicka-alfa', 'Sklenička alfa', 'Sklenička alfa je kvalitní sklenička z řady alfa', 'Sklenička alfa je kvalitní sklenička z řady alfa', '606.0', '0.0', '0', '0', '118', '1', '0');
INSERT INTO `product` VALUES ('53', '5588074', '53-kvetinac-kath', 'Květináč kath', 'Květináč kath je kvalitní květináč z řady kath', 'Květináč kath je kvalitní květináč z řady kath', '665.0', '0.0', '0', '0', '40', '1', '0');
INSERT INTO `product` VALUES ('54', '1238098', '54-sklenicka-sense', 'Sklenička sense', 'Sklenička sense je kvalitní sklenička z řady sense', 'Sklenička sense je kvalitní sklenička z řady sense', '629.0', '0.0', '0', '0', '158', '1', '0');
INSERT INTO `product` VALUES ('55', '5437927', '55-sklenicka-best', 'Sklenička best', 'Sklenička best je kvalitní sklenička z řady best', 'Sklenička best je kvalitní sklenička z řady best', '254.0', '0.0', '0', '0', '107', '1', '0');
INSERT INTO `product` VALUES ('56', '9789124', '56-sklenicka-ella', 'Sklenička ella', 'Sklenička ella je kvalitní sklenička z řady ella', 'Sklenička ella je kvalitní sklenička z řady ella', '260.0', '0.0', '0', '0', '41', '1', '0');
INSERT INTO `product` VALUES ('57', '3080749', '57-kvetinac-alfa', 'Květináč alfa', 'Květináč alfa je kvalitní květináč z řady alfa', 'Květináč alfa je kvalitní květináč z řady alfa', '590.0', '0.0', '0', '0', '81', '1', '0');
INSERT INTO `product` VALUES ('58', '3789368', '58-sklenicka-best', 'Sklenička best', 'Sklenička best je kvalitní sklenička z řady best', 'Sklenička best je kvalitní sklenička z řady best', '654.0', '0.0', '0', '0', '171', '1', '0');
INSERT INTO `product` VALUES ('59', '2579040', '59-sklenicka-best', 'Sklenička best', 'Sklenička best je kvalitní sklenička z řady best', 'Sklenička best je kvalitní sklenička z řady best', '581.0', '0.0', '0', '0', '119', '1', '0');
INSERT INTO `product` VALUES ('60', '4801331', '60-sklenicka-alfa', 'Sklenička alfa', 'Sklenička alfa je kvalitní sklenička z řady alfa', 'Sklenička alfa je kvalitní sklenička z řady alfa', '468.0', '0.0', '0', '0', '55', '1', '0');
INSERT INTO `product` VALUES ('61', '2995300', '61-sklenicka-best', 'Sklenička best', 'Sklenička best je kvalitní sklenička z řady best', 'Sklenička best je kvalitní sklenička z řady best', '632.0', '0.0', '0', '0', '77', '1', '0');
INSERT INTO `product` VALUES ('62', '9387513', '62-zaclona-sense', 'Záclona sense', 'Záclona sense je kvalitní záclona z řady sense', 'Záclona sense je kvalitní záclona z řady sense', '858.0', '0.0', '0', '0', '101', '1', '0');
INSERT INTO `product` VALUES ('63', '8392029', '63-sklenicka-best', 'Sklenička best', 'Sklenička best je kvalitní sklenička z řady best', 'Sklenička best je kvalitní sklenička z řady best', '650.0', '0.0', '0', '0', '111', '1', '0');
INSERT INTO `product` VALUES ('64', '9110413', '64-kvetinac-kath', 'Květináč kath', 'Květináč kath je kvalitní květináč z řady kath', 'Květináč kath je kvalitní květináč z řady kath', '481.0', '0.0', '0', '0', '13', '1', '0');
INSERT INTO `product` VALUES ('65', '7831726', '65-sklenicka-ella', 'Sklenička ella', 'Sklenička ella je kvalitní sklenička z řady ella', 'Sklenička ella je kvalitní sklenička z řady ella', '42.0', '0.0', '0', '0', '78', '1', '0');
INSERT INTO `product` VALUES ('66', '532531', '66-kvetinac-zour', 'Květináč zour', 'Květináč zour je kvalitní květináč z řady zour', 'Květináč zour je kvalitní květináč z řady zour', '493.0', '0.0', '0', '0', '198', '1', '0');
INSERT INTO `product` VALUES ('67', '5376892', '67-kvetinac-sense', 'Květináč sense', 'Květináč sense je kvalitní květináč z řady sense', 'Květináč sense je kvalitní květináč z řady sense', '712.0', '0.0', '0', '0', '133', '1', '0');
INSERT INTO `product` VALUES ('68', '5216370', '68-sklenicka-alfa', 'Sklenička alfa', 'Sklenička alfa je kvalitní sklenička z řady alfa', 'Sklenička alfa je kvalitní sklenička z řady alfa', '549.0', '0.0', '0', '0', '162', '1', '0');
INSERT INTO `product` VALUES ('69', '90026', '69-sklenicka-zero', 'Sklenička zero', 'Sklenička zero je kvalitní sklenička z řady zero', 'Sklenička zero je kvalitní sklenička z řady zero', '69.0', '0.0', '0', '0', '133', '1', '0');
INSERT INTO `product` VALUES ('70', '9724427', '70-sklenicka-alfa', 'Sklenička alfa', 'Sklenička alfa je kvalitní sklenička z řady alfa', 'Sklenička alfa je kvalitní sklenička z řady alfa', '806.0', '0.0', '0', '0', '112', '1', '0');
INSERT INTO `product` VALUES ('71', '6033630', '71-sklenicka-zero', 'Sklenička zero', 'Sklenička zero je kvalitní sklenička z řady zero', 'Sklenička zero je kvalitní sklenička z řady zero', '17.0', '0.0', '0', '0', '34', '1', '0');
INSERT INTO `product` VALUES ('72', '5619202', '72-sklenicka-alfa', 'Sklenička alfa', 'Sklenička alfa je kvalitní sklenička z řady alfa', 'Sklenička alfa je kvalitní sklenička z řady alfa', '921.0', '0.0', '0', '0', '153', '1', '0');
INSERT INTO `product` VALUES ('73', '2270202', '73-sklenicka-sense', 'Sklenička sense', 'Sklenička sense je kvalitní sklenička z řady sense', 'Sklenička sense je kvalitní sklenička z řady sense', '962.0', '0.0', '0', '0', '93', '1', '0');
INSERT INTO `product` VALUES ('74', '9463196', '74-kvetinac-alfa', 'Květináč alfa', 'Květináč alfa je kvalitní květináč z řady alfa', 'Květináč alfa je kvalitní květináč z řady alfa', '50.0', '0.0', '0', '0', '93', '1', '0');
INSERT INTO `product` VALUES ('75', '2862243', '75-zaclona-sense', 'Záclona sense', 'Záclona sense je kvalitní záclona z řady sense', 'Záclona sense je kvalitní záclona z řady sense', '812.0', '0.0', '0', '0', '65', '1', '0');
INSERT INTO `product` VALUES ('76', '2818908', '76-zaclona-zero', 'Záclona zero', 'Záclona zero je kvalitní záclona z řady zero', 'Záclona zero je kvalitní záclona z řady zero', '848.0', '0.0', '0', '0', '37', '1', '0');
INSERT INTO `product` VALUES ('77', '6872254', '77-zaclona-sense', 'Záclona sense', 'Záclona sense je kvalitní záclona z řady sense', 'Záclona sense je kvalitní záclona z řady sense', '973.0', '0.0', '0', '0', '7', '1', '0');
INSERT INTO `product` VALUES ('78', '2248840', '78-kvetinac-zero', 'Květináč zero', 'Květináč zero je kvalitní květináč z řady zero', 'Květináč zero je kvalitní květináč z řady zero', '473.0', '0.0', '0', '0', '191', '1', '0');
INSERT INTO `product` VALUES ('79', '8362732', '79-sklenicka-kath', 'Sklenička kath', 'Sklenička kath je kvalitní sklenička z řady kath', 'Sklenička kath je kvalitní sklenička z řady kath', '351.0', '0.0', '0', '0', '75', '1', '0');
INSERT INTO `product` VALUES ('80', '9315491', '80-sklenicka-sense', 'Sklenička sense', 'Sklenička sense je kvalitní sklenička z řady sense', 'Sklenička sense je kvalitní sklenička z řady sense', '580.0', '0.0', '0', '0', '63', '1', '0');
INSERT INTO `product` VALUES ('81', '6396179', '81-zaclona-ella', 'Záclona ella', 'Záclona ella je kvalitní záclona z řady ella', 'Záclona ella je kvalitní záclona z řady ella', '352.0', '0.0', '0', '0', '126', '1', '0');
INSERT INTO `product` VALUES ('82', '581359', '82-kvetinac-kath', 'Květináč kath', 'Květináč kath je kvalitní květináč z řady kath', 'Květináč kath je kvalitní květináč z řady kath', '326.0', '0.0', '0', '0', '57', '1', '0');
INSERT INTO `product` VALUES ('83', '5035095', '83-kvetinac-best', 'Květináč best', 'Květináč best je kvalitní květináč z řady best', 'Květináč best je kvalitní květináč z řady best', '881.0', '0.0', '0', '0', '116', '1', '0');
INSERT INTO `product` VALUES ('84', '7608948', '84-zaclona-best', 'Záclona best', 'Záclona best je kvalitní záclona z řady best', 'Záclona best je kvalitní záclona z řady best', '366.0', '0.0', '0', '0', '81', '1', '0');
INSERT INTO `product` VALUES ('85', '3341980', '85-sklenicka-alfa', 'Sklenička alfa', 'Sklenička alfa je kvalitní sklenička z řady alfa', 'Sklenička alfa je kvalitní sklenička z řady alfa', '347.0', '0.0', '0', '0', '100', '1', '0');
INSERT INTO `product` VALUES ('86', '6960755', '86-kvetinac-alfa', 'Květináč alfa', 'Květináč alfa je kvalitní květináč z řady alfa', 'Květináč alfa je kvalitní květináč z řady alfa', '858.0', '0.0', '0', '0', '140', '1', '0');
INSERT INTO `product` VALUES ('87', '5379334', '87-kvetinac-best', 'Květináč best', 'Květináč best je kvalitní květináč z řady best', 'Květináč best je kvalitní květináč z řady best', '654.0', '0.0', '0', '0', '36', '1', '0');
INSERT INTO `product` VALUES ('88', '199279', '88-kvetinac-alfa', 'Květináč alfa', 'Květináč alfa je kvalitní květináč z řady alfa', 'Květináč alfa je kvalitní květináč z řady alfa', '457.0', '0.0', '0', '0', '141', '1', '0');
INSERT INTO `product` VALUES ('89', '209655', '89-sklenicka-alfa', 'Sklenička alfa', 'Sklenička alfa je kvalitní sklenička z řady alfa', 'Sklenička alfa je kvalitní sklenička z řady alfa', '210.0', '0.0', '0', '0', '179', '1', '0');
INSERT INTO `product` VALUES ('90', '3887024', '90-kvetinac-alfa', 'Květináč alfa', 'Květináč alfa je kvalitní květináč z řady alfa', 'Květináč alfa je kvalitní květináč z řady alfa', '320.0', '0.0', '0', '0', '90', '1', '0');
INSERT INTO `product` VALUES ('91', '1895446', '91-zaclona-alfa', 'Záclona alfa', 'Záclona alfa je kvalitní záclona z řady alfa', 'Záclona alfa je kvalitní záclona z řady alfa', '918.0', '0.0', '0', '0', '85', '1', '0');
INSERT INTO `product` VALUES ('92', '9586487', '92-sklenicka-ella', 'Sklenička ella', 'Sklenička ella je kvalitní sklenička z řady ella', 'Sklenička ella je kvalitní sklenička z řady ella', '103.0', '0.0', '0', '0', '93', '1', '0');
INSERT INTO `product` VALUES ('93', '9499207', '93-zaclona-alfa', 'Záclona alfa', 'Záclona alfa je kvalitní záclona z řady alfa', 'Záclona alfa je kvalitní záclona z řady alfa', '189.0', '0.0', '0', '0', '12', '1', '0');
INSERT INTO `product` VALUES ('94', '3860168', '94-kvetinac-best', 'Květináč best', 'Květináč best je kvalitní květináč z řady best', 'Květináč best je kvalitní květináč z řady best', '962.0', '0.0', '0', '0', '157', '1', '0');
INSERT INTO `product` VALUES ('95', '7083435', '95-zaclona-ella', 'Záclona ella', 'Záclona ella je kvalitní záclona z řady ella', 'Záclona ella je kvalitní záclona z řady ella', '926.0', '0.0', '0', '0', '115', '1', '0');
INSERT INTO `product` VALUES ('96', '8270569', '96-sklenicka-ella', 'Sklenička ella', 'Sklenička ella je kvalitní sklenička z řady ella', 'Sklenička ella je kvalitní sklenička z řady ella', '553.0', '0.0', '0', '0', '188', '1', '0');
INSERT INTO `product` VALUES ('97', '3710632', '97-sklenicka-alfa', 'Sklenička alfa', 'Sklenička alfa je kvalitní sklenička z řady alfa', 'Sklenička alfa je kvalitní sklenička z řady alfa', '536.0', '0.0', '0', '0', '50', '1', '0');
INSERT INTO `product` VALUES ('98', '9380188', '98-zaclona-alfa', 'Záclona alfa', 'Záclona alfa je kvalitní záclona z řady alfa', 'Záclona alfa je kvalitní záclona z řady alfa', '34.0', '0.0', '0', '0', '192', '1', '0');
INSERT INTO `product` VALUES ('99', '3443298', '99-kvetinac-sense', 'Květináč sense', 'Květináč sense je kvalitní květináč z řady sense', 'Květináč sense je kvalitní květináč z řady sense', '925.0', '0.0', '0', '0', '174', '1', '0');
INSERT INTO `product` VALUES ('100', '8751526', '100-zaclona-alfa', 'Záclona alfa', 'Záclona alfa je kvalitní záclona z řady alfa', 'Záclona alfa je kvalitní záclona z řady alfa', '59.0', '0.0', '0', '0', '75', '1', '0');
INSERT INTO `product` VALUES ('101', '10000001', 'ceska-posta-dobirka', 'Česká pošta - Dobírka', '', '', '130.0', '0.0', '0', '0', '0', '0', '1');
INSERT INTO `product` VALUES ('102', '10000002', 'ppl-dobirka', 'PPL - Dobírka', '', '', '100.0', '0.0', '0', '0', '0', '0', '1');

-- ----------------------------
-- Table structure for `product_category`
-- ----------------------------
DROP TABLE IF EXISTS `product_category`;
CREATE TABLE `product_category` (
  `product_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`product_category_id`),
  KEY `category_id` (`category_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `product_category_unique` UNIQUE (`product_id`, `category_id`),
  CONSTRAINT `product_category_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `product_category_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- ----------------------------
-- Records of product_category
-- ----------------------------
INSERT INTO `product_category` VALUES ('1', '1', '4');
INSERT INTO `product_category` VALUES ('2', '2', '14');
INSERT INTO `product_category` VALUES ('3', '3', '14');
INSERT INTO `product_category` VALUES ('4', '4', '3');
INSERT INTO `product_category` VALUES ('5', '5', '14');
INSERT INTO `product_category` VALUES ('6', '6', '4');
INSERT INTO `product_category` VALUES ('7', '7', '4');
INSERT INTO `product_category` VALUES ('8', '8', '14');
INSERT INTO `product_category` VALUES ('9', '9', '3');
INSERT INTO `product_category` VALUES ('10', '10', '4');
INSERT INTO `product_category` VALUES ('11', '11', '3');
INSERT INTO `product_category` VALUES ('12', '12', '4');
INSERT INTO `product_category` VALUES ('13', '13', '14');
INSERT INTO `product_category` VALUES ('14', '14', '3');
INSERT INTO `product_category` VALUES ('15', '15', '3');
INSERT INTO `product_category` VALUES ('16', '16', '4');
INSERT INTO `product_category` VALUES ('17', '17', '3');
INSERT INTO `product_category` VALUES ('18', '18', '3');
INSERT INTO `product_category` VALUES ('19', '19', '4');
INSERT INTO `product_category` VALUES ('20', '20', '3');
INSERT INTO `product_category` VALUES ('21', '21', '4');
INSERT INTO `product_category` VALUES ('22', '22', '14');
INSERT INTO `product_category` VALUES ('23', '23', '14');
INSERT INTO `product_category` VALUES ('24', '24', '14');
INSERT INTO `product_category` VALUES ('25', '25', '4');
INSERT INTO `product_category` VALUES ('26', '26', '3');
INSERT INTO `product_category` VALUES ('27', '27', '14');
INSERT INTO `product_category` VALUES ('28', '28', '4');
INSERT INTO `product_category` VALUES ('29', '29', '4');
INSERT INTO `product_category` VALUES ('30', '30', '4');
INSERT INTO `product_category` VALUES ('31', '31', '3');
INSERT INTO `product_category` VALUES ('32', '32', '14');
INSERT INTO `product_category` VALUES ('33', '33', '4');
INSERT INTO `product_category` VALUES ('34', '34', '4');
INSERT INTO `product_category` VALUES ('35', '35', '14');
INSERT INTO `product_category` VALUES ('36', '36', '14');
INSERT INTO `product_category` VALUES ('37', '37', '4');
INSERT INTO `product_category` VALUES ('38', '38', '4');
INSERT INTO `product_category` VALUES ('39', '39', '4');
INSERT INTO `product_category` VALUES ('40', '40', '14');
INSERT INTO `product_category` VALUES ('41', '41', '14');
INSERT INTO `product_category` VALUES ('42', '42', '14');
INSERT INTO `product_category` VALUES ('43', '43', '14');
INSERT INTO `product_category` VALUES ('44', '44', '4');
INSERT INTO `product_category` VALUES ('45', '45', '4');
INSERT INTO `product_category` VALUES ('46', '46', '4');
INSERT INTO `product_category` VALUES ('47', '47', '14');
INSERT INTO `product_category` VALUES ('48', '48', '3');
INSERT INTO `product_category` VALUES ('49', '49', '4');
INSERT INTO `product_category` VALUES ('50', '50', '3');
INSERT INTO `product_category` VALUES ('51', '51', '14');
INSERT INTO `product_category` VALUES ('52', '52', '14');
INSERT INTO `product_category` VALUES ('53', '53', '4');
INSERT INTO `product_category` VALUES ('54', '54', '14');
INSERT INTO `product_category` VALUES ('55', '55', '14');
INSERT INTO `product_category` VALUES ('56', '56', '14');
INSERT INTO `product_category` VALUES ('57', '57', '4');
INSERT INTO `product_category` VALUES ('58', '58', '14');
INSERT INTO `product_category` VALUES ('59', '59', '14');
INSERT INTO `product_category` VALUES ('60', '60', '14');
INSERT INTO `product_category` VALUES ('61', '61', '14');
INSERT INTO `product_category` VALUES ('62', '62', '3');
INSERT INTO `product_category` VALUES ('63', '63', '14');
INSERT INTO `product_category` VALUES ('64', '64', '4');
INSERT INTO `product_category` VALUES ('65', '65', '14');
INSERT INTO `product_category` VALUES ('66', '66', '4');
INSERT INTO `product_category` VALUES ('67', '67', '4');
INSERT INTO `product_category` VALUES ('68', '68', '14');
INSERT INTO `product_category` VALUES ('69', '69', '14');
INSERT INTO `product_category` VALUES ('70', '70', '14');
INSERT INTO `product_category` VALUES ('71', '71', '14');
INSERT INTO `product_category` VALUES ('72', '72', '14');
INSERT INTO `product_category` VALUES ('73', '73', '14');
INSERT INTO `product_category` VALUES ('74', '74', '4');
INSERT INTO `product_category` VALUES ('75', '75', '3');
INSERT INTO `product_category` VALUES ('76', '76', '3');
INSERT INTO `product_category` VALUES ('77', '77', '3');
INSERT INTO `product_category` VALUES ('78', '78', '4');
INSERT INTO `product_category` VALUES ('79', '79', '14');
INSERT INTO `product_category` VALUES ('80', '80', '14');
INSERT INTO `product_category` VALUES ('81', '81', '3');
INSERT INTO `product_category` VALUES ('82', '82', '4');
INSERT INTO `product_category` VALUES ('83', '83', '4');
INSERT INTO `product_category` VALUES ('84', '84', '3');
INSERT INTO `product_category` VALUES ('85', '85', '14');
INSERT INTO `product_category` VALUES ('86', '86', '4');
INSERT INTO `product_category` VALUES ('87', '87', '4');
INSERT INTO `product_category` VALUES ('88', '88', '4');
INSERT INTO `product_category` VALUES ('89', '89', '14');
INSERT INTO `product_category` VALUES ('90', '90', '4');
INSERT INTO `product_category` VALUES ('91', '91', '3');
INSERT INTO `product_category` VALUES ('92', '92', '14');
INSERT INTO `product_category` VALUES ('93', '93', '3');
INSERT INTO `product_category` VALUES ('94', '94', '4');
INSERT INTO `product_category` VALUES ('95', '95', '3');
INSERT INTO `product_category` VALUES ('96', '96', '14');
INSERT INTO `product_category` VALUES ('97', '97', '14');
INSERT INTO `product_category` VALUES ('98', '98', '3');
INSERT INTO `product_category` VALUES ('99', '99', '4');
INSERT INTO `product_category` VALUES ('100', '100', '3');
INSERT INTO `product_category` VALUES ('101', '101', '20');
INSERT INTO `product_category` VALUES ('102', '102', '20');

-- ----------------------------
-- Table structure for `review`
-- ----------------------------
DROP TABLE IF EXISTS `review`;
CREATE TABLE `review` (
  `review_id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text COLLATE utf8_czech_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `sent` datetime NOT NULL,
  PRIMARY KEY (`review_id`),
  UNIQUE KEY `unique_product_user` (`product_id`,`user_id`),
  KEY `user_id` (`user_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `review_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `review_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- ----------------------------
-- Records of review
-- ----------------------------
INSERT INTO `review` VALUES ('1', 'Skvělý květináč!', '1', '8', '5', '2015-05-03 11:34:49');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_czech_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_czech_ci NOT NULL,
  `role` enum('member','admin') COLLATE utf8_czech_ci NOT NULL DEFAULT 'member',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin@localeshop.cz', '$2y$10$h8vmMU0yHJ4jFOpfxrZO0eIW3qgnRFXsdi4G9DKzXaHuo9OLPuPJu', 'admin');
INSERT INTO `user` VALUES ('2', 'test@localeshop.cz', '$2y$10$Re6SSHFjyr25eaddRBQHP.tvQ0nUr0EqUK05y12bGhgM.MzeHa5c6', 'member');

-- ----------------------------
-- Table structure for `e_order`
-- ----------------------------
DROP TABLE IF EXISTS `e_order`;
CREATE TABLE `e_order` (
  `e_order_id` int(11) NOT NULL AUTO_INCREMENT,
  `token` char(32) COLLATE utf8_czech_ci NOT NULL,
  `created` datetime NOT NULL,
  `buyer_id` int(11) DEFAULT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `seller_address_id` int(11) DEFAULT NULL,
  `buyer_address_id` int(11) DEFAULT NULL,
  `seller_person_detail_id` int(11) DEFAULT NULL,
  `buyer_person_detail_id` int(11) DEFAULT NULL,
  `accountant_detail_id` int(11) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `issued` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `state` enum('created','completed','accepted','sent','suspended','canceled') COLLATE utf8_czech_ci NOT NULL DEFAULT 'created',
  `buyer_delivery_address_id` int(11) DEFAULT NULL,
  `delivery_product_id` int(11) DEFAULT NULL,
  `seller_bank_account_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`e_order_id`),
  KEY `seller_bank_account_id` (`seller_bank_account_id`),
  KEY `buyer_delivery_address_id` (`buyer_delivery_address_id`),
  KEY `accountant_detail_id` (`accountant_detail_id`),
  KEY `buyer_person_detail_id` (`buyer_person_detail_id`),
  KEY `seller_person_detail_id` (`seller_person_detail_id`),
  KEY `buyer_address_id` (`buyer_address_id`),
  KEY `delivery_product_id` (`delivery_product_id`),
  KEY `seller_address_id` (`seller_address_id`),
  CONSTRAINT `e_order_ibfk_1` FOREIGN KEY (`seller_address_id`) REFERENCES `address` (`address_id`),
  CONSTRAINT `e_order_ibfk_2` FOREIGN KEY (`buyer_address_id`) REFERENCES `address` (`address_id`),
  CONSTRAINT `e_order_ibfk_3` FOREIGN KEY (`seller_person_detail_id`) REFERENCES `person_detail` (`person_detail_id`),
  CONSTRAINT `e_order_ibfk_4` FOREIGN KEY (`buyer_person_detail_id`) REFERENCES `person_detail` (`person_detail_id`),
  CONSTRAINT `e_order_ibfk_5` FOREIGN KEY (`buyer_delivery_address_id`) REFERENCES `address` (`address_id`),
  CONSTRAINT `e_order_ibfk_6` FOREIGN KEY (`delivery_product_id`) REFERENCES `product` (`product_id`),
  CONSTRAINT `e_order_ibfk_7` FOREIGN KEY (`seller_bank_account_id`) REFERENCES `bank_account` (`bank_account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `product_e_order`
-- ----------------------------
DROP TABLE IF EXISTS `product_e_order`;
CREATE TABLE `product_e_order` (
  `product_e_order_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `e_order_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`product_e_order_id`),
  KEY `e_order_id` (`e_order_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `product_e_order_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  CONSTRAINT `product_e_order_ibfk_2` FOREIGN KEY (`e_order_id`) REFERENCES `e_order` (`e_order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- ----------------------------
-- Table structure for `bank_code`
-- ----------------------------
DROP TABLE IF EXISTS `bank_code`;
CREATE TABLE `bank_code` (
  `bank_code_id` int(11) NOT NULL AUTO_INCREMENT,
  `bank_code` int(4) DEFAULT NULL,
  `bank_name` varchar(80) DEFAULT NULL,
  `swift` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`bank_code_id`),
  KEY `bank_code` (`bank_code`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bank_code
-- ----------------------------
INSERT INTO `bank_code` VALUES ('1', '100', 'Komerční banka, a.s.', 'KOMBCZPP');
INSERT INTO `bank_code` VALUES ('2', '300', 'Československá obchodní banka, a.s.', 'CEKOCZPP');
INSERT INTO `bank_code` VALUES ('3', '600', 'GE Money Bank, a.s.', 'AGBACZPP');
INSERT INTO `bank_code` VALUES ('4', '710', 'Česká národní banka', 'CNBACZPP');
INSERT INTO `bank_code` VALUES ('5', '800', 'Česká spořitelna, a.s.', 'GIBACZPX');
INSERT INTO `bank_code` VALUES ('6', '2010', 'Fio banka, a.s.', 'FIOBCZPP');
INSERT INTO `bank_code` VALUES ('7', '2020', 'Bank of Tokyo-Mitsubishi UFJ (Holland) N.V. Prague Branch, organizační složka', 'BOTKCZPP');
INSERT INTO `bank_code` VALUES ('8', '2030', 'AKCENTA, spořitelní a úvěrní družstvo', '');
INSERT INTO `bank_code` VALUES ('9', '2050', 'WPB Capital, spořitelní družstvo', '');
INSERT INTO `bank_code` VALUES ('10', '2060', 'Citfin, spořitelní družstvo', 'CITFCZPP');
INSERT INTO `bank_code` VALUES ('11', '2070', 'Moravský Peněžní Ústav – spořitelní družstvo', 'MPUBCZPP');
INSERT INTO `bank_code` VALUES ('12', '2100', 'Hypoteční banka, a.s.', '');
INSERT INTO `bank_code` VALUES ('13', '2200', 'Peněžní dům, spořitelní družstvo', '');
INSERT INTO `bank_code` VALUES ('14', '2210', 'Evropsko-ruská banka, a.s.', 'FICHCZPP');
INSERT INTO `bank_code` VALUES ('15', '2220', 'Artesa, spořitelní družstvo', 'ARTTCZPP');
INSERT INTO `bank_code` VALUES ('16', '2240', 'Poštová banka, a.s., pobočka Česká republika', 'POBNCZPP');
INSERT INTO `bank_code` VALUES ('17', '2250', 'Záložna CREDITAS, spořitelní družstvo', 'CTASCZ22');
INSERT INTO `bank_code` VALUES ('18', '2310', 'ZUNO BANK AG, organizační složka', 'ZUNOCZPP');
INSERT INTO `bank_code` VALUES ('19', '2600', 'Citibank Europe plc, organizační složka', 'CITICZPX');
INSERT INTO `bank_code` VALUES ('20', '2700', 'UniCredit Bank Czech Republic and Slovakia, a.s.', 'BACXCZPP');
INSERT INTO `bank_code` VALUES ('21', '3020', 'MEINL BANK Aktiengesellschaft,pobočka Praha', '');
INSERT INTO `bank_code` VALUES ('22', '3030', 'Air Bank a.s.', 'AIRACZP1');
INSERT INTO `bank_code` VALUES ('23', '3500', 'ING Bank N.V.', 'INGBCZPP');
INSERT INTO `bank_code` VALUES ('24', '4000', 'LBBW Bank CZ a.s.', 'SOLACZPP');
INSERT INTO `bank_code` VALUES ('25', '4300', 'Českomoravská záruční a rozvojová banka, a.s.', 'CMZRCZP1');
INSERT INTO `bank_code` VALUES ('26', '5400', 'The Royal Bank of Scotland plc, organizační složka', 'ABNACZPP');
INSERT INTO `bank_code` VALUES ('27', '5500', 'Raiffeisenbank a.s.', 'RZBCCZPP');
INSERT INTO `bank_code` VALUES ('28', '5800', 'J & T Banka, a.s.', 'JTBPCZPP');
INSERT INTO `bank_code` VALUES ('29', '6000', 'PPF banka a.s.', 'PMBPCZPP');
INSERT INTO `bank_code` VALUES ('30', '6100', 'Equa bank a.s.', 'EQBKCZPP');
INSERT INTO `bank_code` VALUES ('31', '6200', 'COMMERZBANK Aktiengesellschaft, pobočka Praha', 'COBACZPX');
INSERT INTO `bank_code` VALUES ('32', '6210', 'mBank S.A., organizační složka', 'BREXCZPP');
INSERT INTO `bank_code` VALUES ('33', '6300', 'BNP Paribas Fortis SA/NV, pobočka Česká republika', 'GEBACZPP');
INSERT INTO `bank_code` VALUES ('34', '6700', 'Všeobecná úverová banka a.s., pobočka Praha', 'SUBACZPP');
INSERT INTO `bank_code` VALUES ('35', '6800', 'Sberbank CZ, a.s.', 'VBOECZ2X');
INSERT INTO `bank_code` VALUES ('36', '7910', 'Deutsche Bank A.G. Filiale Prag', 'DEUTCZPX');
INSERT INTO `bank_code` VALUES ('37', '7940', 'Waldviertler Sparkasse Bank AG', 'SPWTCZ21');
INSERT INTO `bank_code` VALUES ('38', '7950', 'Raiffeisen stavební spořitelna a.s.', '');
INSERT INTO `bank_code` VALUES ('39', '7960', 'Českomoravská stavební spořitelna, a.s.', '');
INSERT INTO `bank_code` VALUES ('40', '7970', 'Wüstenrot-stavební spořitelna a.s.', '');
INSERT INTO `bank_code` VALUES ('41', '7980', 'Wüstenrot hypoteční banka a.s.', '');
INSERT INTO `bank_code` VALUES ('42', '7990', 'Modrá pyramida stavební spořitelna, a.s.', '');
INSERT INTO `bank_code` VALUES ('43', '8030', 'Raiffeisenbank im Stiftland eG pobočka Cheb, odštěpný závod', 'GENOCZ21');
INSERT INTO `bank_code` VALUES ('44', '8040', 'Oberbank AG pobočka Česká republika', 'OBKLCZ2X');
INSERT INTO `bank_code` VALUES ('45', '8060', 'Stavební spořitelna České spořitelny, a.s.', '');
INSERT INTO `bank_code` VALUES ('46', '8090', 'Česká exportní banka, a.s.', 'CZEECZPP');
INSERT INTO `bank_code` VALUES ('47', '8150', 'HSBC Bank plc - pobočka Praha', 'MIDLCZPP');
INSERT INTO `bank_code` VALUES ('48', '8200', 'PRIVAT BANK AG der Raiffeisenlandesbank Oberösterreich v České republice', '');
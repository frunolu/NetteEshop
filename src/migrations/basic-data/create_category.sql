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

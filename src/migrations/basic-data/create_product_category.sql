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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

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

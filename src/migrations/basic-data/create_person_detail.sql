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
  `registry_entry` varchar(100) COLLATE utf8_czech_ci NULL,
  PRIMARY KEY (`person_detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- ----------------------------
-- Records of person_detail
-- ----------------------------
INSERT INTO `person_detail` VALUES ('1', null, null, 'Localeshop s.r.o.', '+420 731 256 987', '', 'admin@localeshop.cz', 'CZ4369875214', '43581425', 'Firma je zapsaná do obchodního rejstříku vedeného krajským soudem v Praze, oddíl B, vložka 745982.');

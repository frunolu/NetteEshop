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
  CONSTRAINT `e_order_ibfk_6` FOREIGN KEY (`delivery_product_id`) REFERENCES produkt (`product_id`),
  CONSTRAINT `e_order_ibfk_7` FOREIGN KEY (`seller_bank_account_id`) REFERENCES `bank_account` (`bank_account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;



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

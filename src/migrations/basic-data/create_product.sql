SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `product`
-- ----------------------------
DROP TABLE IF EXISTS product;
CREATE TABLE product (
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
INSERT INTO product VALUES ('1', '1073913', '1-kvetinac-zero', 'Květináč zero', 'Květináč zero je kvalitní květináč z řady zero', 'Květináč zero je kvalitní květináč z řady zero', '554.0', '0.0', '0', '0', '33', '1', '0');
INSERT INTO product VALUES ('2', '7837220', '2-sklenicka-alfa', 'Sklenička alfa', 'Sklenička alfa je kvalitní sklenička z řady alfa', 'Sklenička alfa je kvalitní sklenička z řady alfa', '910.0', '0.0', '0', '0', '109', '1', '0');
INSERT INTO product VALUES ('3', '4244080', '3-sklenicka-alfa', 'Sklenička alfa', 'Sklenička alfa je kvalitní sklenička z řady alfa', 'Sklenička alfa je kvalitní sklenička z řady alfa', '786.0', '0.0', '0', '0', '151', '1', '0');
INSERT INTO product VALUES ('4', '3146057', '4-zaclona-ella', 'Záclona ella', 'Záclona ella je kvalitní záclona z řady ella', 'Záclona ella je kvalitní záclona z řady ella', '30.0', '0.0', '0', '0', '36', '1', '0');
INSERT INTO product VALUES ('5', '4582214', '5-sklenicka-sense', 'Sklenička sense', 'Sklenička sense je kvalitní sklenička z řady sense', 'Sklenička sense je kvalitní sklenička z řady sense', '705.0', '0.0', '0', '0', '13', '1', '0');
INSERT INTO product VALUES ('6', '8279114', '6-kvetinac-zour', 'Květináč zour', 'Květináč zour je kvalitní květináč z řady zour', 'Květináč zour je kvalitní květináč z řady zour', '349.0', '0.0', '0', '0', '148', '1', '0');
INSERT INTO product VALUES ('7', '6150818', '7-kvetinac-best', 'Květináč best', 'Květináč best je kvalitní květináč z řady best', 'Květináč best je kvalitní květináč z řady best', '216.0', '0.0', '0', '0', '177', '1', '0');
INSERT INTO product VALUES ('8', '4798889', '8-sklenicka-zero', 'Sklenička zero', 'Sklenička zero je kvalitní sklenička z řady zero', 'Sklenička zero je kvalitní sklenička z řady zero', '527.0', '0.0', '5', '1', '153', '1', '0');
INSERT INTO product VALUES ('9', '8012390', '9-zaclona-best', 'Záclona best', 'Záclona best je kvalitní záclona z řady best', 'Záclona best je kvalitní záclona z řady best', '724.0', '0.0', '0', '0', '98', '1', '0');
INSERT INTO product VALUES ('10', '9267884', '10-kvetinac-sense', 'Květináč sense', 'Květináč sense je kvalitní květináč z řady sense', 'Květináč sense je kvalitní květináč z řady sense', '717.0', '0.0', '0', '0', '55', '1', '0');
INSERT INTO product VALUES ('11', '4229431', '11-zaclona-zero', 'Záclona zero', 'Záclona zero je kvalitní záclona z řady zero', 'Záclona zero je kvalitní záclona z řady zero', '137.0', '0.0', '0', '0', '133', '1', '0');
INSERT INTO product VALUES ('12', '3248596', '12-kvetinac-zour', 'Květináč zour', 'Květináč zour je kvalitní květináč z řady zour', 'Květináč zour je kvalitní květináč z řady zour', '579.0', '0.0', '0', '0', '161', '1', '0');
INSERT INTO product VALUES ('13', '3864441', '13-sklenicka-alfa', 'Sklenička alfa', 'Sklenička alfa je kvalitní sklenička z řady alfa', 'Sklenička alfa je kvalitní sklenička z řady alfa', '860.0', '0.0', '0', '0', '137', '1', '0');
INSERT INTO product VALUES ('14', '3303528', '14-zaclona-best', 'Záclona best', 'Záclona best je kvalitní záclona z řady best', 'Záclona best je kvalitní záclona z řady best', '266.0', '0.0', '0', '0', '78', '1', '0');
INSERT INTO product VALUES ('15', '979919', '15-zaclona-zero', 'Záclona zero', 'Záclona zero je kvalitní záclona z řady zero', 'Záclona zero je kvalitní záclona z řady zero', '800.0', '0.0', '0', '0', '68', '1', '0');
INSERT INTO product VALUES ('16', '995178', '16-kvetinac-zour', 'Květináč zour', 'Květináč zour je kvalitní květináč z řady zour', 'Květináč zour je kvalitní květináč z řady zour', '435.0', '0.0', '0', '0', '112', '1', '0');
INSERT INTO product VALUES ('17', '4638367', '17-zaclona-kath', 'Záclona kath', 'Záclona kath je kvalitní záclona z řady kath', 'Záclona kath je kvalitní záclona z řady kath', '363.0', '0.0', '0', '0', '182', '1', '0');
INSERT INTO product VALUES ('18', '2886047', '18-zaclona-sense', 'Záclona sense', 'Záclona sense je kvalitní záclona z řady sense', 'Záclona sense je kvalitní záclona z řady sense', '244.0', '0.0', '0', '0', '69', '1', '0');
INSERT INTO product VALUES ('19', '8902283', '19-kvetinac-best', 'Květináč best', 'Květináč best je kvalitní květináč z řady best', 'Květináč best je kvalitní květináč z řady best', '456.0', '0.0', '0', '0', '34', '1', '0');
INSERT INTO product VALUES ('20', '538635', '20-zaclona-best', 'Záclona best', 'Záclona best je kvalitní záclona z řady best', 'Záclona best je kvalitní záclona z řady best', '347.0', '0.0', '0', '0', '55', '1', '0');
INSERT INTO product VALUES ('21', '2834167', '21-kvetinac-zour', 'Květináč zour', 'Květináč zour je kvalitní květináč z řady zour', 'Květináč zour je kvalitní květináč z řady zour', '484.0', '0.0', '0', '0', '81', '1', '0');
INSERT INTO product VALUES ('22', '515441', '22-sklenicka-best', 'Sklenička best', 'Sklenička best je kvalitní sklenička z řady best', 'Sklenička best je kvalitní sklenička z řady best', '901.0', '0.0', '0', '0', '77', '1', '0');
INSERT INTO product VALUES ('23', '496521', '23-sklenicka-zour', 'Sklenička zour', 'Sklenička zour je kvalitní sklenička z řady zour', 'Sklenička zour je kvalitní sklenička z řady zour', '353.0', '0.0', '0', '0', '79', '1', '0');
INSERT INTO product VALUES ('24', '4378967', '24-sklenicka-ella', 'Sklenička ella', 'Sklenička ella je kvalitní sklenička z řady ella', 'Sklenička ella je kvalitní sklenička z řady ella', '563.0', '0.0', '0', '0', '40', '1', '0');
INSERT INTO product VALUES ('25', '951843', '25-kvetinac-sense', 'Květináč sense', 'Květináč sense je kvalitní květináč z řady sense', 'Květináč sense je kvalitní květináč z řady sense', '471.0', '0.0', '0', '0', '84', '1', '0');
INSERT INTO product VALUES ('26', '8691712', '26-zaclona-alfa', 'Záclona alfa', 'Záclona alfa je kvalitní záclona z řady alfa', 'Záclona alfa je kvalitní záclona z řady alfa', '488.0', '0.0', '0', '0', '152', '1', '0');
INSERT INTO product VALUES ('27', '8262635', '27-sklenicka-zero', 'Sklenička zero', 'Sklenička zero je kvalitní sklenička z řady zero', 'Sklenička zero je kvalitní sklenička z řady zero', '743.0', '0.0', '0', '0', '53', '1', '0');
INSERT INTO product VALUES ('28', '5016174', '28-kvetinac-zour', 'Květináč zour', 'Květináč zour je kvalitní květináč z řady zour', 'Květináč zour je kvalitní květináč z řady zour', '334.0', '0.0', '0', '0', '118', '1', '0');
INSERT INTO product VALUES ('29', '1491394', '29-kvetinac-alfa', 'Květináč alfa', 'Květináč alfa je kvalitní květináč z řady alfa', 'Květináč alfa je kvalitní květináč z řady alfa', '576.0', '0.0', '0', '0', '42', '1', '0');
INSERT INTO product VALUES ('30', '9914856', '30-kvetinac-zour', 'Květináč zour', 'Květináč zour je kvalitní květináč z řady zour', 'Květináč zour je kvalitní květináč z řady zour', '255.0', '0.0', '0', '0', '144', '1', '0');
INSERT INTO product VALUES ('31', '4700623', '31-zaclona-sense', 'Záclona sense', 'Záclona sense je kvalitní záclona z řady sense', 'Záclona sense je kvalitní záclona z řady sense', '875.0', '0.0', '0', '0', '8', '1', '0');
INSERT INTO product VALUES ('32', '4950256', '32-sklenicka-sense', 'Sklenička sense', 'Sklenička sense je kvalitní sklenička z řady sense', 'Sklenička sense je kvalitní sklenička z řady sense', '909.0', '0.0', '0', '0', '137', '1', '0');
INSERT INTO product VALUES ('33', '6952820', '33-kvetinac-ella', 'Květináč ella', 'Květináč ella je kvalitní květináč z řady ella', 'Květináč ella je kvalitní květináč z řady ella', '48.0', '0.0', '0', '0', '5', '1', '0');
INSERT INTO product VALUES ('34', '6684876', '34-kvetinac-zero', 'Květináč zero', 'Květináč zero je kvalitní květináč z řady zero', 'Květináč zero je kvalitní květináč z řady zero', '452.0', '0.0', '0', '0', '103', '1', '0');
INSERT INTO product VALUES ('35', '2310486', '35-sklenicka-alfa', 'Sklenička alfa', 'Sklenička alfa je kvalitní sklenička z řady alfa', 'Sklenička alfa je kvalitní sklenička z řady alfa', '999.0', '0.0', '0', '0', '192', '1', '0');
INSERT INTO product VALUES ('36', '6681214', '36-sklenicka-ella', 'Sklenička ella', 'Sklenička ella je kvalitní sklenička z řady ella', 'Sklenička ella je kvalitní sklenička z řady ella', '539.0', '0.0', '0', '0', '149', '1', '0');
INSERT INTO product VALUES ('37', '9836121', '37-kvetinac-ella', 'Květináč ella', 'Květináč ella je kvalitní květináč z řady ella', 'Květináč ella je kvalitní květináč z řady ella', '137.0', '0.0', '0', '0', '23', '1', '0');
INSERT INTO product VALUES ('38', '1501770', '38-kvetinac-zero', 'Květináč zero', 'Květináč zero je kvalitní květináč z řady zero', 'Květináč zero je kvalitní květináč z řady zero', '328.0', '0.0', '0', '0', '80', '1', '0');
INSERT INTO product VALUES ('39', '3592224', '39-kvetinac-zour', 'Květináč zour', 'Květináč zour je kvalitní květináč z řady zour', 'Květináč zour je kvalitní květináč z řady zour', '366.0', '0.0', '0', '0', '55', '1', '0');
INSERT INTO product VALUES ('40', '2709045', '40-sklenicka-sense', 'Sklenička sense', 'Sklenička sense je kvalitní sklenička z řady sense', 'Sklenička sense je kvalitní sklenička z řady sense', '474.0', '0.0', '0', '0', '3', '1', '0');
INSERT INTO product VALUES ('41', '2641296', '41-sklenicka-zero', 'Sklenička zero', 'Sklenička zero je kvalitní sklenička z řady zero', 'Sklenička zero je kvalitní sklenička z řady zero', '94.0', '0.0', '0', '0', '145', '1', '0');
INSERT INTO product VALUES ('42', '6865540', '42-sklenicka-alfa', 'Sklenička alfa', 'Sklenička alfa je kvalitní sklenička z řady alfa', 'Sklenička alfa je kvalitní sklenička z řady alfa', '134.0', '0.0', '0', '0', '124', '1', '0');
INSERT INTO product VALUES ('43', '1045837', '43-sklenicka-ella', 'Sklenička ella', 'Sklenička ella je kvalitní sklenička z řady ella', 'Sklenička ella je kvalitní sklenička z řady ella', '225.0', '0.0', '0', '0', '49', '1', '0');
INSERT INTO product VALUES ('44', '5533752', '44-kvetinac-best', 'Květináč best', 'Květináč best je kvalitní květináč z řady best', 'Květináč best je kvalitní květináč z řady best', '963.0', '0.0', '0', '0', '149', '1', '0');
INSERT INTO product VALUES ('45', '7868347', '45-kvetinac-sense', 'Květináč sense', 'Květináč sense je kvalitní květináč z řady sense', 'Květináč sense je kvalitní květináč z řady sense', '167.0', '0.0', '0', '0', '22', '1', '0');
INSERT INTO product VALUES ('46', '5276184', '46-kvetinac-alfa', 'Květináč alfa', 'Květináč alfa je kvalitní květináč z řady alfa', 'Květináč alfa je kvalitní květináč z řady alfa', '120.0', '0.0', '0', '0', '85', '1', '0');
INSERT INTO product VALUES ('47', '7171326', '47-sklenicka-zero', 'Sklenička zero', 'Sklenička zero je kvalitní sklenička z řady zero', 'Sklenička zero je kvalitní sklenička z řady zero', '825.0', '0.0', '0', '0', '22', '1', '0');
INSERT INTO product VALUES ('48', '7655335', '48-zaclona-sense', 'Záclona sense', 'Záclona sense je kvalitní záclona z řady sense', 'Záclona sense je kvalitní záclona z řady sense', '258.0', '0.0', '0', '0', '37', '1', '0');
INSERT INTO product VALUES ('49', '8017273', '49-kvetinac-zour', 'Květináč zour', 'Květináč zour je kvalitní květináč z řady zour', 'Květináč zour je kvalitní květináč z řady zour', '607.0', '0.0', '0', '0', '104', '1', '0');
INSERT INTO product VALUES ('50', '9233704', '50-zaclona-best', 'Záclona best', 'Záclona best je kvalitní záclona z řady best', 'Záclona best je kvalitní záclona z řady best', '535.0', '0.0', '0', '0', '13', '1', '0');
INSERT INTO product VALUES ('51', '4468689', '51-sklenicka-alfa', 'Sklenička alfa', 'Sklenička alfa je kvalitní sklenička z řady alfa', 'Sklenička alfa je kvalitní sklenička z řady alfa', '419.0', '0.0', '0', '0', '25', '1', '0');
INSERT INTO product VALUES ('52', '1573791', '52-sklenicka-alfa', 'Sklenička alfa', 'Sklenička alfa je kvalitní sklenička z řady alfa', 'Sklenička alfa je kvalitní sklenička z řady alfa', '606.0', '0.0', '0', '0', '118', '1', '0');
INSERT INTO product VALUES ('53', '5588074', '53-kvetinac-kath', 'Květináč kath', 'Květináč kath je kvalitní květináč z řady kath', 'Květináč kath je kvalitní květináč z řady kath', '665.0', '0.0', '0', '0', '40', '1', '0');
INSERT INTO product VALUES ('54', '1238098', '54-sklenicka-sense', 'Sklenička sense', 'Sklenička sense je kvalitní sklenička z řady sense', 'Sklenička sense je kvalitní sklenička z řady sense', '629.0', '0.0', '0', '0', '158', '1', '0');
INSERT INTO product VALUES ('55', '5437927', '55-sklenicka-best', 'Sklenička best', 'Sklenička best je kvalitní sklenička z řady best', 'Sklenička best je kvalitní sklenička z řady best', '254.0', '0.0', '0', '0', '107', '1', '0');
INSERT INTO product VALUES ('56', '9789124', '56-sklenicka-ella', 'Sklenička ella', 'Sklenička ella je kvalitní sklenička z řady ella', 'Sklenička ella je kvalitní sklenička z řady ella', '260.0', '0.0', '0', '0', '41', '1', '0');
INSERT INTO product VALUES ('57', '3080749', '57-kvetinac-alfa', 'Květináč alfa', 'Květináč alfa je kvalitní květináč z řady alfa', 'Květináč alfa je kvalitní květináč z řady alfa', '590.0', '0.0', '0', '0', '81', '1', '0');
INSERT INTO product VALUES ('58', '3789368', '58-sklenicka-best', 'Sklenička best', 'Sklenička best je kvalitní sklenička z řady best', 'Sklenička best je kvalitní sklenička z řady best', '654.0', '0.0', '0', '0', '171', '1', '0');
INSERT INTO product VALUES ('59', '2579040', '59-sklenicka-best', 'Sklenička best', 'Sklenička best je kvalitní sklenička z řady best', 'Sklenička best je kvalitní sklenička z řady best', '581.0', '0.0', '0', '0', '119', '1', '0');
INSERT INTO product VALUES ('60', '4801331', '60-sklenicka-alfa', 'Sklenička alfa', 'Sklenička alfa je kvalitní sklenička z řady alfa', 'Sklenička alfa je kvalitní sklenička z řady alfa', '468.0', '0.0', '0', '0', '55', '1', '0');
INSERT INTO product VALUES ('61', '2995300', '61-sklenicka-best', 'Sklenička best', 'Sklenička best je kvalitní sklenička z řady best', 'Sklenička best je kvalitní sklenička z řady best', '632.0', '0.0', '0', '0', '77', '1', '0');
INSERT INTO product VALUES ('62', '9387513', '62-zaclona-sense', 'Záclona sense', 'Záclona sense je kvalitní záclona z řady sense', 'Záclona sense je kvalitní záclona z řady sense', '858.0', '0.0', '0', '0', '101', '1', '0');
INSERT INTO product VALUES ('63', '8392029', '63-sklenicka-best', 'Sklenička best', 'Sklenička best je kvalitní sklenička z řady best', 'Sklenička best je kvalitní sklenička z řady best', '650.0', '0.0', '0', '0', '111', '1', '0');
INSERT INTO product VALUES ('64', '9110413', '64-kvetinac-kath', 'Květináč kath', 'Květináč kath je kvalitní květináč z řady kath', 'Květináč kath je kvalitní květináč z řady kath', '481.0', '0.0', '0', '0', '13', '1', '0');
INSERT INTO product VALUES ('65', '7831726', '65-sklenicka-ella', 'Sklenička ella', 'Sklenička ella je kvalitní sklenička z řady ella', 'Sklenička ella je kvalitní sklenička z řady ella', '42.0', '0.0', '0', '0', '78', '1', '0');
INSERT INTO product VALUES ('66', '532531', '66-kvetinac-zour', 'Květináč zour', 'Květináč zour je kvalitní květináč z řady zour', 'Květináč zour je kvalitní květináč z řady zour', '493.0', '0.0', '0', '0', '198', '1', '0');
INSERT INTO product VALUES ('67', '5376892', '67-kvetinac-sense', 'Květináč sense', 'Květináč sense je kvalitní květináč z řady sense', 'Květináč sense je kvalitní květináč z řady sense', '712.0', '0.0', '0', '0', '133', '1', '0');
INSERT INTO product VALUES ('68', '5216370', '68-sklenicka-alfa', 'Sklenička alfa', 'Sklenička alfa je kvalitní sklenička z řady alfa', 'Sklenička alfa je kvalitní sklenička z řady alfa', '549.0', '0.0', '0', '0', '162', '1', '0');
INSERT INTO product VALUES ('69', '90026', '69-sklenicka-zero', 'Sklenička zero', 'Sklenička zero je kvalitní sklenička z řady zero', 'Sklenička zero je kvalitní sklenička z řady zero', '69.0', '0.0', '0', '0', '133', '1', '0');
INSERT INTO product VALUES ('70', '9724427', '70-sklenicka-alfa', 'Sklenička alfa', 'Sklenička alfa je kvalitní sklenička z řady alfa', 'Sklenička alfa je kvalitní sklenička z řady alfa', '806.0', '0.0', '0', '0', '112', '1', '0');
INSERT INTO product VALUES ('71', '6033630', '71-sklenicka-zero', 'Sklenička zero', 'Sklenička zero je kvalitní sklenička z řady zero', 'Sklenička zero je kvalitní sklenička z řady zero', '17.0', '0.0', '0', '0', '34', '1', '0');
INSERT INTO product VALUES ('72', '5619202', '72-sklenicka-alfa', 'Sklenička alfa', 'Sklenička alfa je kvalitní sklenička z řady alfa', 'Sklenička alfa je kvalitní sklenička z řady alfa', '921.0', '0.0', '0', '0', '153', '1', '0');
INSERT INTO product VALUES ('73', '2270202', '73-sklenicka-sense', 'Sklenička sense', 'Sklenička sense je kvalitní sklenička z řady sense', 'Sklenička sense je kvalitní sklenička z řady sense', '962.0', '0.0', '0', '0', '93', '1', '0');
INSERT INTO product VALUES ('74', '9463196', '74-kvetinac-alfa', 'Květináč alfa', 'Květináč alfa je kvalitní květináč z řady alfa', 'Květináč alfa je kvalitní květináč z řady alfa', '50.0', '0.0', '0', '0', '93', '1', '0');
INSERT INTO product VALUES ('75', '2862243', '75-zaclona-sense', 'Záclona sense', 'Záclona sense je kvalitní záclona z řady sense', 'Záclona sense je kvalitní záclona z řady sense', '812.0', '0.0', '0', '0', '65', '1', '0');
INSERT INTO product VALUES ('76', '2818908', '76-zaclona-zero', 'Záclona zero', 'Záclona zero je kvalitní záclona z řady zero', 'Záclona zero je kvalitní záclona z řady zero', '848.0', '0.0', '0', '0', '37', '1', '0');
INSERT INTO product VALUES ('77', '6872254', '77-zaclona-sense', 'Záclona sense', 'Záclona sense je kvalitní záclona z řady sense', 'Záclona sense je kvalitní záclona z řady sense', '973.0', '0.0', '0', '0', '7', '1', '0');
INSERT INTO product VALUES ('78', '2248840', '78-kvetinac-zero', 'Květináč zero', 'Květináč zero je kvalitní květináč z řady zero', 'Květináč zero je kvalitní květináč z řady zero', '473.0', '0.0', '0', '0', '191', '1', '0');
INSERT INTO product VALUES ('79', '8362732', '79-sklenicka-kath', 'Sklenička kath', 'Sklenička kath je kvalitní sklenička z řady kath', 'Sklenička kath je kvalitní sklenička z řady kath', '351.0', '0.0', '0', '0', '75', '1', '0');
INSERT INTO product VALUES ('80', '9315491', '80-sklenicka-sense', 'Sklenička sense', 'Sklenička sense je kvalitní sklenička z řady sense', 'Sklenička sense je kvalitní sklenička z řady sense', '580.0', '0.0', '0', '0', '63', '1', '0');
INSERT INTO product VALUES ('81', '6396179', '81-zaclona-ella', 'Záclona ella', 'Záclona ella je kvalitní záclona z řady ella', 'Záclona ella je kvalitní záclona z řady ella', '352.0', '0.0', '0', '0', '126', '1', '0');
INSERT INTO product VALUES ('82', '581359', '82-kvetinac-kath', 'Květináč kath', 'Květináč kath je kvalitní květináč z řady kath', 'Květináč kath je kvalitní květináč z řady kath', '326.0', '0.0', '0', '0', '57', '1', '0');
INSERT INTO product VALUES ('83', '5035095', '83-kvetinac-best', 'Květináč best', 'Květináč best je kvalitní květináč z řady best', 'Květináč best je kvalitní květináč z řady best', '881.0', '0.0', '0', '0', '116', '1', '0');
INSERT INTO product VALUES ('84', '7608948', '84-zaclona-best', 'Záclona best', 'Záclona best je kvalitní záclona z řady best', 'Záclona best je kvalitní záclona z řady best', '366.0', '0.0', '0', '0', '81', '1', '0');
INSERT INTO product VALUES ('85', '3341980', '85-sklenicka-alfa', 'Sklenička alfa', 'Sklenička alfa je kvalitní sklenička z řady alfa', 'Sklenička alfa je kvalitní sklenička z řady alfa', '347.0', '0.0', '0', '0', '100', '1', '0');
INSERT INTO product VALUES ('86', '6960755', '86-kvetinac-alfa', 'Květináč alfa', 'Květináč alfa je kvalitní květináč z řady alfa', 'Květináč alfa je kvalitní květináč z řady alfa', '858.0', '0.0', '0', '0', '140', '1', '0');
INSERT INTO product VALUES ('87', '5379334', '87-kvetinac-best', 'Květináč best', 'Květináč best je kvalitní květináč z řady best', 'Květináč best je kvalitní květináč z řady best', '654.0', '0.0', '0', '0', '36', '1', '0');
INSERT INTO product VALUES ('88', '199279', '88-kvetinac-alfa', 'Květináč alfa', 'Květináč alfa je kvalitní květináč z řady alfa', 'Květináč alfa je kvalitní květináč z řady alfa', '457.0', '0.0', '0', '0', '141', '1', '0');
INSERT INTO product VALUES ('89', '209655', '89-sklenicka-alfa', 'Sklenička alfa', 'Sklenička alfa je kvalitní sklenička z řady alfa', 'Sklenička alfa je kvalitní sklenička z řady alfa', '210.0', '0.0', '0', '0', '179', '1', '0');
INSERT INTO product VALUES ('90', '3887024', '90-kvetinac-alfa', 'Květináč alfa', 'Květináč alfa je kvalitní květináč z řady alfa', 'Květináč alfa je kvalitní květináč z řady alfa', '320.0', '0.0', '0', '0', '90', '1', '0');
INSERT INTO product VALUES ('91', '1895446', '91-zaclona-alfa', 'Záclona alfa', 'Záclona alfa je kvalitní záclona z řady alfa', 'Záclona alfa je kvalitní záclona z řady alfa', '918.0', '0.0', '0', '0', '85', '1', '0');
INSERT INTO product VALUES ('92', '9586487', '92-sklenicka-ella', 'Sklenička ella', 'Sklenička ella je kvalitní sklenička z řady ella', 'Sklenička ella je kvalitní sklenička z řady ella', '103.0', '0.0', '0', '0', '93', '1', '0');
INSERT INTO product VALUES ('93', '9499207', '93-zaclona-alfa', 'Záclona alfa', 'Záclona alfa je kvalitní záclona z řady alfa', 'Záclona alfa je kvalitní záclona z řady alfa', '189.0', '0.0', '0', '0', '12', '1', '0');
INSERT INTO product VALUES ('94', '3860168', '94-kvetinac-best', 'Květináč best', 'Květináč best je kvalitní květináč z řady best', 'Květináč best je kvalitní květináč z řady best', '962.0', '0.0', '0', '0', '157', '1', '0');
INSERT INTO product VALUES ('95', '7083435', '95-zaclona-ella', 'Záclona ella', 'Záclona ella je kvalitní záclona z řady ella', 'Záclona ella je kvalitní záclona z řady ella', '926.0', '0.0', '0', '0', '115', '1', '0');
INSERT INTO product VALUES ('96', '8270569', '96-sklenicka-ella', 'Sklenička ella', 'Sklenička ella je kvalitní sklenička z řady ella', 'Sklenička ella je kvalitní sklenička z řady ella', '553.0', '0.0', '0', '0', '188', '1', '0');
INSERT INTO product VALUES ('97', '3710632', '97-sklenicka-alfa', 'Sklenička alfa', 'Sklenička alfa je kvalitní sklenička z řady alfa', 'Sklenička alfa je kvalitní sklenička z řady alfa', '536.0', '0.0', '0', '0', '50', '1', '0');
INSERT INTO product VALUES ('98', '9380188', '98-zaclona-alfa', 'Záclona alfa', 'Záclona alfa je kvalitní záclona z řady alfa', 'Záclona alfa je kvalitní záclona z řady alfa', '34.0', '0.0', '0', '0', '192', '1', '0');
INSERT INTO product VALUES ('99', '3443298', '99-kvetinac-sense', 'Květináč sense', 'Květináč sense je kvalitní květináč z řady sense', 'Květináč sense je kvalitní květináč z řady sense', '925.0', '0.0', '0', '0', '174', '1', '0');
INSERT INTO product VALUES ('100', '8751526', '100-zaclona-alfa', 'Záclona alfa', 'Záclona alfa je kvalitní záclona z řady alfa', 'Záclona alfa je kvalitní záclona z řady alfa', '59.0', '0.0', '0', '0', '75', '1', '0');
INSERT INTO product VALUES ('101', '10000001', 'ceska-posta-dobirka', 'Česká pošta - Dobírka', '', '', '130.0', '0.0', '0', '0', '0', '0', '1');
INSERT INTO product VALUES ('102', '10000002', 'ppl-dobirka', 'PPL - Dobírka', '', '', '100.0', '0.0', '0', '0', '0', '0', '1');

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
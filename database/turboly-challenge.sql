/*
SQLyog Ultimate v12.4.3 (64 bit)
MySQL - 10.1.30-MariaDB : Database - turboly_challenge
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`turboly_challenge` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `turboly_challenge`;

/*Table structure for table `_code` */

DROP TABLE IF EXISTS `_code`;

CREATE TABLE `_code` (
  `pkey` int(11) NOT NULL AUTO_INCREMENT,
  `useautocode` int(1) NOT NULL DEFAULT '1',
  `isautoconfirmed` int(1) NOT NULL DEFAULT '1',
  `code` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `prefix` varchar(255) DEFAULT NULL,
  `digit` int(11) DEFAULT '5',
  PRIMARY KEY (`pkey`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `_code` */

insert  into `_code`(`pkey`,`useautocode`,`isautoconfirmed`,`code`,`label`,`prefix`,`digit`) values 
(1,1,0,'employee','Karyawan','EP',5),
(2,1,0,'task','Task','TSK',5);

/*Table structure for table `_nextkey` */

DROP TABLE IF EXISTS `_nextkey`;

CREATE TABLE `_nextkey` (
  `pkey` int(11) NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) DEFAULT NULL,
  `nextkey` int(11) DEFAULT NULL,
  PRIMARY KEY (`pkey`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

/*Data for the table `_nextkey` */

insert  into `_nextkey`(`pkey`,`table_name`,`nextkey`) values 
(1,'_code',3),
(2,'_nextkey',18),
(3,'_setting',57),
(4,'_setting_category',7),
(5,'_setting_detail',1),
(6,'_user_code',3),
(7,'_user_setting',57),
(8,'employee',3),
(9,'employee_status',4),
(10,'task',5),
(11,'login_log',1),
(12,'login_log_status',3),
(13,'master_status',3),
(14,'security_access',218),
(15,'security_object',3),
(16,'tag',6),
(17,'user_security_object',3);

/*Table structure for table `_setting` */

DROP TABLE IF EXISTS `_setting`;

CREATE TABLE `_setting` (
  `pkey` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `categorykey` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `orderlist` int(11) DEFAULT NULL,
  `show` int(11) DEFAULT '0',
  `multivalue` int(11) DEFAULT '0',
  PRIMARY KEY (`pkey`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;

/*Data for the table `_setting` */

insert  into `_setting`(`pkey`,`code`,`categorykey`,`description`,`type`,`orderlist`,`show`,`multivalue`) values 
(1,'sitesName',1,'Nama Situs',1,1,1,0),
(2,'companyName',2,'Nama Perusahaan',1,2,1,0),
(3,'companyLogo',2,'Logo Perusahaan (Web)',6,3,1,0),
(4,'companyAddress',2,'Alamat',3,5,1,0),
(5,'companyPhone',3,'Telepon',1,1,1,1),
(6,'companyFax',3,'Fax',1,6,0,0),
(7,'companyEmail',3,'Email',1,2,1,1),
(8,'companyMessenger',3,'Messenger',1,3,1,1),
(9,'companyMedsos',3,'Media Sosial',1,4,1,1),
(10,'companyMap',2,'Koordinat Peta',1,5,1,0),
(11,'totalRandomProducts',1,'Jml. Produk Random',2,10,1,0),
(12,'lowStockThreshold',1,'Batas Stok Minimum',2,13,1,0),
(13,'webIcon',1,'Website Icon',6,1,1,0),
(14,'emailLogo',2,'Logo Perusahaan (Email)',6,4,1,0),
(15,'rewardsPointUnitValue',4,'Nilai Unit Point Reward',2,1,1,0),
(16,'rewardsPointMultiple',4,'Kelipatan Reward Point',2,1,1,0),
(17,'productCategoryOrder',1,'Pengurutan Kategori Produk',1,1,0,0),
(18,'emailInvoiceFooter',1,'Footer Invoice (Email)',3,14,1,0),
(19,'galleryTotalItemPerpage',1,'Total Gambar per Halaman',2,16,1,0),
(20,'poSlotThreshold',1,'Batas Stok PO',2,14,1,0),
(21,'emailPOInvoiceFooter',1,'Footer PO Invoice (Email)',3,15,1,0),
(22,'costProportionalType',1,'Metode Perhitungan Cost<br>(1: Gramasi, 2: Nilai Item)',1,1,0,0),
(23,'othersInformation',2,'Informasi Tambahan',3,8,1,0),
(24,'latestNews',1,'Jml. Berita/Artikel Terbaru',2,12,1,0),
(25,'newsTotalRowsPerPage',1,'Total Berita/Artikel per Halaman',2,12,1,0),
(26,'productTotalItemPerPage',1,'Total Produk per Halaman',2,12,1,0),
(27,'menuRows',1,'Menu per Kolom',2,0,0,0),
(28,'adminTotalRowsPerPage',1,'Jml Baris per Hal (Admin)',2,1,0,0),
(29,'version',1,'Versi',1,1,0,0),
(30,'FBLikeScript',5,'Script FB Like',4,3,1,0),
(31,'FBPluginScript',5,'Script FB Plugin',4,2,1,0),
(32,'reCaptchaSiteKey',5,'reCaptcha Site Key',1,3,1,0),
(33,'reCaptchaSecretKey',5,'reCAPTCHA Secret Key',1,4,1,0),
(34,'lockoutSecond',1,'Interval lockout (detik)',2,99,1,0),
(35,'loginAttemptUntilLockout',1,'Percobaan Login',2,98,1,0),
(36,'chatSupport',5,'Chat',4,5,1,0),
(37,'googleAnalytics',5,'Google Analytics',4,6,1,0),
(38,'metaURL',6,'URL',1,1,1,0),
(39,'metaTitle',6,'Title',1,2,1,0),
(40,'metaDescription',6,'Description',1,3,1,0),
(41,'metaType',6,'Type',1,4,1,0),
(42,'metaImage',6,'Image',6,5,1,0),
(43,'metaKeywords',6,'Keywords',1,7,1,0),
(44,'FBAppID',5,'FB App ID',1,1,1,0),
(45,'rememberLatestSellingPrice',1,'Menampilkan Harga Jual Terakhir.<br><br>(1: Ya, 2: Tidak)',1,20,1,0),
(46,'adminPath',1,'URL Backoffice',1,2,0,0),
(47,'inventoryCOAType',1,'Pengelompokan Persediaan COA',1,20,0,0),
(48,'useGL',1,'Fitur GL',1,20,1,0),
(49,'underMaintenance',1,'Situs Dalam Pemeliharaan<br>(1: Ya, 2: Tidak)',1,998,1,0),
(50,'underMaintenanceImage',1,'Gambar Pemeliharaan',6,999,1,0),
(51,'adminBackgroundImage',1,'Background Admin',6,1000,1,0),
(52,'defaultLang',1,'Bahasa',1,1000,0,0),
(53,'emailTemplate',1,'Template Email',3,1000,0,0),
(54,'salesInvoiceDetailTemplate',1,'Template Detail Faktur',3,1000,0,0),
(55,'salesInvoiceTemplate',1,'Template Faktur',3,1000,0,0),
(56,'invoiceArchiveEmail',1,'Email Berkas Faktur',1,1000,1,0),
(60,'movementDateMethod',1,'Metode Pergerakan<br>(1: Tgl. Konfirmasi, 2: Tgl. Transaksi)',1,1000,1,0),
(61,'decimalTransaction',1,'Jml. Desimal',1,1,0,0),
(62,'defaultPawnDuedate',7,'Lama Tempo Gadai',2,1,1,0),
(63,'defaultPawnRate',7,'Suku Bunga Gadai',2,1,1,0),
(64,'defaultPawnBreak',7,'Break Hari',2,1,1,0);

/*Table structure for table `_setting_category` */

DROP TABLE IF EXISTS `_setting_category`;

CREATE TABLE `_setting_category` (
  `pkey` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(255) DEFAULT NULL,
  `orderlist` int(11) DEFAULT NULL,
  PRIMARY KEY (`pkey`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `_setting_category` */

insert  into `_setting_category`(`pkey`,`category`,`orderlist`) values 
(1,'Umum',1),
(2,'Informasi Perusahaan',2),
(3,'Informasi Kontak',4),
(4,'Promo & Campaign',5),
(5,'Plugin',6),
(6,'Meta Tag',7),
(7,'Variabel Gadai',3);

/*Table structure for table `_setting_detail` */

DROP TABLE IF EXISTS `_setting_detail`;

CREATE TABLE `_setting_detail` (
  `pkey` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `refkey` int(11) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pkey`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

/*Data for the table `_setting_detail` */

insert  into `_setting_detail`(`pkey`,`refkey`,`label`,`value`,`file`) values 
(15,5,'Phone','(021)31931621',NULL);

/*Table structure for table `_user_code` */

DROP TABLE IF EXISTS `_user_code`;

CREATE TABLE `_user_code` (
  `pkey` int(11) NOT NULL AUTO_INCREMENT,
  `codekey` int(11) DEFAULT NULL,
  `counter` int(11) DEFAULT '1',
  PRIMARY KEY (`pkey`),
  KEY `fcodekey` (`codekey`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `_user_code` */

insert  into `_user_code`(`pkey`,`codekey`,`counter`) values 
(1,1,8),
(2,2,5);

/*Table structure for table `_user_setting` */

DROP TABLE IF EXISTS `_user_setting`;

CREATE TABLE `_user_setting` (
  `pkey` int(11) NOT NULL AUTO_INCREMENT,
  `settingkey` int(11) DEFAULT NULL,
  `value` text,
  PRIMARY KEY (`pkey`),
  KEY `fsettingkey` (`settingkey`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;

/*Data for the table `_user_setting` */

insert  into `_user_setting`(`pkey`,`settingkey`,`value`) values 
(1,1,''),
(2,2,''),
(3,3,'j.jpg'),
(4,4,''),
(5,5,''),
(6,6,''),
(7,7,''),
(8,8,'j.jpg'),
(9,9,''),
(10,10,''),
(11,11,'25.00'),
(12,12,'5.00'),
(13,13,''),
(14,14,''),
(15,15,'0.00'),
(16,16,'0.00'),
(17,17,'2'),
(18,18,''),
(19,19,'9.00'),
(20,20,'0.00'),
(21,21,''),
(22,22,'2'),
(23,23,''),
(24,24,'5.00'),
(25,25,'10.00'),
(26,26,'25.00'),
(27,27,'5'),
(28,28,'25'),
(29,29,'3'),
(30,30,''),
(31,31,''),
(32,32,''),
(33,33,''),
(34,34,'60.00'),
(35,35,'3.00'),
(36,36,''),
(37,37,''),
(38,38,''),
(39,39,''),
(40,40,''),
(41,41,''),
(42,42,''),
(43,43,''),
(44,44,''),
(45,45,''),
(46,46,'admin'),
(47,47,'1'),
(48,48,'2'),
(49,49,''),
(50,50,''),
(51,51,''),
(52,52,'id'),
(53,53,'<body><table style=\"border:1px solid #ccc; width:100%; max-width:800px; color:#333;\"><tr><td style=\"text-align:center; padding:10px\">{{COMPANY_LOGO}}</td</tr><tr><td></td></tr><tr><td style=\"padding:10px;\">{{CONTENT}}</td></tr><tr><td style=\"text-align:center; font-size:0.9em; padding:10px; border-top:1px solid #ccc;\"><a href=\"{{WEBSITE_URL}}\" target=\"_blank\" style=\"color:#999;\">{{COMPANY_NAME}}</a></td></tr></table></body>'),
(54,54,'<tr><td style=\"padding: 5px; vertical-align:top;border-top:1px solid #e9e9e9; text-align:right;\" >{{ROW_NUMBER}}.</td>  <td style=\"padding: 5px; vertical-align:top;border-top:1px solid #e9e9e9;\"><a href=\"{{ITEM_URL}}\" target=\"_blank\">{{ITEM_NAME}}</a></td><td style=\"padding: 5px; vertical-align:top;border-top:1px solid #e9e9e9;text-align:right;\" >{{UNIT_PRICE}}</td><td style=\"padding: 5px; vertical-align:top;border-top:1px solid #e9e9e9;text-align:right;\" >{{QTY}}</td><td style=\"padding: 5px; vertical-align:top;border-top:1px solid #e9e9e9;text-align:right;\" >{{SUBTOTAL}}</td></tr>'),
(55,55,'<div style=\"width:100%;\" > <table style=\"width:100%;\"> <tr> <td style=\"padding: 5px; vertical-align:top;\"><span style=\"font-size:22px;\">{{INVOICE_CODE}}</span></td> </tr> <tr> <td style=\"padding: 5px; vertical-align:top;\">{{INVOICE_DATE}}</td> </tr> </table> <div style=\"clear:both; height:20px;\"></div> <table style=\"font-size:14px; width:100%;text-align:left;\"> <tr> <td style=\"vertical-align:top; width:50%\"> <table style=\"width:100%;\"> <tr> <td style=\"padding: 5px; vertical-align:top; width:100px\"><strong>{{LANG_RECIPIENT_NAME}}</strong></td> <td style=\"padding: 5px; vertical-align:top;\">{{RECIPIENT_NAME}}</td> </tr> <tr> <td style=\"padding: 5px; vertical-align:top;\"><strong>{{LANG_RECIPIENT_PHONE}}</strong></td> <td style=\"padding: 5px; vertical-align:top;\">{{RECIPIENT_PHONE}}</td> <tr> <tr> <td style=\"padding: 5px; vertical-align:top;\"><strong>{{LANG_RECIPIENT_EMAIL}}</strong></td> <td style=\"padding: 5px; vertical-align:top;\">{{RECIPIENT_EMAIL}}</td> <tr> </table> </td> <td style=\"vertical-align:top; width:50%\"> <table style=\"width:100%;\"> <tr> <td style=\"padding: 5px; vertical-align:top; width:100px\"><strong>{{LANG_RECIPIENT_ADDRESS}}</strong></td> <td style=\"padding: 5px; vertical-align:top;\">{{RECIPIENT_ADDRESS}}</td> </tr> </table> </td> </tr> </table> <div style=\"clear:both; height:10px;\"></div> <table style=\" width:100%;text-align:left;\"> <tr> <td style=\"padding: 5px; vertical-align:top;border-top:1px solid #666;border-bottom:1px solid #666;font-weight:bold;width:30px; text-align:right;\">#</td> <td style=\"padding: 5px; vertical-align:top;border-top:1px solid #666;border-bottom:1px solid #666;font-weight:bold;width:350px\">{{LANG_ITEM_NAME}}</td> <td style=\"padding: 5px; vertical-align:top;border-top:1px solid #666;border-bottom:1px solid #666;font-weight:bold;width:80px; text-align:right;\">@ {{LANG_PRICE}}</td> <td style=\"padding: 5px; vertical-align:top;border-top:1px solid #666;border-bottom:1px solid #666;font-weight:bold;width:70px; text-align:right;\">{{LANG_QTY}}</td> <td style=\"padding: 5px; vertical-align:top;border-top:1px solid #666;border-bottom:1px solid #666;font-weight:bold;text-align:right;\">{{LANG_SUBTOTAL}} (IDR)</td> </tr> {{INVOICE_DETAIL}} <tr > <td colspan=\"3\" style=\"padding: 5px; vertical-align:top;border-top:1px solid #000;font-weight:bold;text-align:right; \">{{LANG_TOTAL}}</td> <td style=\"padding: 5px; vertical-align:top;border-top:1px solid #000;font-weight:bold;text-align:right; \" >{{TOTAL_QTY}}</td> <td style=\"padding: 5px; vertical-align:top;border-top:1px solid #000;font-weight:bold;text-align:right; \" >{{TOTAL_PRICE}}</td> </tr> <tr> <td colspan=\"3\" style=\"padding: 5px; vertical-align:top; font-weight:bold;text-align:right; \">{{LANG_DISCOUNT}}</td> <td style=\"padding: 5px; vertical-align:top;font-weight:bold;text-align:right; \" ></td> <td style=\"padding: 5px; vertical-align:top;font-weight:bold;text-align:right; \" >{{DISCOUNT}}</td> </tr> <tr> <td colspan=\"3\" style=\"padding: 5px; vertical-align:top;font-weight:bold;text-align:right; \">{{LANG_TAX}}</td> <td style=\"padding: 5px; vertical-align:top;font-weight:bold;text-align:right; \" ></td> <td style=\"padding: 5px; vertical-align:top;font-weight:bold;text-align:right; \" >{{TAX}}</td> </tr>  <tr> <td colspan=\"3\" style=\"padding: 5px; vertical-align:top;font-weight:bold;text-align:right; \">{{LANG_COST}}</td> <td style=\"padding: 5px; vertical-align:top;font-weight:bold;text-align:right; \" ></td> <td style=\"padding: 5px; vertical-align:top;font-weight:bold;text-align:right; \" >{{SHIPMENT_AND_COST}}</td> </tr> <tr> <td colspan=\"3\" style=\"padding: 5px; vertical-align:top;font-weight:bold;text-align:right;\">{{LANG_TOTAL}}</td> <td style=\"padding: 5px; vertical-align:top;font-weight:bold;text-align:right;\"></td> <td style=\"padding: 5px; vertical-align:top;font-weight:bold;text-align:right;\">{{GRAND_TOTAL}}</td> </tr> </table> <div style=\"clear:both; height:30px;\"></div> <div style=\"font-size:12px\">{{INVOICE_FOOTER}}</div> </div>'),
(56,56,''),
(57,60,'2'),
(58,61,'2'),
(59,62,'120.00'),
(60,63,'1.00'),
(61,64,'1.00');

/*Table structure for table `employee` */

DROP TABLE IF EXISTS `employee`;

CREATE TABLE `employee` (
  `pkey` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `categorykey` int(11) NOT NULL,
  `warehousekey` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `address1` varchar(255) DEFAULT NULL,
  `address2` varchar(255) NOT NULL,
  `citykey` int(11) NOT NULL,
  `zipcode` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `statuskey` int(11) DEFAULT '1',
  `registerdt` date DEFAULT '0000-00-00',
  `maxdisc` int(11) NOT NULL DEFAULT '0',
  `activationhashkey` varchar(255) NOT NULL,
  `createdon` datetime NOT NULL,
  `createdby` int(11) NOT NULL,
  `modifiedon` datetime NOT NULL,
  `modifiedby` int(11) NOT NULL,
  `file` varchar(255) NOT NULL,
  `tagkey` int(11) NOT NULL DEFAULT '0',
  `systemVariable` int(11) DEFAULT '0',
  PRIMARY KEY (`pkey`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `employee` */

insert  into `employee`(`pkey`,`code`,`categorykey`,`warehousekey`,`username`,`password`,`name`,`address1`,`address2`,`citykey`,`zipcode`,`phone`,`mobile`,`email`,`statuskey`,`registerdt`,`maxdisc`,`activationhashkey`,`createdon`,`createdby`,`modifiedon`,`modifiedby`,`file`,`tagkey`,`systemVariable`) values 
(1,'EP00001',1,1,'admin','21232f297a57a5a743894a0e4a801fc3','Admin','Jalan sitoli','sitoli',463,'12345','12345','123456','admin@vormosa.com',2,'2013-04-11',0,'','0000-00-00 00:00:00',0,'2018-03-06 13:16:24',1,'',0,1),
(2,'EP00007',0,0,'zoolee','d8578edf8458ce06fbc5bb76a58c5ca4','Muhamad Soleh',NULL,'',0,'',NULL,NULL,NULL,2,'0000-00-00',0,'','2018-03-06 13:31:06',1,'2018-03-06 23:59:21',2,'',0,0);

/*Table structure for table `employee_status` */

DROP TABLE IF EXISTS `employee_status`;

CREATE TABLE `employee_status` (
  `pkey` tinyint(4) NOT NULL DEFAULT '0',
  `status` varchar(255) NOT NULL,
  PRIMARY KEY (`pkey`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `employee_status` */

insert  into `employee_status`(`pkey`,`status`) values 
(1,'Menunggu'),
(2,'Aktif'),
(3,'Non Aktif');

/*Table structure for table `login_log` */

DROP TABLE IF EXISTS `login_log`;

CREATE TABLE `login_log` (
  `pkey` int(11) NOT NULL AUTO_INCREMENT,
  `logintype` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `statuskey` int(11) NOT NULL,
  `createdon` datetime NOT NULL,
  PRIMARY KEY (`pkey`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `login_log` */

/*Table structure for table `login_log_status` */

DROP TABLE IF EXISTS `login_log_status`;

CREATE TABLE `login_log_status` (
  `pkey` tinyint(4) NOT NULL AUTO_INCREMENT,
  `status` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`pkey`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `login_log_status` */

insert  into `login_log_status`(`pkey`,`status`) values 
(1,'Berhasil'),
(2,'Gagal');

/*Table structure for table `master_status` */

DROP TABLE IF EXISTS `master_status`;

CREATE TABLE `master_status` (
  `pkey` tinyint(4) NOT NULL AUTO_INCREMENT,
  `status` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`pkey`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `master_status` */

insert  into `master_status`(`pkey`,`status`) values 
(1,'Aktif'),
(2,'Non Aktif');

/*Table structure for table `security_access` */

DROP TABLE IF EXISTS `security_access`;

CREATE TABLE `security_access` (
  `pkey` int(11) NOT NULL AUTO_INCREMENT,
  `userkey` int(11) DEFAULT NULL,
  `objectkey` int(11) DEFAULT NULL,
  `statuskey` int(11) DEFAULT NULL,
  PRIMARY KEY (`pkey`),
  KEY `fuserkey` (`userkey`,`objectkey`,`statuskey`)
) ENGINE=InnoDB AUTO_INCREMENT=6662 DEFAULT CHARSET=utf8;

/*Data for the table `security_access` */

insert  into `security_access`(`pkey`,`userkey`,`objectkey`,`statuskey`) values 
(6632,1,1,1),
(6633,1,1,2),
(6634,1,1,3),
(6629,1,1,10),
(6630,1,1,11),
(6631,1,1,12),
(6638,1,2,1),
(6639,1,2,2),
(6635,1,2,10),
(6636,1,2,11),
(6637,1,2,12),
(6659,2,1,1),
(6660,2,1,2),
(6661,2,1,3),
(6656,2,1,10),
(6657,2,1,11),
(6658,2,1,12),
(6654,2,2,1),
(6655,2,2,2),
(6651,2,2,10),
(6652,2,2,11),
(6653,2,2,12);

/*Table structure for table `security_object` */

DROP TABLE IF EXISTS `security_object`;

CREATE TABLE `security_object` (
  `pkey` int(11) NOT NULL AUTO_INCREMENT,
  `modulecode` varchar(255) DEFAULT NULL,
  `modulename` varchar(255) DEFAULT NULL,
  `modulestatus` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pkey`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `security_object` */

insert  into `security_object`(`pkey`,`modulecode`,`modulename`,`modulestatus`) values 
(1,'Employee','User','employee_status'),
(2,'Task','Task','task_status');

/*Table structure for table `tag` */

DROP TABLE IF EXISTS `tag`;

CREATE TABLE `tag` (
  `pkey` tinyint(4) NOT NULL DEFAULT '0',
  `tagname` varchar(255) NOT NULL,
  `hexcolor` varchar(255) NOT NULL,
  `shadowclass` varchar(255) NOT NULL,
  PRIMARY KEY (`pkey`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tag` */

insert  into `tag`(`pkey`,`tagname`,`hexcolor`,`shadowclass`) values 
(1,'Merah','#C41E3A','shadow-red-cardinal'),
(2,'Hijau','#568203','shadow-green-avocado'),
(3,'Kuning','#FFC40C','shadow-yellow-mikado'),
(4,'Biru','#0093AF','shadow-blue-munsell'),
(5,'Ungu','#9A4EAE','shadow-purple-purpureus');

/*Table structure for table `task` */

DROP TABLE IF EXISTS `task`;

CREATE TABLE `task` (
  `pkey` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `userkey` int(11) DEFAULT NULL,
  `task` varchar(255) DEFAULT NULL,
  `duedate` date DEFAULT NULL,
  `prioritykey` int(11) DEFAULT NULL,
  `statuskey` int(11) DEFAULT NULL,
  `description` text,
  `createdon` datetime NOT NULL,
  `createdby` int(11) DEFAULT NULL,
  `modifiedon` datetime DEFAULT NULL,
  `modifiedby` int(11) DEFAULT NULL,
  `tagkey` int(11) DEFAULT NULL,
  PRIMARY KEY (`pkey`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `task` */

insert  into `task`(`pkey`,`code`,`userkey`,`task`,`duedate`,`prioritykey`,`statuskey`,`description`,`createdon`,`createdby`,`modifiedon`,`modifiedby`,`tagkey`) values 
(1,'TSK00001',2,'test edit','2018-03-07',2,1,'gazsdfbvazdsfbbb','2018-03-06 22:14:50',2,'2018-03-07 20:57:36',2,NULL),
(2,'TSK00002',1,'tes 2 edit','2018-03-06',3,2,'edit edit','2018-03-06 22:16:10',2,'2018-03-06 22:59:51',2,NULL),
(3,'TSK00003',2,'Coba task hari ini','2018-03-07',1,2,'coba desc','2018-03-07 16:15:10',2,NULL,NULL,NULL),
(4,'TSK00004',2,'Task ke 2 nih','2018-03-07',3,1,'Bisa kali ini mah','2018-03-07 16:45:20',2,'2018-03-07 16:47:52',2,NULL);

/*Table structure for table `task_priority` */

DROP TABLE IF EXISTS `task_priority`;

CREATE TABLE `task_priority` (
  `pkey` tinyint(4) NOT NULL AUTO_INCREMENT,
  `priority` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`pkey`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `task_priority` */

insert  into `task_priority`(`pkey`,`priority`) values 
(1,'Low'),
(2,'Medium'),
(3,'High');

/*Table structure for table `task_status` */

DROP TABLE IF EXISTS `task_status`;

CREATE TABLE `task_status` (
  `pkey` tinyint(4) NOT NULL AUTO_INCREMENT,
  `status` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`pkey`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `task_status` */

insert  into `task_status`(`pkey`,`status`) values 
(1,'Open'),
(2,'Complete');

/*Table structure for table `transaction_log` */

DROP TABLE IF EXISTS `transaction_log`;

CREATE TABLE `transaction_log` (
  `pkey` int(11) NOT NULL AUTO_INCREMENT,
  `createdon` datetime NOT NULL,
  `createdby` int(11) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `tablename` varchar(255) DEFAULT NULL,
  `refkey` int(11) DEFAULT NULL,
  `refcode` varchar(255) DEFAULT NULL,
  `trdesc` text,
  `sqllog` text,
  PRIMARY KEY (`pkey`)
) ENGINE=InnoDB AUTO_INCREMENT=46298 DEFAULT CHARSET=utf8;

/*Data for the table `transaction_log` */

insert  into `transaction_log`(`pkey`,`createdon`,`createdby`,`action`,`tablename`,`refkey`,`refcode`,`trdesc`,`sqllog`) values 
(46251,'2018-03-06 11:20:55',1,'add','employee',12,'EP00012','',NULL),
(46252,'2018-03-06 11:21:01',1,'changestatus','employee',12,'EP00012','Aktif',NULL),
(46253,'2018-03-06 12:56:23',1,'edit','employee',12,'EP00012','',NULL),
(46254,'2018-03-06 12:59:56',1,'add','employee',13,'EP00006','',NULL),
(46255,'2018-03-06 13:00:42',1,'delete','employee',0,'','',NULL),
(46256,'2018-03-06 13:00:42',1,'delete','employee',0,'','',NULL),
(46257,'2018-03-06 13:14:59',1,'edit','employee',1,'EP00001','',NULL),
(46258,'2018-03-06 13:15:32',1,'edit','employee',1,'EP00001','',NULL),
(46259,'2018-03-06 13:16:24',1,'edit','employee',1,'EP00001','',NULL),
(46260,'2018-03-06 13:31:06',1,'add','employee',2,'EP00007','',NULL),
(46261,'2018-03-06 13:31:10',1,'changestatus','employee',2,'EP00007','Aktif',NULL),
(46262,'2018-03-06 22:14:50',2,'add','task',1,'TSK00001','',NULL),
(46263,'2018-03-06 22:14:58',2,'edit','task',1,'TSK00001','',NULL),
(46264,'2018-03-06 22:15:09',2,'edit','task',1,'TSK00001','',NULL),
(46265,'2018-03-06 22:15:14',2,'edit','task',1,'TSK00001','',NULL),
(46266,'2018-03-06 22:16:10',2,'add','task',2,'TSK00002','',NULL),
(46267,'2018-03-06 22:16:24',2,'edit','task',2,'TSK00002','',NULL),
(46268,'2018-03-06 22:16:41',2,'changestatus','task',2,'TSK00002','Complete',NULL),
(46269,'2018-03-06 22:45:30',2,'edit','task',2,'TSK00002','',NULL),
(46270,'2018-03-06 22:46:16',2,'edit','task',2,'TSK00002','',NULL),
(46271,'2018-03-06 22:47:10',2,'edit','task',2,'TSK00002','',NULL),
(46272,'2018-03-06 22:48:00',2,'edit','task',1,'TSK00001','',NULL),
(46273,'2018-03-06 22:59:43',2,'changestatus','task',2,'TSK00002','Open',NULL),
(46274,'2018-03-06 22:59:51',2,'edit','task',2,'TSK00002','',NULL),
(46275,'2018-03-06 23:05:02',2,'edit','employee',2,'EP00007','',NULL),
(46276,'2018-03-06 23:26:05',2,'edit','employee',2,'EP00007','',NULL),
(46277,'2018-03-06 23:29:04',2,'edit','employee',2,'EP00007','',NULL),
(46278,'2018-03-06 23:29:17',2,'edit','employee',2,'EP00007','',NULL),
(46279,'2018-03-06 23:35:15',2,'edit','employee',2,'EP00007','',NULL),
(46280,'2018-03-06 23:38:18',2,'edit','employee',2,'EP00007','',NULL),
(46281,'2018-03-06 23:42:48',2,'edit','employee',2,'EP00007','',NULL),
(46282,'2018-03-06 23:48:22',2,'edit','employee',2,'EP00007','',NULL),
(46283,'2018-03-06 23:48:36',2,'edit','employee',2,'EP00007','',NULL),
(46284,'2018-03-06 23:49:09',2,'edit','employee',2,'EP00007','',NULL),
(46285,'2018-03-06 23:49:21',2,'edit','employee',2,'EP00007','',NULL),
(46286,'2018-03-06 23:49:28',2,'edit','employee',2,'EP00007','',NULL),
(46287,'2018-03-06 23:52:06',2,'edit','employee',2,'EP00007','',NULL),
(46288,'2018-03-06 23:54:48',2,'edit','employee',2,'EP00007','',NULL),
(46289,'2018-03-06 23:57:07',2,'edit','employee',2,'EP00007','',NULL),
(46290,'2018-03-06 23:58:01',2,'edit','employee',2,'EP00007','',NULL),
(46291,'2018-03-06 23:59:21',2,'edit','employee',2,'EP00007','',NULL),
(46292,'2018-03-07 16:15:10',2,'add','task',3,'TSK00003','',NULL),
(46293,'2018-03-07 16:45:20',2,'add','task',4,'TSK00004','',NULL),
(46294,'2018-03-07 16:47:25',2,'edit','task',4,'TSK00004','',NULL),
(46295,'2018-03-07 16:47:52',2,'edit','task',4,'TSK00004','',NULL),
(46296,'2018-03-07 20:49:29',2,'changestatus','task',3,'TSK00003','Complete',NULL),
(46297,'2018-03-07 20:57:36',2,'edit','task',1,'TSK00001','',NULL);

/*Table structure for table `user_security_object` */

DROP TABLE IF EXISTS `user_security_object`;

CREATE TABLE `user_security_object` (
  `pkey` int(11) NOT NULL AUTO_INCREMENT,
  `security_object_key` int(11) DEFAULT NULL,
  `statuskey` int(11) DEFAULT '1',
  PRIMARY KEY (`pkey`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `user_security_object` */

insert  into `user_security_object`(`pkey`,`security_object_key`,`statuskey`) values 
(1,1,1),
(2,2,1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

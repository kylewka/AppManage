/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.5.49 : Database - demo
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`demo` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `demo`;

/*Table structure for table `goods` */

DROP TABLE IF EXISTS `goods`;

CREATE TABLE `goods` (
  `id` int(20) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `size` varchar(100) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `goods` */

insert  into `goods`(`id`,`location`,`name`,`size`,`url`) values (20121029,'应用程序','Visio 2013','490.72MB','ed2k://|file|cn_visio_professional_2013_x64_1138440.exe|514554984|19B78FCFF27829530E1B5F30FFDA2955|/'),(20150922,'应用程序','Project 2016','2.41G','ed2k://|file|cn_project_professional_2016_x86_x64_dvd_6966612.iso|2588266496|DEF65A0A9B12D8A8B734528800F625D5|/'),(20150923,'应用程序','Office 2016','2.41G','ed2k://|file|cn_office_professional_plus_2016_x86_x64_dvd_6969182.iso|2588266496|27EEA4FE4BB13CD0ECCDFC24167F9E01|/'),(20181003,'应用程序','Office 2019','3.52GB','ed2k://|file|cn_office_professional_plus_2019_x86_x64_dvd_5e5be643.iso|3775004672|1E4FFA5240F21F60DC027F73F1C62FF4|/'),(19990409,'开发人员工具','Visual Basic 6.0','161.43MB','ed2k://|file|sc_vb6_ent_cd1.iso|274132992|93B08D085B3D7CC0E6DC0EDEBC96E95B|/'),(20040108,'开发人员工具','Visual C++ 2.0','162.29MB','ed2k://|file|en_vc++_2.0.exe|170173440|AA5123F83E4AB42FC77EB4AA915D5FEF|/'),(20120815,'开发人员工具','Visual Studio 2012','1.48GB','ed2k://|file|cn_visual_studio_professional_2012_x86_dvd_920783.iso|1590749184|52B956DB8119CFB1610CC8E369F5F1FD|/'),(20150720,'开发人员工具','Visual Studio 2015','3.84GB','ed2k://|file|cn_visual_studio_professional_2015_x86_x64_dvd_6846645.iso|4125556736|6EECD10D20D74704C919CC60F088823E|/'),(20150729,'操作系统','Windows 10','3.87GB','ed2k://|file|cn_windows_10_education_x64_dvd_6847843.iso|4159854592|50A2126871A73D48FAE49D7D928D5343|/'),(20130909,'操作系统','Windows 8.1','3.8GB','ed2k://|file|cn_windows_8_1_x64_dvd_2707237.iso|4076017664|839CBE17F3CE8411E8206B92658A91FA|/'),(20090826,'操作系统','Windows 7','2.43GB','ed2k://|file|cn_windows_7_home_basic_x86_dvd_x15-65975.iso|2604238848|AF82993DCF8F3D7AA08D54693691BB48|/'),(20011030,'操作系统','Windows XP','505.63MB','ed2k://|file|CN_WINXP_PRO_ISO.img|530186240|7855069CE4216615D761654E2B75A4F7|/'),(20120307,'服务器','SQL Server 2012','4.71GB','ed2k://|file|cn_sql_server_2012_business_intelligence_x86_x64_dvd_813384.iso|5054384128|3A46060F56276DE947278265EE18F355|/'),(20191104,'服务器','SQL Server 2019','1.52GB','ed2k://|file|cn_sql_server_2019_developer_x64_dvd_c21035cc.iso|1632086016|7AFACB434CF9716CA7818F39F06BE0F5|/');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `pwd` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`name`,`pwd`) values (11,'lis','123'),(12,'kylewka','123'),(13,'abc','012');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

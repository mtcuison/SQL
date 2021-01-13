/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.5.62-0+deb8u1-log 
*********************************************************************
*/
/*!40101 SET NAMES utf8 */;

create table `LR_Collection_Unit_Priority` (
	`cCollUnit` char (1),
	`nDDelayFr` smallint (4),
	`nDDelayTo` smallint (4),
	`cWAppoint` char (1),
	`cAppointW` char (1),
	`nNoVisitx` smallint (4),
	`nDAftPayF` smallint (4),
	`nDAftPayT` smallint (4),
	`nDB4SchdF` smallint (4),
	`nDB4SchdT` smallint (4),
	`nDAftPrev` smallint (4),
	`nDForSchd` smallint (6),
	`nPriority` smallint (4),
	`sModified` varchar (10),
	`dModified` datetime 
); 
insert into `LR_Collection_Unit_Priority` (`cCollUnit`, `nDDelayFr`, `nDDelayTo`, `cWAppoint`, `cAppointW`, `nNoVisitx`, `nDAftPayF`, `nDAftPayT`, `nDB4SchdF`, `nDB4SchdT`, `nDAftPrev`, `nDForSchd`, `nPriority`, `sModified`, `dModified`) values('0','1','10','0',NULL,'1','30','365','0','0','0',NULL,'2','rex','2012-08-17 10:56:43');
insert into `LR_Collection_Unit_Priority` (`cCollUnit`, `nDDelayFr`, `nDDelayTo`, `cWAppoint`, `cAppointW`, `nNoVisitx`, `nDAftPayF`, `nDAftPayT`, `nDB4SchdF`, `nDB4SchdT`, `nDAftPrev`, `nDForSchd`, `nPriority`, `sModified`, `dModified`) values('0','11','15','0',NULL,'1','15','29','0','0','0',NULL,'3','rex','2012-08-17 10:56:45');
insert into `LR_Collection_Unit_Priority` (`cCollUnit`, `nDDelayFr`, `nDDelayTo`, `cWAppoint`, `cAppointW`, `nNoVisitx`, `nDAftPayF`, `nDAftPayT`, `nDB4SchdF`, `nDB4SchdT`, `nDAftPrev`, `nDForSchd`, `nPriority`, `sModified`, `dModified`) values('1','11','15','0',NULL,'2','30','365','10','5','2',NULL,'2','rex','2010-12-10 16:21:15');
insert into `LR_Collection_Unit_Priority` (`cCollUnit`, `nDDelayFr`, `nDDelayTo`, `cWAppoint`, `cAppointW`, `nNoVisitx`, `nDAftPayF`, `nDAftPayT`, `nDB4SchdF`, `nDB4SchdT`, `nDAftPrev`, `nDForSchd`, `nPriority`, `sModified`, `dModified`) values('1','16','60','0',NULL,'2','16','90','10','5','2',NULL,'4','rex','2012-06-30 17:12:29');
insert into `LR_Collection_Unit_Priority` (`cCollUnit`, `nDDelayFr`, `nDDelayTo`, `cWAppoint`, `cAppointW`, `nNoVisitx`, `nDAftPayF`, `nDAftPayT`, `nDB4SchdF`, `nDB4SchdT`, `nDAftPrev`, `nDForSchd`, `nPriority`, `sModified`, `dModified`) values('1','61','90','0',NULL,'2','15','30','0','0','2',NULL,'5','rex','2010-12-10 16:21:15');
insert into `LR_Collection_Unit_Priority` (`cCollUnit`, `nDDelayFr`, `nDDelayTo`, `cWAppoint`, `cAppointW`, `nNoVisitx`, `nDAftPayF`, `nDAftPayT`, `nDB4SchdF`, `nDB4SchdT`, `nDAftPrev`, `nDForSchd`, `nPriority`, `sModified`, `dModified`) values('2','16','60','0',NULL,'2','91','365','0','0','5',NULL,'3','rex','2010-12-10 16:21:15');
insert into `LR_Collection_Unit_Priority` (`cCollUnit`, `nDDelayFr`, `nDDelayTo`, `cWAppoint`, `cAppointW`, `nNoVisitx`, `nDAftPayF`, `nDAftPayT`, `nDB4SchdF`, `nDB4SchdT`, `nDAftPrev`, `nDForSchd`, `nPriority`, `sModified`, `dModified`) values('2','61','90','1',NULL,'2','31','365','0','0','5',NULL,'2','rex','2010-12-10 16:21:15');
insert into `LR_Collection_Unit_Priority` (`cCollUnit`, `nDDelayFr`, `nDDelayTo`, `cWAppoint`, `cAppointW`, `nNoVisitx`, `nDAftPayF`, `nDAftPayT`, `nDB4SchdF`, `nDB4SchdT`, `nDAftPrev`, `nDForSchd`, `nPriority`, `sModified`, `dModified`) values('2','91','150','0',NULL,'2','15','365','0','0','0',NULL,'4','rex','2010-12-10 16:21:15');
insert into `LR_Collection_Unit_Priority` (`cCollUnit`, `nDDelayFr`, `nDDelayTo`, `cWAppoint`, `cAppointW`, `nNoVisitx`, `nDAftPayF`, `nDAftPayT`, `nDB4SchdF`, `nDB4SchdT`, `nDAftPrev`, `nDForSchd`, `nPriority`, `sModified`, `dModified`) values('3','151','3660','0',NULL,'5','15','365','0','0','0',NULL,'2','rex','2010-12-10 16:31:56');

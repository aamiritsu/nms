/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.5.55-0ubuntu0.14.04.1 : Database - pos
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `m_item` */

DROP TABLE IF EXISTS `m_item`;

CREATE TABLE `m_item` (
  `id_item` varchar(6) NOT NULL,
  `item_name` varchar(100) DEFAULT NULL,
  `note` text,
  `stock` decimal(10,2) DEFAULT '0.00',
  `price` int(14) DEFAULT '0',
  `unit` varchar(4) DEFAULT 'PCS',
  PRIMARY KEY (`id_item`),
  UNIQUE KEY `unik` (`item_name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `m_item` */

insert  into `m_item`(`id_item`,`item_name`,`note`,`stock`,`price`,`unit`) values ('PB0001','Razor Blade','best razor blade in the world',9.00,12000,'PCS');
insert  into `m_item`(`id_item`,`item_name`,`note`,`stock`,`price`,`unit`) values ('PB0002','Muscle Face','for build body',10.00,50000,'PCS');

/*Table structure for table `m_user` */

DROP TABLE IF EXISTS `m_user`;

CREATE TABLE `m_user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `pass_user` char(50) NOT NULL,
  `h_menu` varchar(254) DEFAULT NULL,
  `uniq_login` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `NewIndex1` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `m_user` */

insert  into `m_user`(`id_user`,`username`,`pass_user`,`h_menu`,`uniq_login`) values (6,'ADMIN','202cb962ac59075b964b07152d234b70','1,2,3','58f72048cc33114');
insert  into `m_user`(`id_user`,`username`,`pass_user`,`h_menu`,`uniq_login`) values (7,'HENZ','202cb962ac59075b964b07152d234b70','1,3',NULL);
insert  into `m_user`(`id_user`,`username`,`pass_user`,`h_menu`,`uniq_login`) values (8,'ROBIN','202cb962ac59075b964b07152d234b70','1,2',NULL);

/*Table structure for table `r_menu` */

DROP TABLE IF EXISTS `r_menu`;

CREATE TABLE `r_menu` (
  `id_menu` int(2) NOT NULL AUTO_INCREMENT,
  `name_menu` varchar(100) DEFAULT NULL,
  `menu_order` int(2) DEFAULT NULL,
  `icon` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_menu`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `r_menu` */

insert  into `r_menu`(`id_menu`,`name_menu`,`menu_order`,`icon`) values (1,'Master',1,'');
insert  into `r_menu`(`id_menu`,`name_menu`,`menu_order`,`icon`) values (2,'Sales',2,'');
insert  into `r_menu`(`id_menu`,`name_menu`,`menu_order`,`icon`) values (3,'Utility',7,'');

/*Table structure for table `r_menu_sub` */

DROP TABLE IF EXISTS `r_menu_sub`;

CREATE TABLE `r_menu_sub` (
  `id_sub_menu` int(3) NOT NULL AUTO_INCREMENT,
  `name_sub_menu` varchar(100) DEFAULT NULL,
  `id_menu` int(2) DEFAULT NULL,
  `sub_menu_order` int(2) DEFAULT NULL,
  `hak_akses` varchar(30) DEFAULT '4',
  `url` varchar(150) DEFAULT '#',
  `content_before` varchar(200) DEFAULT NULL,
  `content_after` varchar(200) DEFAULT NULL,
  `icon` varchar(150) DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `target` enum('_self','_blank') DEFAULT '_self',
  PRIMARY KEY (`id_sub_menu`),
  KEY `urutan_sub_menu_index` (`id_menu`,`sub_menu_order`)
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=latin1;

/*Data for the table `r_menu_sub` */

insert  into `r_menu_sub`(`id_sub_menu`,`name_sub_menu`,`id_menu`,`sub_menu_order`,`hak_akses`,`url`,`content_before`,`content_after`,`icon`,`title`,`target`) values (1,'Master Item',1,2,'2','application/master/v_item.php',NULL,NULL,'<i class=\"fa  fa-arrow-right\"></i>','MASTER ITEMS','_self');
insert  into `r_menu_sub`(`id_sub_menu`,`name_sub_menu`,`id_menu`,`sub_menu_order`,`hak_akses`,`url`,`content_before`,`content_after`,`icon`,`title`,`target`) values (2,'Point Of Sale',2,2,'2','application/sales/v_pos.php',NULL,NULL,'<i class=\"fa  fa-arrow-right\"></i>','POINT OF SALES','_self');
insert  into `r_menu_sub`(`id_sub_menu`,`name_sub_menu`,`id_menu`,`sub_menu_order`,`hak_akses`,`url`,`content_before`,`content_after`,`icon`,`title`,`target`) values (3,'Master User',3,1,'4','application/utility/v_mstuser.php',NULL,NULL,'<i class=\"fa  fa-arrow-right\"></i>','MASTER USERS','_self');

/*Table structure for table `r_ref_system` */

DROP TABLE IF EXISTS `r_ref_system`;

CREATE TABLE `r_ref_system` (
  `id` int(1) NOT NULL DEFAULT '1',
  `name_shop` text,
  `address_shop` text,
  `phone_shop` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `r_ref_system` */

insert  into `r_ref_system`(`id`,`name_shop`,`address_shop`,`phone_shop`) values (1,'SEEGATESITE SHOP','1193 Hartway Street Rapid City, SD 57702','08777-8370-888');

/*Table structure for table `t_sale` */

DROP TABLE IF EXISTS `t_sale`;

CREATE TABLE `t_sale` (
  `sale_id` char(10) NOT NULL,
  `id_user` int(11) NOT NULL,
  `sale_date` date NOT NULL,
  `input_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `paid` int(14) DEFAULT NULL,
  `disc_prcn` decimal(5,2) DEFAULT '0.00',
  `disc_rp` int(14) DEFAULT '0',
  `sts` int(1) NOT NULL DEFAULT '1' COMMENT '1 aktif, 0 delete',
  `note` text,
  PRIMARY KEY (`sale_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `t_sale` */

/*Table structure for table `t_sale_detail` */

DROP TABLE IF EXISTS `t_sale_detail`;

CREATE TABLE `t_sale_detail` (
  `autoid` int(11) NOT NULL AUTO_INCREMENT,
  `sale_id` char(10) NOT NULL,
  `id_item` varchar(6) NOT NULL,
  `item_name` varchar(150) NOT NULL,
  `qty` decimal(14,2) DEFAULT NULL,
  `unit` varchar(4) NOT NULL,
  `price` int(14) DEFAULT NULL,
  `disc_prc` decimal(5,2) DEFAULT '0.00',
  `disc_rp` int(14) DEFAULT '0',
  PRIMARY KEY (`sale_id`,`id_item`,`item_name`,`unit`),
  KEY `autoid` (`autoid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `t_sale_detail` */

/*Table structure for table `temp_sale` */

DROP TABLE IF EXISTS `temp_sale`;

CREATE TABLE `temp_sale` (
  `id_user` int(11) NOT NULL,
  `uniqid` varchar(13) NOT NULL,
  `input_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_item` varchar(6) NOT NULL,
  `item_name` varchar(100) NOT NULL,
  `qty` decimal(14,2) DEFAULT NULL,
  `unit` varchar(4) NOT NULL,
  `price` int(14) DEFAULT NULL,
  `discprc` decimal(5,2) DEFAULT NULL,
  `discrp` int(14) DEFAULT NULL,
  PRIMARY KEY (`id_user`,`uniqid`,`id_item`,`item_name`,`unit`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `temp_sale` */

insert  into `temp_sale`(`id_user`,`uniqid`,`input_date`,`id_item`,`item_name`,`qty`,`unit`,`price`,`discprc`,`discrp`) values (6,'5903197402cca','2017-04-28 17:29:18','PB0001','Razor Blade',1.00,'PCS',12000,0.00,0);

/* Procedure structure for procedure `deleteBarang` */

/*!50003 DROP PROCEDURE IF EXISTS  `deleteBarang` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`::1` PROCEDURE `deleteBarang`(idbarang varchar(6))
BEGIN
	delete from m_barang where id_barang = idbarang;
	delete from m_barang_detail where id_barang = idbarang;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `deleteSale` */

/*!50003 DROP PROCEDURE IF EXISTS  `deleteSale` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteSale`(x_sale_id VARCHAR(10),cnote TEXT)
BEGIN
	CALL restore_stock_sale(x_sale_id);
	UPDATE t_sale SET sts = 0,note = cnote WHERE sale_id= x_sale_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `restore_stock_sale` */

/*!50003 DROP PROCEDURE IF EXISTS  `restore_stock_sale` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `restore_stock_sale`(var_sale_id VARCHAR(10))
BEGIN
	DECLARE v_finished INTEGER DEFAULT 0;
    DECLARE cid_item VARCHAR(6);
    DECLARE cqty INT;
    DECLARE deletesale CURSOR FOR SELECT id_item,qty FROM t_sale_detail WHERE sale_id = var_sale_id ;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_finished = 1;
	
	OPEN deletesale;
	get_deletesale: LOOP
	FETCH deletesale INTO cid_item,cqty;
	IF v_finished = 1 THEN 
		LEAVE get_deletesale;
	END IF;
	 	UPDATE m_item SET stock = stock + cqty WHERE id_item = cid_item;	
	END LOOP get_deletesale;
        CLOSE deletesale;
        
    END */$$
DELIMITER ;

/* Procedure structure for procedure `saveItem` */

/*!50003 DROP PROCEDURE IF EXISTS  `saveItem` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `saveItem`(var_item_name VARCHAR(100),var_unit VARCHAR(4),var_stock INT,var_price INT,var_note TEXT)
BEGIN
	DECLARE newnumber,newiditem VARCHAR(6);
	DECLARE countitem INT;
		SELECT COUNT(id_item) FROM m_item INTO countitem;
		IF(countitem = 0 ) THEN
			SET newnumber = '1';
		ELSE
			SELECT TRIM(CAST((CAST(SUBSTR(id_item,3,6) AS UNSIGNED)+1) AS CHAR(4)))    
			FROM m_item 
			ORDER BY id_item DESC LIMIT 1 INTO newnumber;
		END IF; 
		IF (LENGTH(newnumber) = 1) THEN
			SET newiditem=CONCAT('PB000',newnumber);
		ELSE
			IF (LENGTH(newnumber) = 2) THEN
				SET newiditem=CONCAT('PB00',newnumber);
			ELSE
				IF (LENGTH(newnumber) = 3) THEN
					SET newiditem=CONCAT('PB0',newnumber);
				ELSE
					SET newiditem=CONCAT('PB',newnumber);
				END IF ;
			END IF ;
		END IF ;
		 INSERT INTO m_item(id_item,item_name,unit,stock,price,note)
		 	VALUES(newiditem,var_item_name,var_unit,var_stock,var_price,var_note);
		 select newiditem as id_item;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `saveSale` */

/*!50003 DROP PROCEDURE IF EXISTS  `saveSale` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `saveSale`(pre_sale_id varchar(7), var_sale_date date
    , var_paid int,discprcn decimal(5,2),discrp int,var_unique varchar(13)
    ,iduser int,var_note text)
BEGIN
    DECLARE v_finished INTEGER DEFAULT 0;
    declare next_sale_id,next_value varchar(10);
    declare count_of_sale int;
    declare cid_item varchar(6);
    declare cname varchar(100);
    declare cqty,cdiscrp,cprice  int;
    declare cunit varchar(4);
    declare cdiscprc decimal(5,2);
    DEClARE tempsale CURSOR FOR SELECT id_item,item_name,qty,unit,price,discprc,discrp  FROM temp_sale where uniqid = var_unique and id_user = iduser ;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_finished = 1;
	
	SELECT COUNT(sale_id) FROM t_sale WHERE SUBSTR(sale_id,1,7) = pre_sale_id  INTO count_of_sale;
	IF count_of_sale = 0 THEN
		SET next_value = '1';
	ELSE
		SELECT TRIM(CAST((CAST(SUBSTR(sale_id,8,3) AS UNSIGNED)+1) AS CHAR(3)))
		FROM t_sale 
		WHERE SUBSTR(sale_id,1,7) = pre_sale_id 
		ORDER BY sale_id DESC LIMIT 1 INTO next_value;
	END IF;
	IF (LENGTH(next_value) = 1) THEN
			SET next_sale_id=CONCAT(pre_sale_id,'00',next_value);
	ELSE
			IF (LENGTH(next_value) = 2) THEN
				SET next_sale_id=CONCAT(pre_sale_id,'0',next_value);
			ELSE
				SET next_sale_id=CONCAT(pre_sale_id,next_value);
			END IF ;
	END IF ;
	INSERT INTO t_sale(sale_id,id_user,sale_date, paid,disc_prcn,disc_rp,sts,note) VALUES
	(next_sale_id,iduser,var_sale_date,var_paid,discprcn,discrp,1,var_note);
	
	OPEN tempsale;
	get_tempsale: LOOP
	FETCH tempsale INTO cid_item,cname,cqty,cunit,cprice,cdiscprc,cdiscrp;
	IF v_finished = 1 THEN 
		LEAVE get_tempsale;
	END IF;
	 
		insert into t_sale_detail(sale_id,id_item,item_name,qty,unit,price,disc_prc,disc_rp) values
		(next_sale_id,cid_item,cname,cqty,cunit,cprice,cdiscprc,cdiscrp);
			update m_item set stock = stock - cqty where id_item = cid_item;
		
	END LOOP get_tempsale;
        CLOSE tempsale;
        select next_sale_id;
    END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

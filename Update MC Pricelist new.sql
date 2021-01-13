SELECT * FROM Branch WHERE `sBranchNm` LIKE '%tuguegarao%';
SELECT * FROM `Employee_Rest_Day_Shift` WHERE `sEmployID` = 'M00120000558';
SELECT * FROM `Employee_Master001` WHERE `sEmployID` IN (SELECT sClientID FROM `Client_Master` WHERE `sLastName` = 'nadal' AND `sFrstName` = 'michael angelo');



SELECT * FROM Branch_Others WHERE `sBranchCD` = 'C050';

DESCRIBE `LR_Payment_Master`;


SELECT * FROM `xxxReplicationLog` WHERE `sTransnox` LIKE 'M07120%' ORDER BY `sTransNox` DESC LIMIT 10;

DESCRIBE `MC_Model_Price`;



SELECT * FROM `MC_Model_Price` WHERE `sModified` = 'mac';

UPDATE `MC_Model_Price` SET
	  `nMinDownx` = FLOOR(((`nSelPrice` * .20) - 1800) / 100) * 100
	, `sModified` = 'mac'
	, `dModified` = '2020-05-16 15:17:00'
WHERE `nMinDownx` = (`nSelPrice` * .20) - 1800
	AND `nMinDownx` <> 0 
	AND `nSelPrice` <> 0;



SELECT  * FROM MC_Model_Price WHERE `sModified` = 'mac' AND `dModified` = '2020-05-16 15:17:00';

SELECT * FROM `MC_Model_Price` WHERE `nMinDownx` = FLOOR(((`nSelPrice` * .20) - 1800) / 100) * 100

SELECT * FROM MC_Model_Price WHERE sModelIDx IN (SELECT sModelIDx FROM MC_Model WHERE cRecdStat = '1' AND sBrandIDx IN ('M0W1001', 'M0W1003', 'M0W1002', 'M0W1009'));
SELECT * FROM Brand WHERE `sBrandNme` = 'yamaha';


SELECT sModelIDx, sModelCde, `sModelNme`, `sModelDsc` FROM MC_Model WHERE `sBrandIDx`= 'M0W1003' AND cRecdStat = '1' AND `sModelNme` LIKE '%sniper%150%';


/*nmax*/
('M00115040', 'M00117008', 'M00118005', 'M00118018', 'M00119024')
/*aerox*/
('M00117018', 'M00117050', 'M00118007', 'M00118019', 'M00118033', 'M00118034', 'M00118046', 'M00119019', 'M00119031', 'M00119037', 'M00119045', 'M00120003', 'M06019001', 'M08919001');

UPDATE `MC_Model_Price` SET
	  `nMinDownx` = FLOOR(((`nSelPrice` * .20) + 1800) / 100) * 100
	, `dPricexxx` = '2020-05-29'
	, `sModified` = 'mac'
	, `dModified` = '2020-05-29 14:23:00'
WHERE sModelIDx IN (SELECT sModelIDx FROM MC_Model WHERE cRecdStat = '1' AND sBrandIDx IN ('M0W1001', 'M0W1003', 'M0W1002', 'M0W1009'));
SELECT * FROM `MC_Model_Price` WHERE `dPricexxx` = '2020-05-29';


SELECT a.sModelIDx, b.sModelNme, a.nSelPrice, a.`nMinDownx`, FLOOR(((`nSelPrice` * .20) + 1800) / 100) * 100 `(nSelPrice * .20) + 1800`
FROM MC_Model_Price a
	LEFT JOIN MC_Model b
		ON a.`sModelIDx` = b.`sModelIDx`
WHERE a.`nMinDownx` > FLOOR(((a.`nSelPrice` * .20) + 1800) / 100) * 100;


DESCRIBE xxxReplicationLog	;

SELECT * FROM `MC_Model_Price` WHERE `dPricexxx` = '2020-05-30';

SELECT * FROM `xxxSysConfig`;

SELECT * FROM `Credit_Online_Application_Points_Detail`
SELECT * FROM Credit_Online_Application ORDER BY dTransact DESC LIMIT 100;

SELECT * FROM `Text_SMS` ORDER BY `dReceived` DESC LIMIT 100;
SELECT * FROM `SMS_Incoming` ORDER BY dTransact DESC LIMIT 1000;

UPDATE MC_Model_Price SET
	  nMinDownx = FLOOR(((nSelPrice * .20) - 1800) / 100) * 100
	, dPricexxx = '2020-05-30'
	, sModified = 'mac'
	, dModified = '2020-05-30 16:15:00'
WHERE sModelIDx IN (SELECT sModelIDx FROM MC_Model WHERE cRecdStat = '1' AND sBrandIDx IN ('M0W1001', 'M0W1003', 'M0W1002', 'M0W1009') AND sModelIDx NOT IN ('GCO119001', 'M00105010', 'M00107007', 'M00110015', 'M00112010', 'M00113007', 'M00113009', 'M00113013', 'M00114019', 'M00114023', 'M00114031', 'M00114032', 'M00115010', 'M00115014', 'M00115030', 'M00116011', 'M00116012', 'M00116023', 'M00116026', 'M00116036', 'M00116054', 'M00117003', 'M00117016', 'M00117022', 'M00117078', 'M00117079', 'M00118010', 'M00118011', 'M00118048', 'M00119001', 'M00119003', 'M00119011', 'M00119012', 'M00119028', 'M00119035', 'M00119038', 'M00119039', 'M00119040', 'M00119061', 'M00119068', 'M00120001', 'M00120026', 'M04608002', 'M0W105090', 'M0W108006', 'M0W108007', 'M0W108014', 'M0W311006', 'M0W311008', 'M00117018', 'M00117050', 'M00118007', 'M00118019', 'M00118033', 'M00118034', 'M00118046', 'M00119019', 'M00119031', 'M00119037', 'M00119045', 'M00120003', 'M06019001', 'M08919001', 'M00115040', 'M00117008', 'M00118005', 'M00118018', 'M00119024', 'M00115017', 'M00116021', 'M00116032', 'M00117010', 'M00117011', 'M00117066', 'M00117067', 'M00118029', 'M00118030', 'M00119071', 'M00119072', 'M00120018', 'M00120019', 'M00115034', 'M00116037', 'M00117032', 'M00117051', 'M00118035', 'M00118047', 'M00119020', 'M00119021', 'M00119030'));
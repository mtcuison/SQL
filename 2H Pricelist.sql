SELECT 
	  a.`sSerialID`
	, a.`sEngineNo`
	, a.`sFrameNox`
	, a.`nYearModl`
	, b.`sModelNme`
	, c.`sColorNme`
	, IFNULL(f.`sDescript`, '') xClassDsc
	, e.`nSelPrice` xOrgPrice
	, e.`nLastPrce` xOrgLastP
	, IF(IFNULL(f.`nMinRatex`, 0) = 0.00, e.`nSelPrice`, ROUND(e.`nSelPrice` - (e.`nSelPrice` * (IFNULL(f.`nMinRatex`, 0) / 100)), 2)) x2HSelPrc
	, IF(IFNULL(f.`nMaxRatex`, 0) = 0.00, e.`nLastPrce`, ROUND(e.`nSelPrice` - (e.`nSelPrice` * (IFNULL(f.`nMaxRatex`, 0) / 100)), 2)) x2HLstPrc
FROM MC_Serial a
	LEFT JOIN MC_Model b
		ON a.`sModelIDx` = b.sModelIDx
	LEFT JOIN Color c
		ON a.`sColorIDx` = c.`sColorIDx`
	LEFT JOIN `MC_Serial_Classification` d
		ON a.`sSerialID` = d.`sSerialID`
	LEFT JOIN `MC_Model_Price` e
		ON a.`sModelIDx` = e.`sModelIDx`
	LEFT JOIN `MC_2H_Classification` f
		ON d.`sClassIDx` = f.`sClassIDx`
WHERE a.`sBranchCd` = 'M001'
	AND a.`cSoldStat` = '1'
	AND a.`cLocation` = '1';
	
SELECT * FROM `MC_2H_Classification`
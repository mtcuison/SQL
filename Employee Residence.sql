SELECT c.`sBranchNm`, b.`sCompnyNm`, CONCAT(b.`sHouseNox`, b.`sAddressx`) xAddressx, e.`sBrgyName`, d.`sTownName`, b.`sMobileNo`, b.`sPhoneNox`
FROM Employee_Master001 a
		LEFT JOIN Branch c
			ON a.`sBranchCd` = c.`sBranchCd`
	, Client_Master b
		LEFT JOIN TownCity d
			ON b.`sTownIDxx` = d.`sTownIDxx`
		LEFT JOIN Barangay e
			ON b.`sBrgyIDxx` = e.`sBrgyIDxx`
WHERE a.`sEmployID` = b.`sClientID`
	AND a.`cRecdStat` = '1'
ORDER BY c.`sBranchNm`, d.`sTownName`;


SELECT * FROM `TownCity` WHERE `sTownName` LIKE '%dagupan%';
SELECT * FROM Barangay WHERE `sTownIDxx` = '0346'
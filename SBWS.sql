SELECT 
   b.sSSSNoxxx, 
   b.sLastName, 
   b.sFrstName, 
   MID(b.sMiddName, 1, 1), 
   REPLACE(b.sTaxIDNox, '-', ''), 
   'NO' sDOLECAMP,
   b.sEmailAdd, 
   e.sBankName, 
   a.sBnkActNo, 
   '' sPayMaya, 
   b.sMobileNo, 
   a.dHiredxxx, 
   a.dFiredxxx, 
   g.sCompnyNm
FROM
   Employee_Master001 a 
		LEFT JOIN Banks e 
			ON a.sBankIDxx = e.sBankIDxx 
		LEFT JOIN Branch f 
			ON a.sSgBranch = f.sBranchCd 
		LEFT JOIN Company g 
			ON f.sCompnyID = g.sCompnyID, 
	Client_Master b 
WHERE a.sEmployID = b.sClientID 
   AND a.cRecdStat = '1' ;
   
SELECT 
   b.sLastName `Last Name`, 
   b.sFrstName `First Name`, 
   b.sMiddName `Middle Name`, 
   b.`dBirthDte` `Birthday`,
   TRIM(CONCAT(b.`sHouseNox`, ' ', b.`sAddressx`, ', ', h.`sTownName`, i.`sProvName`)) `Address`,
   h.`sTownName` `Town`,
   i.`sProvName` `Province`,  
   g.sCompnyNm `Company`
FROM
   Employee_Master001 a 
   LEFT JOIN Banks e 
      ON a.sBankIDxx = e.sBankIDxx 
   LEFT JOIN Branch f 
      ON a.sSgBranch = f.sBranchCd 
   LEFT JOIN Company g 
      ON f.sCompnyID = g.sCompnyID, Client_Master b 
   LEFT JOIN TownCity h 
      ON b.`sTownIDxx` = h.`sTownIDxx` 
   LEFT JOIN Province i 
      ON h.`sProvIDxx` = i.`sProvIDxx` 
WHERE a.sEmployID = b.sClientID 
   AND a.cRecdStat = '1' ;



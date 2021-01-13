SELECT
	  g.`sAreaDesc` `Area`
	, c.`sBranchNm` `Branch`
	, h.`sDeptName` `Department`
	, i.`sPositnNm` `Position`
	, b.`sCompnyNm` `Name`
	, ROUND(DATEDIFF(NOW(), b.`dBirthDte`) /365) `Age`
	, IF(b.`cGenderCd`='0','MALE', 'FEMALE') `Gender`
	, TRIM(CONCAT(b.`sHouseNox`, ' ', b.`sAddressx`, ', ', d.`sTownName`, ' ', e.`sProvName`)) `Home Address`
	, d.`sTownName` `Town`
	, e.`sProvName` `Province`
	, b.`sMobileNo` `Mobile No`
	, a.`nSalaryxx` `Reg Salary`
	, k.`sCompnyCd` `Company`
	, a.`cEmpTypex` `Status`
	, g.`sAreaCode` `Area Code`
	, a.`sBnkActNo` `Account No.`
	, l.`sBankCode` `Bank`
FROM Employee_Master001 a
		LEFT JOIN Branch c
			ON a.`sBranchCd` = c.`sBranchCd`
		LEFT JOIN Branch_Others f
			ON c.`sBranchCd` = f.`sBranchCD`
		LEFT JOIN `Branch_Area` g
			ON f.`sAreaCode` = g.`sAreaCode`
		LEFT JOIN Department h
			ON a.`sDeptIDxx` = h.`sDeptIDxx`
		LEFT JOIN POSITION i
			ON a.`sPositnID`= i.`sPositnID`
		LEFT JOIN Branch j
			ON a.`sSgBranch` = j.`sBranchCd`
		LEFT JOIN Company k
			ON j.`sCompnyID` = k.`sCompnyID`
		LEFT JOIN Banks l
			ON a.`sBankIDxx` = l.`sBankIDxx`
	, Client_Master b
		LEFT JOIN `TownCity` d
			ON b.`sTownIDxx` = d.`sTownIDxx`
		LEFT JOIN `Province` e
			ON d.`sProvIDxx` = e.`sProvIDxx`
WHERE a.`sEmployID` = b.`sClientID`
	AND a.`cRecdStat` = '1'
	AND b.`sCompnyNm` LIKE 'tarrega, rico%%'
HAVING g.`sAreaCode` BETWEEN '0001' AND '0024'
ORDER BY g.`sAreaDesc`, c.`sBranchNm`, h.`sDeptName`, i.`sPositnNm`, b.`sCompnyNm`;
AND (a.sEmpLevID = '3' OR a.`sPositnID` IN ('031', '009'))

SELECT
	  g.`sAreaDesc` `Area`
	, c.`sBranchNm` `Branch`
	, h.`sDeptName` `Department`
	, i.`sPositnNm` `Position`
	, b.`sCompnyNm` `Name`
	, b.`sTaxIDNox` `TIN`
	, k.`sCompnyCd` `Company`
FROM Employee_Master001 a
		LEFT JOIN Branch c
			ON a.`sBranchCd` = c.`sBranchCd`
		LEFT JOIN Branch_Others f
			ON c.`sBranchCd` = f.`sBranchCD`
		LEFT JOIN `Branch_Area` g
			ON f.`sAreaCode` = g.`sAreaCode`
		LEFT JOIN Department h
			ON a.`sDeptIDxx` = h.`sDeptIDxx`
		LEFT JOIN POSITION i
			ON a.`sPositnID`= i.`sPositnID`
		LEFT JOIN Branch j
			ON a.`sSgBranch` = j.`sBranchCd`
		LEFT JOIN Company k
			ON j.`sCompnyID` = k.`sCompnyID`
	, Client_Master b
		LEFT JOIN `TownCity` d
			ON b.`sTownIDxx` = d.`sTownIDxx`
		LEFT JOIN `Province` e
			ON d.`sProvIDxx` = e.`sProvIDxx`
WHERE a.`sEmployID` = b.`sClientID`
	AND a.`cRecdStat` = '1'
	AND ISNULL(a.`dFiredxxx`)
ORDER BY g.`sAreaDesc`, c.`sBranchNm`, h.`sDeptName`, i.`sPositnNm`, b.`sCompnyNm`;

SELECT * FROM Branch_Area;
DESCRIBE Employee_Master001;

DESCRIBE Client_Master;

SELECT * FROM `Payroll_Govt_Deductions`

DESCRIBE Employee_Master001;
DESCRIBE Client_Master;




SELECT * 
FROM Employee_Master001 a
	, Client_Master b
WHERE a.`sEmployID` = b.`sClientID`
	AND b.`sCompnyNm` LIKE 'SAJONAS, JASMIN NICOLE%';
	
SELECT
	  g.`sAreaDesc` `Area`
	, c.`sBranchNm` `Branch`
	, h.`sDeptName` `Department`
	, i.`sPositnNm` `Position`
	, b.`sCompnyNm` `Name`
	, a.`sBnkActNo` `Account No.`
	, l.`sBankCode` `Bank`
	, b.`sSSSNoxxx` `SSS No.`
	, b.`sTaxIDNox` `TIN No.`
FROM Employee_Master001 a
		LEFT JOIN Branch c
			ON a.`sBranchCd` = c.`sBranchCd`
		LEFT JOIN Branch_Others f
			ON c.`sBranchCd` = f.`sBranchCD`
		LEFT JOIN `Branch_Area` g
			ON f.`sAreaCode` = g.`sAreaCode`
		LEFT JOIN Department h
			ON a.`sDeptIDxx` = h.`sDeptIDxx`
		LEFT JOIN POSITION i
			ON a.`sPositnID`= i.`sPositnID`
		LEFT JOIN Branch j
			ON a.`sSgBranch` = j.`sBranchCd`
		LEFT JOIN Company k
			ON j.`sCompnyID` = k.`sCompnyID`
		LEFT JOIN Banks l
			ON a.`sBankIDxx` = l.`sBankIDxx`
	, Client_Master b
		LEFT JOIN `TownCity` d
			ON b.`sTownIDxx` = d.`sTownIDxx`
		LEFT JOIN `Province` e
			ON d.`sProvIDxx` = e.`sProvIDxx`
WHERE a.`sEmployID` = b.`sClientID`
	AND a.`cRecdStat` = '1'
ORDER BY g.`sAreaDesc`, c.`sBranchNm`, h.`sDeptName`, i.`sPositnNm`, b.`sCompnyNm`;
	

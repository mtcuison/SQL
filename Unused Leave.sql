SELECT * FROM `Employee_Leave_Credit` WHERE `sEmployID` = 'M00111005387';
SELECT DISTINCT(`cLeaveTyp`) FROM `Employee_Leave_Credit`;
SELECT * FROM Employee_Master001 WHERE `sEmployID` IN (SELECT sClientID FROM `Client_Master` WHERE `sLastName` = 'clauna' AND `sFrstName` = 'jhon mark');
SELECT 
     f.`sAreaDesc` `AREA`
   , d.`sBranchNm` `BRANCH`
   , g.`sDeptName` `DEPARTMENT`
   , a.`sEmployID` `EMPLOYEE ID`
   , b.`sCompnyNm` `NAME`
   , CASE
			WHEN a.`sEmpLevID` = '0' THEN 'Rank and File'
			WHEN a.`sEmpLevID` = '1' THEN 'Supervisor'
			WHEN a.`sEmpLevID` = '2' THEN 'Department Head'
			WHEN a.`sEmpLevID` = '3' THEN 'Branch Head'
			WHEN a.`sEmpLevID` = '4' THEN 'Area Manager'
			WHEN a.`sEmpLevID` = '5' THEN 'General Manager'
		END `EMPLOYEE LEVEL`
   , CASE
			WHEN c.`cLeaveTyp` = '0' THEN 'Vacation'
			WHEN c.`cLeaveTyp` = '1' THEN 'Sick'
			WHEN c.`cLeaveTyp` = '2' THEN 'Others'
			WHEN c.`cLeaveTyp` = '3' THEN 'Birthday'
			WHEN c.`cLeaveTyp` = '4' THEN 'Paternity'
			WHEN c.`cLeaveTyp` = '5' THEN 'Solo Parent'
			WHEN c.`cLeaveTyp` = '6' THEN 'Saturday'
		END `LEAVE TYPE`
   , c.`nNoDaysxx` `CREDITS`
   , c.`nCredtUse` `USED`
   , c.`nNoDaysxx` - c.`nCredtUse` `REMAINING`
FROM
   Employee_Master001 a 
		LEFT JOIN `Employee_Leave_Credit` c 
			ON a.`sEmployID` = c.`sEmployID` 
				AND c.`dValdFrom` BETWEEN '2019-09-01' AND '2020-08-31' 
				AND c.`dValdThru` BETWEEN '2019-09-01' AND '2020-08-31' 
		LEFT JOIN Branch d 
			ON a.`sBranchCd` = d.`sBranchCd` 
		LEFT JOIN Branch_Others e 
			ON d.`sBranchCd` = e.`sBranchCD` 
		LEFT JOIN `Branch_Area` f 
			ON e.`sAreaCode` = f.`sAreaCode`
		LEFT JOIN `Department` g
			ON a.`sDeptIDxx` = g.`sDeptIDxx`
   , Client_Master b 
WHERE a.`sEmployID` = b.`sClientID` 
   AND a.cRecdStat = '1'
   AND ISNULL(a.dFiredxxx)
HAVING `REMAINING` > 0
ORDER BY f.`sAreaDesc`, d.`sBranchNm`, g.`sDeptName`, b.`sCompnyNm`;


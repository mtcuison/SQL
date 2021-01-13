SELECT
	c.`sBranchNm` `Branch`
	, b.`sCompnyNm` `Name`
	, b.dBirthDte `Birth Date`
	, a.dHiredxxx `Date Hired`
	, a.`nSalaryxx` `Reg Salary`
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
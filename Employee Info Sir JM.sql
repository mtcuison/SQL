SELECT 
	g.sCompnyNm `Company`,
   b.sLastName `Last Name`, 
   b.sFrstName `First Name`, 
   MID(b.sMiddName, 1, 1) `M.I.`, 
   h.sPositnNm `Designation`,
   '' `Work arrangement during COVID`,
   IF(a.cEmpTypex = 'R','Regular', IF(a.cEmpTypex = 'P', 'Probationary', 'Trainee')) `Employment Status`,
   b.sTaxIDNox `TIN No.`,
   b.sSSSNoxxx `SSS No.`
FROM
   Employee_Master001 a 
		LEFT JOIN Banks e 
			ON a.sBankIDxx = e.sBankIDxx 
		LEFT JOIN Branch f 
			ON a.sSgBranch = f.sBranchCd 
		LEFT JOIN Company g 
			ON f.sCompnyID = g.sCompnyID
		LEFT JOIN POSITION h
			ON a.sPositnID = h.sPositnID, 
	Client_Master b 
WHERE a.sEmployID = b.sClientID 
   AND a.cRecdStat = '1'
ORDER BY g.sCompnyNm;
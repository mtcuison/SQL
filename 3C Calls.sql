SELECT 
	e.sAreaDesc, 
	c.sBranchNm,
	a.sAcctNmbr, 
	f.sCompnyNm,
	CASE 
		WHEN b.`cLoanType` = 0 THEN 'Motorcycle'
		WHEN b.`cLoanType` = 1 THEN 'Sidecar'
		WHEN b.`cLoanType` = 2 THEN 'Power Products'
		WHEN b.`cLoanType` = 3 THEN 'Others'
		WHEN b.`cLoanType` = 4 THEN 'Mobile Phone'
	END xLoanType,
	g.sRemarksx,
	DATE_FORMAT(j.dTransact, '%Y-%m-%d') dPromisex,
	k.sORNoxxxx,
	j.nAmountxx,
	j.sRemarksx,
	DATE_FORMAT(a.dStartPrc, '%Y-%m-%d') dStartPrc,
	IFNULL(i.sCompnyNm, 'Jeffrey Yambao(Old System Account)'),
	DATE_FORMAT(b.dLastPaym, '%Y-%m-%d') dLastPaym
FROM LR_Calls_Master a
		LEFT JOIN LR_Calls_Detail g
			ON a.sTransNox = g.sTransNox
		LEFT JOIN LR_Calls_Appointment j
			ON a.sAcctNmbr = j.sAcctNmbr
				AND j.dTransact >=  '2020-06-01'
				AND j.nAmountxx > 0.00
		LEFT JOIN MC_AR_Ledger k
			ON a.sAcctNmbr = k.sAcctNmbr
				AND DATE_FORMAT(j.dTransact, '%Y-%m-%d') = k.dTransact
	, MC_AR_Master b
		LEFT JOIN Branch c ON b.sBranchCd = c.sBranchCd
		LEFT JOIN Branch_Others d ON c.sBranchCd = d.sBranchCd
		LEFT JOIN Branch_Area e ON d.sAreaCode = e.sAreaCode
	, Client_Master f
	, LR_3C_Agent h
		LEFT JOIN Client_Master i ON h.sEmployID = i.sClientID
WHERE a.`dTransact` BETWEEN  '2020-08-01' AND '2020-08-31'
	AND a.`sAcctNmbr` = b.`sAcctNmbr`
	AND b.sClientID = f.sClientID
	AND a.sAgentIDx = h.sEmployID
	AND (h.cRecdStat = '1' OR h.sEmployID = 'M001040080')
	AND a.cTranstat <> '0';
	
SELECT 
	f.sAreaDesc, 
	d.sBranchNm,
	a.sAcctNmbr, 
	c.sCompnyNm,
	g.sContctNo,
	g.sRemarksx
FROM LR_Calls_Master a
	, LR_Calls_Detail g
	, MC_AR_Master b
		LEFT JOIN Branch d ON b.sBranchCd = d.sBranchCd
		LEFT JOIN Branch_Others e ON d.sBranchCd = e.sBranchCd
		LEFT JOIN Branch_Area f ON e.sAreaCode = f.sAreaCode
	, Client_Master c
WHERE a.`dTransact` BETWEEN  '2020-06-01' AND '2020-06-30'
	AND a.`sTransNox` = g.`sTransNox`
	AND a.`sAcctNmbr` = b.`sAcctNmbr`
	AND b.sClientID = c.sClientID
	AND (g.sRemarksx LIKE '%Unattended%' OR g.sRemarksx LIKE '%Cannot%Be%Reach%');
	
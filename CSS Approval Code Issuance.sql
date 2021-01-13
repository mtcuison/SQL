SELECT 
     a.`dTransact` `Date Issued` 
   , b.`sBranchNm` `Requesting Branch`
   , a.`dReqstdxx` `Requested Date`
   , a.`sMiscInfo` `Requested Refer No.`
   , a.`sRemarks2` `Remarks`
   , a.`sApprCode` `Issued Code`
   , IF(MID(a.`sApprCode`, 4, 1) = 'X', 'MIS Account', 'CSS Account') `Issued By` 
   , d.`sSCATitle` `TYPE`
   , IFNULL(e.`sTransNox`, f.sTransNox) `Payment Trans`
   , IFNULL(e.`sAcctNmbr`, f.sAcctNmbr) `Account No.`
   , h.sCompnyNm `Customer Name`
   , IFNULL(e.`sReferNox`, f.sReferNox) `OR No.`
   , IFNULL(e.`dTransact`, f.dTransact) `Payment Date`
   , IFNULL(e.`nRebatesx`, f.nRebatesx) `Rebate`
   , IFNULL(e.`sAPprCode`, f.sAPprCode) `Approval Code`
FROM
   `System_Code_Approval` a 
   LEFT JOIN Branch b
		ON a.`sReqstdBy` = b.`sBranchCd`
	LEFT JOIN `xxxSCA_Usage` c
		ON a.`sApprCode` = c.sApprCode
			AND a.`sSystemCD` = c.`sSystemCD`
	LEFT JOIN `xxxSCA_Request` d
		ON a.`sSystemCD` = d.`sSCACodex`
	LEFT JOIN (SELECT * FROM `LR_Payment_Master` WHERE dTransact >= '2020-03-17') e
			ON a.`dReqstdxx` = e.`dTransact`
			AND a.`sMiscInfo` = e.`sReferNox`
	LEFT JOIN (SELECT * FROM `LR_Payment_Master_PR` WHERE dTransact >= '2020-03-17') f
			ON a.`dReqstdxx` = f.`dTransact`
			AND a.`sMiscInfo` = f.`sReferNox`
	LEFT JOIN MC_AR_Master g
		ON IFNULL(e.`sAcctNmbr`, f.sAcctNmbr) = g.`sAcctNmbr`
	LEFT JOIN Client_Master h
		ON g.`sClientID` = h.sClientID
WHERE a.sSystemCd IN ('R1', 'R2') 
   AND a.dTransact BETWEEN '2020-05-25' AND '2020-05-31'
ORDER BY a.`dReqstdxx` ;
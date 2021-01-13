SELECT
	  c.`sBranchNm`
	, a.`dTransact`
	, b.`sCompnyNm`
	, b.`sTaxIDNox`
	, a.`nAmtPaidx`
FROM MC_SO_Master a
	, Client_Master b
	, Branch c
WHERE a.`sClientID` = b.sClientID
	AND LEFT(a.`sTransNox`, 4) = c.`sBranchCd`
	AND a.dTransact BETWEEN '2020-12-01' AND '2020-12-31'
	AND a.`nAmtPaidx` > 0
	AND a.`cTranStat` NOT IN ('3', '7')
HAVING IFNULL(b.`sTaxIDNox`, '') <> ''
UNION
SELECT
	  c.`sBranchNm`
	, a.`dTransact`
	, b.`sCompnyNm`
	, b.`sTaxIDNox`
	, a.`nAmtPaidx`
FROM SP_SO_Master a
	, Client_Master b
	, Branch c
WHERE a.`sClientID` = b.sClientID
	AND LEFT(a.`sTransNox`, 4) = c.`sBranchCd`
	AND a.dTransact BETWEEN '2020-12-01' AND '2020-12-31'
	AND a.`nAmtPaidx` > 0
	AND a.`cTranStat` NOT IN ('3', '7')
HAVING IFNULL(b.`sTaxIDNox`, '') <> ''
UNION
SELECT
	  c.`sBranchNm`
	, a.`dTransact`
	, b.`sCompnyNm`
	, b.`sTaxIDNox`
	, a.`nTranTotl`
FROM JobOrderBranch_Master a
	, Client_Master b
	, Branch c
WHERE a.`sClientID` = b.sClientID
	AND LEFT(a.`sTransNox`, 4) = c.`sBranchCd`
	AND a.dTransact BETWEEN '2020-12-01' AND '2020-12-31'
	AND a.`nTranTotl` > 0
	AND a.`cTranStat` NOT IN ('3', '7')
HAVING IFNULL(b.`sTaxIDNox`, '') <> ''
UNION
SELECT
	  c.`sBranchNm`
	, a.`dTransact`
	, b.`sCompnyNm`
	, b.`sTaxIDNox`
	, a.`nAmountxx`
FROM LR_Payment_Master a
	, Client_Master b
	, Branch c
WHERE a.`sClientID` = b.sClientID
	AND LEFT(a.`sTransNox`, 4) = c.`sBranchCd`
	AND a.dTransact BETWEEN '2020-12-01' AND '2020-12-31'
	AND a.`nAmountxx` > 0
	AND a.sTransNox LIKE 'M%'
HAVING IFNULL(b.`sTaxIDNox`, '') <> ''
UNION
SELECT
	  c.`sBranchNm`
	, a.`dTransact`
	, b.`sCompnyNm`
	, b.`sTaxIDNox`
	, a.`nAmountxx`
FROM LR_Payment_Master_PR a
	, Client_Master b
	, Branch c
WHERE a.`sClientID` = b.sClientID
	AND LEFT(a.`sTransNox`, 4) = c.`sBranchCd`
	AND a.dTransact BETWEEN '2020-12-01' AND '2020-12-31'
	AND a.`nAmountxx` > 0
	AND a.sTransNox LIKE 'M%'
HAVING IFNULL(b.`sTaxIDNox`, '') <> ''
ORDER BY sBranchNm;

DESCRIBE LR_Payment_Master
UNION
SELECT
	  c.`sBranchNm`
	, a.`dTransact`
	, b.`sCompnyNm`
	, b.`sTaxIDNox`
	, a.`nAmountxx`
FROM LR_Payment_Master a
	, Client_Master b
	, Branch c
WHERE a.`sClientID` = b.sClientID
	AND LEFT(a.`sTransNox`, 4) = c.`sBranchCd`
	AND a.dTransact BETWEEN '2020-12-01' AND '2020-12-31'
	AND a.`nAmountxx` > 0
	AND a.sTransNox LIKE 'M%'
HAVING IFNULL(b.`sTaxIDNox`, '') <> ''
UNION
SELECT
	  c.`sBranchNm`
	, a.`dTransact`
	, b.`sCompnyNm`
	, b.`sTaxIDNox`
	, a.`nAmountxx`
FROM LR_Payment_Master_PR a
	, Client_Master b
	, Branch c
WHERE a.`sClientID` = b.sClientID
	AND LEFT(a.`sTransNox`, 4) = c.`sBranchCd`
	AND a.dTransact BETWEEN '2020-12-01' AND '2020-12-31'
	AND a.`nAmountxx` > 0
	AND a.sTransNox LIKE 'M%'
HAVING IFNULL(b.`sTaxIDNox`, '') <> ''
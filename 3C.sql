SELECT * FROM xxxReplicationLog WHERE `sTransNox` LIKE 'M0W120%' ORDER BY sTransNox DESC LIMIT 10;


SELECT 
   a.*, b.sTransNox, b.cTranStat, c.`nDelayAvg`, c.`dFirstPay`, c.`dLastPaym`, c.`dDueDatex`
FROM
   LR_Collection_Unit a 
   LEFT JOIN LR_Calls_Master b 
      ON a.sAcctNmbr = b.sAcctNmbr 
      AND a.dScheduld = b.dTransact
   LEFT JOIN MC_AR_Master c
		ON a.`sAcctNmbr` = c.`sAcctNmbr`
WHERE a.dTransact <= '2020-05-27 00:00:00' 
   AND a.dDueUntil >= '2020-05-27 00:00:00' 
   AND a.cCollUnit = '0' 
   AND a.cCollStat < 2 
   AND (
      a.dAppointx IS NULL 
      OR a.dAppointx = '2020-05-27 00:00:00' 
      AND a.cApntUnit = '0'
   ) 
HAVING b.cTranStat = '0' 
   OR b.cTranStat IS NULL 
ORDER BY a.cCollStat DESC, a.nPriority, a.dAppointx, a.dDueUntil 
LIMIT 60 ;


SELECT 
	  `nAcctTerm`
	, ROUND((`nPNValuex` / `nMonAmort`)) xAcctTerm
	, (`nPaymTotl` + `nCashTotl` + `nRebTotlx` + `nDownTotl` + `nCredTotl` - `nDebtTotl`) xTotlPaym
	, (`nPaymTotl` + `nCashTotl` + `nRebTotlx` + `nDownTotl` + `nCredTotl` - `nDebtTotl`) / `nMonAmort` xMonthsPd
	, `nPNValuex`
	, `nMonAmort`
	, `dDueDatex`
FROM `MC_AR_Master` 
WHERE `sAcctNmbr` IN ('C066190027', 'C063190045', 'C064190010', 'C021190018', 'C043190107', 'M117200015', 'M027170126', 'M005200113', 'M049200094', 'M102200035', 'M060200065', 'C056200015', 'M019200043', 'C035200020', 'C015190134', 'M110200050', 'M095190033', 'M085190139', 'M071190267', 'C042190103', 'M036190254', 'M007200056', 'M047190299', 'GCC1200032', 'M029190152', 'M078200027', 'M125190128', 'M025190123', 'M005190309', 'M030200001', 'M068200009', 'M085190045', 'M018190250', 'C040200049', 'M093190296', 'M095190248', 'M097190263', 'C061190112', 'M146200066', 'M071190244', 'M133190218', 'M146190162', 'M048190321', 'M017190199', 'M046190141', 'M061190310', 'M083190118', 'M106190282', 'M156200014', 'M139190138', 'M027180049', 'M060190121', 'C006190134', 'C001190036', 'C024190049', 'C068190050', 'C027190247', 'C074190091', 'M008190411', 'M034190059');
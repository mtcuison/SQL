SELECT * FROM `LR_Collection_Unit` aa
INNER JOIN
	(SELECT 
		  sAcctNmbr
		, cCollUnit
	FROM (SELECT *
			FROM `LR_Collection_Unit`
			ORDER BY `dTransact` ASC,`cCollUnit` DESC) a
	GROUP BY a.sAcctNmbr
	HAVING COUNT(a.sAcctNmbr) > 1) bb
WHERE aa.`sAcctNmbr` = bb.`sAcctNmbr`
	AND aa.`cCollUnit` = bb.`cCollUnit`;
	
DELETE FROM `LR_Collection_Unit`
WHERE (sAcctNmbr, cCollUnit) IN (SELECT 
				  sAcctNmbr
				, cCollUnit
				FROM (SELECT *
						FROM `LR_Collection_Unit`
						WHERE `dTransact` >= '2019-10-29'
						ORDER BY `dTransact` ASC,`cCollUnit` DESC) a
				GROUP BY a.sAcctNmbr
				HAVING COUNT(a.sAcctNmbr) > 1);
	
ALTER TABLE GGC_ISysDBF.`LR_Collection_Unit` CHANGE cCollUnit
cCollUnit CHAR(1) CHARSET latin1 COLLATE latin1_swedish_ci NULL, DROP PRIMARY KEY, ADD PRIMARY KEY (sAcctNmbr);
				
DESCRIBE LR_Collection_Unit;

SELECT * FROM `xxxReplicationLog` WHERE sTransNox LIKE 'M00120%' ORDER BY sTransNox DESC LIMIT 100;
SELECT * FROM `xxxReplicationLog` WHERE sTransNox = 'M0012013284187';
SELECT * FROM `LR_Collection_Unit` WHERE sAcctNmbr = 'M114170079';
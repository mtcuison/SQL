SELECT DISTINCT 
	a.`sEmployID`,
   CONCAT(
      b.sLastName, ', ', b.sFrstName, ' ', IF(
         IFNULL(b.sSuffixNm, '') = '', '', CONCAT(b.sSuffixNm, ' ')
      ), b.sMiddName
   ) AS sEmployNm, d.dTransact, CAST(
      IF(
         NOT ISNULL(c.dAMInxxxx), c.dAMInxxxx, g.dAMInxxxx
      ) AS TIME
   ) dAMInxxxx, CAST(
      IF(
         NOT ISNULL(c.dAMOutxxx), c.dAMOutxxx, g.dAMOutxxx
      ) AS TIME
   ) dAMOutxxx, CAST(
      IF(
         NOT ISNULL(c.dPMInxxxx), c.dPMInxxxx, g.dPMInxxxx
      ) AS TIME
   ) dPMInxxxx, CAST(
      IF(
         NOT ISNULL(c.dPMOutxxx), c.dPMOutxxx, g.dPMOutxxx
      ) AS TIME
   ) dPMOutxxx, CAST(
      IF(
         NOT ISNULL(c.dOTimeInx), c.dOTimeInx, g.dOTimeInx
      ) AS TIME
   ) dOTimeInx, CAST(
      IF(
         NOT ISNULL(c.dOTimeOut), c.dOTimeOut, g.dOTimeOut
      ) AS TIME
   ) dOTimeOut, d.nTardyxxx, d.nUndrTime, d.nOverTime, d.cAbsentxx, d.cLeavexxx, d.cHolidayx, d.cDeductxx, e.sBranchNm, l.sBranchNm `sSgBranch`, h.sTransNox, d.cRestDayx, i.sTransNox xLvTransx, IFNULL(j.sTransNox, m.sTransNox) xOTTransx, d.nPayRatex, k.dTransact xForgot2L, d.nNightDif, d.nOTNghtDf 
FROM
   Employee_Master001 a 
   LEFT JOIN Client_Master b 
      ON a.sEmployID = b.sClientID 
   LEFT JOIN Employee_Timesheet d 
      ON a.sEmployID = d.sEmployID 
   LEFT JOIN 
      (SELECT 
         a.dTransact, b.* 
      FROM
         Employee_Log_Manual_Master a 
         LEFT JOIN Employee_Log_Manual_Detail b 
            ON a.sTransNox = b.sTransNox 
      WHERE a.dTransact BETWEEN '2020-05-15 00:00:00' 
         AND '2020-05-15 00:00:00' 
         AND a.cTranStat IN ('1', '2', '4')) g 
      ON d.sEmployID = g.sEmployID 
      AND d.dTransact = g.dTransact 
   LEFT JOIN Employee_Log c 
      ON d.sEmployID = c.sEmployID 
      AND d.dTransact = c.dTransact 
   LEFT JOIN Employee_Business_Trip h 
      ON a.sEmployID = h.sEmployID 
      AND d.dtransact BETWEEN h.dAppldFrx 
      AND h.dAppldTox 
      AND h.cTranStat IN ('1', '2', '4') 
   LEFT JOIN Employee_Leave i 
      ON a.sEmployID = i.sEmployID 
      AND d.dtransact BETWEEN i.dAppldFrx 
      AND i.dAppldTox 
      AND i.cTranStat IN ('1', '2', '4') 
   LEFT JOIN Branch e 
      ON a.sBranchCD = e.sBranchCD 
   LEFT JOIN Employee_Overtime j 
      ON a.sEmployID = j.sEmployID 
      AND d.dTransact BETWEEN j.dAppldFrx 
      AND j.dAppldTox 
      AND j.cTranStat IN ('1', '2', '4') 
   LEFT JOIN Employee_Overtime m 
      ON a.sEmployID = m.sEmployID 
      AND d.dTransact = m.dDateFrom 
      AND m.cTranStat IN ('1', '2', '4') 
   LEFT JOIN Employee_Log_F2S k 
      ON d.sEmployID = k.sEmployID 
      AND d.dTransact = k.dTransact 
      AND k.cIsOBxxxx = '0' 
      AND k.cTranStat IN ('1', '2', '4') 
   LEFT JOIN Branch l 
      ON a.sSgBranch = l.sBranchCD 
WHERE d.dTransact IS NOT NULL 
   AND a.sBranchCd = 'M109' 
   AND d.dTransact BETWEEN '2020-05-15 00:00:00' 
   AND '2020-05-15 00:00:00' 
UNION
SELECT DISTINCT 
	a.`sEmployID`,
   CONCAT(
      b.sLastName, ', ', b.sFrstName, ' ', IF(
         IFNULL(b.sSuffixNm, '') = '', '', CONCAT(b.sSuffixNm, ' ')
      ), b.sMiddName
   ) AS sEmployNm, d.dTransact, CAST(
      IF(
         NOT ISNULL(c.dAMInxxxx), c.dAMInxxxx, g.dAMInxxxx
      ) AS TIME
   ) dAMInxxxx, CAST(
      IF(
         NOT ISNULL(c.dAMOutxxx), c.dAMOutxxx, g.dAMOutxxx
      ) AS TIME
   ) dAMOutxxx, CAST(
      IF(
         NOT ISNULL(c.dPMInxxxx), c.dPMInxxxx, g.dPMInxxxx
      ) AS TIME
   ) dPMInxxxx, CAST(
      IF(
         NOT ISNULL(c.dPMOutxxx), c.dPMOutxxx, g.dPMOutxxx
      ) AS TIME
   ) dPMOutxxx, CAST(
      IF(
         NOT ISNULL(c.dOTimeInx), c.dOTimeInx, g.dOTimeInx
      ) AS TIME
   ) dOTimeInx, CAST(
      IF(
         NOT ISNULL(c.dOTimeOut), c.dOTimeOut, g.dOTimeOut
      ) AS TIME
   ) dOTimeOut, d.nTardyxxx, d.nUndrTime, d.nOverTime, d.cAbsentxx, d.cLeavexxx, d.cHolidayx, d.cDeductxx, e.sBranchNm, l.sBranchNm `sSgBranch`, h.sTransNox, d.cRestDayx, i.sTransNox xLvTransx, IFNULL(j.sTransNox, m.sTransNox) xOTTransx, d.nPayRatex, k.dTransact xForgot2L, 0 nNightDif, 0 nOTNghtDf 
FROM
   Employee_Master001 a 
   LEFT JOIN Client_Master b 
      ON a.sEmployID = b.sClientID 
   LEFT JOIN Employee_Timesheet_Old d 
      ON a.sEmployID = d.sEmployID 
   LEFT JOIN 
      (SELECT 
         a.dTransact, b.* 
      FROM
         Employee_Log_Manual_Master a 
         LEFT JOIN Employee_Log_Manual_Detail b 
            ON a.sTransNox = b.sTransNox 
      WHERE a.dTransact BETWEEN '2020-05-15 00:00:00' 
         AND '2020-05-15 00:00:00' 
         AND a.cTranStat IN ('1', '2', '4')) g 
      ON d.sEmployID = g.sEmployID 
      AND d.dTransact = g.dTransact 
   LEFT JOIN Employee_Log c 
      ON d.sEmployID = c.sEmployID 
      AND d.dTransact = c.dTransact 
   LEFT JOIN Employee_Business_Trip h 
      ON a.sEmployID = h.sEmployID 
      AND d.dtransact BETWEEN h.dAppldFrx 
      AND h.dAppldTox 
      AND h.cTranStat IN ('1', '2', '4') 
   LEFT JOIN Employee_Leave i 
      ON a.sEmployID = i.sEmployID 
      AND d.dtransact BETWEEN i.dAppldFrx 
      AND i.dAppldTox 
      AND i.cTranStat IN ('1', '2', '4') 
   LEFT JOIN Branch e 
      ON a.sBranchCD = e.sBranchCD 
   LEFT JOIN Employee_Overtime j 
      ON a.sEmployID = j.sEmployID 
      AND d.dTransact BETWEEN j.dAppldFrx 
      AND j.dAppldTox 
      AND j.cTranStat IN ('1', '2', '4') 
   LEFT JOIN Employee_Overtime m 
      ON a.sEmployID = m.sEmployID 
      AND d.dTransact = m.dDateFrom 
      AND m.cTranStat IN ('1', '2', '4') 
   LEFT JOIN Employee_Log_F2S k 
      ON d.sEmployID = k.sEmployID 
      AND d.dTransact = k.dTransact 
      AND k.cIsOBxxxx = '0' 
      AND k.cTranStat IN ('1', '2', '4') 
   LEFT JOIN Branch l 
      ON a.sSgBranch = l.sBranchCD 
WHERE d.dTransact IS NOT NULL 
   AND a.sBranchCd = 'M109' 
   AND d.dTransact BETWEEN '2020-05-15 00:00:00' 
   AND '2020-05-15 00:00:00' 
ORDER BY sBranchNm, sEmployNm, dTransact;
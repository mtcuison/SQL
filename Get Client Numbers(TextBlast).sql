/*GET CUSTOMER NUMBER BY BRANCH*/
SELECT 
	IFNULL(IFNULL(a.sMobileNo, e.sMobileNo), f.sPhoneNox) xMobileNo
FROM
   Client_Master a 
   LEFT JOIN MC_Serial d 
   LEFT JOIN MC_Model g 
   LEFT JOIN Brand h 
      ON g.sBrandIDx = h.sBrandIDx 
      ON d.sModelIDx = g.sModelIDx 
      ON a.sClientID = d.sClientID 
   LEFT JOIN MC_SO_Master i 
      ON a.sClientID = i.sClientID 
      AND i.cTranStat <> '3' 
   LEFT JOIN Client_Mobile e 
      ON a.sClientID = e.sClientID 
      AND e.cIncdMktg = '1' 
   LEFT JOIN Client_Telephone f 
      ON a.sClientID = f.sClientID, TownCity b, Province c 
WHERE a.sClientID = d.sClientID 
   AND a.sTownIDxx = b.sTownIDxx 
   AND b.sProvIDxx = c.sProvIDxx 
   AND LEFT(a.sClientID, 4) = 'M031' 
GROUP BY xMobileNo 
ORDER BY a.sLastName, a.sFrstName 
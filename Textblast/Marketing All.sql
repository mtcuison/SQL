SELECT 
   d.sMobileNo xMobileNo
FROM
   Client_Master a 
   LEFT JOIN Client_Mobile d 
      ON a.sClientID = d.sClientID 
   LEFT JOIN Client_Telephone e 
      ON a.sClientID = e.sClientID, TownCity b, Province c 
WHERE d.cIncdMktg = '1' 
   AND a.sTownIDxx = b.sTownIDxx 
   AND b.sProvIDxx = c.sProvIDxx 
   AND LENGTH(a.sMobileNo) = 11 
   AND LEFT(a.sMobileNo, 2) = '09' 
   AND (
      d.cInvalidx <> '1' 
      OR d.cInvalidx = '' 
      OR ISNULL(d.cInvalidx)
   ) 
   AND LENGTH(d.sMobileNo) = 11 
   AND ISNULL(d.dInactive) 
   AND a.sTownIDxx IN (
      '0314', '0346', '0347', '0345', '0344', '0349', '0334', '0315', '0331', '0330', '0316', '0318'
   ) 
GROUP BY xMobileNo 
ORDER BY a.sLastName, a.sFrstName;


SELECT * FROM TownCity WHERE `sTownName` LIKE '%Alaminos%'; 
SELECT * FROM Province WHERE `sProvName` LIKE 'Nueva Ecija';
Dagupan, Mangaldan, San Fabian, San Jacinto, Manoag, Pozurrobio, San Carlos, Lingayen, Binmaley, Bugallion, Labarador, Alaminos
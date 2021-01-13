SELECT 
	nGrossPrc + nDebtTotl - (nDownTotl + nCashTotl + nPaymTotl + nRebTotlx + nCredTotl) `Account Balance`
	, IF(12 * (YEAR(NOW()) - YEAR(dFirstPay)) + (MONTH(NOW()) - MONTH(dFirstPay)) >  nAcctTerm, nAcctTerm, 12 * (YEAR(NOW()) - YEAR(dFirstPay)) + (MONTH(NOW()) - MONTH(dFirstPay))) `Account Term`
	, (IF(12 * (YEAR(NOW()) - YEAR(dFirstPay)) + (MONTH(NOW()) - MONTH(dFirstPay)) >  nAcctTerm, nAcctTerm, 12 * (YEAR(NOW()) - YEAR(dFirstPay)) + (MONTH(NOW()) - MONTH(dFirstPay))) * nMonAmort + nDownPaym + nCashBalx) - (nGrossPrc - (nGrossPrc + nDebtTotl - (nDownTotl + nCashTotl + nPaymTotl + nRebTotlx + nCredTotl))) `Due`
	, ((IF(12 * (YEAR(NOW()) - YEAR(dFirstPay)) + (MONTH(NOW()) - MONTH(dFirstPay)) >  nAcctTerm, nAcctTerm, 12 * (YEAR(NOW()) - YEAR(dFirstPay)) + (MONTH(NOW()) - MONTH(dFirstPay))) * nMonAmort + nDownPaym + nCashBalx) - (nGrossPrc - (nGrossPrc + nDebtTotl - (nDownTotl + nCashTotl + nPaymTotl + nRebTotlx + nCredTotl)))) / nMonAmort `Delay`
	, IF((IF(12 * (YEAR(NOW()) - YEAR(dFirstPay)) + (MONTH(NOW()) - MONTH(dFirstPay)) >  nAcctTerm, nAcctTerm, 12 * (YEAR(NOW()) - YEAR(dFirstPay)) + (MONTH(NOW()) - MONTH(dFirstPay))) * nMonAmort + nDownPaym + nCashBalx) - (nGrossPrc - (nGrossPrc + nDebtTotl - (nDownTotl + nCashTotl + nPaymTotl + nRebTotlx + nCredTotl))) > nGrossPrc + nDebtTotl - (nDownTotl + nCashTotl + nPaymTotl + nRebTotlx + nCredTotl), nGrossPrc + nDebtTotl - (nDownTotl + nCashTotl + nPaymTotl + nRebTotlx + nCredTotl), (IF(12 * (YEAR(NOW()) - YEAR(dFirstPay)) + (MONTH(NOW()) - MONTH(dFirstPay)) >  nAcctTerm, nAcctTerm, 12 * (YEAR(NOW()) - YEAR(dFirstPay)) + (MONTH(NOW()) - MONTH(dFirstPay))) * nMonAmort + nDownPaym + nCashBalx) - (nGrossPrc - (nGrossPrc + nDebtTotl - (nDownTotl + nCashTotl + nPaymTotl + nRebTotlx + nCredTotl)))) `xAmount`
FROM `MC_AR_Master` 
WHERE `sAcctNmbr` = 'M046190009'

;

SELECT 12 * (YEAR(NOW()) - YEAR('2020-03-01')) + (MONTH(NOW()) - MONTH('2020-03-01'));
SELECT DATEDIFF(NOW(), '2020-05-01') / 30;


SELECT 
   b.`sMobileNo`, a.`sAcctNmbr`, b.`sClientID`, b.`sLastName`, b.`sFrstName`, CONCAT(b.`sFrstName`, ' ', b.`sLastName`) xClientNm
FROM
   `MC_AR_Master` a, Client_Master b 
WHERE ((IF(12 * (YEAR(NOW()) - YEAR(dFirstPay)) + (MONTH(NOW()) - MONTH(dFirstPay)) >  nAcctTerm, nAcctTerm, 12 * (YEAR(NOW()) - YEAR(dFirstPay)) + (MONTH(NOW()) - MONTH(dFirstPay))) * nMonAmort + nDownPaym + nCashBalx) - (nGrossPrc - (nGrossPrc + nDebtTotl - (nDownTotl + nCashTotl + nPaymTotl + nRebTotlx + nCredTotl)))) / nMonAmort = 12 * (YEAR(NOW()) - YEAR('2020-03-01')) + (MONTH(NOW()) - MONTH('2020-03-01'))
	AND NOT ISNULL(a.`dLastPaym`)
   AND a.`cLoanType` = '0' 
   AND a.`cAcctstat` = '0'    
   AND IFNULL(a.`cActTypex`, '0') = '0' 
   AND a.`sClientID` = b.`sClientID` 
   AND IFNULL(b.`sMobileNo`, '') <> '' 
   AND a.`dDueDatex` >= NOW()
   AND DATEDIFF(NOW(), a.`dLastPaym`) / 30 > 1
ORDER BY a.`dLastPaym`;  
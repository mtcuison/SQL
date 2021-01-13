DELETE FROM Sales_Master;
DELETE FROM Sales_Detail;
DELETE FROM Sales_Payment;
DELETE FROM Receipt_Master;
DELETE FROM Credit_Card_Trans;
DELETE FROM Gift_Certificate_Trans;
DELETE FROM Check_Payment_Trans;
DELETE FROM Inv_Ledger;
DELETE FROM Charge_Invoice;
DELETE FROM Daily_Summary;
DELETE FROM Event_Master;


UPDATE Cash_Reg_Machine SET sORNoxxxx = '', nSalesTot = 0.00, nVATSales = 0.00, nVATAmtxx = 0.00, nNonVATxx = 0.00, nZeroRatd = 0.00, nZReadCtr = 0;;
	
	
SELECT * FROM Brand;
SELECT * FROM Inventory;	
SELECT * FROM `Inv_Master`;
SELECT * FROM `Inv_Serial`;
SELECT * FROM `Cash_Reg_Machine`;


sIDNumber
nLastZCtr
dResetDte
dStartDte
sModified
dTimeStmp;

SELECT * FROM Branch WHERE `sBranchCD` = 'C001';
SELECT * FROM `xxxSysClient` WHERE `sClientID` LIKE '%C001';

SELECT * FROM `xxxReportMaster`;


SELECT * FROM `xxxSysObjectSub`;
SELECT * FROM `xxxSysApplicationSub`;
SELECT * FROM `xxxSysWorkStation` WHERE sClientID LIKE '%P001';


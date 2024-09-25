<!---------------------->
<!--- Page / Section --->
<!---------------------->

# Item Price

<br />
<br />
<br />

<!---------------------->
<!--- Page / Section --->
<!---------------------->



<div style="page-break-after: always"> 



<!---------------------->
<!--- Page / Section --->
<!---------------------->

## Item Cost
   
<br />

``` SQL
SELECT
ISNULL(IPC.RECID,-1) AS ItemPriceRecId,
ISNULL(ID.RECID,-1) AS InventDimRecId,
ISNULL(IT.RECID,-1) AS ItemRecId,
ISNULL(DA.RECID,-1) AS CompanyRecId,
ISNULL(SI.RECID,-1) AS SiteCompanyRecId,
RANK() OVER (PARTITION BY IT.RECID, ID.RECID ORDER BY IPC.ACTIVATIONDATE DESC) AS ItemPriceVersion,
FORMAT(IPC.ACTIVATIONDATE,'MMMM dd, yyyy') AS ItemPriceVersionName,
IPC.ACTIVATIONDATE AS ActivationDate,
IPC.COSTINGTYPE AS CostingType,
IPC.MARKUP AS Markup,
IPC.PRICE AS Price,
IPC.PRICEQTY AS PriceQuantity,
IPC.PRICETYPE AS PriceType,
IPC.PRICEUNIT AS PriceUnit,
IPC.UNITID AS UnitId,
ISNULL(IPC.VERSIONID,'') AS VersionId,
IPC.CREATEDDATETIME AS CreatedDateTime,
IPC.DATAAREAID AS CompanyId

  FROM [dbo].[InventItemPrice] IPC 

	LEFT JOIN Dynamics365_FinOps_PRD.dbo.InventDim ID
		ON IPC.INVENTDIMID = ID.INVENTDIMID
		AND IPC.DATAAREAID = ID.DATAAREAID

	LEFT JOIN Dynamics365_FinOps_PRD.dbo.INVENTSITE SI
		   ON ID.InventSiteID = SI.SiteID
		   AND ID.DATAAREAID = SI.DATAAREAID

	LEFT JOIN Dynamics365_FinOps_PRD.dbo.InventTable IT
		ON IPC.ITEMID = IT.ITEMID
		AND IPC.DATAAREAID = IT.DATAAREAID

	LEFT JOIN Dynamics365_FinOps_PRD.dbo.DATAAREA DA
		ON IPC.DataAreaId = DA.ID

WHERE IT.RECID IS NOT NULL;

```

<br />

```
| DataAreaId | ItemId  | ModuleType | PriceDate | Price |
| ---------- | ------- | ---------- | --------- | ----- |
| LE01       | ITM0001 | Sales      | 01-Jan    | 5.00  |
| LE01       | ITM0001 | Sales      | 23-Mar    | 5.50  |
| LE01       | ITM0001 | Inventory  | 01-Jan    | 5.00  |
| LE01       | ITM0001 | Purchase   | 01-Jan    | 4.80  |
```

<br />
<br />
<br />

<!---------------------->
<!--- Page / Section --->
<!---------------------->

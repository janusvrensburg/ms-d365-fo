<!---------------------->
<!--- Page / Section --->
<!---------------------->

# Purchase Orders

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

## Purchase Order Header
 
This query will return the unique list of purchase order headers.
   
<br />

``` SQL
SELECT [PUR].[DataAreaId] AS [DataAreaId]
      ,[PUR].[PurchId] AS [PurchaseOrderId]
      ,[PUR].[PurchName] AS [PurchaseOrderName]
      ,[PUR].[PurchStatus] AS [PurchaseOrderStatus]
      ,[PUR].[DocumentState] AS [ApprovalStatus]
      ,[PUR].[OrderAccount] AS [VendorId]
  FROM [dbo].[PurchTable] AS [PUR];
```

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

## Vendor Lookup
 
This query will return the unique list of purchase order headers along with the vendor details.
   
<br />

``` SQL
SELECT [PUR].[DataAreaId] AS [DataAreaId]
      ,[PUR].[RecId] AS [PurchaseOrderRecId]
      ,[PUR].[PurchId] AS [PurchaseOrderId]

      ,[VND].[RecId] AS [VendorRecId]
      ,[VND_NME].[Name] AS [VendorName]

  FROM [dbo].[PurchTable] AS [PUR]

       LEFT JOIN [dbo].[VendTable] AS [VND]
              ON [VND].[AccountNum] = [PUR].[OrderAccount]
             AND [VND].[DataAreaId] = [PUR].[DataAreaId]

       LEFT JOIN [dbo].[DirPartyTable] AS [VND_NME]
              ON [VND_NME].[RecId] = [VND].[Party]
             AND [VND_NME].[LanguageId] = 'en-US';
```

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

## Payment Term Lookup
 
This query will return the unique list of purchase order headers along with the payment terms.
   
<br />

``` SQL
SELECT [PUR].[DataAreaId] AS [DataAreaId]
      ,[PUR].[RecId] AS [PurchaseOrderRecId]
      ,[PUR].[PurchId] AS [PurchaseOrderId]

      ,[PUR].[Payment] AS [PaymentTermId]
      ,[PAY_TRM].[Description] AS [PaymentTermName]

  FROM [dbo].[PurchTable] AS [PUR]

       LEFT JOIN [dbo].[PaymTerm] AS [PAY_TRM]
              ON [PAY_TRM].[PaymTermId] = [PUR].[Payment]
             AND [PAY_TRM].[DataAreaId] = [PUR].[DataAreaId];
```

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

## Site Lookup
 
This query will return the unique list of purchase order headers along with the site.
   
<br />

``` SQL
SELECT [PUR].[DataAreaId] AS [DataAreaId]
      ,[PUR].[RecId] AS [PurchaseOrderRecId]
      ,[PUR].[PurchId] AS [PurchaseOrderId]

      ,[PUR].[InventSiteId] AS [SiteId]
      ,[INV_STE].[Name] AS [SiteName]

  FROM [dbo].[PurchTable] AS [PUR]

       LEFT JOIN [dbo].[InventSite] AS [INV_STE]
              ON [INV_STE].[SiteId] = [PUR].[InventSiteId]
             AND [INV_STE].[DataAreaId] = [PUR].[DataAreaId];
```

<br />
<br />
<br />

<!---------------------->
<!--- Page / Section --->
<!---------------------->

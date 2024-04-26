<!---------------------->
<!--- Page / Section --->
<!---------------------->

# Accounts Payable (AP)

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

## Vendor Name Lookup
   
<br />

``` SQL
SELECT [VND].[DataAreaId] AS [DataAreaId]
      ,[VND].[RecId] AS [VendorRecId]
      ,[VND].[AccountNum] AS [VendorId]

      ,[VND_NME].[Name] AS [VendorName]

  FROM [dbo].[VendTable] AS [VND]

       LEFT JOIN [dbo].[DirPartyTable] AS [VND_NME]
              ON [VND_NME].[RecID] = [VND].[Party]
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

## Vendor Group Lookup
   
<br />

``` SQL
SELECT [VND].[DataAreaId] AS [DataAreaId]
      ,[VND].[RecId] AS [VendorRecId]
      ,[VND].[AccountNum] AS [VendorId]

      ,[VND].[VendGroup] AS [VendorGroupId]
      ,[VND_GRP].[Name] AS [VendorGroupName]

  FROM [dbo].[VendTable] AS [VND]

       LEFT JOIN [dbo].[VendGroup] AS [VND_GRP]
              ON [VND_GRP].[VendGroup]  = [VND].[VendGroup]
             AND [VND_GRP].[DataAreaId] = [VND].[DataAreaId]
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

## Payment Terms Lookup
   
<br />

``` SQL
SELECT [VND].[DataAreaId] AS [DataAreaId]
      ,[VND].[RecId] AS [VendorRecId]
      ,[VND].[AccountNum] AS [VendorId]

      ,[VND].[PaymTermId] AS [PaymentTermId]
      ,[PAY_TRM].[Description] AS [PaymentTermName]

  FROM [dbo].[VendTable] AS [VND]

       LEFT JOIN [dbo].[PaymTerm] AS [PAY_TRM]
              ON [PAY_TRM].[PaymTermId] = [VND].[PaymTermId]
             AND [PAY_TRM].[DataAreaId] = [VND].[DataAreaId]
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

## Delivery Terms Lookup
   
<br />

``` SQL
SELECT [VND].[DataAreaId] AS [DataAreaId]
      ,[VND].[RecId] AS [VendorRecId]
      ,[VND].[AccountNum] AS [VendorId]

      ,[VND].[DlvTerm] AS [DeliveryTermId]
      ,[DEL_TRM].[Txt] AS [DeliveryTermName]

  FROM [dbo].[VendTable] AS [VND]

       LEFT JOIN [dbo].[DlvTerm] AS [DEL_TRM]
              ON [DEL_TRM].[Code] = [VND].[DlvTerm]
             AND [DEL_TRM].[DataAreaId] = [VND].[DataAreaId]
```

<br />
<br />
<br />

<!---------------------->
<!--- Page / Section --->
<!---------------------->

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
 
This query will return the unique list of customers
   
<br />

``` SQL
SELECT [PUR].[DataAreaId]      AS [DataAreaId]
      ,[PUR].[PurchId]         AS [PurchaseOrderId]
      ,[PUR].[PurchName]       AS [PurchaseOrderName]
      ,[PUR].[PurchStatus]     AS [PurchaseOrderStatus]
      ,[PUR].[DocumentState]   AS [ApprovalStatus]
      ,[PUR].[OrderAccount]    AS [VendorId]
  FROM [dbo].[PurchTable] AS [PUR]
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


## Customer Organization
      
This query will return the unique list of customers along with the Organization Number
   
<br />

``` SQL
SELECT [CUS].[DataAreaID]                  AS [Company_ID]

      ,[CUS].[RecID]                       AS [Customer_Record_ID]
      ,[CUS].[AccountNum]                  AS [Customer_ID]
      ,NULLIF([CUS_NME].[Name], '')        AS [Customer_Name]

      ,NULLIF([CUS_ORG].[OrgNumber], '')   AS [Organization_Number]

  FROM [dbo].[CustTable] AS [CUS]

       -- Customer Name Lookup
       LEFT JOIN [dbo].[DirPartyTable] AS [CUS_NME]
              ON [CUS_NME].[RecID]     = [CUS].[Party]
             AND [CUS_NME].[Partition] = [CUS].[Partition]

       -- Customer Organization Lookup
       LEFT JOIN [dbo].[DirOrganization] AS [CUS_ORG]
              ON [CUS_ORG].[PartyNumber] = [CUS_NME].[PartyNumber]
             AND [CUS_ORG].[Partition]   = [CUS_NME].[Partition]

 ORDER BY [CUS].[DataAreaID] ASC
      ,[CUS].[AccountNum] ASC;

```

<br />
<br />
<br />

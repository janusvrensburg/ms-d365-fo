# Item Batch

<br />

## Entity Relationship
High-level overview of entity relationships

<br />

<img src="https://raw.githubusercontent.com/janusvrensburg/ms-d365-fo/main/svg/customer-electronic-contact-info.drawio.svg">

<br />

## SQL

<br />

```sql
SELECT [CUS].[DataAreaId]             AS [Company_ID]
      ,[CUS].[AccountNum]             AS [Customer_Number]

      ,NULLIF([CUS_NME].[Name], '')   AS [Customer_Name]

      ,[ELC_ADD].[Type]               AS [Contact_Type]
      ,[ELC_ADD].[Locator]            AS [Contact_Detail]
      ,[ELC_ADD].[IsPrimary]          AS [Contact_Primary]

  FROM [dbo].[CustTable] AS [CUS] -- Customer

       -- Customer (Name) Lookup
       LEFT JOIN [dbo].[DirPartyTable] AS [CUS_NME]
              ON [CUS_NME].[RecId]     = [CUS].[Party]
             AND [CUS_NME].[Partition] = [CUS].[Partition]

       -- Customer Location Lookup
       INNER JOIN [dbo].[DirPartyLocation] AS [CUS_LOC]
               ON [CUS_LOC].[Party]            = [CUS].[Party]
              AND [CUS_LOC].[Partition]        = [CUS].[Partition]
              AND [CUS_LOC].[IsPostalAddress] != 1

       -- Electronic Address Lookup
       INNER JOIN [dbo].[LogisticsElectronicAddress] AS [ELC_ADD] 
               ON [ELC_ADD].[Location]   = [CUS_LOC].[Location]
              AND [ELC_ADD].[Partition]  = [CUS_LOC].[Partition]
              AND [ELC_ADD].[Locator]   != ''

 ORDER BY [CUS].[AccountNum] ASC
      ,[ELC_ADD].[Type] ASC;
```

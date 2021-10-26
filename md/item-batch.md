# Item Batch

<br />

## Entity Relationship
High-level overview of entity relationships

<br />

<img src="https://raw.githubusercontent.com/janusvrensburg/ms-d365-fo/main/svg/item-batch.drawio.svg">

<br />

## SQL
This will return all Items, along with the Batch Numbers (One Item can have multiple or no Batch Numbers)

``` sql
-- Item Batches
SELECT [INV_ITM].[DataAreaId]                                AS [Company_ID]

      ,[INV_ITM].[ItemId]                                    AS [Item_Number]
      ,NULLIF([ITM_NME].[Name], '')                          AS [Item_Name]

      ,NULLIF([INV_BTC].[InventBatchId], '')                 AS [Batch_Number]
      ,NULLIF([INV_BTC].[ProdDate], '1900-01-01 00:00:00')   AS [Manufacturing_Date]
      ,NULLIF([INV_BTC].[ExpDate], '1900-01-01 00:00:00')    AS [Expiration_Date]

  FROM [dbo].[InventTable] AS [INV_ITM] -- Item

       -- Item (Name) Lookup
       LEFT JOIN [dbo].[EcoResProductTranslation] AS [ITM_NME]
              ON [ITM_NME].[Product]    = [INV_ITM].[Product]
             AND [ITM_NME].[Partition]  = [INV_ITM].[Partition]
             AND [ITM_NME].[LanguageId] = 'en-us'


       -- Item Batch Lookup
       LEFT JOIN [dbo].[InventBatch] AS [INV_BTC]
              ON [INV_BTC].[ItemId]      = [INV_ITM].[ItemId]
             AND [INV_BTC].[Partition]   = [INV_ITM].[Partition]
             AND [INV_BTC].[DataAreaId]  = [INV_ITM].[DataAreaId]

 ORDER BY [INV_ITM].[DataAreaId] ASC
      ,[INV_ITM].[ItemId] ASC
      ,[INV_BTC].[InventBatchId] ASC;
```

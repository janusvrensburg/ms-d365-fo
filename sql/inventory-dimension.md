``` sql
SELECT [INV_DIM].[DataAreaId]                     AS [CompanyID]

      ,[INV_DIM].[RecId]                          AS [InventoryDimensionKey]
      ,[INV_DIM].[InventDimId]                    AS [InventoryDimensionID]

      ,NULLIF([INV_DIM].[InventBatchId],'')       AS [BatchNumber]
      ,NULLIF([INV_DIM].[InventStyleId],'')       AS [StyleID]

      ,NULLIF([INV_DIM].[InventSiteId], '')       AS [SiteID]
      ,NULLIF([INV_DIM].[InventLocationId], '')   AS [WarehouseID]
      ,NULLIF([INV_DIM].[WMSLocationId], '')      AS [WarehouseLocationID]
      ,NULLIF([INV_DIM].[WMSPalletId], '')        AS [PalletID]

  FROM [dbo].[InventDim] AS [INV_DIM];
```

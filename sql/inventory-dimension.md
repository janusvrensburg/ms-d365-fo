# Inventory Dimension

<br />

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

<br />

## Site Lookup

<br />

``` sql
SELECT [INV_DIM].[DataAreaId]                     AS [CompanyID]

      ,NULLIF([INV_DIM].[InventSiteId], '')       AS [SiteID]
      ,NULLIF([INV_STE].[Name], '')               AS [SiteName]

  FROM [dbo].[InventDim] AS [INV_DIM]

       LEFT JOIN [dbo].[InventSite] AS [INV_STE]
              ON [INV_STE].[DataAreaId] = [INV_DIM].[DataAreaId]
             AND [INV_STE].[SiteId] = [INV_DIM].[InventSiteId]
```

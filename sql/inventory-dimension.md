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

  FROM [dbo].[InventDim] AS [INV_DIM]
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

<br />

## Warehouse Lookup

<br />

``` sql
SELECT [INV_DIM].[DataAreaId]                     AS [CompanyID]

      ,NULLIF([INV_DIM].[InventLocationId], '')   AS [WarehouseID]
      ,NULLIF([INV_LOC].[Name], '')               AS [WarehouseName]

  FROM [dbo].[InventDim] AS [INV_DIM]

       LEFT JOIN [dbo].[InventLocation] AS [INV_LOC]
              ON [INV_LOC].[DataAreaId] = [INV_DIM].[DataAreaId]
             AND [INV_LOC].[InventLocationId] = [INV_DIM].[InventLocationId]
```
<br />

## Warehouse Location Lookup

<br />

``` sql
SELECT [INV_DIM].[DataAreaId]                     AS [CompanyID]

      ,NULLIF([WMS_LOC].[WMSLocationId], '')      AS [WarehouseLocationID]

      ,NULLIF([WMS_LOC].[ZoneId], '')             AS [ZoneID]

  FROM [dbo].[InventDim] AS [INV_DIM]

       LEFT JOIN [dbo].[WMSLocation] AS [WMS_LOC]
              ON [WMS_LOC].[DataAreaId] = [INV_DIM].[DataAreaId]
             AND [WMS_LOC].[WMSLocationId] = [INV_DIM].[WMSLocationId]
```

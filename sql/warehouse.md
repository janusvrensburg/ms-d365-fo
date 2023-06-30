<!---------------------->
<!--- Page / Section --->
<!---------------------->

# Warehouse (InventLocation)

<br />

``` sql
SELECT [INV_LOC].[DataAreaId]                     AS [CompanyID]

      ,[INV_LOC].[RecId]                          AS [WarehouseKey]

      ,NULLIF([INV_LOC].[InventSiteId], '')       AS [SiteID]

      ,NULLIF([INV_LOC].[InventLocationId], '')   AS [WarehouseID]
      ,NULLIF([INV_LOC].[Name], '')               AS [WarehouseName]

  FROM [dbo].[InventLocation] AS [INV_LOC]
```

<br />

<!---------------------->
<!--- Page / Section --->
<!---------------------->



<div style="page-break-after: always"> 



<!---------------------->
<!--- Page / Section --->
<!---------------------->

## Lookups

<!---------------------->
<!--- Page / Section --->
<!---------------------->



<!-- <div style="page-break-after: always">  -->



<!---------------------->
<!--- Page / Section --->
<!---------------------->

### Site Lookup (InventSite)

<br />

``` sql
SELECT [INV_LOC].[DataAreaId]                     AS [CompanyID]

      ,NULLIF([INV_LOC].[InventSiteId], '')       AS [SiteID]
      ,NULLIF([INV_STE].[Name], '')               AS [SiteName]

  FROM [dbo].[InventLocation] AS [INV_LOC]

       LEFT JOIN [dbo].[InventSite] AS [INV_STE]
              ON [INV_STE].[DataAreaId] = [INV_LOC].[DataAreaId]
             AND [INV_STE].[SiteId] = [INV_LOC].[InventSiteId]
```

<br />

<!---------------------->
<!--- Page / Section --->
<!---------------------->

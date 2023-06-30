# Site

<br />

``` sql
SELECT [INV_STE].[DataAreaId]           AS [CompanyID]
      ,[INV_STE].[RecId]                AS [SiteKey]
      ,NULLIF([INV_STE].[SiteId], '')   AS [SiteID]
      ,NULLIF([INV_STE].[Name], '')     AS [SiteName]
  FROM [dbo].[InventSite] AS [INV_STE]
```

# Warehouse Location (WMSLocation)

<br />

``` sql
SELECT [WMS_LOC].[DataAreaId]                     AS [CompanyID]

      ,[WMS_LOC].[RecId]                          AS [WarehouseLocationKey]

      ,NULLIF([WMS_LOC].[WMSLocationId], '')      AS [WarehouseLocationID]

      ,NULLIF([WMS_LOC].[LocationType], '')       AS [WarehouseLocationType] -- Enumeration

      ,NULLIF([WMS_LOC].[ZoneId], '')             AS [ZoneID]

      ,NULLIF([WMS_LOC].[Height], 0.00)           AS [Height]
      ,NULLIF([WMS_LOC].[Width], 0.00)            AS [Width]
      ,NULLIF([WMS_LOC].[Depth], 0.00)            AS [Depth]

  FROM [dbo].[WMSLocation] AS [WMS_LOC]
```

<br />

## Warehouse Location Type (LocationType)

<br />

``` sql
SELECT DISTINCT [WMS_LOC].[DataAreaId]            AS [CompanyID]

      ,NULLIF([WMS_LOC].[LocationType], '')       AS [WarehouseLocationType] -- Enumeration

      ,(CASE [WMS_LOC].[LocationType] 
             WHEN '0' THEN 'Buffer' 
             WHEN '1' THEN 'Pick'
             WHEN '2' THEN 'InputPort'
             WHEN '3' THEN 'OutputPort'
             WHEN '4' THEN 'ProductionInput'
             WHEN '5' THEN 'InspectionLocation'
             WHEN '6' THEN 'KanbanSupermarket'
        END)                                      AS [WarehouseLocationTypeLabel]

  FROM [dbo].[WMSLocation] AS [WMS_LOC]
```

<br />

> Enumerations can be customized; please review before implementing.

<br />

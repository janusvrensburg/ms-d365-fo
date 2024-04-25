<!---------------------->
<!--- Page / Section --->
<!---------------------->

# Inventory Transfer

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

## Draft
 
 
   
<br />

``` SQL
WITH [COGS] AS 

    (

      SELECT [INV_TRN].[DataAreaId]
            ,[TRN_ORI].[InventTransId]

            ,SUM([INV_TRN].[CostAmountPosted]) * -1 AS [CostAmountPosted]
            ,SUM([INV_TRN].[CostAmountAdjustment]) * -1 AS [CostAmountAdjustment]

        FROM [dbo].[InventTrans] AS [INV_TRN]

             INNER JOIN [dbo].[InventTransOrigin] AS [TRN_ORI] 
                     ON [TRN_ORI].[RecId] = [INV_TRN].[InventTransOrigin]
                    AND [TRN_ORI].[DataAreaId] = [INV_TRN].[DataAreaId]

      GROUP BY [INV_TRN].[DataAreaId]
           ,[TRN_ORI].[InventTransId]

    )

SELECT [INV_TRF].[DataAreaId]                  AS [DataAreaId]
      ,[INV_TRF].[RecId]                       AS [InventoryTransferRecId]
      ,[INV_TRF].[TransferId]                  AS [InventoryTransferId]

      ,[INV_TRF].[InventLocationIdFrom]        AS [OriginLocationId]
      ,[FRM_LOC].[Name]                        AS [OriginLocationName]

      ,[INV_TRF].[InventLocationIdTo]          AS [DestinationLocationId]
      ,[TO_LOC].[Name]                         AS [DestinationLocationName]

      ,[INV_TRF_LNE].[LineNum]                 AS [LineNumber]
      ,[INV_TRF_LNE].[ItemId]                  AS [ItemId]

      ,[INV_TRF_LNE].[ShipDate]                AS [ShipDate]
      ,[INV_TRF_LNE].[ReceiveDate]             AS [ReceiveDate]

      ,[INV_TRF_LNE].[QtyTransfer]             AS [TransferQty]
      ,[INV_TRF_LNE].[QtyShipped]              AS [ShippedQty]
      ,[INV_TRF_LNE].[QtyReceived]             AS [ReceivedQty]

      ,[COGS].[CostAmountPosted]               AS [CostAmountPosted]
      ,[COGS].[CostAmountAdjustment]           AS [CostAmountAdjustment]

  FROM [dbo].[InventTransferTable] AS [INV_TRF]

       LEFT JOIN [dbo].[InventLocation] AS [FRM_LOC]
              ON [FRM_LOC].[InventLocationId] = [INV_TRF].[InventLocationIdFrom]
             AND [FRM_LOC].[DataAreaId] = [INV_TRF].[DataAreaId]

       LEFT JOIN [dbo].[InventLocation] AS [To_LOC]
              ON [To_LOC].[InventLocationId] = [INV_TRF].[InventLocationIdTo]
             AND [To_LOC].[DataAreaId] = [INV_TRF].[DataAreaId]
  
       LEFT JOIN [dbo].[InventTransferLine] AS [INV_TRF_LNE]
              ON [INV_TRF_LNE].[TransferId] = [INV_TRF].[TransferId]
             AND [INV_TRF_LNE].[DataAreaId] = [INV_TRF].[DataAreaId]

       LEFT JOIN [COGS] 
              ON [COGS].[InventTransId] = [INV_TRF_LNE].[InventTransId]
             AND [COGS].[DataAreaId] = [INV_TRF_LNE].[DataAreaId];
```

<br />
<br />
<br />

<!---------------------->
<!--- Page / Section --->
<!---------------------->

<!---------------------->
<!--- Page / Section --->
<!---------------------->

# Cost of Goods Sold

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
            ,[INV_TRN].[InvoiceId]
            ,[TRN_ORI].[InventTransId]

            ,SUM([INV_TRN].[CostAmountPosted]) * -1 AS [COGS]
            ,SUM([INV_TRN].[CostAmountAdjustment]) * -1 AS [CostAmountAdjustment]

        FROM [dbo].[InventTrans] AS [INV_TRN]

             INNER JOIN [dbo].[InventTransOrigin] AS [TRN_ORI] 
                     ON [TRN_ORI].[RecId] = [INV_TRN].[InventTransOrigin]
                    AND [TRN_ORI].[DataAreaId] = [INV_TRN].[DataAreaId]

      WHERE [INV_TRN].[InvoiceId] <> ''

      GROUP BY [INV_TRN].[DataAreaId]
           ,[INV_TRN].[InvoiceId]
           ,[TRN_ORI].[InventTransId]

    ) 

SELECT [INV_LNE].[DataAreaId]
      ,[INV_LNE].[SalesId]
      ,[INV_LNE].[InvoiceId]
      ,[INV_LNE].[LineNum]
      ,[INV_LNE].[LineAmount]
      ,[INV_LNE].[LineAmount] - ISNULL([COGS].[COGS], 0) - ISNULL([COGS].[CostAmountAdjustment], 0) AS [Margin]
  FROM [dbo].[CustInvoiceTrans] AS [INV_LNE]

       LEFT JOIN [COGS] 
              ON [COGS].[InvoiceId] = [INV_LNE].[InvoiceId]
             AND [COGS].[InventTransId] = [INV_LNE].[InventTransId]
             AND [COGS].[DataAreaId] = [INV_LNE].[DataAreaId]

ORDER BY 2, 3, 4 ASC

```

<br />
<br />
<br />

<!---------------------->
<!--- Page / Section --->
<!---------------------->

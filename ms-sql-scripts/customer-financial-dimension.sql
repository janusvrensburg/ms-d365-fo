

-- CUSTOMER FINANCIAL DIMENSION
WITH [FIN_DIM]
  AS

     (

       -- FINANCIAL DIMENSION
       SELECT [FIN_DIM].[Partition]                   -- AS [Financial_Dimension_Partition]
             ,[FIN_DIM].[DimensionAttributeValueSet]  -- AS [Financial_Dimension_ID]
             ,[DIM_ATT].[Name]                        -- AS [Financial_Dimension_Name]
             ,[FIN_DIM].[DisplayValue]                -- AS [Financial_Dimension_Value]
         FROM [dbo].[DimensionAttributeValueSetItem] AS [FIN_DIM]
       
              INNER JOIN [dbo].[DimensionAttributeValue] AS [ATT_VAL]
                      ON [ATT_VAL].[RecID]     = [FIN_DIM].[DimensionAttributeValue]
                     AND [ATT_VAL].[Partition] = [FIN_DIM].[Partition]
       
              INNER JOIN [dbo].[DimensionAttribute] AS [DIM_ATT]
                      ON [DIM_ATT].[RecID]     = [ATT_VAL].[DimensionAttribute]
                     AND [DIM_ATT].[Partition] = [ATT_VAL].[Partition]

     )

SELECT [CUS].[DataAreaID]             AS [Company_ID]

      ,[CUS].[RecID]                  AS [Customer_Record_ID]

      ,[CUS].[AccountNum]             AS [Customer_ID]
      ,NULLIF([CUS_NME].[Name], '')   AS [Customer_Name]

      ,[FIN_DIM].[Name]               AS [Financial_Dimension_Name]
      ,[FIN_DIM].[DisplayValue]       AS [Financial_Dimension_Value]

  FROM [dbo].[CustTable] AS [CUS]

       -- CUSTOMER (NAME) LOOKUP
       LEFT JOIN [dbo].[DirPartyTable] AS [CUS_NME]
              ON [CUS_NME].[RecID]     = [CUS].[Party]
             AND [CUS_NME].[Partition] = [CUS].[Partition]

       -- FINANCIAL DIMENSION LOOKUP
       LEFT JOIN [FIN_DIM]
              ON [FIN_DIM].[DimensionAttributeValueSet] = [CUS].[DefaultDimensionID]
             AND [FIN_DIM].[Partition]                  = [CUS].[Partition]

 ORDER BY [CUS].[DataAreaID] ASC
      ,[CUS].[AccountNum] ASC;


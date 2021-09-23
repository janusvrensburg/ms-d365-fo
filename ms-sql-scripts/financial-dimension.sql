
-- FINANCIAL DIMENSION
SELECT [FIN_DIM].[Partition]                    AS [Financial_Dimension_Partition]
      ,[FIN_DIM].[DimensionAttributeValueSet]   AS [Financial_Dimension_ID]
      ,[DIM_ATT].[Name]                         AS [Financial_Dimension_Name]
      ,[FIN_DIM].[DisplayValue]                 AS [Financial_Dimension_Value]
  FROM [dbo].[DimensionAttributeValueSetItem] AS [FIN_DIM]

       INNER JOIN [dbo].[DimensionAttributeValue] AS [ATT_VAL]
               ON [ATT_VAL].[RecID]     = [FIN_DIM].[DimensionAttributeValue]
              AND [ATT_VAL].[Partition] = [FIN_DIM].[Partition]

       INNER JOIN [dbo].[DimensionAttribute] AS [DIM_ATT]
               ON [DIM_ATT].[RecID]     = [ATT_VAL].[DimensionAttribute]
              AND [DIM_ATT].[Partition] = [ATT_VAL].[Partition]

 ORDER BY [DIM_ATT].[Name] ASC


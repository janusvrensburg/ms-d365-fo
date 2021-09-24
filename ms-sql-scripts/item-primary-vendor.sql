
-- ITEM PRIMARY VENDOR
SELECT [ITM].[DataAreaID]                                AS [Company_ID]

      ,[ITM].[RecID]                                     AS [Item_Record_ID]
      ,NULLIF([ITM].[ItemID], '')                        AS [Item_Number]
      ,NULLIF([PRD].[SearchName], '')                    AS [Item_Search_Name]
      ,NULLIF([PRD_NME].[Name], '')                      AS [Item_Name]

      ,NULLIF([ITM].[PrimaryVendorId], '')               AS [Primary_Vendor_ID]
      ,NULLIF([PRI_VND_NME].[Name], '')                  AS [Primary_Vendor_Name]
      ,NULLIF([PRI_VND_EXT_ITM].[ExternalItemTxt], '')   AS [Primary_Vendor_External_Item]

  FROM [dbo].[InventTable] AS [ITM]

       -- PRODUCT LOOKUP
       LEFT JOIN [dbo].[EcoResProduct] AS [PRD]
              ON [PRD].[EcoResProductRecID] = [ITM].[Product]
             AND [PRD].[Partition]          = [ITM].[Partition]

       -- PRODUCT (NAME) LOOKUP
       LEFT JOIN [dbo].[EcoResProductTranslation] AS [PRD_NME]
              ON [PRD_NME].[Product]    = [ITM].[Product]
             AND [PRD_NME].[Partition]  = [ITM].[Partition]
             AND [PRD_NME].[LanguageID] = 'en-us'

       -- PRIMARY VENDOR LOOKUP
       LEFT JOIN [dbo].[VendTable] AS [PRI_VND]
              ON [PRI_VND].[AccountNum] = [ITM].[PrimaryVendorId]
             AND [PRI_VND].[Partition]  = [ITM].[Partition]
             AND [PRI_VND].[DataAreaID] = [ITM].[DataAreaID]

       -- PRIMARY VENDOR (NAME) LOOKUP
       LEFT JOIN [dbo].[DirPartyTable] AS [PRI_VND_NME]
              ON [PRI_VND_NME].[RecID]     = [PRI_VND].[Party]
             AND [PRI_VND_NME].[Partition] = [PRI_VND].[Partition]

       -- PRIMARY VENDOR EXTERNAL ITEM LOOKUP
       LEFT JOIN [dbo].[CustVendExternalItem] AS [PRI_VND_EXT_ITM]
              ON [PRI_VND_EXT_ITM].[ItemID]           = [ITM].[ItemID]
             AND [PRI_VND_EXT_ITM].[CustVendRelation] = [ITM].[PrimaryVendorId]
             AND [PRI_VND_EXT_ITM].[Partition]        = [ITM].[Partition]
             AND [PRI_VND_EXT_ITM].[DataAreaID]       = [ITM].[DataAreaID]


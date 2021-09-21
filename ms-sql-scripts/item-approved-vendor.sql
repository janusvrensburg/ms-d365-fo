
-- ITEM APPROVED VENDOR
SELECT [ITM].[RecID]                                     AS [Item_Record_ID]
      ,[ITM].[DataAreaID]                                AS [Company_ID]

      ,NULLIF([ITM].[ItemID], '')                        AS [Item_Number]
      ,NULLIF([PRD].[SearchName], '')                    AS [Item_Search_Name]
      ,NULLIF([PRD_NME].[Name], '')                      AS [Item_Name]

      ,NULLIF([APR_VND_ITM].[PdsApprovedVendor], '')     AS [Approved_Vendor_ID]
      ,NULLIF([APR_VND_NME].[Name], '')                  AS [Approved_Vendor_Name]
      ,NULLIF([APR_VND_EXT_ITM].[ExternalItemTxt], '')   AS [Approved_Vendor_External_Item]

      ,[APR_VND_ITM].[ValidFrom]                         AS [Valid_From]
      ,[APR_VND_ITM].[ValidTo]                           AS [Valid_To]

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
  
       -- APPROVED VENDOR ITEM LOOKUP
       LEFT JOIN [dbo].[PdsApprovedVendorList] AS [APR_VND_ITM]
              ON [APR_VND_ITM].[ItemID]     = [ITM].[ItemID]
             AND [APR_VND_ITM].[Partition]  = [ITM].[Partition]
             AND [APR_VND_ITM].[DataAreaID] = [ITM].[DataAreaID]

       -- APPROVED VENDOR LOOKUP
       LEFT JOIN [dbo].[VendTable] AS [APR_VND]
              ON [APR_VND].[AccountNum] = [APR_VND_ITM].[PdsApprovedVendor]
             AND [APR_VND].[Partition]  = [APR_VND_ITM].[Partition]
             AND [APR_VND].[DataAreaID] = [APR_VND_ITM].[DataAreaID]

       -- APPROVED VENDOR (NAME) LOOKUP
       LEFT JOIN [dbo].[DirPartyTable] AS [APR_VND_NME]
              ON [APR_VND_NME].[RecID]     = [APR_VND].[Party]
             AND [APR_VND_NME].[Partition] = [APR_VND].[Partition]

       -- APPROVED VENDOR EXTERNAL ITEM LOOKUP
       LEFT JOIN [dbo].[CustVendExternalItem] AS [APR_VND_EXT_ITM]
              ON [APR_VND_EXT_ITM].[ItemID]           = [APR_VND_ITM].[ItemID]
             AND [APR_VND_EXT_ITM].[CustVendRelation] = [APR_VND_ITM].[PdsApprovedVendor]
             AND [APR_VND_EXT_ITM].[Partition]        = [APR_VND_ITM].[Partition]
             AND [APR_VND_EXT_ITM].[DataAreaID]       = [APR_VND_ITM].[DataAreaID]


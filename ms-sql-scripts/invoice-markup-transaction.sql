
-- Invoice Markup Transaction

    -- Returns Markup Transactions based on Invoice Headers (such as additional freight charges or sales tax)
    -- One Invoice Header can have multiple Markup Transactions
    -- Exchange Rate on Invoice Header can be used for Markup currency conversions
    -- Markup can be spread across Invoice Line Items (using the Invoice Line-Item Amount as the weight)

SELECT [INV_HDR].[DataAreaID]         AS [Company_ID]

      ,[MRK_TRN].[RecID]              AS [Markup_Record_ID]

      ,[INV_HDR].[RecID]              AS [Invoice_Record_ID]
      ,[INV_HDR].[InvoiceID]          AS [Invoice_Number]

      ,[MRK_TRN].[MarkupCode]         AS [Markup_Code]
      ,[MRK_TRN].[TXT]                AS [Markup_Description]

      ,[MRK_TRN].[CurrencyCode]       AS [Currency_Code]
      ,[INV_HDR].[ExchRate]           AS [Exchange_Rate]

      ,[MRK_TRN].[CalculatedAmount]   AS [Markup_Amount]

  FROM [dbo].[CustInvoiceJour] AS [INV_HDR] -- Invoice Header

       -- Markup Transaction Lookup (1:M)
       INNER JOIN [dbo].[MarkupTrans] AS [MRK_TRN]
               ON [MRK_TRN].[TransRecID]   = [INV_HDR].[RecID]
              AND [MRK_TRN].[Partition]    = [INV_HDR].[Partition]
              AND [MRK_TRN].[DataAreaID]   = [INV_HDR].[DataAreaID]
              AND [MRK_TRN].[TransTableID] = 239  -- Filter for Invoice Header Markups only

 ORDER BY [INV_HDR].[RecID] ASC
      ,[MRK_TRN].[RecID] ASC;


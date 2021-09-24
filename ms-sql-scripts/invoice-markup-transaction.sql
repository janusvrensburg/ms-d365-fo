
-- INVOICE MARKUP TRANSACTION
-- RETURNS MARKUPS BASED ON INVOICE HEADERS (SUCH AS ADDITIONAL FREIGHT CHARGES OR SALES TAX)
-- ONE INVOICE (HEADER) CAN HAVE MULTIPLE MARKUPS
-- EXCHANGE RATE ON INVOICE HEADER CAN BE USED FOR MARKUP CURRENCY CONVERSION
-- MARKUP CAN BE SPREAD ACROSS INVOICE LINE ITEMS FOR MORE GRANULAR DETAILS (USING INVOICE LINE ITEM AMOUNT)

SELECT [MRK_TRN].[RecID]              AS [Markup_Record_ID]

      ,[INV_HDR].[RecID]              AS [Invoice_Record_ID]
      ,[INV_HDR].[InvoiceID]          AS [Invoice_Number]

      ,[MRK_TRN].[MarkupCode]         AS [Markup_Code]
      ,[MRK_TRN].[TXT]                AS [Markup_Description]

      ,[MRK_TRN].[CurrencyCode]       AS [Currency_Code]
      ,[INV_HDR].[ExchRate]           AS [Exchange_Rate]
	  
      ,[MRK_TRN].[CalculatedAmount]   AS [Markup_Amount]

  FROM [dbo].[CustInvoiceJour] AS [INV_HDR] -- INVOICE HEADER
  
       -- MARKUP TRANSACTION LOOKUP (1:M)
       INNER JOIN [dbo].[MarkupTrans] AS [MRK_TRN]
               ON [MRK_TRN].[TransRecID]        = [INV_HDR].[RecID]
              AND [MRK_TRN].[Partition]         = [INV_HDR].[Partition]
              AND [MRK_TRN].[DataAreaID]        = [INV_HDR].[DataAreaID]
              AND [MRK_TRN].[TransTableID]      = 239  -- NEED TO FILTER FOR INVOICE MARKUPS ONLY

 ORDER BY [INV_HDR].[RecID] ASC
      ,[MRK_TRN].[RecID] ASC;


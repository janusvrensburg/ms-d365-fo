<!---------------------->
<!--- Page / Section --->
<!---------------------->

# Accounts Payable (AP)

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

## Vendor Transactions
   
<br />

``` SQL
SELECT [VND_TRN].[DataAreaId] AS [DataAreaId]
      ,[VND_TRN].[RecId] AS [VendorTransactionRecId]

      ,[VND_INV_JRN].[RecId] AS [VendorInvoiceJournalRecId]
      ,[VND].[RecId] AS [VendorRecId]
      ,[PUR].[RecId] AS [PurchaseOrderRecId]

      ,[VND_TRN].[Voucher] AS [Voucher]
      ,[VND_TRN].[TransType] AS [TransactionType]

      ,[VND_TRN].[DocumentDate] AS [InvoiceDate]
      ,[VND_TRN].[DueDate] AS [DueDate]
      ,[VND_TRN].[TransDate] AS [TransactionDate]
      ,[VND_TRN].[Closed] AS [ClosedDate]

      ,[VND_TRN].[CurrencyCode] AS [CurrencyCode]
      ,[VND_TRN].[AmountCur] AS [TransactionAmount]
      ,[VND_TRN].[SettleAmountCur] AS [SettlementAmount]

      ,([VND_TRN].[AmountCur] - [VND_TRN].[SettleAmountCur]) AS [PayableAmount]

  FROM [dbo].[VendTrans] AS [VND_TRN]

       LEFT JOIN [dbo].[VendTable] AS [VND]
              ON [VND].[AccountNum] = [VND_TRN].[AccountNum]
             AND [VND].[DataAreaId] = [VND_TRN].[DataAreaId]

       LEFT JOIN [dbo].[VendInvoiceJour] AS [VND_INV_JRN]
              ON [VND_INV_JRN].[InvoiceAccount] = [VND_TRN].[AccountNum]
             AND [VND_INV_JRN].[LedgerVoucher] = [VND_TRN].[Voucher]
             AND [VND_INV_JRN].[InvoiceId] = [VND_TRN].[Invoice]
             AND [VND_INV_JRN].[DataAreaId] = [VND_TRN].[DataAreaId]

       LEFT JOIN [dbo].[PurchTable] AS [PUR]
              ON [PUR].[PurchId] = [VND_INV_JRN].[PurchId]
             AND [PUR].[DataAreaId] = [VND_INV_JRN].[DataAreaId]
```

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

## Vendor Settlement
   
<br />

``` SQL
SELECT [VND_STL].[DataAreaId] AS [DataAreaId]
      ,[VND_STL].[RecId] AS [VendorSettlementRecId]

      ,[VND_TRN].[RecId] AS [VendorTransactionRecId]
      ,[VND_INV_JRN].[RecId] AS [VendorInvoiceJournalRecId]
      ,[VND].[RecId] AS [VendorRecId]
      ,[PUR].[RecId] AS [PurchaseOrderRecId]

      ,[VND_STL].[SettlementVoucher] AS [SettlementVoucher]
      ,[VND_STL].[TransType] AS [TransactionType]

      ,[VND_TRN].[DocumentDate] AS [InvoiceDate]
      ,[VND_STL].[DueDate] AS [DueDate]
      ,[VND_STL].[TransDate] AS [TransactionDate]

      ,[VND_TRN].[CurrencyCode] AS [CurrencyCode]
      ,[VND_STL].[SettleAmountCur] AS [SettlementAmount]

  FROM [dbo].[VendSettlement] AS [VND_STL]

       LEFT JOIN [dbo].[VendTable] AS [VND]
              ON [VND].[AccountNum] = [VND_STL].[AccountNum]
             AND [VND].[DataAreaId] = [VND_STL].[DataAreaId]

       LEFT JOIN [dbo].[VendTrans] AS [VND_TRN]
              ON [VND_TRN].[RecId] = [VND_STL].[TransRecId]
             AND [VND_TRN].[DataAreaId] = [VND_STL].[DataAreaId]

       LEFT JOIN [dbo].[VendInvoiceJour] AS [VND_INV_JRN]
              ON [VND_INV_JRN].[InvoiceAccount] = [VND_TRN].[AccountNum]
             AND [VND_INV_JRN].[LedgerVoucher] = [VND_TRN].[Voucher]
             AND [VND_INV_JRN].[InvoiceId] = [VND_TRN].[Invoice]
             AND [VND_INV_JRN].[DataAreaId] = [VND_TRN].[DataAreaId]

       LEFT JOIN [dbo].[PurchTable] AS [PUR]
              ON [PUR].[PurchId] = [VND_INV_JRN].[PurchId]
             AND [PUR].[DataAreaId] = [VND_INV_JRN].[DataAreaId]
```

<br />
<br />
<br />

<!---------------------->
<!--- Page / Section --->
<!---------------------->

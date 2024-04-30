<!---------------------->
<!--- Page / Section --->
<!---------------------->

# General Ledger (GL)

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

<!-- ## Data Model

<br /> 

<img src="https://raw.githubusercontent.com/janusvrensburg/ms-d365-fo/main/sql/accounts-payable/ap-data-model.drawio.svg">

<br /> 
<br /> 
<br /> -->

<!---------------------->
<!--- Page / Section --->
<!---------------------->



<div style="page-break-after: always"> 



<!---------------------->
<!--- Page / Section --->
<!---------------------->

## Main Account
   
<br />

``` SQL
SELECT [ACC].[RecId] AS [MainAccountRecId]
      ,[ACC].[MainAccountId] AS [MainAccountId]
      ,[ACC].[Name] AS [MainAccountName]
      ,[ACC].[Type] AS [AccountType]
      ,[ACC_CAT].[Description] AS [AccountCategory]
  FROM [AXDB].[dbo].[MainAccount] AS [ACC]

       LEFT JOIN [AXDB].[dbo].[MainAccountCategory] AS [ACC_CAT]
              ON [ACC_CAT].[AccountCategoryRef] = [ACC].[AccountCategoryRef]
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

## General Ledger Transactions
   
<br />

``` SQL
SELECT [CMP].[DataArea] AS [DataAreaId]
      ,[JRN_ENT].[SubledgerVoucherDataAreaId] AS [SubledgerVoucherDataAreaId]
      ,[JRN_ACC_ENT].[RecId] AS [GeneralJournalAccountEntryRecId]
      ,[JRN_ENT].[RecId] AS [GeneralJournalEntryRecId]
      ,[ACC].[RecId] AS [MainAccountRecId]

      ,[JRN_ACC_ENT].[LedgerAccount] AS [LedgerAccount]
      ,[JRN_ACC_ENT].[LedgerDimension] AS [LedgerDimension]
      ,[JRN_ENT].[JournalCategory] AS [JournalCategory]
      ,[JRN_ENT].[JournalNumber] AS [JournalNumber]
      ,[JRN_ENT].[SubledgerVoucher] AS [Voucher]
      ,[JRN_ACC_ENT].[PostingType] AS [PostingType]

      ,CONVERT(DATE, [JRN_ENT].[AccountingDate]) AS [TransactionDate]

      ,[JRN_ACC_ENT].[TransactionCurrencyCode] AS [TransactionCurrencyCode]
      ,[JRN_ACC_ENT].[TransactionCurrencyAmount] AS [TransactionCurrencyAmount]
      ,[JRN_ACC_ENT].[AccountingCurrencyAmount] AS [AccountingCurrencyAmount]
      ,[JRN_ACC_ENT].[ReportingCurrencyAmount] AS [ReportingCurrencyAmount]

  FROM [AXDB].[dbo].[GeneralJournalAccountEntry] AS [JRN_ACC_ENT]

       INNER JOIN [AXDB].[dbo].[GeneralJournalEntry] AS [JRN_ENT]
               ON [JRN_ENT].[RecId] = [JRN_ACC_ENT].[GeneralJournalEntry]

       INNER JOIN [AXDB].[dbo].[MainAccount] AS [ACC]
               ON [ACC].[RecId] = [JRN_ACC_ENT].[MainAccount]

       INNER JOIN [AXDB].[dbo].[Ledger] AS [LGR]
               ON [LGR].[RecId] = [JRN_ENT].[Ledger]

       INNER JOIN [AXDB].[dbo].[CompanyInfo] AS [CMP]
               ON [CMP].[RecId] = [LGR].[PrimaryForLegalEntity]
```

<br />
<br />
<br />

<!---------------------->
<!--- Page / Section --->
<!---------------------->

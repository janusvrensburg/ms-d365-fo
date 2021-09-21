
-- CUSTOMERS
SELECT [CUS].[DataAreaID]                        AS [Company_ID]

      ,[CUS].[AccountNum]                        AS [Customer_ID]
      ,NULLIF([CUS_NME].[Name], '')              AS [Customer_Name]

      ,NULLIF([CUS].[CustGroup], '')             AS [Customer_Group_ID]
      ,NULLIF([CUS_GRP].[Name], '')              AS [Customer_Group]

      ,NULLIF([CUS].[CommissionGroup], '')       AS [Commission_Group_ID]
      ,NULLIF([CUS_COM_GRP].[Name], '')          AS [Commission_Group_Name]

      ,NULLIF([CUS].[SalesDistrictID], '')       AS [Sales_District_ID]
      ,NULLIF([CUS_SLE_DIS].[Description], '')   AS [Sales_District_Name]

      ,NULLIF([CUS].[SalesPoolID], '')           AS [Sales_Pool_ID]
      ,NULLIF([CUS_SLE_SPL].[Name], '')          AS [Sales_Pool_Name]

      ,NULLIF([CUS].[PaymTermID], '')            AS [Payment_Term_ID]
      ,NULLIF([CUS_PAY_TRM].[Description], '')   AS [Payment_Term_Name]

      ,NULLIF([CUS].[DlvMode], '')               AS [Delivery_Mode_ID]
      ,NULLIF([CUS_DEL_MDE].[TXT], '')           AS [Delivery_Mode_Name]

      ,NULLIF([CUS_EMP_RES_NME].[Name], '')      AS [Employee_Responsible]
      
      ,NULLIF([CUS].[CreditMax], 0.00)           AS [Credit_Limit]

  FROM [dbo].[CustTableStaging] AS [CUS]

       -- CUSTOMER NAME LOOKUP
       LEFT JOIN [dbo].[DirPartyTable] AS [CUS_NME]
              ON [CUS_NME].[RecID]     = [CUS].[Party]
             AND [CUS_NME].[Partition] = [CUS].[Partition]

       -- CUSTOMER SALES POOL LOOKUP
       LEFT JOIN [dbo].[SalesPool] AS [CUS_SLE_SPL]
              ON [CUS_SLE_SPL].[SalesPoolID] = [CUS].[SalesPoolID]
             AND [CUS_SLE_SPL].[Partition]   = [CUS].[Partition]
             AND [CUS_SLE_SPL].[DataAreaID]  = [CUS].[DataAreaID]

       -- CUSTOMER EMPLOYEE RESPONSIBLE LOOKUP
       LEFT JOIN [dbo].[HcmWorker] AS [CUS_EMP_RES]
              ON [CUS_EMP_RES].[RecID]     = [CUS].[MainContactWorker]
             AND [CUS_EMP_RES].[Partition] = [CUS].[Partition]

       -- CUSTOMER EMPLOYEE RESPONSIBLE (NAME) LOOKUP
       LEFT JOIN [dbo].[DirPartyTable] AS [CUS_EMP_RES_NME]
              ON [CUS_EMP_RES_NME].[RecID]     = [CUS_EMP_RES].[Person]
             AND [CUS_EMP_RES_NME].[Partition] = [CUS].[Partition]

       -- CUSTOMER DELIVERY MODE LOOKUP
       LEFT JOIN [dbo].[DlvMode] AS [CUS_DEL_MDE]
              ON [CUS_DEL_MDE].[Code]       = [CUS].[DlvMode]
             AND [CUS_DEL_MDE].[Partition]  = [CUS].[Partition]
             AND [CUS_DEL_MDE].[DataAreaID] = [CUS].[DataAreaID]

       -- CUSTOMER PAYMENT TERM LOOKUP
       LEFT JOIN [dbo].[PaymTerm] AS [CUS_PAY_TRM]
              ON [CUS_PAY_TRM].[PaymTermID] = [CUS].[PaymTermID]
             AND [CUS_PAY_TRM].[Partition]  = [CUS].[Partition]
             AND [CUS_PAY_TRM].[DataAreaID] = [CUS].[DataAreaID]

       -- CUSTOMER GROUP LOOKUP
       LEFT JOIN [dbo].[CustGroup] AS [CUS_GRP]
              ON [CUS_GRP].[CustGroup]  = [CUS].[CustGroup]
             AND [CUS_GRP].[Partition]  = [CUS].[Partition]
             AND [CUS_GRP].[DataAreaID] = [CUS].[DataAreaID]

       -- CUSTOMER COMMISSION GROUP LOOKUP
       LEFT JOIN [dbo].[CommissionCustomerGroup] AS [CUS_COM_GRP]
              ON [CUS_COM_GRP].[GroupID]    = [CUS].[CommissionGroup]
             AND [CUS_COM_GRP].[Partition]  = [CUS].[Partition]
             AND [CUS_COM_GRP].[DataAreaID] = [CUS].[DataAreaID]

       -- CUSTOMER SALES DISTRICT LOOKUP
       LEFT JOIN [dbo].[smmBusRelSalesDistrictGroup] AS [CUS_SLE_DIS]
              ON [CUS_SLE_DIS].[SalesDistrictID] = [CUS].[SalesDistrictID]
             AND [CUS_SLE_DIS].[Partition]       = [CUS].[Partition]
             AND [CUS_SLE_DIS].[DataAreaID]      = [CUS].[DataAreaID];

GO


<!---------------------->
<!--- Page / Section --->
<!---------------------->

# Production Planning

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
SELECT TOP 100 [PT].*
  FROM [dbo].[ReqTrans] AS [PT] 

       LEFT JOIN [dbo].[ReqPO] AS [PO] 
              ON [PT].[RefId] = [PO].[RefId]
             AND [PT].[RefType] = [PO].[RefType] 
             AND [PT].[PlanVersion] = [PO].[PlanVersion] 
             AND [PT].[DataAreaId] = [PO].[DataAreaId]
```

<br />
<br />
<br />

<!---------------------->
<!--- Page / Section --->
<!---------------------->

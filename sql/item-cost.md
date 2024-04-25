<!---------------------->
<!--- Page / Section --->
<!---------------------->

# Item Cost

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

## Item Cost
   
<br />

``` SQL
SELECT [ITM_MOD].[DataAreaId]
      ,[ITM_MOD].[ItemId]
      ,[ITM_MOD].[ModuleType]
      ,[ITM_MOD].[PriceDate]
      ,[ITM_MOD].[Price]
  FROM [dbo].[InventTableModule] AS [ITM_MOD]
```

<br />

```
| DataAreaId | ItemId  | ModuleType | PriceDate | Price |
| ---------- | ------- | ---------- | --------- | ----- |
| LE01       | ITM0001 | Sales      | 01-Jan    | 5.00  |
| LE01       | ITM0001 | Sales      | 23-Mar    | 5.50  |
| LE01       | ITM0001 | Inventory  | 01-Jan    | 5.00  |
| LE01       | ITM0001 | Purchase   | 01-Jan    | 4.80  |
```

<br />
<br />
<br />

<!---------------------->
<!--- Page / Section --->
<!---------------------->

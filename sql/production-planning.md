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



<div style="page-break-after: always"> 



<!---------------------->
<!--- Page / Section --->
<!---------------------->

## Draft
 
 
   
<br />

``` DBML

// https://dbdiagram.io/d/






TABLE "InventTable" [Note: "Item Master"]
{
"DataAreaId" Varchar
"RecId" BigInt [PK]
"Product" BigInt
"ItemId" Varchar [Note: "Item Number"]
"PrimaryVendorId" Varchar
"ItemBuyerGroupId" Varchar
"ItemType" "ItemType" 
}

    ENUM "ItemType"
    {
    "Item"
    "Service"
    }



TABLE "EcoResProduct" [Note: "Product Master"]
{
"DataAreaId" Varchar
"RecId" BigInt [PK]
}



TABLE "EcoResProductTranslation" [Note: "Product Name Lookup"]
{
"DataAreaId" Varchar
"RecId" BigInt [PK]
"Product" BigInt
"LanguageId" Varchar
"Name" Varchar [Note: "Product Name"]
}


TABLE "VendTable" [Note: "Vendor Master"]
{
"DataAreaId" Varchar
"RecId" BigInt [PK]
"Party" BigInt
"AccountNum" Varchar
}


TABLE "DirPartyTable" [Note: "Vendor Name Lookup"]
{
"DataAreaId" Varchar
"RecId" BigInt [PK]
"PartyNumber" Varchar
"LanguageId" Varchar
"Name" Varchar [Note: "Primary Vendor Name"]
}



TABLE "ReqPlan" [Note: "Requirements Plan"]
{
"DataAreaId" Varchar
"RecId" BigInt [PK]
"ReqPlanId" Varchar
"Name" Varchar [Note: "Plan Name"]
"PlanType" "PlanType"
}


    ENUM "PlanType"
    {
    "Scheduled Plan"
    "Forecast Plan"
    }


Ref: "InventTable"."Product" - "EcoResProduct"."RecId"
Ref: "EcoResProduct"."RecId" - "EcoResProductTranslation"."Product"
Ref: "InventTable"."PrimaryVendorId" - "VendTable"."AccountNum"
Ref: "VendTable"."Party" - "DirPartyTable"."RecId"
```

<br />
<br />
<br />

<!---------------------->
<!--- Page / Section --->
<!---------------------->














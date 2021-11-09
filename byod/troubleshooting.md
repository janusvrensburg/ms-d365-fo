# BYOD Troubleshooting



<br />
<br />
<br />

<!--- Page Break --->
<div style="page-break-after: always"> 
<!--- Page Break --->



## Configuration Keys

<br />

**Error Message:**

<br />

```
Unable to determine default value for column
The column might be assigned a disabled configuration key. Please remove this column from the project mapping.
```

<br />

**Description:**

Data entity cannot be exported due to disabled configuration key assigned to field within the specific data entity. The field can be removed from the mapping (therefore the field will be excluded from the export) or configuration key needs to be reenabled on the field.

<br />

**External Resources:**

- [Configuration Keys and Data Entities (Microsoft Docs)](https://docs.microsoft.com/en-us/dynamics365/fin-ops-core/dev-itpro/data-entities/config-key-entities)
- [Effect of Disabling a Table or Column (Microsoft Docs)](https://docs.microsoft.com/en-us/dynamicsax-2012/developer/effect-of-disabling-a-table-or-column)



<br />
<br />
<br />

<!--- Page Break --->
<div style="page-break-after: always"> 
<!--- Page Break --->



## Change Tracking

<br />

**Error Message:**

<br />

```
Cannot select a record in  ().
The SQL database has issued an error.
Object Server Azure:
[Microsoft][ODBC Driver 17 for SQL Server][SQL Server]Change tracking is not enabled on table
```

<br />

**Description:**

Data Entity cannot be exported because Change Tracking is not enabled. Change Tracking needs to be enabled to export Data Entities incrementally. Change Tracking does not need to be enabled on Data Entities that are exported in full. Ensure that the specific Data Entity is published, then enable Change Tracking. If the Data Entity is published and states that Change Tracking is already enabled; disable the Change Tracking and reenable again.

<br />

**External Resources:**

- [Enable Change Tracking for Entities (Microsoft Docs)](https://docs.microsoft.com/en-us/dynamics365/fin-ops-core/dev-itpro/data-entities/entity-change-track)


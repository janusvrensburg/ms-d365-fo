# BYOD Troubleshooting



<br />
<br />
<br />

<!--- Page Break --->
<div style="page-break-after: always"> 
<!--- Page Break --->



## Configuration Keys

<br />

### Symptom

The following error message is raised on the Batch Export execution log:

```
Unable to determine default value for column
The column might be assigned a disabled configuration key. Please remove this column from the project mapping.
```

<br />

### Root Cause

Data Entity cannot be exported due to disabled configuration key assigned to field within the specific Data Entity.

<br />

### Resolution

There are two options:

1. The field can be removed from the mapping (therefore the field will be excluded from the export)
2. Configuration key needs to be reenabled on the field (therefore the field will be included in the export)

<br />

### External Resources

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

### Symptom

The following error message is raised on the Batch Export execution log:

```
Cannot select a record in  ().
The SQL database has issued an error.
Object Server Azure:
[Microsoft][ODBC Driver 17 for SQL Server][SQL Server]Change tracking is not enabled on table
```

<br />

### Root Cause

Data Entity cannot be exported because Change Tracking is not enabled; Change Tracking needs to be enabled to export Data Entities incrementally. Please note that Change Tracking does not need to be enabled on Data Entities that are exported in full.

<br />

### Resolution

Ensure that the specific Data Entity is published, then enable Change Tracking. If the Data Entity is published and states that Change Tracking is already enabled; disable the Change Tracking and reenable again. If the problem still persists - Disable the Change Tracking, drop the Data Entity, republish and reenable Change Tracking.

<br />

### External Resources

- [Enable Change Tracking for Entities (Microsoft Docs)](https://docs.microsoft.com/en-us/dynamics365/fin-ops-core/dev-itpro/data-entities/entity-change-track)

<br />
<br />
<br />

<!--- Page Break --->
<div style="page-break-after: always"> 
<!--- Page Break --->



## Data Encryption Certificate

<br />

### Symptom

The following error message is raised on the Batch Export execution log:

```
The required data encryption certificate was not found when trying to edit the Source data formats table 
and the EntityStoreConnectionString field.
Please add a valid certificate. 
Microsoft.Dynamics.Ax.Xpp.Security.CryptoEncryptionException: Encryption error occurred with exception:
Microsoft.Dynamics.AX.Configuration.CertificateHandler.NoCertificateFoundException: No certificate found for id.
```

<br />

### Root Cause

The connection to the Entity Export Database cannot be established.

<br />

### Resolution

Navigate to **Data Management** under the **System Administration** module, and select **Configure Entity Export to Database**. Select the appropriate source and validate the connection string.

Below is a sample connection string that can be used:

```
Data Source=;Initial Catalog=;Integrated Security=False;User ID=;Password=;TrustServerCertificate=False;
```

<br />

### External Resources

- [Bring Your Own Database (Microsoft Docs)](https://docs.microsoft.com/en-us/dynamics365/fin-ops-core/dev-itpro/analytics/export-entities-to-your-own-database)

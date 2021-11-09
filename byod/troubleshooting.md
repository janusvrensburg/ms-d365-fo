# BYOD Troubleshooting

<br />

## Configuration Keys

<br />

**Error Message:**

<br />

```
Unable to determine default value for column (x)
The column might be assigned a disabled configuration key. Please remove this column from the project mapping.
```

<br />

**Description:**

Data entity cannot be exported due to disabled configuration key assigned to field within the specific data entity. The field can be removed from the mapping (therefore the field will be excluded from the export) or configuration key needs to be reenabled on the field.

<br />

**External Resources:**

- [Configuration Keys and Data Entities (Microsoft Docs)](https://docs.microsoft.com/en-us/dynamics365/fin-ops-core/dev-itpro/data-entities/config-key-entities)
- [Effect of Disabling a Table or Column (Microsoft Docs)](https://docs.microsoft.com/en-us/dynamicsax-2012/developer/effect-of-disabling-a-table-or-column)

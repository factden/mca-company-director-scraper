# Data dictionary

The Actor writes to a **default** dataset plus typed **Companies**, **Directors**, and **Director Leads** views.
Most fields below are public corporate-registry data. The director `email` and `phone` are personal contact
data, fetched only as a paid enrichment and subject to the DPDP Act, 2023 (see the store listing for details).

## Companies

| Field | Type | Description |
|---|---|---|
| `rowType` | string | Always `"company"` |
| `cin` | string | Corporate Identification Number (the company's unique registry ID) |
| `name` | string | Registered legal name |
| `status` | string | Registry status (e.g. `Active`, `Strike Off`, `Amalgamated`) |
| `companyType` | string | Class read from the CIN (Private, Public, OPC, etc.) |
| `companyCategory` | string | Company category / sub-category |
| `listed` | boolean | Whether the company is listed (first CIN character `L`) |
| `companyEmail` | string | The company's on-record public email |
| `dateOfIncorporation` | string | Incorporation date (MM/DD/YYYY) |
| `industryDescription` | string | NIC industry description |
| `mainDivision` | string | 2-digit NIC division code |
| `state` | string | Registered state / UT |
| `roc` | string | Registrar of Companies office |
| `authorisedCapital` | string | Authorised share capital |
| `paidUpCapital` | string | Paid-up share capital |
| `lastAgmDate` | string | Date of last AGM |
| `registeredAddress` | object | Registered-office address (street, city, state, PIN, country) |
| `filings` | array | 3-year balance-sheet & annual-return filing dates (when available) |
| `boardSize` | integer | Number of directors on the board |
| `smallCompany` | boolean | Small-company flag |
| `underCIRP` | boolean | Under Corporate Insolvency Resolution Process |
| `annualReturnDefaulter` | boolean | Annual-return default flag |
| `balanceSheetDefaulter` | boolean | Balance-sheet default flag |
| `retrievedAt` | string | ISO timestamp of retrieval |

## Directors

| Field | Type | Description |
|---|---|---|
| `rowType` | string | Always `"director"` |
| `din` | string | Director Identification Number (8-digit) |
| `name` | string | Director's full name |
| `status` | string | DIN status (e.g. `Approved`) |
| `disqualified` | boolean | Disqualification flag |
| `dob` | string | Date of birth (as published) |
| `gender` | string | Gender (as published) |
| `nationality` | string | Nationality |
| `educationalQualification` | string | Educational qualification (when available) |
| `email` | string | Director's personal email as registered with MCA (DIN / DIR-3 KYC). Paid contact enrichment; empty when not fetched or not on file |
| `phone` | string | Director's personal phone as registered with MCA (DIN / DIR-3 KYC). Paid contact enrichment; empty when not fetched or not on file |
| `directorshipCount` | integer | Number of companies the person directs |
| `directorships` | array | The directorship network, one entry per company |

Each `directorships[]` entry: `cin`, `company`, `designation`, `role`, `effectiveDate`, `cessationDate`, `active`.

## Director Leads

The **Director Leads** view is the `Directors` data unwound to **one row per directorship** (director identity +
per-company columns), for a flat, CRM-ready table. Columns: `din`, `name`, `cin`, `company`, `designation`,
`role`, `email`, `phone`, `effectiveDate`, `cessationDate`, `active`, `gender`, `dob`, `nationality`,
`status`, `disqualified`, `directorshipCount`.

# MCA India Company & Director Data Scraper — CIN, DIN & B2B registry data

[![Run on Apify](https://img.shields.io/badge/Run%20on-Apify-2bd17e?logo=apify&logoColor=white)](https://apify.com/factden/mca-company-director-scraper?fpr=factden)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

Pull **India MCA (Ministry of Corporate Affairs)** company and director data at scale — company master records,
the full board, directorships, capital, filings, incorporation date, status, and the company's on-record public
email — by **CIN, DIN, company name, or industry + state**. Clean JSON/CSV, **no login, no API key**.

This repo is the **open documentation** for the hosted
**[MCA India Company & Director Data Scraper](https://apify.com/factden/mca-company-director-scraper?fpr=factden)**
on Apify — field dictionary, how-to guide, copy-paste input examples, and Python / Node / cURL snippets. The
scraper runs as a managed Actor on Apify (nothing to install or maintain).

<p align="center">
  <a href="https://apify.com/factden/mca-company-director-scraper?fpr=factden">
    <img src="https://raw.githubusercontent.com/factden/apify-actor-assets/main/mca-company-director-scraper/02-companies-overview.png"
         width="900"
         alt="MCA India Company Data Scraper output — table of companies with CIN, name, status, type, industry, state, capital, and incorporation date">
  </a>
</p>

## Why this one

- 🏆 **Search by industry + state** — pick a sector (NIC-mapped) and a state to discover the whole segment, not
  just one CIN at a time.
- 🏆 **Company + director graph** — company master record, the full board, and each director's complete
  directorship network.
- 🏆 **Registry firmographics** — status, type, capital, ROC, addresses, and 3-year filing history.
- 🏆 **No-setup** — no portal login, no API key, no CAPTCHA handling.

## 30-second start

1. Open the **[Actor on Apify](https://apify.com/factden/mca-company-director-scraper?fpr=factden)** and click **Try for free**.
2. Pick a mode (**Companies** or **Directors**), enter CINs/DINs or a name, or choose an **industry + state**.
3. Download results as **JSON / CSV / Excel**, or pull them via the [Apify API](https://docs.apify.com/api/v2).

New Apify accounts get a **$5 free credit** on the first run.

## Documentation in this repo

| File | What's in it |
|---|---|
| **[FIELDS.md](FIELDS.md)** | Full data dictionary — every Companies and Directors field, with types |
| **[HOWTO.md](HOWTO.md)** | How to scrape MCA data: by CIN/DIN, by name, by industry + state, and on a schedule |
| **[examples/](examples/)** | Copy-paste input configs + illustrative output rows (JSON + CSV) |
| **[snippets/](snippets/)** | Run the Actor from Python, Node.js, or cURL via the public Apify API |

## Output at a glance

Typed **Companies**, **Directors**, and **Director Leads** datasets. See **[FIELDS.md](FIELDS.md)** for the full
schema and **[examples/](examples/)** for complete sample rows.

```jsonc
// Companies (one row per company)
{ "cin": "U63999MH2024PTC431654", "name": "CRESTFORT TECHNOLOGIES PRIVATE LIMITED",
  "status": "Active", "companyType": "Company", "companyEmail": "contact@example.com",
  "dateOfIncorporation": "08/31/2024", "state": "MH",
  "authorisedCapital": "1000000", "paidUpCapital": "536260", "boardSize": 2 }

// Directors (one row per director, directorships nested)
{ "din": "09397486", "name": "KARAN NEERAJKUMAR MEHRA", "status": "Approved",
  "directorshipCount": 4, "directorships": [ { "cin": "…", "company": "…", "designation": "Director" } ] }
```

## Use cases

- **B2B lead lists** by industry + state, with authoritative firmographics.
- **KYB / due diligence** — status, directors, capital, and filing history in one call.
- **Directorship-network mapping** for investors and researchers.
- **CRM enrichment** from the system-of-record registry.

## Compliance

This actor reads public corporate-registry data for legitimate business use. You are responsible for using the
results in compliance with applicable data-protection law, including **India's DPDP Act, 2023**, and for having a
lawful basis for any personal data you process.

## Other FactDen scrapers

- **[Indeed Jobs Scraper](https://apify.com/factden/indeed-jobs-scraper?fpr=factden)** ([docs](https://github.com/factden/indeed-jobs-scraper)) — jobs with salaries + free company profiles
- **[G2 Reviews Scraper](https://apify.com/factden/g2-reviews-scraper?fpr=factden)** ([docs](https://github.com/factden/g2-reviews-scraper)) — B2B software reviews
- **[All FactDen actors →](https://apify.com/factden?fpr=factden)**

## License

MIT © 2026 FactDen. See [LICENSE](LICENSE).

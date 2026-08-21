# MCA India Company & Director Data Scraper: CIN, DIN & B2B registry data

[![Run on Apify](https://img.shields.io/badge/Run%20on-Apify-2bd17e?logo=apify&logoColor=white)](https://apify.com/factden/mca-company-director-scraper?fpr=factden)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

Pull **India MCA (Ministry of Corporate Affairs)** company and director data at scale: company master records,
the full board, directorships, capital, filings, incorporation date, status, and the company's on-record public
email, by **CIN, DIN, company name, or industry + state**. Directors mode adds each person's personal email and
phone as an optional paid enrichment. Clean JSON/CSV, **no login, no API key**.

This repo is the **open documentation** for the hosted
**[MCA India Company & Director Data Scraper](https://apify.com/factden/mca-company-director-scraper?fpr=factden)**
on Apify: field dictionary, how-to guide, copy-paste input examples, and Python / Node / cURL snippets. The
scraper runs as a managed Actor on Apify (nothing to install or maintain).

**Watch the walkthrough:**

[![Watch: how to scrape India MCA company and director data with email and phone, no code](https://img.youtube.com/vi/PhZmoVHMjTE/maxresdefault.jpg)](https://www.youtube.com/watch?v=PhZmoVHMjTE)

<p align="center">
  <a href="https://apify.com/factden/mca-company-director-scraper?fpr=factden">
    <img src="https://raw.githubusercontent.com/factden/apify-actor-assets/main/mca-company-director-scraper/04-director-contacts.png"
         width="900"
         alt="MCA India director contacts output table with DIN, name, gender, DOB, personal email, phone, and directorship count for a company board">
  </a>
</p>

## Why this one

- 🏆 **Search by industry + state:** pick a sector (NIC-mapped) and a state to discover the whole segment, not
  just one CIN at a time.
- 🏆 **Company + director graph:** company master record, the full board, and each director's complete
  directorship network.
- 🏆 **Director contacts:** each director's personal email and phone, as registered with MCA on their DIN /
  DIR-3 KYC record, as an opt-in paid enrichment. **Charged once per unique director (DIN), and only when a
  contact is actually found**, never per row.
- 🏆 **Registry firmographics:** status, type, capital, ROC, addresses, and 3-year filing history.
- 🏆 **No setup:** no portal login, no API key, no CAPTCHA handling.

## 30-second start

1. Open the **[Actor on Apify](https://apify.com/factden/mca-company-director-scraper?fpr=factden)** and click **Try for free**.
2. Pick a mode (**Companies** or **Directors**), enter CINs/DINs or a name, or choose an **industry + state**.
3. Download results as **JSON / CSV / Excel**, or pull them via the [Apify API](https://docs.apify.com/api/v2).

New Apify accounts get a **$5 free credit** on the first run.

In **Companies** mode you can search by **company name** (here, all `Tata` IT companies in Maharashtra), by
exact CIN, or by industry, and narrow it with state, status, type, and listing filters:

<p align="center">
  <img src="https://raw.githubusercontent.com/factden/apify-actor-assets/main/mca-company-director-scraper/01-input-company.png"
       width="900"
       alt="Company search by name (Tata) with industry (IT and Software), state (Maharashtra) and status (Active) filters, plus board and director-contacts toggles">
</p>

In **Directors** mode you search by **director name** (here, `Nandan Nilekani`) or exact DIN, optionally scoped
to a company, and every match returns as a full lead (profile, directorship network, and personal email and
phone when on file):

<p align="center">
  <img src="https://raw.githubusercontent.com/factden/apify-actor-assets/main/mca-company-director-scraper/02-input-director.png"
       width="900"
       alt="Director search by name (Nandan Nilekani) with DINs, at-company scope, director companies toggle, and max directors">
</p>

## Documentation in this repo

| File | What's in it |
|---|---|
| **[FIELDS.md](FIELDS.md)** | Full data dictionary: every Companies and Directors field, with types |
| **[HOWTO.md](HOWTO.md)** | How to scrape MCA data: by CIN/DIN, by name, by industry + state, and on a schedule |
| **[examples/](examples/)** | Copy-paste input configs plus illustrative output rows (JSON + CSV) |
| **[snippets/](snippets/)** | Run the Actor from Python, Node.js, or cURL via the public Apify API |

## Output at a glance

Typed **Companies**, **Directors**, and **Director Leads** datasets. See **[FIELDS.md](FIELDS.md)** for the full
schema and **[examples/](examples/)** for complete sample rows.

The **Companies** dataset gives you the full firmographic record per company: CIN, name, status, incorporation
date, state, class, industry, on-record company email, board size, capital, ROC, and compliance flags.

<p align="center">
  <img src="https://raw.githubusercontent.com/factden/apify-actor-assets/main/mca-company-director-scraper/03-company-output.png"
       width="900"
       alt="Companies output table with CIN, name, status, incorporation date, state, class, industry, company email, board size, and capital (email blurred for privacy)">
</p>

```jsonc
// Companies (one row per company)
{ "cin": "U63999MH2024PTC431654", "name": "CRESTFORT TECHNOLOGIES PRIVATE LIMITED",
  "status": "Active", "companyType": "Company", "companyEmail": "contact@example.com",
  "dateOfIncorporation": "08/31/2024", "state": "MH",
  "authorisedCapital": "1000000", "paidUpCapital": "536260", "boardSize": 2 }

// Directors (one row per director; directorships nested. email + phone are the director's
// personal contact as registered with MCA, populated only when the contact enrichment is on.
// The values below are dummy examples.)
{
  "din": "09397486",
  "name": "ANANYA SHARMA",
  "status": "Approved",
  "dob": "1988-04-12",
  "gender": "FEMALE",
  "nationality": "INDIA",
  "educationalQualification": "GRADUATE",
  "email": "ananya.sharma@example.com",   // dummy
  "phone": "+919876543210",               // dummy
  "directorshipCount": 3,
  "directorships": [
    { "cin": "U62099KA2024PTC100001", "companyName": "EXAMPLE LABS PRIVATE LIMITED",
      "designation": "Director", "role": "Director/Designated Partner",
      "effectiveDate": "2021-06-14", "active": true },
    { "cin": "U72200MH2019PTC200002", "companyName": "SAMPLE ANALYTICS PRIVATE LIMITED",
      "designation": "Managing Director", "role": "Director", "effectiveDate": "2019-02-01",
      "active": true }
  ]
}
```

The **Directorships by company** view unwinds each director into one row per company they sit on, so you can
see the whole board-level network at a glance (contact values below are blurred for privacy in this preview):

<p align="center">
  <img src="https://raw.githubusercontent.com/factden/apify-actor-assets/main/mca-company-director-scraper/05-directorships-by-company.png"
       width="900"
       alt="MCA director directorships unwound to one row per company, with DIN, name, email, phone, company name, CIN, designation, and role">
</p>

## Use cases

- **B2B lead lists** by industry + state, with authoritative firmographics.
- **KYB / due diligence:** status, directors, capital, and filing history in one call.
- **Directorship-network mapping** for investors and researchers.
- **CRM enrichment** from the system-of-record registry.

## Compliance

This actor reads public corporate-registry data for legitimate business use. The optional director contact
enrichment (email and phone) returns personal data. You are responsible for using the results in compliance
with applicable data-protection law, including **India's DPDP Act, 2023**, and for having a lawful basis for
any personal data you process.

Director search is a paid-plan feature. On the free plan you still get full company records and board rosters
(director names and DINs) with the on-record company email redacted (`*****@domain`); upgrade to a paid Apify plan
to search directors by DIN or name and unlock their email and phone.

## Other FactDen scrapers

- [Booking.com Scraper](https://apify.com/factden/booking-com-scraper?fpr=factden) - hotels, live prices, per-room rates, availability & occupancy, and guest reviews across a whole city or one hotel ([docs](https://github.com/factden/booking-com-scraper))
- **[Indeed Jobs Scraper](https://apify.com/factden/indeed-jobs-scraper?fpr=factden)** ([docs](https://github.com/factden/indeed-jobs-scraper)), jobs with salaries plus free company profiles
- **[G2 Reviews Scraper](https://apify.com/factden/g2-reviews-scraper?fpr=factden)** ([docs](https://github.com/factden/g2-reviews-scraper)), B2B software reviews
- **[All FactDen actors](https://apify.com/factden?fpr=factden)**

## License

MIT © 2026 FactDen. See [LICENSE](LICENSE).

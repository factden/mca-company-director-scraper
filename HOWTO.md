# How to scrape MCA India company & director data

A practical guide to the hosted
**[MCA India Company & Director Data Scraper](https://apify.com/factden/mca-company-director-scraper?fpr=factden)**.

## 1. Look up exact companies (by CIN)

Set **mode = Companies** and paste one or more **CINs** (e.g. `U63999MH2024PTC431654`). Each returns that exact
company's master record. Toggle **Include board** to also get its directors. Pasted CINs bypass the filters.

## 2. Search by company name

Enter a **company name**. It's a **prefix match on the registered legal name**, so enter the name as filed with
MCA (not a brand/trade name). Narrow with the **state**, **status**, **type**, and **listed** filters.

## 3. Discover a whole sector (industry + state)

Pick one or more **industries** (mapped to NIC codes) and, optionally, one or more **states**. The Actor
discovers matching companies across the registry and applies your status/type/listed filters. Combine an
industry with a company name to **intersect** the two. Use **Max companies** to cap the run.

## 4. Look up directors (by DIN or name)

Set **mode = Directors**. Paste exact **DINs**, or search by **director name** (prefix match, first→middle→last).
For a common name, add **…at company** to keep only the person who sits on a company matching that text. Each
director returns their profile, their full **directorship network**, and, as a paid enrichment, their personal
**email and phone** when on file (billed only when a contact is found).

## 5. Export & integrate

Download the dataset as **JSON, CSV, Excel, or HTML**, or pull it from the [Apify API](https://docs.apify.com/api/v2).
See [snippets/](snippets/) for Python / Node / cURL.

## 6. Run on a schedule

Use Apify **Schedules** to re-run a search daily/weekly and diff the output: new incorporations in a sector,
status changes, and fresh directorships. Push the delta to your CRM, a webhook, or a Google Sheet via Apify
integrations.

## Notes

- Name search is a **prefix** on the registered name; use the CIN/DIN for exact lookups.
- Some fields (e.g. NIC industry code) are inconsistently populated at source.
- The registry applies a fair-use limit on master-data reads; large runs are paced, and if the upstream limit
  is hit the run ends with a re-run status (partial results are still delivered).

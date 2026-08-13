# Examples

Copy-paste input configs and illustrative output rows for the
**[MCA India Company & Director Data Scraper](https://apify.com/factden/mca-company-director-scraper?fpr=factden)**.

## Input configs

| File | What it does |
|---|---|
| [`company-cin.input.json`](company-cin.input.json) | Look up exact companies by CIN (+ their board) |
| [`industry-state.input.json`](industry-state.input.json) | Discover a sector in a state (industry + state) |
| [`director-name.input.json`](director-name.input.json) | Search directors by name, narrowed to a company |

## Sample output

| File | What it is |
|---|---|
| [`company.sample.json`](company.sample.json) | One Companies row |
| [`director.sample.json`](director.sample.json) | One Directors row (directorships nested) |
| [`companies.sample.csv`](companies.sample.csv) | A few Companies rows as CSV |

Paste an input config into the Actor's **Input** tab (JSON view), or pass it as the run input via the
[Apify API](https://docs.apify.com/api/v2) — see [../snippets/](../snippets/).

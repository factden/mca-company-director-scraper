"""Run the MCA India Company & Director Data Scraper via the Apify API (Python).

Actor: https://apify.com/factden/mca-company-director-scraper
Docs:  https://docs.apify.com/api/v2

    pip install apify-client
"""
from apify_client import ApifyClient

client = ApifyClient("<YOUR_APIFY_TOKEN>")

run_input = {
    "mode": "company",
    "industries": ["it_software"],
    "states": ["Karnataka"],
    "companyStatuses": ["Active"],
    "maxCompanies": 500,
}

run = client.actor("factden/mca-company-director-scraper").call(run_input=run_input)

for item in client.dataset(run["defaultDatasetId"]).iterate_items():
    print(item.get("cin"), item.get("name"), item.get("status"))

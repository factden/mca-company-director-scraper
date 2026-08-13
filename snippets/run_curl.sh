#!/usr/bin/env bash
# Run the MCA India Company & Director Data Scraper via the Apify API (cURL).
#
# Actor: https://apify.com/factden/mca-company-director-scraper
# Docs:  https://docs.apify.com/api/v2
#
# Runs the Actor synchronously and returns the dataset items as JSON.

APIFY_TOKEN="<YOUR_APIFY_TOKEN>"

curl -s -X POST \
  "https://api.apify.com/v2/acts/factden~mca-company-director-scraper/run-sync-get-dataset-items?token=${APIFY_TOKEN}" \
  -H "Content-Type: application/json" \
  -d '{
        "mode": "company",
        "industries": ["it_software"],
        "states": ["Karnataka"],
        "companyStatuses": ["Active"],
        "maxCompanies": 500
      }'

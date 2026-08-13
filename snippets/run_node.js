// Run the MCA India Company & Director Data Scraper via the Apify API (Node.js).
//
// Actor: https://apify.com/factden/mca-company-director-scraper
// Docs:  https://docs.apify.com/api/v2
//
//   npm install apify-client

import { ApifyClient } from 'apify-client';

const client = new ApifyClient({ token: '<YOUR_APIFY_TOKEN>' });

const input = {
    mode: 'company',
    industries: ['it_software'],
    states: ['Karnataka'],
    companyStatuses: ['Active'],
    maxCompanies: 500,
};

const run = await client.actor('factden/mca-company-director-scraper').call(input);
const { items } = await client.dataset(run.defaultDatasetId).listItems();

for (const item of items) {
    console.log(item.cin, item.name, item.status);
}

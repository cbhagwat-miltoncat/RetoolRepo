// Load API data with fresh OAuth token on page load
// This triggers the full workflow: get token → fetch data
await getOAuthToken.trigger();
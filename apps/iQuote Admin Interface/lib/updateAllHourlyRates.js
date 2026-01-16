// Update ALL records in pricesheetadminapp table with the new hourly rate
const newRate = numberInputRate.value;

// Create a SQL query to update all records
const query = `UPDATE "pricesheetadminapp" SET installation_hourly_rate = ${newRate}`;

// Execute using a resource query (you'll need to create this as a SQL query)
// For now, we'll prepare the data
return {
  message: `Ready to update all records to rate: ${newRate}`,
  query: query,
  newRate: newRate };
// Refresh Retool Database from Internal Admin API (Bulk Update)
const apiData = getApiData.data;
const apiRows = Array.isArray(apiData?.content) ? apiData.content : [];

if (apiRows.length === 0) {
  return { success: false, message: "No API data to sync" };
}

console.log(`Syncing ${apiRows.length} rows from API to database...`);

// Build a single bulk update SQL statement using CASE expressions
const ids = apiRows.map((row) => row.localItemId).join(',');

const itemCostCase = apiRows.map((row) => {
  const cost = row.costAmount ? Math.round(row.costAmount * 100) : 0;
  return `WHEN id = ${row.localItemId} THEN ${cost}`;
}).join(' ');

const gpCase = apiRows.map((row) => {
  const gp = row.grossProfitPercent ?? 0;
  return `WHEN id = ${row.localItemId} THEN ${gp}`;
}).join(' ');

const itemSellCase = apiRows.map((row) => {
  const sell = row.sellAmount ? Math.round(row.sellAmount * 100) : 0;
  return `WHEN id = ${row.localItemId} THEN ${sell}`;
}).join(' ');

// Create bulk update SQL
const bulkSQL = `
UPDATE pricesheetadminapp
SET 
  item_cost = CASE ${itemCostCase} ELSE item_cost END,
  gp = CASE ${gpCase} ELSE gp END,
  item_sell = CASE ${itemSellCase} ELSE item_sell END
WHERE id IN (${ids})
`;

console.log("Executing bulk update...");

// Execute the bulk update
try {
  await query2.trigger({
    additionalScope: {
      query: bulkSQL } });



  // Refresh the table
  await getFilteredPricesheet.trigger();

  utils.showNotification({
    title: 'Success',
    message: `Successfully synced ${apiRows.length} records from API`,
    notificationType: 'success',
    duration: 4.5 });


  return {
    success: true,
    syncedCount: apiRows.length };

} catch (error) {
  utils.showNotification({
    title: 'Error',
    message: `Failed to sync: ${error.message}`,
    notificationType: 'error',
    duration: 4.5 });


  return {
    success: false,
    error: error.message };

}
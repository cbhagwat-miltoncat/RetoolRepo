// Compare DB (new/edited) with API (old) to show what will be submitted
const apiData = {{ getApiData.data }};
const apiRows = Array.isArray(apiData?.content) ? apiData.content : [];
const dbRows = {{ formatDataAsArray(getFilteredPricesheet.data) }} || [];

// Build a lookup map from API by localItemId
const apiById = {};
for (const row of apiRows) {
  if (row.localItemId) {
    apiById[row.localItemId] = row;
  }
}

// Find rows with differences (DB is new, API is old)
const differences = [];

dbRows.forEach((dbRow) => {
  const apiRow = apiById[dbRow.id];

  if (!apiRow) return; // Skip if not in API

  // Database values (new/edited)
  const dbCost = dbRow.item_cost ?? 0;
  const dbSell = dbRow.item_sell ?? 0;
  const dbGp = dbRow.gp ?? 0;

  // API values (old) - convert dollars to cents
  const apiCost = apiRow.costAmount ? Math.round(apiRow.costAmount * 100) : 0;
  const apiSell = apiRow.sellAmount ? Math.round(apiRow.sellAmount * 100) : 0;
  const apiGp = apiRow.grossProfitPercent ?? 0;

  // Check if there are any differences
  if (dbCost !== apiCost || dbGp !== apiGp || dbSell !== apiSell) {
    differences.push({
      id: dbRow.id,
      partNumber: apiRow.partNumber,
      description: apiRow.description,

      // API values (old)
      oldCost: apiCost,
      oldGp: apiGp / 100, // Convert to decimal for percent format
      oldSell: apiSell,

      // Database values (new/edited)
      newCost: dbCost,
      newGp: dbGp / 100, // Convert to decimal for percent format
      newSell: dbSell,

      // Differences
      costDiff: dbCost - apiCost,
      gpDiff: dbGp - apiGp,
      sellDiff: dbSell - apiSell });

  }
});

return differences;
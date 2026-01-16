// Merge data from Internal Admin API (getApiData) with Retool DB (getFilteredPricesheet)
// API returns: { content: [...rows...] }
// API uses: localItemId, partNumber, baseModel, costAmount, sellAmount, grossProfitPercent, etc.
// DB uses: id, part_number, base_model, item_cost, item_sell, gp, etc.
// Join on: API.localItemId = DB.id
// IMPORTANT: API amounts are in DOLLARS, DB stores in CENTS

const apiData = {{ getApiData.data }};
const apiRows = Array.isArray(apiData?.content) ? apiData.content : [];
const dbRows = {{ formatDataAsArray(getFilteredPricesheet.data) }} || [];

// Build a lookup map from DB by id
const dbById = {};
for (const row of dbRows) {
  if (row.id) {
    dbById[row.id] = row;
  }
}

// Merge rows: API is the base, DB supplies installation-related fields
const merged = apiRows.map((apiRow) => {
  const rowId = apiRow.localItemId; // API uses localItemId
  const dbRow = rowId && dbById[rowId] ? dbById[rowId] : {};

  return {
    // ID
    id: apiRow.localItemId ?? null,

    // From API - map field names to snake_case
    action_type: apiRow.itemEntryType ?? null,
    base_model: apiRow.baseModel ?? null,
    part_number: apiRow.partNumber ?? null,
    description: apiRow.description ?? null,
    vendor: apiRow.vendor ?? null,
    extra_description: apiRow.extraDescription ?? null,

    // Convert API dollars to cents (multiply by 100)
    item_cost: apiRow.costAmount ? Math.round(apiRow.costAmount * 100) : null,
    item_sell: apiRow.sellAmount ? Math.round(apiRow.sellAmount * 100) : null,

    gp: apiRow.grossProfitPercent ?? null,
    currency_code: apiRow.currencyCode ?? null,
    local_item_status: apiRow.localItemStatus ?? null,

    // From DB (Retool Database) - installation-related fields (already in cents)
    installation_hourly_rate: dbRow.installation_hourly_rate ?? null,
    hours_estimate: dbRow.hours_estimate ?? null,
    installation_cost: dbRow.installation_cost ?? null,
    misc_cost: dbRow.misc_cost ?? null };

});

return merged;
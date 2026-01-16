// Build API payload for first change
const changes = {{ compareApiWithDatabase.value }};
const apiData = {{ getApiData.data }};

if (!changes || changes.length === 0) {
  return null;
}

const firstChange = changes[0];
const apiRow = apiData?.content?.find((r) => r.localItemId === firstChange.id);

if (!apiRow) {
  return { error: 'API row not found' };
}

// Convert GP to proper format (0.30 -> 30.00)
const gpPercent = Math.round(firstChange.newGp * 100 * 100) / 100; // Round to 2 decimals

// Return all fields needed for API
return {
  localItemId: parseInt(apiRow.localItemId, 10),
  actionType: apiRow.itemEntryType || 'U',
  baseModel: apiRow.baseModel || '',
  division: apiRow.division || '',
  description: apiRow.description || '',
  extraDescription: apiRow.extraDescription || '',
  partNumber: apiRow.partNumber || '',
  vendor: apiRow.vendor || '',
  segment: apiRow.segment,
  serviceManagementControlSystem: apiRow.serviceManagementControlSystem,
  costAmount: firstChange.newCost / 100,
  grossProfitPercent: gpPercent, // Properly formatted as XX.XX
  sellAmount: firstChange.newSell / 100,
  currencyCode: apiRow.currencyCode || '',
  localItemStatus: apiRow.localItemStatus || '' };
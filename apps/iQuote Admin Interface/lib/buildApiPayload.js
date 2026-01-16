// Build payload for API submission
const changes = compareApiWithDatabase.value;
const apiData = getApiData.data;

if (!changes || changes.length === 0) {
  return { error: 'No changes to submit' };
}

const payload = changes.map((row) => {
  // Find matching API row
  const apiRow = apiData?.content?.find((r) => r.localItemId === row.id);

  if (!apiRow) {
    console.log('Warning: API row not found for id:', row.id);
    return null;
  }

  // Build complete record
  return {
    localItemId: apiRow.localItemId,
    actionType: 'U',
    baseModel: apiRow.baseModel || '256',
    division: apiRow.division || 'G',
    description: apiRow.description || 'Empty at this point',
    extraDescription: apiRow.extraDescription || '',
    partNumber: apiRow.partNumber || '',
    vendor: apiRow.vendor || 'CAT',
    segment: apiRow.segment || null,
    serviceManagementControlSystem: apiRow.serviceManagementControlSystem || null,
    costAmount: row.newCost / 100,
    grossProfitPercent: row.newGp * 100,
    sellAmount: row.newSell / 100,
    currencyCode: apiRow.currencyCode || '',
    localItemStatus: apiRow.localItemStatus || '' };

}).filter((item) => item !== null);

console.log('Payload to submit:', payload);
return payload;
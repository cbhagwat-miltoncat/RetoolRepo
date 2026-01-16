// Submit changes to API - Array version
const changes = compareApiWithDatabase.value || [];
const apiData = getApiData.data || {};
const apiRows = apiData.content || [];

if (changes.length === 0) {
  utils.showNotification({
    title: 'No Changes',
    message: 'No changes to submit',
    notificationType: 'warning' });

  return { success: false, message: 'No changes to submit' };
}

// Build payload as array
const payload = changes.map((row) => {
  const apiRow = apiRows.find((r) => r.localItemId === row.id);

  if (!apiRow) {
    console.log('Warning: API row not found for id:', row.id);
    return null;
  }

  return {
    localItemId: apiRow.localItemId,
    actionType: 'U',
    baseModel: apiRow.baseModel || '',
    division: apiRow.division || '',
    description: apiRow.description || '',
    extraDescription: apiRow.extraDescription || '',
    partNumber: apiRow.partNumber || '',
    vendor: apiRow.vendor || '',
    segment: apiRow.segment || null,
    serviceManagementControlSystem: apiRow.serviceManagementControlSystem || null,
    costAmount: row.newCost / 100,
    grossProfitPercent: row.newGp * 100,
    sellAmount: row.newSell / 100,
    currencyCode: apiRow.currencyCode || '',
    localItemStatus: apiRow.localItemStatus || '' };

}).filter((item) => item !== null);

console.log('Submitting payload (array):', JSON.stringify(payload, null, 2));

// Trigger the REST query with the payload array
try {
  const result = await submitChangesToAPI.trigger({
    additionalScope: {
      payload: payload } });



  utils.showNotification({
    title: 'Success',
    message: `Submitted ${payload.length} changes to API`,
    notificationType: 'success' });


  modalReviewChanges.hide();

  return { success: true, count: payload.length, result };
} catch (error) {
  console.error('API Error:', error);
  utils.showNotification({
    title: 'Error',
    message: `Failed to submit: ${error.message}`,
    notificationType: 'error' });


  return { success: false, error: error.message };
}
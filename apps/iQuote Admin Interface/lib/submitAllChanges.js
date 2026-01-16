// Submit ALL changes to API - one at a time
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

console.log(`Submitting ${changes.length} changes...`);

let successCount = 0;
let failCount = 0;
const errors = [];

// Submit each change one at a time
for (const change of changes) {
  const apiRow = apiRows.find((r) => r.localItemId === change.id);

  if (!apiRow) {
    console.log('Skipping - API row not found for id:', change.id);
    failCount++;
    errors.push({ id: change.id, error: 'API row not found' });
    continue;
  }

  const gpPercent = Math.round(change.newGp * 100 * 100) / 100;

  const payload = {
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
    costAmount: parseFloat((change.newCost / 100).toFixed(2)),
    grossProfitPercent: parseFloat(gpPercent.toFixed(2)),
    sellAmount: parseFloat((change.newSell / 100).toFixed(2)),
    currencyCode: apiRow.currencyCode || '',
    localItemStatus: apiRow.localItemStatus || '' };


  console.log(`Submitting ${apiRow.partNumber}:`, payload);

  try {
    await submitChangesToAPI.trigger({
      additionalScope: { currentPayload: payload } });

    successCount++;
  } catch (error) {
    console.error(`Failed to submit ${apiRow.partNumber}:`, error);
    failCount++;
    errors.push({ partNumber: apiRow.partNumber, error: error.message });
  }
}

// Show results
if (failCount === 0) {
  utils.showNotification({
    title: 'Success',
    message: `Successfully submitted ${successCount} changes to API`,
    notificationType: 'success' });

  modalReviewChanges.hide();
  await getApiData.trigger(); // Refresh API data
  return { success: true, successCount };
} else {
  utils.showNotification({
    title: 'Partial Success',
    message: `Submitted ${successCount} changes, ${failCount} failed`,
    notificationType: 'warning' });

  return { success: false, successCount, failCount, errors };
}
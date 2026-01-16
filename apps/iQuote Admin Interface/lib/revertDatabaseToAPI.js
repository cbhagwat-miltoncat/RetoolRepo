// Documentation:
//   Reverts database changes back to API values for all changed items.
//   Compares the current changes, finds corresponding API rows, and updates
//   the database to match the original API values.
// Returns:
//   {
//     success: boolean // Whether the revert operation completed successfully
//     revertedCount: number // Number of items successfully reverted
//     failCount?: number // Number of items that failed to revert (if any)
//     message?: string // Additional message about the operation
//   }

// Revert database changes back to API values
const changes = compareApiWithDatabase.value || [];
const apiData = getApiData.data || {};
const apiRows = apiData.content || [];

if (changes.length === 0) {
  utils.showNotification({
    title: 'No Changes',
    message: 'No changes to revert',
    notificationType: 'info' });

  return { success: false, message: 'No changes to revert' };
}

console.log(`Reverting ${changes.length} items back to API values...`);

let successCount = 0;
let failCount = 0;

// Revert each changed item back to API values
for (const change of changes) {
  const apiRow = apiRows.find((r) => r.localItemId === change.id);

  if (!apiRow) {
    console.log('Skipping - API row not found for id:', change.id);
    failCount++;
    continue;
  }

  // API values (old) - convert dollars to cents for database
  const apiCost = apiRow.costAmount ? Math.round(apiRow.costAmount * 100) : 0;
  const apiSell = apiRow.sellAmount ? Math.round(apiRow.sellAmount * 100) : 0;
  const apiGp = apiRow.grossProfitPercent ?? 0;

  try {
    // Update database with API values
    await saveSingleRowSQL.trigger({
      additionalScope: {
        rowId: change.id,
        item_cost: apiCost,
        gp: apiGp,
        item_sell: apiSell,
        hours_estimate: null, // Keep existing
        misc_cost: null // Keep existing
      } });

    successCount++;
  } catch (error) {
    console.error(`Failed to revert item ${change.id}:`, error);
    failCount++;
  }
}

// Refresh data
await getFilteredPricesheet.trigger();

// Show results
if (failCount === 0) {
  utils.showNotification({
    title: 'Reverted',
    message: `Successfully reverted ${successCount} items to API values`,
    notificationType: 'success' });

  modalReviewChanges.hide();
  return { success: true, revertedCount: successCount };
} else {
  utils.showNotification({
    title: 'Partial Revert',
    message: `Reverted ${successCount} items, ${failCount} failed`,
    notificationType: 'warning' });

  return { success: false, revertedCount: successCount, failCount };
}
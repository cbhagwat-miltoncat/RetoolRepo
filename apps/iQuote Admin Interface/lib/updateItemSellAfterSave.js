// Calculate and save item_sell after autoSaveRow completes
const currentRow = pricesheetTable.selectedSourceRow;

if (!currentRow || !currentRow.id) {
  return { success: false, message: "No row selected" };
}

// Get current values (already saved by autoSaveRow)
const hours_estimate = currentRow.hours_estimate ?? 0;
const misc_cost = currentRow.misc_cost ?? 0;
const item_cost = currentRow.item_cost ?? 0;
const gp = currentRow.gp ?? 0;
const installation_hourly_rate = currentRow.installation_hourly_rate ?? 0;

// Calculate installation_cost and item_sell
const installation_cost = installation_hourly_rate * hours_estimate;
const item_sell = Math.round((item_cost + installation_cost + misc_cost) * (1 + gp / 100));

// Update only item_sell
await bulkUpdateItemGP.trigger({
  additionalScope: {
    item_sell: item_sell,
    id: currentRow.id } });



return { success: true, item_sell: item_sell };
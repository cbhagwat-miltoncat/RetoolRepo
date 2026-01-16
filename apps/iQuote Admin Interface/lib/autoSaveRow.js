// Auto-save with SQL execution
const changeset = pricesheetTable.changesetArray;

if (!changeset || changeset.length === 0) {
  console.log("No changeset - skipping save");
  return { success: false, message: "No changes to save" };
}

const editedRow = changeset[0];
const currentRow = pricesheetTable.selectedSourceRow;

if (!editedRow.id || !currentRow) {
  console.log("Missing ID or current row - skipping save");
  return { success: false, message: "Missing row data" };
}

// Get values
const hours_estimate = editedRow.hours_estimate ?? currentRow.hours_estimate ?? 0;
const misc_cost = editedRow.misc_cost ?? currentRow.misc_cost ?? 0;
const item_cost = editedRow.item_cost ?? currentRow.item_cost ?? 0;
const gp = editedRow.gp ?? currentRow.gp ?? 0;
const installation_hourly_rate = currentRow.installation_hourly_rate ?? 0;

// Calculate item_sell
const installation_cost = installation_hourly_rate * hours_estimate;
const item_sell = Math.round((item_cost + installation_cost + misc_cost) * (1 + gp / 100));

console.log("Saving:", { hours_estimate, misc_cost, item_cost, gp, item_sell, id: editedRow.id });

// Execute SQL update
await saveSingleRowSQL.trigger({
  additionalScope: {
    hours_estimate,
    misc_cost,
    item_cost,
    gp,
    item_sell,
    rowId: editedRow.id } });



// Clear changeset and refresh
pricesheetTable.clearChangeset();
await getFilteredPricesheet.trigger();

return {
  success: true,
  savedValues: { hours_estimate, misc_cost, item_cost, gp, item_sell } };
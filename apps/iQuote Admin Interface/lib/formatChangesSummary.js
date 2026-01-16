// Build a human-friendly summary of edits to Cost and Gross Profit

const changes = {{ pricesheetTable.changesetArray }} || [];
const sourceData = formatDataAsArray({{ getFilteredPricesheet.data }} || {});

// Index source data by primary key id for quick lookup
const byId = new Map(sourceData.map((row) => [row.id, row]));

const summaryRows = changes.map((change) => {
  const original = byId.get(change.id) || {};
  const orig = original;

  const oldCost = Number(orig.item_cost) || 0;
  const newCost = change.item_cost !== undefined ? Number(change.item_cost) || 0 : oldCost;

  const oldGp = Number(orig.gp) || 0;
  const newGp = change.gp !== undefined ? Number(change.gp) || 0 : oldGp;

  const oldSell = oldCost * (1 + oldGp / 100);
  const newSell = newCost * (1 + newGp / 100);

  return {
    id: change.id,
    partNumber: orig.part_number,
    description: orig.description,
    oldCost,
    newCost,
    oldGp,
    newGp,
    oldSell,
    newSell };

});

return summaryRows;
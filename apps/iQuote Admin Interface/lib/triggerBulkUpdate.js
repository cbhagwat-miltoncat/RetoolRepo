// Conditionally trigger bulk update queries based on selected column
// columnBulkEditSelect: Select component whose value is 'cost' or 'sell'
// bulkUpdateItemCost: query to bulk update cost
// bulkUpdateItemSell: query to bulk update sell

const selected = columnBulkEditSelect.value;

if (selected === 'cost') {
  // Trigger bulk update for cost
  bulkUpdateItemCost.trigger();
} else if (selected === 'gp') {
  // Trigger bulk update for sell
  bulkUpdateItemGP.trigger();
} else {
  // No valid selection; optionally you could show a notification here
  console.log('No bulk update triggered: unsupported selection', selected);
}

return selected;
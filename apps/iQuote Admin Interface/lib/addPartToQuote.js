// Add selected part from partsCatalogTable to currentQuoteItems
const selected = partsCatalogTable.selectedSourceRow;
if (!selected) {
  utils.showNotification({
    title: 'No part selected',
    message: 'Select a part from the catalog first.',
    notificationType: 'warning' });

  return;
}

const items = currentQuoteItems.value || [];

// Default quantity 1 if not present
const quantity = 1;
const unitPrice = selected.priceAfterFreight ?? selected.basePrice ?? 0;
const lineTotal = unitPrice * quantity;

items.push({
  type: selected.type,
  size: selected.size,
  partNumber: selected.partNumber,
  unitPrice,
  quantity,
  lineTotal });


currentQuoteItems.setValue(items);
// Remove selected item from selectedItemsTable
const items = currentQuoteItems.value || [];
const index = selectedItemsTable.selectedDataIndex;

if (index == null || index < 0 || index >= items.length) {
  utils.showNotification({
    title: 'No line selected',
    message: 'Select a line item to remove.',
    notificationType: 'warning' });

  return;
}

items.splice(index, 1);
currentQuoteItems.setValue(items);
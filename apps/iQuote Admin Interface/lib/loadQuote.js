// Load selected quote from quotesListTable into currentQuote and currentQuoteItems
const selected = quotesListTable.selectedSourceRow;
if (!selected) {
  utils.showNotification({
    title: 'No quote selected',
    message: 'Select a quote to edit.',
    notificationType: 'warning' });

  return;
}

currentQuote.setValue(selected);
currentQuoteItems.setValue(selected.items || []);
customerNameInput.setValue(selected.customerName || '');
customerEmailInput.setValue(selected.customerEmail || '');

utils.showNotification({
  title: 'Quote loaded',
  message: `Editing quote ${selected.quoteNumber}`,
  notificationType: 'info' });


return selected;
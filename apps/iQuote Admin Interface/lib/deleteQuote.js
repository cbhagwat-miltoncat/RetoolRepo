// Delete selected quote from allQuotes
const quotes = allQuotes.value || [];
const selected = quotesListTable.selectedSourceRow;
if (!selected) {
  utils.showNotification({
    title: 'No quote selected',
    message: 'Select a quote to delete.',
    notificationType: 'warning' });

  return;
}

const filtered = quotes.filter((q) => q.id !== selected.id);
allQuotes.setValue(filtered);

// If deleting the current quote, clear it
if (currentQuote.value && currentQuote.value.id === selected.id) {
  currentQuote.setValue({ id: null, quoteNumber: null, customerName: '', customerEmail: '', status: 'Draft', notes: '' });
  currentQuoteItems.setValue([]);
}

utils.showNotification({
  title: 'Quote deleted',
  message: `Quote ${selected.quoteNumber} has been deleted.`,
  notificationType: 'success' });


return filtered;
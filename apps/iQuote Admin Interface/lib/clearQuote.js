// Clear current quote and start a new one
currentQuote.setValue({
  id: null,
  quoteNumber: null,
  customerName: '',
  customerEmail: '',
  status: 'Draft',
  notes: '' });

currentQuoteItems.setValue([]);
customerNameInput.setValue('');
customerEmailInput.setValue('');

utils.showNotification({
  title: 'New quote',
  message: 'Started a new quote.',
  notificationType: 'info' });


return true;
// Save current quote to allQuotes
const quotes = allQuotes.value || [];
const calc = quoteCalculator.value || { subtotal: 0, labor: 0, total: 0 };
const current = currentQuote.value || {};

// Basic validation
if (!customerNameInput.value) {
  utils.showNotification({
    title: 'Missing customer name',
    message: 'Please enter a customer name before saving.',
    notificationType: 'warning' });

  return;
}

// Generate quote number if new
let quoteNumber = current.quoteNumber;
if (!quoteNumber) {
  quoteNumber = quoteNumberGenerator.value;
}

const quoteId = current.id ?? quotes.length + 1;

const newQuote = {
  id: quoteId,
  quoteNumber,
  customerName: customerNameInput.value,
  customerEmail: customerEmailInput.value,
  status: current.status || 'Draft',
  notes: current.notes || '',
  subtotal: calc.subtotal,
  labor: calc.labor,
  total: calc.total,
  items: currentQuoteItems.value || [],
  createdAt: current.createdAt || new Date().toISOString() };


// If editing existing quote, replace it
const existingIndex = quotes.findIndex((q) => q.id === quoteId);
if (existingIndex >= 0) {
  quotes[existingIndex] = newQuote;
} else {
  quotes.push(newQuote);
}

allQuotes.setValue(quotes);
currentQuote.setValue(newQuote);

utils.showNotification({
  title: 'Quote saved',
  message: `Quote ${quoteNumber} saved successfully`,
  notificationType: 'success' });


return newQuote;
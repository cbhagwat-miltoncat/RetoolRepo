// Generate a simple quote number like Q-2026-001 based on allQuotes length
const quotes = {{ allQuotes.value }} || [];
const index = quotes.length + 1;
const year = new Date().getFullYear();
const padded = String(index).padStart(3, '0');

return `Q-${year}-${padded}`;
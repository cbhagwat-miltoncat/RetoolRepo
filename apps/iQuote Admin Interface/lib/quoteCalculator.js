// Calculate subtotal, labor, and total for current quote
const items = {{ currentQuoteItems.value }} || [];
const modifiers = {{ partsCatalogData.value }}?.pricingModifiers || {};
const laborSelection = {{ selectedLaborCosts.value }} || {};

const subtotal = items.reduce((sum, item) => sum + (item.lineTotal || 0), 0);

let labor = 0;
if (laborSelection.bcpLabor) labor += modifiers.bcpLabor || 0;
if (laborSelection.gciLabor) labor += modifiers.gciLabor || 0;
if (laborSelection.measureUp) labor += modifiers.measureUp || 0;
if (laborSelection.makeUpOil) labor += modifiers.makeUpOil || 0;

const total = subtotal + labor;

return { subtotal, labor, total };
// Build a human-readable summary of the changes

const rows = {{ formatChangesSummary.value }} || [];

if (!rows.length) {
  return "No pending changes.";
}

const count = rows.length;

// Total deltas
let totalCostDelta = 0;
let totalGpDelta = 0;
let totalSellDelta = 0;

rows.forEach((r) => {
  totalCostDelta += (r.newCost || 0) - (r.oldCost || 0);
  totalGpDelta += (r.newGp || 0) - (r.oldGp || 0);
  totalSellDelta += (r.newSell || 0) - (r.oldSell || 0);
});

const avgCostDelta = totalCostDelta / count;
const avgGpDelta = totalGpDelta / count;
const avgSellDelta = totalSellDelta / count;

// Helper to format currency deltas
function formatCurrencyDelta(v) {
  if (!v) return "$0";
  const sign = v > 0 ? "+" : "";
  const abs = Math.round(Math.abs(v));
  return `${sign}$${abs.toLocaleString()}`;
}

// Helper to format percent deltas
function formatPercentDelta(v) {
  if (!v) return "0pp";
  const sign = v > 0 ? "+" : "";
  const abs = Math.round(Math.abs(v));
  return `${sign}${abs}pp`;
}

const summaryLines = [];
summaryLines.push(`You have modified ${count} item${count === 1 ? "" : "s"}.`);
summaryLines.push(
`Average Cost change: ${formatCurrencyDelta(avgCostDelta)} per item (total: ${formatCurrencyDelta(totalCostDelta)}).`);

summaryLines.push(
`Average Gross Profit change: ${formatPercentDelta(avgGpDelta)} (total: ${formatPercentDelta(totalGpDelta)}).`);

summaryLines.push(
`Average Sell Price change: ${formatCurrencyDelta(avgSellDelta)} per item (total: ${formatCurrencyDelta(totalSellDelta)}).`);


return summaryLines.join("\n");
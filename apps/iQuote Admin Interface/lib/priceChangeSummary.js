// Generate AI summary of price changes
const changes = {{ compareApiWithDatabase.value }} || [];

if (changes.length === 0) {
  return "No price changes detected.";
}

// Calculate statistics
let increasedCount = 0;
let decreasedCount = 0;
let unchangedCount = 0;
let totalOldSell = 0;
let totalNewSell = 0;
let maxIncrease = { amount: 0, percent: 0, partNumber: '' };
let maxDecrease = { amount: 0, percent: 0, partNumber: '' };

changes.forEach((change) => {
  const oldSell = change.oldSell / 100;
  const newSell = change.newSell / 100;
  const diff = newSell - oldSell;
  const percentChange = oldSell > 0 ? diff / oldSell * 100 : 0;

  totalOldSell += oldSell;
  totalNewSell += newSell;

  if (diff > 0) {
    increasedCount++;
    if (diff > maxIncrease.amount) {
      maxIncrease = { amount: diff, percent: percentChange, partNumber: change.partNumber };
    }
  } else if (diff < 0) {
    decreasedCount++;
    if (Math.abs(diff) > Math.abs(maxDecrease.amount)) {
      maxDecrease = { amount: diff, percent: percentChange, partNumber: change.partNumber };
    }
  } else {
    unchangedCount++;
  }
});

const avgOldSell = totalOldSell / changes.length;
const avgNewSell = totalNewSell / changes.length;
const overallChange = totalNewSell - totalOldSell;
const overallPercent = totalOldSell > 0 ? overallChange / totalOldSell * 100 : 0;

// Build summary
let summary = `### Price Change Summary\n\n`;
summary += `**${changes.length}** items have pricing changes:\n\n`;

if (increasedCount > 0) {
  summary += `📈 **${increasedCount}** items increased in price\n`;
}
if (decreasedCount > 0) {
  summary += `📉 **${decreasedCount}** items decreased in price\n`;
}
if (unchangedCount > 0) {
  summary += `➖ **${unchangedCount}** items have no sell price change\n`;
}

summary += `\n**Overall Impact:**\n`;
summary += `- Total Sell Price: ${overallChange >= 0 ? '+' : ''}$${overallChange.toFixed(2)} (${overallPercent >= 0 ? '+' : ''}${overallPercent.toFixed(2)}%)\n`;
summary += `- Average Sell Price: $${avgOldSell.toFixed(2)} → $${avgNewSell.toFixed(2)}\n`;

if (maxIncrease.amount > 0) {
  summary += `\n**Largest Increase:** ${maxIncrease.partNumber} (+$${maxIncrease.amount.toFixed(2)}, +${maxIncrease.percent.toFixed(1)}%)\n`;
}
if (maxDecrease.amount < 0) {
  summary += `**Largest Decrease:** ${maxDecrease.partNumber} ($${maxDecrease.amount.toFixed(2)}, ${maxDecrease.percent.toFixed(1)}%)\n`;
}

return summary;
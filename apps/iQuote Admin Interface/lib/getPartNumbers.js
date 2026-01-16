
function getPartNumbers() {
  return {{ getPartPrices.data.content}}.map(item => item.partNumber);
}

return getPartNumbers();



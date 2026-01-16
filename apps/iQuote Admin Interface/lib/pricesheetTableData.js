// Get distinct IDs from table based on search filter
const searchValue = {{ tableSearch.value }} || '';
const tableData = {{ pricesheetTable.data }} || [];

// If search is empty, return all IDs
if (searchValue.trim() === '') {
  return [...new Set(tableData.map((row) => row.id).filter((id) => id != null))];
}

// Filter data based on search
const lowerSearch = searchValue.toLowerCase();
const filteredData = tableData.filter((row) =>
Object.values(row).some((val) => String(val).toLowerCase().includes(lowerSearch)));


// Return distinct IDs
return [...new Set(filteredData.map((row) => row.id).filter((id) => id != null))];
// Get IDs of currently displayed (filtered) rows in the table
// This accounts for both table search and any other filters
// Since displayedData doesn't exist, we use the table's data property

const tableData = {{ pricesheetTable.data }};
const distinctIds = [...new Set(tableData.map((row) => row.id))];

return distinctIds;
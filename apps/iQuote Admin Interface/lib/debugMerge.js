// Debug the data merge
return {
  apiDataExists: !!getApiData.data,
  apiDataIsArray: Array.isArray(getApiData.data),
  apiRowCount: Array.isArray(getApiData.data) ? getApiData.data.length : 0,
  apiFirstRow: Array.isArray(getApiData.data) && getApiData.data.length > 0 ? getApiData.data[0] : null,

  dbDataExists: !!getFilteredPricesheet.data,
  dbRawData: getFilteredPricesheet.data,
  dbRowCount: formatDataAsArray(getFilteredPricesheet.data).length,
  dbFirstRow: formatDataAsArray(getFilteredPricesheet.data)[0] || null,

  mergeResultExists: !!mergeTableData.value,
  mergeRowCount: Array.isArray(mergeTableData.value) ? mergeTableData.value.length : 0,
  mergeFirstRow: Array.isArray(mergeTableData.value) && mergeTableData.value.length > 0 ? mergeTableData.value[0] : null };
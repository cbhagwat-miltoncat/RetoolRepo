// Debug helper - get first change with API data
const changes = {{ compareApiWithDatabase.value }};
const apiData = {{ getApiData.data }};

if (!changes || changes.length === 0) {
  return { error: 'No changes found' };
}

const firstChange = changes[0];
const apiRow = apiData?.content?.find((r) => r.localItemId === firstChange.id);

return {
  firstChangeId: firstChange.id,
  firstChangePartNumber: firstChange.partNumber,
  apiRowFound: !!apiRow,
  apiRowPartNumber: apiRow?.partNumber,
  apiRowDescription: apiRow?.description,
  fullApiRow: apiRow,
  fullChange: firstChange };
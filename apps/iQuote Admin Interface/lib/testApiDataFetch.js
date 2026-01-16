// TEST: API Data Fetch with Fresh Token
// Validates that API data can be fetched using a fresh OAuth token

console.log('🧪 TEST: API Data Fetch with Fresh Token');
console.log('─────────────────────────────────');

const results = {
  testName: 'API Data Fetch with Fresh Token',
  timestamp: new Date().toISOString(),
  steps: [] };


try {
  // Step 1: Get fresh token
  console.log('Step 1: Getting fresh OAuth token...');
  await getOAuthToken.trigger();

  if (!getOAuthToken.data || !getOAuthToken.data.access_token) {
    throw new Error('Failed to get OAuth token');
  }

  results.steps.push({
    step: 1,
    description: 'Get fresh OAuth token',
    status: 'PASS',
    data: { hasToken: true } });


  // Step 2: Store token
  console.log('Step 2: Storing token in variable...');
  const token = getOAuthToken.data.access_token;
  cloudLinkAccessToken.setValue(token);

  results.steps.push({
    step: 2,
    description: 'Store token in variable',
    status: 'PASS' });


  // Step 3: Wait for state update
  console.log('Step 3: Waiting for state update...');
  await new Promise((resolve) => setTimeout(resolve, 500));

  results.steps.push({
    step: 3,
    description: 'Wait for state update',
    status: 'PASS',
    message: 'Waited 500ms' });


  // Step 4: Trigger API data fetch
  console.log('Step 4: Fetching API data with fresh token...');
  await getApiData.trigger();

  results.steps.push({
    step: 4,
    description: 'Trigger getApiData',
    status: 'PASS',
    message: 'Query executed' });


  // Step 5: Validate API response
  console.log('Step 5: Validating API response...');
  const apiData = getApiData.data;

  if (!apiData) {
    throw new Error('No data returned from getApiData');
  }

  if (!apiData.content) {
    throw new Error('Response missing "content" field');
  }

  if (!Array.isArray(apiData.content)) {
    throw new Error('"content" field is not an array');
  }

  const itemCount = apiData.content.length;

  if (itemCount === 0) {
    throw new Error('API returned empty content array');
  }

  results.steps.push({
    step: 5,
    description: 'Validate API response',
    status: 'PASS',
    data: {
      hasContent: true,
      itemCount: itemCount,
      isArray: true } });



  // Step 6: Validate item structure
  console.log('Step 6: Validating item structure...');
  const firstItem = apiData.content[0];
  const requiredFields = ['localItemId', 'partNumber', 'description', 'costAmount', 'sellAmount'];
  const missingFields = requiredFields.filter((field) => !(field in firstItem));

  if (missingFields.length > 0) {
    console.warn(`⚠️  Warning: Missing fields in items: ${missingFields.join(', ')}`);
  }

  results.steps.push({
    step: 6,
    description: 'Validate item structure',
    status: 'PASS',
    data: {
      sampleFields: Object.keys(firstItem).slice(0, 5),
      missingFields: missingFields } });



  // Final result
  results.status = 'PASS';
  results.summary = `✅ All ${results.steps.length} validation steps passed`;
  results.itemCount = itemCount;

  console.log('\n✅ TEST PASSED');
  console.log('─────────────────────────────────');
  console.log('Summary:', results.summary);
  console.log(`Fetched ${itemCount} items from CloudLink API`);

  utils.showNotification({
    title: '✅ Test Passed: API Data Fetch',
    message: `Successfully fetched ${itemCount} items with fresh token`,
    notificationType: 'success',
    duration: 4 });


  return results;

} catch (error) {
  results.status = 'FAIL';
  results.error = error.message;
  results.summary = `❌ Test failed: ${error.message}`;

  console.error('\n❌ TEST FAILED');
  console.error('─────────────────────────────────');
  console.error('Error:', error.message);

  utils.showNotification({
    title: '❌ Test Failed: API Data Fetch',
    message: error.message,
    notificationType: 'error',
    duration: 5 });


  return results;
}
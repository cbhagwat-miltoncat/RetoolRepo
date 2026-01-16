// TEST: Complete Token Flow (End-to-End)
// Validates the entire token flow from OAuth to API data display

console.log('🧪 TEST: Complete Token Flow (End-to-End)');
console.log('═════════════════════════════════════════');

const results = {
  testName: 'Complete Token Flow (End-to-End)',
  timestamp: new Date().toISOString(),
  steps: [],
  metrics: {} };


try {
  const startTime = Date.now();

  // Step 1: Trigger loadApiDataWithFreshToken
  console.log('Step 1: Triggering complete workflow...');
  await loadApiDataWithFreshToken.trigger();

  results.steps.push({
    step: 1,
    description: 'Trigger loadApiDataWithFreshToken',
    status: 'PASS' });


  // Step 2: Wait for workflow to complete
  console.log('Step 2: Waiting for workflow completion...');
  await new Promise((resolve) => setTimeout(resolve, 1000));

  results.steps.push({
    step: 2,
    description: 'Wait for workflow completion',
    status: 'PASS',
    message: 'Waited 1000ms' });


  // Step 3: Verify token was obtained
  console.log('Step 3: Verifying OAuth token...');
  const tokenData = getOAuthToken.data;

  if (!tokenData || !tokenData.access_token) {
    throw new Error('OAuth token not obtained');
  }

  results.steps.push({
    step: 3,
    description: 'Verify OAuth token obtained',
    status: 'PASS',
    data: {
      tokenLength: tokenData.access_token.length,
      expiresIn: tokenData.expires_in } });



  // Step 4: Verify token was stored
  console.log('Step 4: Verifying token storage...');
  const storedToken = cloudLinkAccessToken.value;

  if (!storedToken) {
    throw new Error('Token not stored in variable');
  }

  if (storedToken !== tokenData.access_token) {
    throw new Error('Stored token does not match obtained token');
  }

  results.steps.push({
    step: 4,
    description: 'Verify token stored in variable',
    status: 'PASS',
    data: { tokensMatch: true } });


  // Step 5: Verify API data was fetched
  console.log('Step 5: Verifying API data fetch...');
  const apiData = getApiData.data;

  if (!apiData || !apiData.content) {
    throw new Error('API data not fetched');
  }

  const itemCount = apiData.content.length;

  if (itemCount === 0) {
    throw new Error('API returned no items');
  }

  results.steps.push({
    step: 5,
    description: 'Verify API data fetched',
    status: 'PASS',
    data: { itemCount: itemCount } });


  // Step 6: Verify data merge
  console.log('Step 6: Verifying data merge...');
  const mergedData = mergeTableData.value;

  if (!mergedData || !Array.isArray(mergedData)) {
    throw new Error('Merged data not available');
  }

  if (mergedData.length === 0) {
    throw new Error('Merged data is empty');
  }

  results.steps.push({
    step: 6,
    description: 'Verify data merge',
    status: 'PASS',
    data: { mergedItemCount: mergedData.length } });


  // Calculate metrics
  const endTime = Date.now();
  const totalTime = endTime - startTime;

  results.metrics = {
    totalTimeMs: totalTime,
    totalTimeSec: (totalTime / 1000).toFixed(2),
    itemsFetched: itemCount,
    itemsMerged: mergedData.length,
    tokenLength: tokenData.access_token.length,
    tokenExpiresIn: tokenData.expires_in };


  // Final result
  results.status = 'PASS';
  results.summary = `✅ Complete token flow executed successfully in ${results.metrics.totalTimeSec}s`;

  console.log('\n✅ TEST PASSED');
  console.log('═════════════════════════════════════════');
  console.log('Summary:', results.summary);
  console.log('\nMetrics:');
  console.log(`  - Total Time: ${results.metrics.totalTimeSec}s`);
  console.log(`  - Items Fetched: ${results.metrics.itemsFetched}`);
  console.log(`  - Items Merged: ${results.metrics.itemsMerged}`);
  console.log(`  - Token Expires In: ${Math.round(results.metrics.tokenExpiresIn / 3600)}h`);

  utils.showNotification({
    title: '✅ Test Passed: Complete Token Flow',
    message: `Successfully executed full workflow in ${results.metrics.totalTimeSec}s`,
    notificationType: 'success',
    duration: 5 });


  return results;

} catch (error) {
  results.status = 'FAIL';
  results.error = error.message;
  results.summary = `❌ Test failed: ${error.message}`;

  console.error('\n❌ TEST FAILED');
  console.error('═════════════════════════════════════════');
  console.error('Error:', error.message);
  console.error('Steps completed:', results.steps.length);

  utils.showNotification({
    title: '❌ Test Failed: Complete Token Flow',
    message: error.message,
    notificationType: 'error',
    duration: 5 });


  return results;
}
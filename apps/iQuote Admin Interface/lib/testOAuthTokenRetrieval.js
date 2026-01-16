// TEST: OAuth Token Retrieval
// Validates that we can successfully get an OAuth token from CloudLink

console.log('🧪 TEST: OAuth Token Retrieval');
console.log('─────────────────────────────────');

const results = {
  testName: 'OAuth Token Retrieval',
  timestamp: new Date().toISOString(),
  steps: [] };


try {
  // Step 1: Trigger token request
  console.log('Step 1: Requesting OAuth token...');
  await getOAuthToken.trigger();

  results.steps.push({
    step: 1,
    description: 'Trigger getOAuthToken',
    status: 'PASS',
    message: 'Query executed successfully' });


  // Step 2: Validate response structure
  console.log('Step 2: Validating response structure...');
  const tokenData = getOAuthToken.data;

  if (!tokenData) {
    throw new Error('No data returned from getOAuthToken');
  }

  results.steps.push({
    step: 2,
    description: 'Check response exists',
    status: 'PASS',
    data: { hasData: true } });


  // Step 3: Validate access_token field
  console.log('Step 3: Checking access_token field...');
  if (!tokenData.access_token) {
    throw new Error('access_token field is missing');
  }

  if (typeof tokenData.access_token !== 'string') {
    throw new Error('access_token is not a string');
  }

  if (tokenData.access_token.length < 10) {
    throw new Error('access_token appears invalid (too short)');
  }

  results.steps.push({
    step: 3,
    description: 'Validate access_token',
    status: 'PASS',
    data: {
      tokenType: typeof tokenData.access_token,
      tokenLength: tokenData.access_token.length,
      tokenPreview: tokenData.access_token.substring(0, 20) + '...' } });



  // Step 4: Validate token_type field
  console.log('Step 4: Checking token_type field...');
  if (!tokenData.token_type) {
    throw new Error('token_type field is missing');
  }

  if (tokenData.token_type !== 'Bearer') {
    console.warn(`⚠️  Warning: token_type is "${tokenData.token_type}", expected "Bearer"`);
  }

  results.steps.push({
    step: 4,
    description: 'Validate token_type',
    status: 'PASS',
    data: { tokenType: tokenData.token_type } });


  // Step 5: Validate expires_in field
  console.log('Step 5: Checking expires_in field...');
  if (!tokenData.expires_in) {
    console.warn('⚠️  Warning: expires_in field is missing');
  } else {
    const expiresInHours = Math.round(tokenData.expires_in / 3600);
    results.steps.push({
      step: 5,
      description: 'Validate expires_in',
      status: 'PASS',
      data: {
        expiresInSeconds: tokenData.expires_in,
        expiresInHours: expiresInHours } });


  }

  // Final result
  results.status = 'PASS';
  results.summary = `✅ All ${results.steps.length} validation steps passed`;

  console.log('\n✅ TEST PASSED');
  console.log('─────────────────────────────────');
  console.log('Summary:', results.summary);
  console.log('Token preview:', tokenData.access_token.substring(0, 30) + '...');

  utils.showNotification({
    title: '✅ Test Passed: OAuth Token Retrieval',
    message: `Successfully retrieved and validated OAuth token`,
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
  console.error('Steps completed:', results.steps.length);

  utils.showNotification({
    title: '❌ Test Failed: OAuth Token Retrieval',
    message: error.message,
    notificationType: 'error',
    duration: 5 });


  return results;
}
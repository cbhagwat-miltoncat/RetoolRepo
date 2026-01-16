// TEST SUITE: Complete Application Test Suite
// Runs all application tests including token flow and business logic

console.log('🧪 COMPLETE APPLICATION TEST SUITE');
console.log('═══════════════════════════════════════════════════');
console.log('Running all application tests...\n');

const suiteResults = {
  suiteName: 'Complete Application Test Suite',
  timestamp: new Date().toISOString(),
  tests: [],
  summary: {
    total: 0,
    passed: 0,
    failed: 0 } };



try {
  const suiteStartTime = Date.now();

  console.log('\n📦 TOKEN FLOW TESTS');
  console.log('═══════════════════════════════════════════════════');

  // Test 1: OAuth Token Retrieval
  console.log('\n[1/5] Running: OAuth Token Retrieval');
  console.log('───────────────────────────────────────────────────');
  const test1 = await testOAuthTokenRetrieval.trigger();
  suiteResults.tests.push(test1);

  // Test 2: Token Storage
  console.log('\n[2/5] Running: Token Storage in Variable');
  console.log('───────────────────────────────────────────────────');
  const test2 = await testTokenStorage.trigger();
  suiteResults.tests.push(test2);

  // Test 3: API Data Fetch
  console.log('\n[3/5] Running: API Data Fetch with Fresh Token');
  console.log('───────────────────────────────────────────────────');
  const test3 = await testApiDataFetch.trigger();
  suiteResults.tests.push(test3);

  // Test 4: Complete Flow
  console.log('\n[4/5] Running: Complete Token Flow (End-to-End)');
  console.log('───────────────────────────────────────────────────');
  const test4 = await testCompleteTokenFlow.trigger();
  suiteResults.tests.push(test4);

  // Wait for all queries from previous tests to settle
  console.log('\n\nWaiting for previous tests to settle...');
  await new Promise((resolve) => setTimeout(resolve, 2000));

  console.log('\n💼 BUSINESS LOGIC TESTS');
  console.log('═══════════════════════════════════════════════════');

  // Test 5: Hourly Rate Update
  console.log('\n[5/5] Running: Installation Hourly Rate Update & Recalculation');
  console.log('───────────────────────────────────────────────────');
  const test5 = await testHourlyRateUpdate.trigger();
  suiteResults.tests.push(test5);

  // Calculate summary
  suiteResults.summary.total = suiteResults.tests.length;
  suiteResults.summary.passed = suiteResults.tests.filter((t) => t.status === 'PASS').length;
  suiteResults.summary.failed = suiteResults.tests.filter((t) => t.status === 'FAIL').length;

  const suiteEndTime = Date.now();
  const suiteTotalTime = ((suiteEndTime - suiteStartTime) / 1000).toFixed(2);

  // Generate report
  console.log('\n\n');
  console.log('═══════════════════════════════════════════════════');
  console.log('📊 COMPLETE TEST SUITE REPORT');
  console.log('═══════════════════════════════════════════════════');
  console.log(`\nSuite: ${suiteResults.suiteName}`);
  console.log(`Time: ${new Date().toLocaleString()}`);
  console.log(`Duration: ${suiteTotalTime}s`);
  console.log('\n───────────────────────────────────────────────────');
  console.log('RESULTS:');
  console.log('───────────────────────────────────────────────────');

  suiteResults.tests.forEach((test, index) => {
    const icon = test.status === 'PASS' ? '✅' : '❌';
    console.log(`${icon} [${index + 1}/${suiteResults.summary.total}] ${test.testName}`);
    console.log(`    Status: ${test.status}`);
    console.log(`    Steps: ${test.steps.length}`);
    if (test.error) {
      console.log(`    Error: ${test.error}`);
    }
    if (test.metrics) {
      console.log(`    Time: ${test.metrics.totalTimeSec}s`);
    }
  });

  console.log('\n───────────────────────────────────────────────────');
  console.log('SUMMARY:');
  console.log('───────────────────────────────────────────────────');
  console.log(`Total Tests: ${suiteResults.summary.total}`);
  console.log(`✅ Passed: ${suiteResults.summary.passed}`);
  console.log(`❌ Failed: ${suiteResults.summary.failed}`);
  console.log(`Success Rate: ${Math.round(suiteResults.summary.passed / suiteResults.summary.total * 100)}%`);
  console.log('═══════════════════════════════════════════════════\n');

  // Show notification
  const allPassed = suiteResults.summary.failed === 0;

  utils.showNotification({
    title: allPassed ? '✅ All Tests Passed!' : '⚠️  Some Tests Failed',
    message: `${suiteResults.summary.passed}/${suiteResults.summary.total} tests passed in ${suiteTotalTime}s`,
    notificationType: allPassed ? 'success' : 'warning',
    duration: 6 });


  suiteResults.summary.duration = suiteTotalTime;
  suiteResults.summary.allPassed = allPassed;

  return suiteResults;

} catch (error) {
  console.error('\n❌ TEST SUITE FAILED');
  console.error('═══════════════════════════════════════════════════');
  console.error('Error:', error.message);

  utils.showNotification({
    title: '❌ Test Suite Failed',
    message: error.message,
    notificationType: 'error',
    duration: 5 });


  suiteResults.error = error.message;
  return suiteResults;
}
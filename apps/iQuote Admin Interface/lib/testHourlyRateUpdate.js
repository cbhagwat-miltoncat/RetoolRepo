// TEST: Installation Hourly Rate and Installation Cost Update
// Validates that updating the hourly rate correctly updates installation cost
// NOTE: item_sell comes from API, not database, so we don't test it here

console.log('🧪 TEST: Installation Hourly Rate & Cost Update');
console.log('─────────────────────────────────────────');

const results = {
  testName: 'Installation Hourly Rate Update and Recalculation',
  timestamp: new Date().toISOString(),
  steps: [] };


try {
  // Step 1: Refresh data first to get current state
  console.log('Step 1: Getting current database state...');
  await getFilteredPricesheet.trigger();
  await getAdminData.trigger();

  const beforeData = formatDataAsArray(getFilteredPricesheet.data);
  const originalRate = formatDataAsArray(getAdminData.data)[0]?.installation_hourly_rate;

  if (!originalRate) {
    throw new Error('Could not get current installation hourly rate');
  }

  results.steps.push({
    step: 1,
    description: 'Get current state',
    status: 'PASS',
    data: { originalRate: originalRate } });


  console.log(`   Current rate: $${originalRate / 100}/hour`);

  // Step 2: Pick a sample row with hours_estimate > 0
  console.log('Step 2: Selecting sample row...');

  if (!beforeData || beforeData.length === 0) {
    throw new Error('No data in database');
  }

  const sampleRow = beforeData.find((row) => row.hours_estimate && row.hours_estimate > 0);

  if (!sampleRow) {
    throw new Error('No rows with hours_estimate > 0 found');
  }

  const beforeValues = {
    id: sampleRow.id,
    hourlyRate: sampleRow.installation_hourly_rate,
    hoursEstimate: sampleRow.hours_estimate,
    installationCost: sampleRow.installation_cost };


  results.steps.push({
    step: 2,
    description: 'Select sample row',
    status: 'PASS',
    data: { sampleRowId: beforeValues.id } });


  console.log(`   Sample row ID: ${beforeValues.id}`);
  console.log(`   Hours Estimate: ${beforeValues.hoursEstimate}`);
  console.log(`   Before - Hourly Rate: $${beforeValues.hourlyRate / 100}`);
  console.log(`   Before - Installation Cost: $${beforeValues.installationCost / 100}`);

  // Step 3: Set test rate
  console.log('Step 3: Setting test hourly rate...');
  const testRate = Math.floor(originalRate / 1000) * 1000 + 1700; // e.g., 201700 cents = $2017

  numberInputRate.setValue(testRate);
  await new Promise((resolve) => setTimeout(resolve, 300));

  results.steps.push({
    step: 3,
    description: 'Set test rate',
    status: 'PASS',
    data: { testRate: testRate } });


  console.log(`   Test rate: $${testRate / 100}/hour`);

  // Step 4: Trigger update
  console.log('Step 4: Updating database...');
  await updateHourlyRate.trigger();
  await new Promise((resolve) => setTimeout(resolve, 2000));

  results.steps.push({
    step: 4,
    description: 'Trigger update',
    status: 'PASS' });


  // Step 5: Fetch updated data
  console.log('Step 5: Fetching updated data...');
  await getFilteredPricesheet.trigger();

  const afterData = formatDataAsArray(getFilteredPricesheet.data);
  const updatedRow = afterData.find((row) => row.id === beforeValues.id);

  if (!updatedRow) {
    throw new Error(`Could not find row ${beforeValues.id} after update`);
  }

  const afterValues = {
    hourlyRate: updatedRow.installation_hourly_rate,
    installationCost: updatedRow.installation_cost };


  results.steps.push({
    step: 5,
    description: 'Fetch updated data',
    status: 'PASS' });


  console.log(`   After - Hourly Rate: $${afterValues.hourlyRate / 100}`);
  console.log(`   After - Installation Cost: $${afterValues.installationCost / 100}`);

  // Step 6: Verify hourly rate updated
  console.log('Step 6: Verifying hourly rate...');

  if (Math.abs(afterValues.hourlyRate - testRate) > 1) {
    throw new Error(`Hourly rate not updated. Expected: ${testRate}, Got: ${afterValues.hourlyRate}`);
  }

  results.steps.push({
    step: 6,
    description: 'Verify hourly rate',
    status: 'PASS' });


  // Step 7: Verify installation cost recalculated
  console.log('Step 7: Verifying installation cost...');

  const expectedCost = testRate * beforeValues.hoursEstimate;
  const costDiff = Math.abs(afterValues.installationCost - expectedCost);

  console.log(`   Expected: $${expectedCost / 100}`);
  console.log(`   Actual: $${afterValues.installationCost / 100}`);
  console.log(`   Diff: $${costDiff / 100}`);

  if (costDiff > 1) {
    throw new Error(`Installation cost incorrect. Expected: ${expectedCost}, Got: ${afterValues.installationCost}`);
  }

  results.steps.push({
    step: 7,
    description: 'Verify installation cost',
    status: 'PASS',
    data: {
      expected: expectedCost,
      actual: afterValues.installationCost } });



  // Step 8: Restore original rate
  console.log('Step 8: Restoring original rate...');
  numberInputRate.setValue(originalRate);
  await new Promise((resolve) => setTimeout(resolve, 300));
  await updateHourlyRate.trigger();
  await new Promise((resolve) => setTimeout(resolve, 2000));

  results.steps.push({
    step: 8,
    description: 'Restore original rate',
    status: 'PASS' });


  console.log(`   Restored to: $${originalRate / 100}/hour`);

  // Success
  results.status = 'PASS';
  results.summary = `✅ All ${results.steps.length} steps passed`;

  console.log('\n✅ TEST PASSED');
  console.log('─────────────────────────────────────────');
  console.log('Hourly rate and installation cost verified!');

  utils.showNotification({
    title: '✅ Test Passed',
    message: 'Hourly rate and installation cost updated correctly',
    notificationType: 'success',
    duration: 5 });


  return results;

} catch (error) {
  results.status = 'FAIL';
  results.error = error.message;
  results.summary = `❌ Test failed: ${error.message}`;

  console.error('\n❌ TEST FAILED');
  console.error('─────────────────────────────────────────');
  console.error('Error:', error.message);

  // Try to restore
  try {
    if (results.steps[0]?.data?.originalRate) {
      numberInputRate.setValue(results.steps[0].data.originalRate);
      await new Promise((resolve) => setTimeout(resolve, 300));
      await updateHourlyRate.trigger();
      console.log('Original rate restored');
    }
  } catch (e) {
    console.error('Restore failed:', e.message);
  }

  utils.showNotification({
    title: '❌ Test Failed',
    message: error.message.substring(0, 100),
    notificationType: 'error',
    duration: 5 });


  return results;
}
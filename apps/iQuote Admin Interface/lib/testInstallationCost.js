// Documentation:
//   Test to verify Installation Cost calculation is correct.
//   Test Scenario:
//   1. Get a sample row with hours_estimate > 0
//   2. Record the installation_hourly_rate and calculated installation_cost
//   3. Verify installation_cost = rate * hours_estimate
//   Expected Result: Installation Cost should equal (Installation Hourly Rate * Hours Estimate)
// Returns:
//   {
//     status: string, // 'PASS', 'FAIL', or 'SKIPPED'
//     testName: string, // Name of the test
//     testRow: object, // Information about the tested row
//     values: object, // Test values and results
//     formula: string, // The formula being tested
//     calculation: string, // The specific calculation performed
//     timestamp: string // ISO timestamp of test execution
//   }

console.log('=== TEST: Installation Cost Calculation ===');

// Step 1: Get current data
const tableData = formatDataAsArray(getFilteredPricesheet.data);
const testRow = tableData.find((row) => (row.hours_estimate || 0) > 0);

if (!testRow) {
  return {
    status: 'SKIPPED',
    message: 'No rows with hours_estimate > 0 found to test',
    timestamp: new Date().toISOString() };

}

// Step 2: Get current values
const hoursEstimate = testRow.hours_estimate || 0;
const currentRate = testRow.installation_hourly_rate || 0;
const currentInstallationCost = currentRate * hoursEstimate;

console.log('Test Row:', {
  id: testRow.id,
  partNumber: testRow.part_number,
  hoursEstimate: hoursEstimate,
  currentRate: currentRate,
  expectedInstallationCost: currentInstallationCost });


// Step 3: Calculate expected value
const displayedInstallationCost = currentRate * hoursEstimate;

// Step 4: Verify calculation
const isCorrect = Math.abs(displayedInstallationCost - currentInstallationCost) < 0.01; // Allow for floating point errors

// Step 5: Build test result
const testResult = {
  status: isCorrect ? 'PASS' : 'FAIL',
  testName: 'Installation Cost Calculation',
  testRow: {
    id: testRow.id,
    partNumber: testRow.part_number,
    description: testRow.description },

  values: {
    hoursEstimate: hoursEstimate,
    installationHourlyRate: currentRate,
    expectedInstallationCost: currentInstallationCost,
    calculatedInstallationCost: displayedInstallationCost,
    match: isCorrect },

  formula: 'Installation Cost = Installation Hourly Rate × Hours Estimate',
  calculation: `${currentRate} × ${hoursEstimate} = ${displayedInstallationCost}`,
  timestamp: new Date().toISOString() };


console.log('Test Result:', testResult);

// Display result
if (isCorrect) {
  utils.showNotification({
    title: '✅ TEST PASSED',
    message: `Installation Cost correctly calculated as $${displayedInstallationCost.toFixed(2)}`,
    notificationType: 'success',
    duration: 5 });

} else {
  utils.showNotification({
    title: '❌ TEST FAILED',
    message: `Installation Cost mismatch! Expected: $${currentInstallationCost.toFixed(2)}, Got: $${displayedInstallationCost.toFixed(2)}`,
    notificationType: 'error',
    duration: 5 });

}

return testResult;
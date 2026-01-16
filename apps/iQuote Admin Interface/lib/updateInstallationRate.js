// Documentation:
//   Updates the installation_hourly_rate for ALL records in the pricesheetadminapp table
//   using the value from the numberInputRate component. Triggers the updateHourlyRate query
//   and refreshes the data display.
// Returns:
//   {
//     success: boolean, // Whether the update was successful
//     updatedRate: number, // The new hourly rate that was set
//   }

const newRate = numberInputRate.value;

// Trigger the SQL update query
await updateHourlyRate.trigger();

// Refresh the pricesheet data to show updated values
await getFilteredPricesheet.trigger();

return {
  success: true,
  updatedRate: newRate };
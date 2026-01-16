// Update installation_hourly_rate for ALL records
const newRate = numberInputRate.value;

// Trigger the update query
await updateHourlyRate.trigger();

// Refresh the admin data display
await getAdminData.trigger();

// Refresh the parts inventory table
await getFilteredPricesheet.trigger();

// Show success notification
utils.showNotification({
  title: 'Success',
  message: `Updated installation hourly rate to $${newRate}/hour for all records`,
  notificationType: 'success',
  duration: 4.5 });


return {
  success: true,
  newRate: newRate };
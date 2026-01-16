-- Debug part 153-7865 sell price calculation
SELECT 
  part_number,
  item_cost,
  installation_cost,
  misc_cost,
  gp,
  item_sell,
  hours_estimate,
  installation_hourly_rate
FROM "pricesheetadminapp"
WHERE part_number = '153-7865'
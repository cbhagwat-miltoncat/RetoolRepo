UPDATE "pricesheetadminapp"
SET installation_hourly_rate = {{ numberInputRate.value }},
installation_cost = {{ numberInputRate.value }} * COALESCE(hours_estimate, 0),
  item_sell = (COALESCE(item_cost, 0) + ({{ numberInputRate.value }} * COALESCE(hours_estimate, 0)) + COALESCE(misc_cost, 0)) * (1 + COALESCE(gp, 0) / 100)


UPDATE pricesheetadminapp
SET 
  hours_estimate = COALESCE({{ hours_estimate }}, hours_estimate),
  misc_cost = COALESCE({{ misc_cost }}, misc_cost),
  item_cost = COALESCE({{ item_cost }}, item_cost),
  gp = COALESCE({{ gp }}, gp),
  item_sell = COALESCE({{ item_sell }}, item_sell)
WHERE id = {{ rowId }}
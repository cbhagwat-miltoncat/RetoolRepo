UPDATE "pricesheetadminapp"
SET item_cost = item_cost+((item_cost*{{  editableBulkPriceText2.value}})/100)
where id = any({{ (pricesheetTableData.value) }})
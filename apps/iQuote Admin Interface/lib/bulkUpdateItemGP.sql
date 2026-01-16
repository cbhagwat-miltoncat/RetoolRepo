UPDATE "pricesheetadminapp"
SET gp = gp+((gp*{{  editableBulkPriceText2.value}})/100)
where id = any({{ (pricesheetTableData.value) }})


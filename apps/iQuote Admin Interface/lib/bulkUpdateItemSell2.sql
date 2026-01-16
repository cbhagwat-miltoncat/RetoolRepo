UPDATE "pricesheetDaisy"
SET item_sell = item_sell+((item_sell*{{  editableBulkPriceText2.value}})/100)
where id = any({{ (pricesheetTableData.value) }})
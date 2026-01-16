UPDATE "pricesheetadminapp"
SET item_sell = {{ pricesheetTable.changesetArray[0].item_cost * (1 + pricesheetTable.changesetArray[0].gp)}}
WHERE ID={{ pricesheetTable.changesetArray[0].id }}
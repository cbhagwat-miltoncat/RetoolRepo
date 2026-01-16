select distinct(id) from  "pricesheetadminapp" where description ilike  
  {{'%'+partDescriptionInput.value+'%'}}
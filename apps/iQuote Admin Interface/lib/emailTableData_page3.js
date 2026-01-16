// Format mockEmailData for the inbox table
const rows = {{ mockEmailData_page3.value }} || [];
return rows.map((row) => ({
  id: row.id,
  subject: row.subject,
  from: row.from,
  date: row.date,
  body: row.body }));
// Retool AI-based summary of the selected email
const selected = emailsTable.selectedSourceRow;
if (!selected) {
  utils.showNotification({
    title: 'No email selected',
    message: 'Please select an email in the inbox first.',
    notificationType: 'warning' });

  return null;
}

const prompt = `Summarize the following email in 3-4 concise bullet points, focusing on the key ask, risk, and next steps.\n\nSubject: ${selected.subject}\nFrom: ${selected.from}\nDate: ${selected.date}\n\nBody:\n${selected.body}`;

// For POC: setting a placeholder message
aiGeneratedSummary_page3.setValue(`AI Summary (POC Mode):\n• ${selected.subject}\n• Sender: ${selected.from}\n• Date: ${selected.date}\n\nNote: Connect a Retool AI Query resource for actual AI summaries.`);

return { prompt, emailId: selected.id };
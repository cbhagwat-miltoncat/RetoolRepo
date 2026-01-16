// Documentation:
//   Generates an AI summary of the selected email. This query validates the selection and prepares
//   the prompt. For actual AI functionality, create a separate Retool AI Query resource.
// Returns:
//   {
//     prompt: string // The formatted prompt for the AI query
//   } | null

const selected = emailInboxTable.selectedSourceRow;
if (!selected) {
  utils.showNotification({
    title: 'No email selected',
    message: 'Please select an email in the inbox first.',
    notificationType: 'warning' });

  return null;
}

const prompt = `Summarize the following email in 3-4 concise bullet points, focusing on the key ask, risk, and next steps.\n\nSubject: ${selected.subject}\nFrom: ${selected.from}\nDate: ${selected.date}\n\nBody:\n${selected.body}`;

// Note: To implement actual AI functionality, create a Retool AI Query resource
// and trigger it here with the prompt. For now, setting a placeholder.
aiGeneratedSummary.setValue('AI summary generation requires a Retool AI Query resource to be configured.');

return { prompt };
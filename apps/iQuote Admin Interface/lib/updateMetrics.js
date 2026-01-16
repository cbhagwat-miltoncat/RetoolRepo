// Recalculate metrics based on current total and processed counts
const metrics = emailMetrics.value || { total: 0, processed: 0, pending: 0 };
const pending = Math.max(0, metrics.total - metrics.processed);
emailMetrics.setValue({ ...metrics, pending });

return emailMetrics.value;
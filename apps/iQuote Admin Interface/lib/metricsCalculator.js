// Derive metrics from emailMetrics variable (so future logic can adjust processed/pending)
const base = {{ emailMetrics.value }} || { total: 0, processed: 0, pending: 0 };
return {
  total: base.total,
  processed: base.processed,
  pending: base.pending };
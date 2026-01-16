// Derive metrics from emailMetrics variable
const base = {{ emailMetrics_page3.value }} || { total: 0, processed: 0, pending: 0 };
return {
  total: base.total,
  processed: base.processed,
  pending: base.pending };
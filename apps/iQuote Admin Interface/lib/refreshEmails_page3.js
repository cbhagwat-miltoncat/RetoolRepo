// Reset mockEmailData to initial seed and reset metrics
const seed = [
{ id: 1, subject: 'Customer escalation: delayed shipment', from: 'support@customer.com', date: '2026-01-10 09:15', body: 'Hi team, our order #12345 is delayed by 5 days and the customer is asking for a discount and expedited shipping on future orders...' },
{ id: 2, subject: 'Internal: Q1 renewal opportunities', from: 'sales-manager@company.com', date: '2026-01-11 13:42', body: 'We have 12 major customers up for renewal in Q1. Please review current pricing, margins, and potential upsell opportunities...' },
{ id: 3, subject: 'Vendor price increase notice', from: 'vendor@parts-supplier.com', date: '2026-01-12 08:05', body: 'This is to inform you that starting February 1st, we are increasing prices by 7% on all hydraulic parts SKUs...' }];


mockEmailData_page3.setValue(seed);
emailMetrics_page3.setValue({ total: seed.length, processed: 0, pending: seed.length });
aiGeneratedSummary_page3.setValue('');
postStatus_page3.setValue('Ready to post');

utils.showNotification({
  title: 'Emails refreshed',
  message: 'Mock inbox reset to initial state.',
  notificationType: 'info' });


return { total: seed.length };
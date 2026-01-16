// DEMO: Simple orchestrator - just trigger token fetch
// The onSuccess handler will automatically trigger demoFetchApiData
console.log('🔄 Starting demo workflow...');
await demoGetToken.trigger();
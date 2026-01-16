<Screen
  id="Pricesheet"
  _customShortcuts={[]}
  _hashParams={[]}
  _order={0}
  _searchParams={[]}
  browserTitle=""
  title="Pricesheet"
  urlSlug=""
  uuid="f5474f57-281b-4e34-a32d-55c09cf3a4a1"
>
  <SqlQueryUnified
    id="getFilteredPricesheet"
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/getFilteredPricesheet.sql", "string")}
    resourceDisplayName="retool_db"
    resourceName="4760ca26-4b71-4d97-82f0-120d4d2a03ee"
    resourceTypeOverride=""
    showSuccessToaster={false}
    warningCodes={[]}
  >
    <Event
      id="72b8d763"
      event="success"
      method="run"
      params={{ map: { src: "loadApiDataWithFreshToken.trigger();" } }}
      pluginId=""
      type="script"
      waitMs="0"
      waitType="debounce"
    />
  </SqlQueryUnified>
  <SqlQueryUnified
    id="bulkUpdateItemGP"
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/bulkUpdateItemGP.sql", "string")}
    resourceDisplayName="retool_db"
    resourceName="4760ca26-4b71-4d97-82f0-120d4d2a03ee"
    resourceTypeOverride=""
    runWhenModelUpdates={false}
    showSuccessToaster={false}
    warningCodes={[]}
  >
    <Event
      id="1366eea6"
      event="success"
      method="trigger"
      params={{}}
      pluginId="getFilteredPricesheet"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
  </SqlQueryUnified>
  <SqlQueryUnified
    id="bulkUpdateItemSell2"
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/bulkUpdateItemSell2.sql", "string")}
    resourceName="b55a7b46-1a2b-4b68-a4a5-2e7845d04524"
    runWhenModelUpdates={false}
    showSuccessToaster={false}
    warningCodes={[]}
  >
    <Event
      id="3dee6481"
      event="success"
      method="trigger"
      params={{}}
      pluginId="getFilteredPricesheet"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
  </SqlQueryUnified>
  <SqlQueryUnified
    id="getFilteredPricesheetid"
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/getFilteredPricesheetid.sql", "string")}
    resourceDisplayName="retool_db"
    resourceName="4760ca26-4b71-4d97-82f0-120d4d2a03ee"
    resourceTypeOverride=""
    showSuccessToaster={false}
    warningCodes={[]}
  />
  <SqlQueryUnified
    id="bulkUpdateItemCost"
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/bulkUpdateItemCost.sql", "string")}
    resourceDisplayName="retool_db"
    resourceName="4760ca26-4b71-4d97-82f0-120d4d2a03ee"
    resourceTypeOverride=""
    runWhenModelUpdates={false}
    showSuccessToaster={false}
    warningCodes={[]}
  >
    <Event
      id="c54f3d2c"
      event="success"
      method="trigger"
      params={{}}
      pluginId="getFilteredPricesheet"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
  </SqlQueryUnified>
  <State id="columnSelect" />
  <JavascriptQuery
    id="triggerBulkUpdate"
    notificationDuration={4.5}
    query={include("../lib/triggerBulkUpdate.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <Function
    id="pricesheetTableData"
    funcBody={include("../lib/pricesheetTableData.js", "string")}
  />
  <SqlQueryUnified
    id="pricesheetTableClickActionHandler"
    notificationDuration={4.5}
    query={include("../lib/pricesheetTableClickActionHandler.sql", "string")}
    resourceDisplayName="retool_db"
    resourceName="4760ca26-4b71-4d97-82f0-120d4d2a03ee"
    resourceTypeOverride=""
    runWhenModelUpdates={false}
    showSuccessToaster={false}
    warningCodes={[]}
  />
  <Function
    id="formatChangesSummary"
    funcBody={include("../lib/formatChangesSummary.js", "string")}
  />
  <Function
    id="changesSummaryText"
    funcBody={include("../lib/changesSummaryText.js", "string")}
  />
  <SqlQueryUnified
    id="updateHourlyRate"
    isMultiplayerEdited={false}
    query={include("../lib/updateHourlyRate.sql", "string")}
    resourceDisplayName="retool_db"
    resourceName="4760ca26-4b71-4d97-82f0-120d4d2a03ee"
    resourceTypeOverride=""
    runWhenModelUpdates={false}
    warningCodes={[]}
  />
  <JavascriptQuery
    id="triggerHourlyRateUpdate"
    notificationDuration={4.5}
    query={include("../lib/triggerHourlyRateUpdate.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <SqlQueryUnified
    id="getAdminData"
    notificationDuration={4.5}
    query={include("../lib/getAdminData.sql", "string")}
    resourceDisplayName="retool_db"
    resourceName="4760ca26-4b71-4d97-82f0-120d4d2a03ee"
    resourceTypeOverride=""
    showSuccessToaster={false}
  />
  <JavascriptQuery
    id="saveHourlyRate"
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/saveHourlyRate.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  >
    <Event
      id="f22b8160"
      event="success"
      method="run"
      params={{ map: { src: "testInstallationCost.trigger();" } }}
      pluginId=""
      type="script"
      waitMs="0"
      waitType="debounce"
    />
  </JavascriptQuery>
  <JavascriptQuery
    id="updateAllHourlyRates"
    notificationDuration={4.5}
    query={include("../lib/updateAllHourlyRates.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <JavascriptQuery
    id="triggerHoursEstimateUpdate"
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <SqlQueryUnified
    id="query2"
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    resourceDisplayName="retool_db"
    resourceName="4760ca26-4b71-4d97-82f0-120d4d2a03ee"
    resourceTypeOverride=""
    showSuccessToaster={false}
    showUpdateSetValueDynamicallyToggle={false}
    updateSetValueDynamically={true}
  />
  <JavascriptQuery
    id="query3"
    notificationDuration={4.5}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <SqlQueryUnified
    id="debugPartNumber"
    notificationDuration={4.5}
    query={include("../lib/debugPartNumber.sql", "string")}
    resourceDisplayName="retool_db"
    resourceName="4760ca26-4b71-4d97-82f0-120d4d2a03ee"
    resourceTypeOverride=""
    showSuccessToaster={false}
  />
  <JavascriptQuery
    id="updateInstallationRate"
    notificationDuration={4.5}
    query={include("../lib/updateInstallationRate.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <RESTQuery
    id="getApiData"
    _comment="Fetch parts data from Internal Admin API for Pricesheet"
    bodyFormData={null}
    bodyRaw={null}
    headers={
      '[{"key":"Authorization","value":"Bearer {{ cloudLinkAccessToken.value }}"},{"key":"Tenant","value":"miltoncat"}]'
    }
    query="v2/quotes/local-items"
    resourceDisplayName="CloudLink OAuth Token"
    resourceName="b5d41a2e-30ef-4cce-9cb1-c37a545f17a7"
    resourceTypeOverride=""
    runWhenModelUpdates={false}
  />
  <Function
    id="mergeTableData"
    funcBody={include("../lib/mergeTableData.js", "string")}
  />
  <JavascriptQuery
    id="debugMerge"
    notificationDuration={4.5}
    query={include("../lib/debugMerge.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <JavascriptQuery
    id="updateItemSellAfterSave"
    notificationDuration={4.5}
    query={include("../lib/updateItemSellAfterSave.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <JavascriptQuery
    id="autoSaveRow"
    notificationDuration={4.5}
    query={include("../lib/autoSaveRow.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <SqlQueryUnified
    id="saveSingleRowSQL"
    isMultiplayerEdited={false}
    query={include("../lib/saveSingleRowSQL.sql", "string")}
    resourceName="b55a7b46-1a2b-4b68-a4a5-2e7845d04524"
    runWhenModelUpdates={false}
    warningCodes={[]}
  >
    <Event
      id="3e0b5c89"
      event="success"
      method="trigger"
      params={{}}
      pluginId="getFilteredPricesheet"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
  </SqlQueryUnified>
  <JavascriptQuery
    id="refreshDatabaseFromAPI"
    notificationDuration={4.5}
    query={include("../lib/refreshDatabaseFromAPI.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <Function
    id="compareApiWithDatabase"
    funcBody={include("../lib/compareApiWithDatabase.js", "string")}
  />
  <SqlQueryUnified
    id="submitChangesToAPI"
    _comment="Submit reviewed changes to Internal Admin API with all required fields"
    resourceDisplayName="retool_db"
    resourceName="4760ca26-4b71-4d97-82f0-120d4d2a03ee"
    resourceTypeOverride=""
  >
    <Event
      id="4ad4b836"
      event="success"
      method="run"
      params={{
        map: {
          src: "utils.showNotification({title: 'Success', message: 'Changes submitted to API successfully', notificationType: 'success'}); modalReviewChanges.hide();",
        },
      }}
      pluginId=""
      type="script"
      waitMs="0"
      waitType="debounce"
    />
  </SqlQueryUnified>
  <JavascriptQuery
    id="buildApiPayload"
    notificationDuration={4.5}
    query={include("../lib/buildApiPayload.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <JavascriptQuery
    id="submitChanges"
    notificationDuration={4.5}
    query={include("../lib/submitChanges.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <Function
    id="debugFirstChange"
    funcBody={include("../lib/debugFirstChange.js", "string")}
  />
  <Function
    id="apiPayloadForFirstChange"
    funcBody={include("../lib/apiPayloadForFirstChange.js", "string")}
  />
  <JavascriptQuery
    id="submitAllChanges"
    notificationDuration={4.5}
    query={include("../lib/submitAllChanges.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <JavascriptQuery
    id="revertDatabaseToAPI"
    notificationDuration={4.5}
    query={include("../lib/revertDatabaseToAPI.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <Function
    id="priceChangeSummary"
    funcBody={include("../lib/priceChangeSummary.js", "string")}
  />
  <JavascriptQuery
    id="testInstallationCost"
    notificationDuration={4.5}
    query={include("../lib/testInstallationCost.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <RESTQuery
    id="demoGetToken"
    _comment="DEMO: Get OAuth token using client_credentials"
    body={
      '[{"key":"client_id","value":"063F3009B17B4A0CAEACBC6F9E0276C3"},{"key":"client_secret","value":"691746F18E08444A891F592787F40A796E57DBA17B8A4F06B1C9FAF3220A265F"},{"key":"grant_type","value":"client_credentials"},{"key":"","value":""}]'
    }
    bodyFormData={null}
    bodyRaw={null}
    bodyType="form"
    headers={'[{"key":"Tenant","value":"miltoncat"}]'}
    query="auth/v2/oauth/token"
    resourceDisplayName="CloudLink OAuth Token"
    resourceName="b5d41a2e-30ef-4cce-9cb1-c37a545f17a7"
    resourceTypeOverride=""
    runWhenModelUpdates={false}
    type="POST"
  >
    <Event
      id="1350a5b4"
      event="success"
      method="run"
      params={{
        map: {
          src: "demoAccessToken.setValue(demoGetToken.data.access_token); setTimeout(() => demoFetchApiData.trigger(), 500);",
        },
      }}
      pluginId=""
      type="script"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <RESTQuery
    id="demoFetchApiData"
    _comment="DEMO: Fetch API data using fresh OAuth token"
    bodyFormData={null}
    bodyRaw={null}
    headers={
      '[{"key":"Authorization","value":"Bearer {{ demoAccessToken.value }}"},{"key":"Tenant","value":"miltoncat"}]'
    }
    isMultiplayerEdited={false}
    query="v2/quotes/local-items"
    resourceDisplayName="CloudLink OAuth Token"
    resourceName="b5d41a2e-30ef-4cce-9cb1-c37a545f17a7"
    resourceTypeOverride=""
    runWhenModelUpdates={false}
  >
    <Event
      id="28d32bea"
      event="success"
      method="run"
      params={{
        map: {
          src: "const itemCount = demoFetchApiData.data?.content?.length || 0; utils.showNotification({ title: '✅ Demo Successful!', message: `Fetched ${itemCount} items using fresh OAuth token`, notificationType: 'success', duration: 4 });",
        },
      }}
      pluginId=""
      type="script"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <JavascriptQuery
    id="demoRunWithFreshToken"
    notificationDuration={4.5}
    query={include("../lib/demoRunWithFreshToken.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <State id="demoAccessToken" value="" />
  <Function
    id="filteredItemIds"
    funcBody={include("../lib/filteredItemIds.js", "string")}
  />
  <RESTQuery
    id="getOAuthToken"
    _comment="Get fresh OAuth token for CloudLink API"
    body={
      '[{"key":"grant_type","value":"client_credentials"},{"key":"client_id","value":"063F3009B17B4A0CAEACBC6F9E0276C3"},{"key":"client_secret","value":"691746F18E08444A891F592787F40A796E57DBA17B8A4F06B1C9FAF3220A265F"}]'
    }
    bodyFormData={null}
    bodyRaw={null}
    bodyType="form"
    headers={'[{"key":"","value":""},{"key":"","value":""}]'}
    query="auth/v2/oauth/token"
    resourceDisplayName="CloudLink OAuth Token"
    resourceName="b5d41a2e-30ef-4cce-9cb1-c37a545f17a7"
    runWhenModelUpdates={false}
    type="POST"
  >
    <Event
      id="20177c58"
      event="success"
      method="run"
      params={{
        map: {
          src: "cloudLinkAccessToken.setValue(getOAuthToken.data.access_token); setTimeout(() => getApiData.trigger(), 500);",
        },
      }}
      pluginId=""
      type="script"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <State id="cloudLinkAccessToken" value="" />
  <JavascriptQuery
    id="loadApiDataWithFreshToken"
    notificationDuration={4.5}
    query={include("../lib/loadApiDataWithFreshToken.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <JavascriptQuery
    id="testOAuthTokenRetrieval"
    notificationDuration={4.5}
    query={include("../lib/testOAuthTokenRetrieval.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <JavascriptQuery
    id="testTokenStorage"
    notificationDuration={4.5}
    query={include("../lib/testTokenStorage.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <JavascriptQuery
    id="testApiDataFetch"
    notificationDuration={4.5}
    query={include("../lib/testApiDataFetch.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <JavascriptQuery
    id="testCompleteTokenFlow"
    notificationDuration={4.5}
    query={include("../lib/testCompleteTokenFlow.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <JavascriptQuery
    id="runTokenFlowTestSuite"
    notificationDuration={4.5}
    query={include("../lib/runTokenFlowTestSuite.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <JavascriptQuery
    id="testHourlyRateUpdate"
    notificationDuration={4.5}
    query={include("../lib/testHourlyRateUpdate.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <State
    id="mockEmailData"
    value={
      '[{"id":1,"subject":"Customer escalation: delayed shipment","from":"support@customer.com","date":"2026-01-10 09:15","body":"Hi team, our order #12345 is delayed by 5 days and the customer is asking for a discount and expedited shipping on future orders..."},{"id":2,"subject":"Internal: Q1 renewal opportunities","from":"sales-manager@company.com","date":"2026-01-11 13:42","body":"We have 12 major customers up for renewal in Q1. Please review current pricing, margins, and potential upsell opportunities..."},{"id":3,"subject":"Vendor price increase notice","from":"vendor@parts-supplier.com","date":"2026-01-12 08:05","body":"This is to inform you that starting February 1st, we are increasing prices by 7% on all hydraulic parts SKUs...\n"}]'
    }
  />
  <State id="aiGeneratedSummary" value={'""'} />
  <State id="postStatus" value={'"Ready to post"'} />
  <State
    id="emailMetrics"
    value="{{ {
  total: mockEmailData.value.length,
  processed: 0,
  pending: mockEmailData.value.length
} }}"
  />
  <Function
    id="emailTableData"
    funcBody={include("../lib/emailTableData.js", "string")}
  />
  <Function
    id="metricsCalculator"
    funcBody={include("../lib/metricsCalculator.js", "string")}
  />
  <Function
    id="summaryPreview"
    funcBody={include("../lib/summaryPreview.js", "string")}
  />
  <JavascriptQuery
    id="generateAISummary"
    notificationDuration={4.5}
    query={include("../lib/generateAISummary.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <JavascriptQuery
    id="refreshEmails"
    notificationDuration={4.5}
    query={include("../lib/refreshEmails.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <JavascriptQuery
    id="postToTeams"
    notificationDuration={4.5}
    query={include("../lib/postToTeams.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <JavascriptQuery
    id="resetSummary"
    notificationDuration={4.5}
    query={include("../lib/resetSummary.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <JavascriptQuery
    id="updateMetrics"
    notificationDuration={4.5}
    query={include("../lib/updateMetrics.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <RetoolTableQuery
    id="insertPricingModifiers"
    actionType="INSERT"
    changeset={
      '[{"key":"freight_modifier","value":"1.035"},{"key":"bcp_labor","value":"231"},{"key":"gci_labor","value":"231"},{"key":"measure_up","value":"311"},{"key":"make_up_oil","value":"35"}]'
    }
    notificationDuration={4.5}
    resourceDisplayName="retool_db"
    resourceName="4760ca26-4b71-4d97-82f0-120d4d2a03ee"
    showSuccessToaster={false}
    tableName="pricing_modifiers"
  />
  <RetoolTableQuery
    id="insertPartsCatalog"
    actionType="BULK_INSERT"
    notificationDuration={4.5}
    records="{{ [
  { category: 'Teeth/GET', size_linkage_description: 'Advansys 70 Pen. Plus', part_number: '539-5673', base_price: 74, price_after_freight: 77 },
  { category: 'Teeth/GET', size_linkage_description: 'Advansys 80 Pen. Plus', part_number: '505-4083', base_price: 110, price_after_freight: 114 },
  { category: 'Teeth/GET', size_linkage_description: 'Advansys 90 Pen. Plus', part_number: '505-4097', base_price: 135, price_after_freight: 140 },
  { category: 'Teeth/GET', size_linkage_description: 'Advansys 100 Pen. Plus', part_number: '505-4103', base_price: 175, price_after_freight: 181 },
  { category: 'Teeth/GET', size_linkage_description: 'A100 Heavy Abrasion Tooth', part_number: '505-4011', price_after_freight: 298 },
  { category: 'Teeth/GET', size_linkage_description: 'Advansys 110 Pen. Plus', part_number: '505-4113', base_price: 239, price_after_freight: 247 },
  { category: 'Teeth/GET', size_linkage_description: 'Advansys 130 Pen. Plus', part_number: '597-6033', base_price: 346, price_after_freight: 358 },
  { category: 'Teeth/GET', size_linkage_description: 'Advansys 150 Pen. Plus', part_number: '368-3783', base_price: 546, price_after_freight: 565 },
  { category: 'Teeth/GET', size_linkage_description: 'Advansys 170 Pen. Plus', part_number: '368-3869', base_price: 693, price_after_freight: 717 },
  { category: 'Teeth/GET', size_linkage_description: 'Advansys 200 Pen. Plus', part_number: '368-3878', base_price: 931, price_after_freight: 964 },
  { category: 'Teeth/GET', size_linkage_description: 'Cutting Edge', part_number: '311-6221', price_after_freight: 116 },
  { category: 'Teeth/GET', size_linkage_description: 'Nut', part_number: '8T-4778', price_after_freight: 4 },
  { category: 'Teeth/GET', size_linkage_description: 'Bolt', part_number: '159-2953', price_after_freight: 2 },
  { category: 'Teeth/GET', size_linkage_description: 'Cutting Edge', part_number: '311-9239', price_after_freight: 139 },
  { category: 'Teeth/GET', size_linkage_description: 'Edge', part_number: '118-7110', price_after_freight: 200 },
  { category: 'Teeth/GET', size_linkage_description: 'Bolt', part_number: '3F-5108', price_after_freight: 2 },
  { category: 'Teeth/GET', size_linkage_description: 'Nut', part_number: '4K-0367', price_after_freight: 1 },
  { category: 'Teeth/GET', size_linkage_description: 'Washer', part_number: '8T-4122', price_after_freight: 2 },
  { category: 'Teeth/GET', size_linkage_description: 'Segments (set of 7)', part_number: '100-6667', base_price: 1528, price_after_freight: 1581 },
  { category: 'Teeth/GET', size_linkage_description: 'A90 GD Tooth', part_number: '505-3994', base_price: 133, price_after_freight: 138 },
  { category: 'Pins', size_linkage_description: '300.9 Pins', part_number: '589-8455', price_after_freight: 37 },
  { category: 'Pins', size_linkage_description: '301-302 Pins', part_number: '154-2672', price_after_freight: 81 },
  { category: 'Pins', size_linkage_description: '302.2-302.7 Pins', part_number: '154-2683', price_after_freight: 92 },
  { category: 'Pins', size_linkage_description: '303-304 Pins', part_number: '154-2638', price_after_freight: 103 },
  { category: 'Pins', size_linkage_description: '3T SSL MTG Group', part_number: '249-1145', price_after_freight: 354 },
  { category: 'Pins', size_linkage_description: '305-306 Pins', part_number: '282-2785', price_after_freight: 118 },
  { category: 'Pins', size_linkage_description: '5T SSL MTG Group', part_number: '316-0412', price_after_freight: 489 },
  { category: 'Pins', size_linkage_description: '307-309 Pins', part_number: '308-0324', price_after_freight: 132 },
  { category: 'Pins', size_linkage_description: '310/450 Pins', part_number: '556-3635', price_after_freight: 162 },
  { category: 'Pins', size_linkage_description: 'BHL Pins 415-440', part_number: '178-3593', price_after_freight: 125 },
  { category: 'Pins', size_linkage_description: '311-315F/ A Pins', part_number: '172-8472', base_price: 778, price_after_freight: 805 },
  { category: 'Pins', size_linkage_description: '315/316 Pins', part_number: '172-8473', base_price: 1021, price_after_freight: 1057 },
  { category: 'Pins', size_linkage_description: 'B Linkage Pins', part_number: '172-8444', base_price: 1458, price_after_freight: 1509 },
  { category: 'Pins', size_linkage_description: 'CB Linkage Pins', part_number: '268-4450', base_price: 1958, price_after_freight: 2027 },
  { category: 'Pins', size_linkage_description: 'DB Linkage Pins', part_number: '268-5606', base_price: 2431, price_after_freight: 2516 },
  { category: 'Pins', size_linkage_description: 'TB Linkage Pins', part_number: '512-6169', base_price: 3958, price_after_freight: 4097 },
  { category: 'Pins', size_linkage_description: 'VB Linkage Pins', part_number: '570-6305', base_price: 4819, price_after_freight: 4988 },
  { category: 'Pins', size_linkage_description: 'HB2 Linkage Pins', part_number: '570-6306', base_price: 7292, price_after_freight: 7547 },
  { category: 'Side cutters', size_linkage_description: '311-315 Side cutters', part_number: '380-1203', base_price: 622, price_after_freight: 644 },
  { category: 'Side cutters', size_linkage_description: '317-319 Side cutters', part_number: '380-1204', base_price: 819, price_after_freight: 848 },
  { category: 'Side cutters', size_linkage_description: '320-340 Side cutters', part_number: '357-2698', base_price: 1451, price_after_freight: 1502 },
  { category: 'Side cutters', size_linkage_description: '345-352 Side cutters', part_number: '357-2685', base_price: 2597, price_after_freight: 2688 },
  { category: 'Side cutters', size_linkage_description: '390-395 Side cutters', part_number: '357-2686', base_price: 2611, price_after_freight: 2702 },
  { category: 'Side cutters', size_linkage_description: 'Sidebar Protector GP', part_number: '135-8245', base_price: 549, price_after_freight: 568 },
  { category: 'Side cutters', size_linkage_description: 'Sidebar Protectors X4 320-340', part_number: '357-2691', base_price: 1590, price_after_freight: 1646 },
  { category: 'Side cutters', size_linkage_description: 'Sidebar Protectors X4 349', part_number: '357-2687', price_after_freight: 1639 },
  { category: 'Side cutters', size_linkage_description: 'Sidebar Protectors X4 374-395', part_number: '329-5956', price_after_freight: 2083 }
] }}"
    resourceDisplayName="retool_db"
    resourceName="4760ca26-4b71-4d97-82f0-120d4d2a03ee"
    showSuccessToaster={false}
    tableName="parts_catalog_reference"
  />
  <Include src="./modalReviewChanges.rsx" />
  <Frame
    id="$main"
    enableFullBleed={false}
    isHiddenOnDesktop={false}
    isHiddenOnMobile={false}
    padding="8px 12px"
    type="main"
  >
    <Text
      id="titleText"
      style={{ fontFamily: "h2Font", fontSize: "h2Font", fontWeight: "h2Font" }}
      value="# MiltonCat Pricesheet Manager"
      verticalAlign="center"
    />
    <Container
      id="container2"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      padding="12px"
      showBody={true}
      showHeader={true}
      style={{ border: "surfacePrimaryBorder", borderRadius: "8px" }}
    >
      <Header>
        <Text
          id="containerTitle4"
          value="#### Installation Hourly Rate"
          verticalAlign="center"
        />
      </Header>
      <View id="00030" viewKey="View 1">
        <NumberInput
          id="numberInputRate"
          currency="USD"
          inputValue={0}
          label="Installation Hourly Rate"
          labelPosition="top"
          placeholder="{{ formatDataAsArray(getAdminData.data)[0]?.installation_hourly_rate }}"
          showSeparators={true}
          showStepper={true}
          value="{{ formatDataAsArray(getAdminData.data)[0]?.installation_hourly_rate }}"
        />
        <Button id="buttonSaveRate" text="Save Rate">
          <Event
            id="d2ff1010"
            event="click"
            method="trigger"
            params={{
              map: {
                options: {
                  object: {
                    onSuccess: null,
                    onFailure: null,
                    additionalScope: null,
                  },
                },
              },
            }}
            pluginId="saveHourlyRate"
            type="datasource"
            waitMs="0"
            waitType="debounce"
          />
        </Button>
      </View>
    </Container>
    <Include src="./container3.rsx" />
    <Container
      id="dataContainer"
      footerPadding="4px 12px"
      headerPadding="8px 16px"
      padding="12px 16px"
      showBody={true}
      showHeader={true}
      showHeaderBorder={false}
      style={{ map: { border: "transparent" } }}
    >
      <Header>
        <Text
          id="dataContainerTitle"
          value="### Parts Inventory"
          verticalAlign="center"
        />
        <TextInput
          id="tableSearch"
          iconBefore="bold/interface-search"
          label="Search parts"
          labelPosition="top"
          placeholder="Search by part number, model, vendor, or description"
          showClear={true}
          style={{ map: { borderRadius: "borderRadius" } }}
          tooltipText="Type to quickly search across all parts in the table."
        />
        <EditableText
          id="partDescriptionInput"
          editIcon="bold/interface-edit-write-1"
          inputTooltip="`Enter` to save, `Esc` to cancel"
          label="Filter by description"
          labelPosition="top"
          placeholder="Start typing a part description"
          tooltipText="Filters the pricesheet by part description; press Enter to apply."
        >
          <Event
            id="c2724600"
            event="change"
            method="trigger"
            params={{}}
            pluginId="getFilteredPricesheet"
            type="datasource"
            waitMs="0"
            waitType="debounce"
          />
        </EditableText>
      </Header>
      <View id="00030" viewKey="View 1">
        <Table
          id="pricesheetTable"
          autoColumnWidth={true}
          caseSensitiveFiltering={true}
          cellSelection="none"
          clearChangesetOnSave={true}
          data="{{ mergeTableData.value }}"
          defaultSelectedRow={{ mode: "index", indexType: "display", index: 0 }}
          disableEdits="false"
          emptyMessage="No rows found"
          includeRowInChangesetArray={true}
          primaryKeyColumnId="f2470"
          searchTerm="{{ tableSearch.value }}"
          showBorder={true}
          showFooter={true}
          showHeader={true}
          toolbarPosition="bottom"
        >
          <Column
            id="cbc41"
            alignment="left"
            editable="true"
            format="tag"
            formatOptions={{ automaticColors: true }}
            groupAggregationMode="none"
            hidden="true"
            key="action_type"
            label="Action type"
            placeholder="Select option"
            position="center"
            size={80.9375}
            summaryAggregationMode="none"
            valueOverride="{{ _.startCase(item) }}"
          />
          <Column
            id="ceead"
            alignment="left"
            cellTooltipMode="overflow"
            editableOptions={{ spellCheck: false }}
            format="string"
            groupAggregationMode="none"
            key="part_number"
            label="Part Number"
            placeholder="Enter value"
            position="center"
            size={133.5625}
            summaryAggregationMode="none"
          />
          <Column
            id="9a160"
            alignment="left"
            cellTooltipMode="overflow"
            editableOptions={{ spellCheck: false }}
            format="string"
            formatOptions={{ showSeparators: true, notation: "standard" }}
            groupAggregationMode="sum"
            key="base_model"
            label="Base Model"
            placeholder="Enter value"
            position="center"
            size={82.3125}
            summaryAggregationMode="none"
          />
          <Column
            id="50834"
            alignment="left"
            cellTooltipMode="overflow"
            editableOptions={{ spellCheck: false }}
            format="string"
            groupAggregationMode="none"
            key="description"
            label="Description"
            placeholder="Enter value"
            position="center"
            size={290.625}
            summaryAggregationMode="none"
          />
          <Column
            id="04c29"
            alignment="left"
            format="tag"
            formatOptions={{ automaticColors: true }}
            groupAggregationMode="none"
            key="vendor"
            label="Vendor"
            placeholder="Select option"
            position="center"
            size={56.578125}
            summaryAggregationMode="none"
            valueOverride="{{ _.startCase(item) }}"
          />
          <Column
            id="739ce"
            alignment="left"
            cellTooltipMode="overflow"
            editableOptions={{ spellCheck: false }}
            format="string"
            groupAggregationMode="none"
            key="extra_description"
            label="Additional Details"
            placeholder="Enter value"
            position="center"
            size={143.5625}
            summaryAggregationMode="none"
          />
          <Column
            id="933a3"
            alignment="right"
            backgroundColor="#fffbea"
            cellTooltip="click me to edit"
            cellTooltipMode="custom"
            editable="true"
            editableOptions={{ showStepper: true }}
            format="decimal"
            formatOptions={{ showSeparators: true, notation: "standard" }}
            groupAggregationMode="sum"
            key="hours_estimate"
            label="Hours Estimate"
            placeholder="Enter value"
            position="center"
            referenceId="hours_estimate"
            size={102.265625}
            summaryAggregationMode="none"
          />
          <Column
            id="8831c"
            alignment="right"
            editableOptions={{ showStepper: true }}
            format="currency"
            formatOptions={{
              currency: "USD",
              currencySign: "standard",
              notation: "standard",
              showSeparators: true,
              currencyDisplay: "symbol",
              decimalPlaces: "0",
            }}
            groupAggregationMode="sum"
            key="installation_cost"
            label="Installation cost"
            placeholder="Enter value"
            position="center"
            referenceId="installation_cost"
            size={105.3125}
            summaryAggregationMode="none"
            valueOverride="{{ (currentSourceRow.installation_hourly_rate || 0) * (currentSourceRow.hours_estimate || 0) }}"
          />
          <Column
            id="9da37"
            alignment="right"
            backgroundColor="#fffbea"
            editable="true"
            editableOptions={{ showStepper: true }}
            format="currency"
            formatOptions={{
              currency: "USD",
              currencySign: "standard",
              notation: "standard",
              showSeparators: true,
              currencyDisplay: "symbol",
              decimalPlaces: "0",
            }}
            groupAggregationMode="sum"
            key="misc_cost"
            label="Miscellaneous Cost"
            placeholder="Enter value"
            position="center"
            referenceId="misc_cost"
            size={126.25}
            summaryAggregationMode="none"
          >
            <Event
              id="b038f116"
              event="changeCell"
              method="trigger"
              params={{}}
              pluginId="autoSaveHoursEstimate"
              type="datasource"
              waitMs="0"
              waitType="debounce"
            />
          </Column>
          <Column
            id="01f2e"
            alignment="right"
            backgroundColor="#fffbea"
            cellTooltip="click me to edit"
            cellTooltipMode="custom"
            editable="true"
            editableOptions={{ showStepper: true }}
            format="currency"
            formatOptions={{
              showSeparators: true,
              decimalPlaces: "0",
              currency: "USD",
              currencySign: "standard",
              currencyDisplay: "symbol",
              notation: "standard",
            }}
            groupAggregationMode="sum"
            key="item_cost"
            label="Cost"
            placeholder="Enter value"
            position="center"
            size={79.5}
            summaryAggregationMode="none"
          >
            <Event
              id="d0917f0d"
              event="changeCell"
              method="setValue"
              params={{ map: { value: "" } }}
              pluginId="columnSelect"
              type="state"
              waitMs="0"
              waitType="debounce"
            />
          </Column>
          <Column
            id="f2470"
            alignment="right"
            editable={false}
            editableOptions={{ showStepper: true }}
            format="decimal"
            formatOptions={{ showSeparators: true, notation: "standard" }}
            groupAggregationMode="sum"
            hidden="false"
            key="id"
            label="ID"
            placeholder="Enter value"
            position="center"
            size={30.75}
            summaryAggregationMode="none"
          />
          <Column
            id="275a0"
            alignment="right"
            backgroundColor="#fffbea"
            cellTooltip="click me to edit"
            cellTooltipMode="custom"
            editable="true"
            editableOptions={{ showStepper: true }}
            format="decimal"
            formatOptions={{ showSeparators: true, notation: "standard" }}
            groupAggregationMode="sum"
            key="gp"
            label="Gross Profit"
            placeholder="Enter value"
            position="center"
            size={82.828125}
            statusIndicatorOptions={{
              manualData: [
                { showWhen: "{{ item }}", label: "%", color: "", icon: "" },
              ],
            }}
            summaryAggregationMode="none"
          />
          <Column
            id="82975"
            alignment="right"
            editable="false"
            editableOptions={{ showStepper: true }}
            format="currency"
            formatOptions={{
              currency: "USD",
              currencySign: "standard",
              notation: "standard",
              showSeparators: true,
              currencyDisplay: "symbol",
              decimalPlaces: "0",
            }}
            groupAggregationMode="sum"
            key="item_sell"
            label="Sell Price"
            placeholder="Enter value"
            position="center"
            size={77.625}
            summaryAggregationMode="none"
            valueOverride="{{ ((currentSourceRow.item_cost || 0) + ((currentSourceRow.installation_hourly_rate || 0) * (currentSourceRow.hours_estimate || 0)) + (currentSourceRow.misc_cost || 0)) * (1 + (currentSourceRow.gp || 0) / 100) }}"
          />
          <Column
            id="e8f3b"
            alignment="left"
            format="tag"
            formatOptions={{ automaticColors: true }}
            groupAggregationMode="none"
            hidden="true"
            key="currency_code"
            label="Currency code"
            placeholder="Select option"
            position="center"
            size={99.5}
            summaryAggregationMode="none"
            valueOverride="{{ _.startCase(item) }}"
          />
          <Column
            id="104ab"
            alignment="left"
            format="tag"
            formatOptions={{ automaticColors: true }}
            groupAggregationMode="none"
            key="local_item_status"
            label="Status"
            placeholder="Select option"
            position="center"
            size={52.390625}
            summaryAggregationMode="none"
            valueOverride="{{ _.startCase(item) }}"
          />
          <ToolbarButton
            id="1a"
            icon="bold/interface-text-formatting-filter-2"
            label="Filter"
            type="filter"
          />
          <ToolbarButton
            id="3c"
            icon="bold/interface-download-button-2"
            label="Download"
            type="custom"
          >
            <Event
              id="68ffebfc"
              event="clickToolbar"
              method="exportData"
              pluginId="pricesheetTable"
              type="widget"
              waitMs="0"
              waitType="debounce"
            />
          </ToolbarButton>
          <ToolbarButton
            id="4d"
            icon="bold/interface-arrows-round-left"
            label="Refresh"
            type="custom"
          >
            <Event
              id="55437854"
              event="clickToolbar"
              method="refresh"
              pluginId="pricesheetTable"
              type="widget"
              waitMs="0"
              waitType="debounce"
            />
          </ToolbarButton>
          <Event
            id="d9eb1827"
            event="save"
            method="trigger"
            params={{}}
            pluginId="autoSaveHoursEstimate"
            type="datasource"
            waitMs="0"
            waitType="debounce"
          />
          <Event
            id="4ccad697"
            event="changeCell"
            method="run"
            params={{ map: { src: "autoSaveRow.trigger();" } }}
            pluginId=""
            type="script"
            waitMs="0"
            waitType="debounce"
          />
        </Table>
      </View>
    </Container>
    <Button
      id="buttonRunTests"
      hidden="{{ !current_user.groups.some(g => g.name !== 'admin') }}"
      styleVariant="outline"
      text="🧪 Run Test Suite"
    >
      <Event
        id="737aaf5d"
        event="click"
        method="run"
        params={{ map: { src: "runTokenFlowTestSuite.trigger();" } }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Container
      id="demoContainer"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      hidden="true"
      padding="12px"
      showBody={true}
      showHeader={true}
      style={{ border: "surfacePrimaryBorder", borderRadius: "8px" }}
    >
      <Header>
        <Text
          id="demoContainerTitle"
          value="### Demo Section"
          verticalAlign="center"
        />
      </Header>
      <View id="00030" viewKey="View 1">
        <Button
          id="demoButton"
          text="🔄 Run Demo: Get Fresh Token & Fetch Data"
        >
          <Event
            id="62ef956d"
            event="click"
            method="run"
            params={{ map: { src: "demoRunWithFreshToken.trigger();" } }}
            pluginId=""
            type="script"
            waitMs="0"
            waitType="debounce"
          />
        </Button>
        <Table
          id="demoTable"
          cellSelection="none"
          clearChangesetOnSave={true}
          data="{{ demoFetchApiData.data.content }}"
          defaultSelectedRow={{ mode: "none", indexType: "display", index: 0 }}
          emptyMessage="No rows found"
          enableSaveActions={true}
          primaryKeyColumnId="2e515"
          showBorder={true}
          showFooter={true}
          showHeader={true}
          style={{ rowSeparator: "rgb(226, 232, 240)" }}
          toolbarPosition="bottom"
        >
          <Column
            id="2e515"
            alignment="right"
            editable={false}
            editableOptions={{ showStepper: true }}
            format="decimal"
            formatOptions={{ showSeparators: true, notation: "standard" }}
            groupAggregationMode="sum"
            key="localItemId"
            label="Local item ID"
            placeholder="Enter value"
            position="center"
            size={100}
            summaryAggregationMode="none"
          />
          <Column
            id="19019"
            alignment="right"
            editableOptions={{ showStepper: true }}
            format="percent"
            formatOptions={{ showSeparators: true, notation: "standard" }}
            groupAggregationMode="average"
            key="baseModel"
            label="Base model"
            placeholder="Enter value"
            position="center"
            size={100}
            summaryAggregationMode="none"
          />
          <Column
            id="42c8a"
            alignment="left"
            format="tag"
            formatOptions={{ automaticColors: true }}
            groupAggregationMode="none"
            key="division"
            label="Division"
            placeholder="Select option"
            position="center"
            size={100}
            summaryAggregationMode="none"
            valueOverride="{{ _.startCase(item) }}"
          />
          <Column
            id="85978"
            alignment="left"
            editableOptions={{ spellCheck: false }}
            format="string"
            groupAggregationMode="none"
            key="description"
            label="Description"
            placeholder="Enter value"
            position="center"
            size={100}
            summaryAggregationMode="none"
          />
          <Column
            id="59b78"
            alignment="left"
            editableOptions={{ spellCheck: false }}
            format="string"
            groupAggregationMode="none"
            key="extraDescription"
            label="Extra description"
            placeholder="Enter value"
            position="center"
            size={100}
            summaryAggregationMode="none"
          />
          <Column
            id="fa596"
            alignment="left"
            editableOptions={{ spellCheck: false }}
            format="string"
            groupAggregationMode="none"
            key="partNumber"
            label="Part number"
            placeholder="Enter value"
            position="center"
            size={100}
            summaryAggregationMode="none"
          />
          <Column
            id="4185a"
            alignment="left"
            format="tag"
            formatOptions={{ automaticColors: true }}
            groupAggregationMode="none"
            key="vendor"
            label="Vendor"
            placeholder="Select option"
            position="center"
            size={100}
            summaryAggregationMode="none"
            valueOverride="{{ _.startCase(item) }}"
          />
          <Column
            id="b0542"
            alignment="left"
            editableOptions={{ spellCheck: false }}
            format="string"
            groupAggregationMode="none"
            key="segment"
            label="Segment"
            placeholder="Enter value"
            position="center"
            size={100}
            summaryAggregationMode="none"
          />
          <Column
            id="172d3"
            alignment="left"
            editableOptions={{ spellCheck: false }}
            format="string"
            groupAggregationMode="none"
            key="serviceManagementControlSystem"
            label="Service management control system"
            placeholder="Enter value"
            position="center"
            size={100}
            summaryAggregationMode="none"
          />
          <Column
            id="3f9c1"
            alignment="right"
            editableOptions={{ showStepper: true }}
            format="decimal"
            formatOptions={{ showSeparators: true, notation: "standard" }}
            groupAggregationMode="sum"
            key="costAmount"
            label="Cost amount"
            placeholder="Enter value"
            position="center"
            size={100}
            summaryAggregationMode="none"
          />
          <Column
            id="b1f11"
            alignment="right"
            editableOptions={{ showStepper: true }}
            format="decimal"
            formatOptions={{ showSeparators: true, notation: "standard" }}
            groupAggregationMode="sum"
            key="grossProfitPercent"
            label="Gross profit percent"
            placeholder="Enter value"
            position="center"
            size={100}
            summaryAggregationMode="none"
          />
          <Column
            id="6a41b"
            alignment="right"
            editableOptions={{ showStepper: true }}
            format="decimal"
            formatOptions={{ showSeparators: true, notation: "standard" }}
            groupAggregationMode="sum"
            key="sellAmount"
            label="Sell amount"
            placeholder="Enter value"
            position="center"
            size={100}
            summaryAggregationMode="none"
          />
          <Column
            id="50039"
            alignment="left"
            format="tag"
            formatOptions={{ automaticColors: true }}
            groupAggregationMode="none"
            key="currencyCode"
            label="Currency code"
            placeholder="Select option"
            position="center"
            size={100}
            summaryAggregationMode="none"
            valueOverride="{{ _.startCase(item) }}"
          />
          <Column
            id="ce9ee"
            alignment="right"
            editableOptions={{ showStepper: true }}
            format="decimal"
            formatOptions={{ showSeparators: true, notation: "standard" }}
            groupAggregationMode="sum"
            key="enterXUId"
            label="Enter xu ID"
            placeholder="Enter value"
            position="center"
            size={100}
            summaryAggregationMode="none"
          />
          <Column
            id="ed96e"
            alignment="left"
            format="datetime"
            groupAggregationMode="none"
            key="enterDate"
            label="Enter date"
            placeholder="Enter value"
            position="center"
            size={100}
            summaryAggregationMode="none"
          />
          <Column
            id="fa5e1"
            alignment="right"
            editableOptions={{ showStepper: true }}
            format="decimal"
            formatOptions={{ showSeparators: true, notation: "standard" }}
            groupAggregationMode="sum"
            key="changeXUId"
            label="Change xu ID"
            placeholder="Enter value"
            position="center"
            size={100}
            summaryAggregationMode="none"
          />
          <Column
            id="fb5e4"
            alignment="left"
            format="datetime"
            groupAggregationMode="none"
            key="changeDate"
            label="Change date"
            placeholder="Enter value"
            position="center"
            size={100}
            summaryAggregationMode="none"
          />
          <Column
            id="23119"
            alignment="left"
            format="tag"
            formatOptions={{ automaticColors: true }}
            groupAggregationMode="none"
            key="itemEntryType"
            label="Item entry type"
            placeholder="Select option"
            position="center"
            size={100}
            summaryAggregationMode="none"
            valueOverride="{{ _.startCase(item) }}"
          />
          <Column
            id="398db"
            alignment="left"
            format="tag"
            formatOptions={{ automaticColors: true }}
            groupAggregationMode="none"
            key="localItemStatus"
            label="Local item status"
            placeholder="Select option"
            position="center"
            size={100}
            summaryAggregationMode="none"
            valueOverride="{{ _.startCase(item) }}"
          />
          <ToolbarButton
            id="1a"
            icon="bold/interface-text-formatting-filter-2"
            label="Filter"
            type="filter"
          />
          <ToolbarButton
            id="3c"
            icon="bold/interface-download-button-2"
            label="Download"
            type="custom"
          >
            <Event
              id="ad89ecb4"
              event="clickToolbar"
              method="exportData"
              pluginId="demoTable"
              type="widget"
              waitMs="0"
              waitType="debounce"
            />
          </ToolbarButton>
          <ToolbarButton
            id="4d"
            icon="bold/interface-arrows-round-left"
            label="Refresh"
            type="custom"
          >
            <Event
              id="94727753"
              event="clickToolbar"
              method="refresh"
              pluginId="demoTable"
              type="widget"
              waitMs="0"
              waitType="debounce"
            />
          </ToolbarButton>
        </Table>
      </View>
    </Container>
  </Frame>
</Screen>

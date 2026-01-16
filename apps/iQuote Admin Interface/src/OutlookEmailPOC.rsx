<Screen
  id="OutlookEmailPOC"
  _customShortcuts={[]}
  _hashParams={[]}
  _order={2}
  _searchParams={[]}
  browserTitle={null}
  title="Outlook Email POC"
  urlSlug={null}
  uuid="68b52660-12b3-4383-b63f-11be9e2056fa"
>
  <State
    id="mockEmailData_page3"
    value={
      '[{"id":1,"subject":"Customer escalation: delayed shipment","from":"support@customer.com","date":"2026-01-10 09:15","body":"Hi team, our order #12345 is delayed by 5 days and the customer is asking for a discount and expedited shipping on future orders..."},{"id":2,"subject":"Internal: Q1 renewal opportunities","from":"sales-manager@company.com","date":"2026-01-11 13:42","body":"We have 12 major customers up for renewal in Q1. Please review current pricing, margins, and potential upsell opportunities..."},{"id":3,"subject":"Vendor price increase notice","from":"vendor@parts-supplier.com","date":"2026-01-12 08:05","body":"This is to inform you that starting February 1st, we are increasing prices by 7% on all hydraulic parts SKUs...\n"}]'
    }
  />
  <State id="aiGeneratedSummary_page3" value={'""'} />
  <State id="postStatus_page3" value={'"Ready to post"'} />
  <State
    id="emailMetrics_page3"
    value="{{ {
  total: mockEmailData_page3.value.length,
  processed: 0,
  pending: mockEmailData_page3.value.length
} }}"
  />
  <Function
    id="emailTableData_page3"
    funcBody={include("../lib/emailTableData_page3.js", "string")}
  />
  <Function
    id="metricsCalculator_page3"
    funcBody={include("../lib/metricsCalculator_page3.js", "string")}
  />
  <JavascriptQuery
    id="generateAISummary_page3"
    notificationDuration={4.5}
    query={include("../lib/generateAISummary_page3.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <JavascriptQuery
    id="postToTeams_page3"
    notificationDuration={4.5}
    query={include("../lib/postToTeams_page3.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <JavascriptQuery
    id="refreshEmails_page3"
    notificationDuration={4.5}
    query={include("../lib/refreshEmails_page3.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <JavascriptQuery
    id="query4"
    notificationDuration={4.5}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <connectResource id="query5" _componentId={null} />
  <RESTQuery
    id="query6"
    _additionalScope={[]}
    body={
      '{\n  "type": "AdaptiveCard",\n  "body": [\n    {\n      "type": "TextBlock",\n      "text": "Test from Retool",\n      "weight": "Bolder",\n      "size": "Medium"\n    },\n    {\n      "type": "TextBlock",\n      "text": "Hello! This is a test message from Retool.",\n      "wrap": true\n    }\n  ],\n  "$schema": "http://adaptivecards.io/schemas/adaptive-card.json",\n  "version": "1.4"\n}'
    }
    bodyType="raw"
    query="https://default3e537216fca1463b851aa198584c0b.73.environment.api.powerplatform.com:443/powerautomate/automations/direct/workflows/a7ce1347d2c04d05b8f92cf93a9b2aab/triggers/manual/paths/invoke?api-version=1&sp=%2Ftriggers%2Fmanual%2Frun&sv=1.0&sig=PxW36CI474cZF161tEX3k56FfPIMtHON4PwQxBuvAE0"
    resourceName="25bfd53c-5b6a-41b6-be1c-86e0c14389f8"
    runWhenModelUpdates={false}
    type="POST"
  />
  <Include src="./settingsModal.rsx" />
  <Frame
    id="$main3"
    enableFullBleed={false}
    isHiddenOnDesktop={false}
    isHiddenOnMobile={false}
    padding="8px 12px"
    sticky={null}
    type="main"
  >
    <Text
      id="appTitleText"
      value="# Email to Teams AI Summary POC"
      verticalAlign="center"
    />
    <Button id="refreshButton" styleVariant="outline" text="Refresh">
      <Event
        id="2da335f7"
        event="click"
        method="run"
        params={{ map: { src: "refreshEmails_page3.trigger();" } }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Button id="settingsButton" styleVariant="outline" text="Settings">
      <Event
        id="453b02a8"
        event="click"
        method="run"
        params={{ map: { src: "settingsModal.show();" } }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Container
      id="totalEmailsContainer"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      padding="12px"
      showBody={true}
      style={{ border: "surfacePrimaryBorder", borderRadius: "8px" }}
    >
      <View id="00030" viewKey="View 1">
        <Icon
          id="totalEmailsIcon"
          horizontalAlign="right"
          icon="bold/programming-web-email"
          styleVariant="background"
        />
        <Statistic
          id="totalEmailsStatistic"
          currency="USD"
          decimalPlaces={0}
          label="Total emails"
          labelCaption="Current period"
          positiveTrend="{{ self.value >= 0 }}"
          secondaryCurrency="USD"
          secondaryFormattingStyle="percent"
          secondaryPositiveTrend="{{ self.secondaryValue >= 0 }}"
          secondaryShowSeparators={true}
          showSeparators={true}
          suffix=" emails"
          value="{{ emailMetrics_page3.value.total }}"
        />
      </View>
    </Container>
    <Container
      id="processedEmailsContainer"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      padding="12px"
      showBody={true}
      style={{ border: "surfacePrimaryBorder", borderRadius: "8px" }}
    >
      <View id="00030" viewKey="View 1">
        <Icon
          id="processedEmailsIcon"
          horizontalAlign="right"
          icon="bold/interface-validation-check-circle"
          styleVariant="background"
        />
        <Statistic
          id="processedEmailsStatistic"
          currency="USD"
          label="Processed"
          labelCaption="Total emails processed"
          positiveTrend="{{ self.value >= 0 }}"
          secondaryCurrency="USD"
          secondaryEnableTrend={true}
          secondaryFormattingStyle="percent"
          secondaryPositiveTrend="{{ self.secondaryValue >= 0 }}"
          secondaryShowSeparators={true}
          secondarySignDisplay="trendArrows"
          showSeparators={true}
          suffix="emails"
          value="{{ emailMetrics_page3.value.processed }}"
        />
      </View>
    </Container>
    <Container
      id="pendingEmailsContainer"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      padding="12px"
      showBody={true}
      style={{ border: "surfacePrimaryBorder", borderRadius: "8px" }}
    >
      <View id="00030" viewKey="View 1">
        <Icon
          id="pendingEmailsIcon"
          horizontalAlign="right"
          icon="bold/interface-time-clock-circle"
          styleVariant="background"
        />
        <Statistic
          id="pendingEmailsStatistic"
          currency="USD"
          decimalPlaces={0}
          label="Pending emails"
          labelCaption="Current pending count"
          positiveTrend="{{ self.value >= 0 }}"
          secondaryCurrency="USD"
          secondaryDecimalPlaces={1}
          secondaryFormattingStyle="percent"
          secondaryPositiveTrend="{{ self.secondaryValue >= 0 }}"
          secondaryShowSeparators={true}
          secondarySignDisplay="trendArrows"
          secondaryValue=""
          showSeparators={true}
          value="{{ emailMetrics_page3.value.pending }}"
        />
      </View>
    </Container>
    <Include src="./emailContentContainer.rsx" />
    <Include src="./aiSummaryTeamsContainer.rsx" />
    <Container
      id="emailInboxContainer"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      padding="12px"
      showBody={true}
      showHeader={true}
      style={{ border: "surfacePrimaryBorder", borderRadius: "8px" }}
    >
      <Header>
        <Text
          id="emailInboxTitle"
          value="#### Email Inbox"
          verticalAlign="center"
        />
      </Header>
      <View id="00030" viewKey="View 1">
        <TextInput
          id="emailSearchInput"
          label="Search emails"
          labelPosition="top"
          placeholder="Search by subject, sender, or text"
          showClear={true}
        />
        <Table
          id="emailsTable"
          cellSelection="none"
          clearChangesetOnSave={true}
          data="{{ emailTableData_page3.value }}"
          defaultSelectedRow={{ mode: "none", indexType: "display", index: 0 }}
          emptyMessage="No emails loaded"
          enableSaveActions={true}
          primaryKeyColumnId="990a9"
          rowHeight="medium"
          showBorder={true}
          showFooter={true}
          showHeader={true}
          style={{ rowSeparator: "rgb(226, 232, 240)" }}
          toolbarPosition="bottom"
        >
          <Column
            id="990a9"
            alignment="right"
            format="decimal"
            groupAggregationMode="countDistinct"
            hidden="true"
            key="id"
            label="ID"
            position="center"
            size={80}
            summaryAggregationMode="none"
          />
          <Column
            id="2b5b8"
            alignment="left"
            caption="{{ currentSourceRow.email }}"
            format="avatar"
            groupAggregationMode="none"
            hidden="true"
            key="email"
            label="User"
            position="center"
            referenceId="name"
            size={250}
            summaryAggregationMode="none"
            valueOverride="{{ currentSourceRow.firstName }} {{ currentSourceRow.lastName }}"
          />
          <Column
            id="422ef"
            alignment="left"
            format="tag"
            formatOptions={{ automaticColors: true }}
            groupAggregationMode="none"
            hidden="true"
            key="role"
            label="Role"
            placeholder="Select option"
            position="center"
            size={72}
            summaryAggregationMode="none"
          />
          <Column
            id="dbbf6"
            alignment="left"
            format="boolean"
            groupAggregationMode="none"
            hidden="true"
            key="enabled"
            label="Enabled"
            position="center"
            size={64}
            summaryAggregationMode="none"
          />
          <Column
            id="4c290"
            alignment="left"
            format="date"
            groupAggregationMode="none"
            hidden="true"
            key="createdAt"
            label="Created at"
            position="center"
            size={96}
            summaryAggregationMode="none"
          />
          <Column
            id="bdb36"
            alignment="left"
            cellTooltipMode="overflow"
            format="tags"
            formatOptions={{ automaticColors: true }}
            groupAggregationMode="none"
            hidden="true"
            key="teams"
            label="Teams"
            placeholder="Select options"
            position="center"
            size={260}
            summaryAggregationMode="none"
          />
          <Column
            id="3e743"
            alignment="left"
            format="link"
            groupAggregationMode="none"
            hidden="true"
            key="website"
            label="Website"
            position="center"
            size={200}
            summaryAggregationMode="none"
          />
          <Column
            id="aab59"
            alignment="left"
            cellTooltipMode="overflow"
            format="multilineString"
            groupAggregationMode="none"
            hidden="true"
            key="text"
            label="Bio"
            position="center"
            size={100}
            summaryAggregationMode="none"
          />
          <Column
            id="b6d07"
            alignment="left"
            cellTooltipMode="overflow"
            editableOptions={{ spellCheck: false }}
            format="string"
            groupAggregationMode="none"
            key="subject"
            label="Subject"
            position="center"
            referenceId="subject"
            size={320}
            summaryAggregationMode="none"
          />
          <Column
            id="c76f1"
            alignment="left"
            cellTooltipMode="overflow"
            editableOptions={{ spellCheck: false }}
            format="string"
            groupAggregationMode="none"
            key="from"
            label="From"
            position="center"
            referenceId="from"
            size={220}
            summaryAggregationMode="none"
          />
          <Column
            id="3ba44"
            alignment="left"
            editableOptions={{ spellCheck: false }}
            format="string"
            groupAggregationMode="none"
            key="date"
            label="Date"
            position="center"
            referenceId="date"
            size={160}
            summaryAggregationMode="none"
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
              id="47dda382"
              event="clickToolbar"
              method="exportData"
              pluginId="emailsTable"
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
              id="15ac6b81"
              event="clickToolbar"
              method="refresh"
              pluginId="emailsTable"
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

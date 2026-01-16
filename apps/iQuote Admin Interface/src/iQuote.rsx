<Screen
  id="iQuote"
  _customShortcuts={[]}
  _hashParams={[]}
  _order={1}
  _searchParams={[]}
  browserTitle={null}
  title="iQuote"
  urlSlug={null}
  uuid="8fc4e38d-dcc7-4590-a66d-464c655bbf66"
>
  <RESTQuery
    id="getIquoteMachine"
    query="v2/external-crm/quotes/machines/"
    resourceName="968da204-e630-40ef-bcc6-ce43f4c47f00"
    resourceTypeOverride=""
  />
  <RESTQuery
    id="getPartPrices"
    notificationDuration={4.5}
    query="v2/quotes/local-items"
    resourceName="968da204-e630-40ef-bcc6-ce43f4c47f00"
    resourceTypeOverride=""
    showSuccessToaster={false}
  />
  <Function
    id="filterPartPrices"
    funcBody={include("../lib/filterPartPrices.js", "string")}
  />
  <Function
    id="getPartNumbers"
    funcBody={include("../lib/getPartNumbers.js", "string")}
  />
  <RetoolAIQuery
    id="chatbotCode"
    action="chatResponseGeneration"
    chatInput="{{ textInput1.value }}"
    customTemperature=".7"
    defaultModelInitialized={true}
    model="claude-sonnet-4-5-20250929"
    providerId="retoolAIBuiltIn::anthropic"
    providerName="anthropic"
    resourceDisplayName="retool_ai"
    resourceName="retool_ai"
    systemMessage="You are a helpful assistant. You are a chatbot that responds to priceing and sales data for Catepillar, respond like you work in contracting services. use {{ table1.data }} to look up answers"
  />
  <RetoolAIQuery
    id="query1"
    action="chatResponseGeneration"
    chatInput="{{ textInput1.value }}"
    defaultModelInitialized={true}
    model="claude-sonnet-4-5-20250929"
    notificationDuration={4.5}
    providerId="retoolAIBuiltIn::anthropic"
    providerName="anthropic"
    resourceDisplayName="retool_ai"
    resourceName="retool_ai"
    showSuccessToaster={false}
    systemMessage="You are a helpful assistant. You are a chatbot for the machinery company Catepillar. Use the data in {{ table1.data }} to respond to the users question. the questions should be about pricing of parts and profit."
  />
  <Include src="./Chatbot.rsx" />
  <Include src="./modalFrame1.rsx" />
  <Frame
    id="$main2"
    enableFullBleed={false}
    isHiddenOnDesktop={false}
    isHiddenOnMobile={false}
    padding="8px 12px"
    sticky={null}
    type="main"
  >
    <Select
      id="partSelect"
      data="{{ getPartNumbers.value }}"
      emptyMessage="No options"
      label=""
      labelPosition="top"
      overlayMaxHeight={375}
      placeholder="Select Part Number"
      showClear={true}
      showSelectionIndicator={true}
      values="{{ item }}"
    />
    <TextInput
      id="iquoteTableSearch"
      label=""
      labelPosition="top"
      placeholder="Table Search"
      showClear={true}
    />
    <Icon
      id="chatbotButton"
      horizontalAlign="center"
      icon="line/computer-robot-cyborg"
    >
      <Event
        id="e6bde2b1"
        event="click"
        method="show"
        params={{}}
        pluginId="Chatbot"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Icon>
    <Table
      id="table1"
      actionsOverflowPosition={1}
      autoColumnWidth={true}
      cellSelection="none"
      clearChangesetOnSave={true}
      data="{{ filterPartPrices.value }}"
      defaultFilters={{
        0: {
          id: "d768f",
          columnId: "f2620",
          operator: "=",
          value: "{{ partSelect.value }}",
          disabled: false,
        },
      }}
      defaultSelectedRow={{ mode: "index", indexType: "display", index: 0 }}
      emptyMessage="No rows found"
      enableSaveActions={true}
      rowHeight="medium"
      searchTerm="{{ iquoteTableSearch.value }}"
      showBorder={true}
      showFooter={true}
      showHeader={true}
      toolbarPosition="bottom"
    >
      <Column
        id="f2620"
        alignment="left"
        editableOptions={{ spellCheck: false }}
        format="string"
        groupAggregationMode="none"
        key="partNumber"
        label="Part Number"
        placeholder="Enter value"
        position="center"
        size={0}
        summaryAggregationMode="none"
      />
      <Column
        id="d8223"
        alignment="right"
        editableOptions={{ showStepper: true }}
        format="decimal"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        key="baseModel"
        label="Base Model"
        placeholder="Enter value"
        position="center"
        size={0}
        summaryAggregationMode="none"
      />
      <Column
        id="d6f65"
        alignment="left"
        editableOptions={{ spellCheck: false }}
        format="string"
        groupAggregationMode="none"
        key="description"
        label="Description"
        placeholder="Enter value"
        position="center"
        size={0}
        summaryAggregationMode="none"
      />
      <Column
        id="e5252"
        alignment="left"
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="vendor"
        label="Vendor"
        placeholder="Select option"
        position="center"
        size={0}
        summaryAggregationMode="none"
        valueOverride="{{ _.startCase(item) }}"
      />
      <Column
        id="285e0"
        alignment="left"
        editableOptions={{ spellCheck: false }}
        format="string"
        groupAggregationMode="none"
        key="extraDescription"
        label="Additional Details"
        placeholder="Enter value"
        position="center"
        size={0}
        summaryAggregationMode="none"
      />
      <Column
        id="86e56"
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
        key="costAmount"
        label="Cost"
        placeholder="Enter value"
        position="center"
        size={0}
        summaryAggregationMode="none"
      />
      <Column
        id="a7527"
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
        key="sellAmount"
        label="Sell Price"
        placeholder="Enter value"
        position="center"
        size={0}
        summaryAggregationMode="none"
      />
      <Column
        id="8a207"
        alignment="right"
        editableOptions={{ showStepper: true }}
        format="percent"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="average"
        key="grossProfitPercent"
        label="Gross Profit"
        placeholder="Enter value"
        position="center"
        size={0}
        summaryAggregationMode="none"
        valueOverride="{{ item/100 }}"
      />
      <Column
        id="eb990"
        alignment="left"
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="localItemStatus"
        label="Status"
        placeholder="Select option"
        position="center"
        size={0}
        summaryAggregationMode="none"
        valueOverride="{{ _.startCase(item) }}"
      />
      <Action id="e4543" icon="bold/interface-edit-pencil" label="Action 1" />
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
          id="a218e210"
          event="clickToolbar"
          method="exportData"
          pluginId="table1"
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
          id="4551448e"
          event="clickToolbar"
          method="refresh"
          pluginId="table1"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
      </ToolbarButton>
    </Table>
  </Frame>
</Screen>

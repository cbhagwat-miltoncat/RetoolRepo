<Container
  id="quoteBuilderContainer"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  padding="12px"
  showBody={true}
  showHeader={true}
  style={{ border: "surfacePrimaryBorder", borderRadius: "8px" }}
>
  <Header>
    <Text
      id="quoteBuilderHeaderText"
      value="### Current Quote"
      verticalAlign="center"
    />
  </Header>
  <View id="00030" viewKey="View 1">
    <Table
      id="selectedItemsTable"
      cellSelection="none"
      clearChangesetOnSave={true}
      data="{{ currentQuoteItems.value }}"
      defaultSelectedRow={{ mode: "none", indexType: "display", index: 0 }}
      emptyMessage="No rows found"
      enableSaveActions={true}
      primaryKeyColumnId="a2583"
      rowHeight="medium"
      showBorder={true}
      showFooter={true}
      showHeader={true}
      style={{ rowSeparator: "rgb(226, 232, 240)" }}
      toolbarPosition="bottom"
    >
      <Column
        id="1e4a0"
        alignment="left"
        editableOptions={{ spellCheck: false }}
        format="string"
        groupAggregationMode="none"
        key="type"
        label="Type"
        position="center"
        referenceId="type"
        size={120}
        summaryAggregationMode="none"
      />
      <Column
        id="b34be"
        alignment="left"
        editableOptions={{ spellCheck: false }}
        format="string"
        groupAggregationMode="none"
        key="size"
        label="Size"
        position="center"
        referenceId="size"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="a2583"
        alignment="left"
        editableOptions={{ spellCheck: false }}
        format="string"
        groupAggregationMode="none"
        key="partNumber"
        label="Part Number"
        position="center"
        referenceId="partNumber"
        size={160}
        summaryAggregationMode="none"
      />
      <Column
        id="acd60"
        alignment="right"
        editableOptions={{ showStepper: true }}
        format="currency"
        formatOptions={{
          showSeparators: true,
          decimalPlaces: 2,
          currency: "USD",
          currencySign: "standard",
          currencyDisplay: "symbol",
        }}
        groupAggregationMode="none"
        key="unitPrice"
        label="Unit Price"
        position="center"
        referenceId="unitPrice"
        size={120}
        summaryAggregationMode="none"
      />
      <Column
        id="d7787"
        alignment="right"
        editableOptions={{ showStepper: true }}
        format="decimal"
        formatOptions={{ showSeparators: true }}
        groupAggregationMode="none"
        key="quantity"
        label="Quantity"
        position="center"
        referenceId="quantity"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="9b78c"
        alignment="right"
        editableOptions={{ showStepper: true }}
        format="currency"
        formatOptions={{
          showSeparators: true,
          decimalPlaces: 2,
          currency: "USD",
          currencySign: "standard",
          currencyDisplay: "symbol",
        }}
        groupAggregationMode="none"
        key="lineTotal"
        label="Line Total"
        position="center"
        referenceId="lineTotal"
        size={140}
        summaryAggregationMode="none"
        valueOverride="{{ currentSourceRow.quantity * currentSourceRow.unitPrice }}"
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
          id="35af5170"
          event="clickToolbar"
          method="exportData"
          pluginId="selectedItemsTable"
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
          id="86ecf053"
          event="clickToolbar"
          method="refresh"
          pluginId="selectedItemsTable"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
      </ToolbarButton>
      <Event
        id="badf33be"
        event="clickRow"
        method="run"
        params={{ map: { src: "removePartFromQuote.trigger();" } }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </Table>
    <TextInput
      id="customerNameInput"
      label="Customer Name"
      labelPosition="top"
      placeholder="Enter value"
    />
    <TextInput
      id="customerEmailInput"
      label="Customer Email"
      labelPosition="top"
      placeholder="Enter value"
    />
    <Text
      id="laborOptionsText"
      value="**Labor Costs**"
      verticalAlign="center"
    />
    <Checkbox
      id="installationLaborCheckbox"
      label="Installation Labor"
      labelWidth="100"
    />
    <Checkbox
      id="diagnosticLaborCheckbox"
      label="Diagnostic Labor"
      labelWidth="100"
    />
    <Checkbox id="customLaborCheckbox" label="Custom Labor" labelWidth="100" />
  </View>
</Container>

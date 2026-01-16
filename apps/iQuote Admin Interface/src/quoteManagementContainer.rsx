<Container
  id="quoteManagementContainer"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  padding="12px"
  showBody={true}
  showHeader={true}
  style={{ border: "surfacePrimaryBorder", borderRadius: "8px" }}
>
  <Header>
    <Text
      id="quoteManagementHeaderText"
      value="### Saved Quotes"
      verticalAlign="center"
    />
  </Header>
  <View id="00030" viewKey="View 1">
    <Table
      id="quotesListTable"
      cellSelection="none"
      clearChangesetOnSave={true}
      data="{{ allQuotes.value }}"
      defaultSelectedRow={{ mode: "none", indexType: "display", index: 0 }}
      emptyMessage="No rows found"
      enableSaveActions={true}
      primaryKeyColumnId="c3b21"
      rowHeight="medium"
      showBorder={true}
      showFooter={true}
      showHeader={true}
      style={{ rowSeparator: "rgb(226, 232, 240)" }}
      toolbarPosition="bottom"
    >
      <Column
        id="8f699"
        alignment="left"
        format="datetime"
        formatOptions={{ manageTimeZone: false }}
        groupAggregationMode="none"
        key="createdAt"
        label="Created At"
        position="center"
        referenceId="createdAt"
        size={180}
        summaryAggregationMode="none"
      />
      <Column
        id="60fa8"
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
        key="total"
        label="Total"
        position="center"
        referenceId="total"
        searchMode="disabled"
        size={140}
        sortMode="rawValue"
        summaryAggregationMode="none"
      />
      <Column
        id="c19d8"
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
        key="labor"
        label="Labor"
        position="center"
        referenceId="labor"
        searchMode="disabled"
        size={120}
        sortMode="rawValue"
        summaryAggregationMode="none"
      />
      <Column
        id="3c6ca"
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
        key="subtotal"
        label="Subtotal"
        position="center"
        referenceId="subtotal"
        searchMode="disabled"
        size={120}
        sortMode="rawValue"
        summaryAggregationMode="none"
      />
      <Column
        id="0af15"
        alignment="left"
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="status"
        label="Status"
        position="center"
        referenceId="status"
        size={120}
        summaryAggregationMode="none"
      />
      <Column
        id="b0d69"
        alignment="left"
        cellTooltipMode="overflow"
        format="email"
        groupAggregationMode="none"
        key="customerEmail"
        label="Email"
        position="center"
        referenceId="customerEmail"
        size={220}
        summaryAggregationMode="none"
      />
      <Column
        id="051a2"
        alignment="left"
        cellTooltipMode="overflow"
        editableOptions={{ spellCheck: false }}
        format="string"
        groupAggregationMode="none"
        key="customerName"
        label="Customer Name"
        position="center"
        referenceId="customerName"
        size={200}
        summaryAggregationMode="none"
      />
      <Column
        id="6e6a0"
        alignment="left"
        cellTooltipMode="overflow"
        editableOptions={{ spellCheck: false }}
        format="string"
        groupAggregationMode="none"
        key="quoteNumber"
        label="Quote #"
        position="center"
        referenceId="quoteNumber"
        size={120}
        summaryAggregationMode="none"
      />
      <Column
        id="c3b21"
        alignment="right"
        editableOptions={{ showStepper: true }}
        format="decimal"
        formatOptions={{ showSeparators: false }}
        groupAggregationMode="none"
        hidden="{{ true }}"
        key="id"
        label="ID"
        position="left"
        referenceId="id"
        searchMode="disabled"
        size={80}
        sortMode="rawValue"
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
          id="371e1a7f"
          event="clickToolbar"
          method="exportData"
          pluginId="quotesListTable"
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
          id="22627228"
          event="clickToolbar"
          method="refresh"
          pluginId="quotesListTable"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
      </ToolbarButton>
    </Table>
    <Text id="summaryText" value="**Quote Summary**" verticalAlign="center" />
    <Statistic
      id="subtotalStatistic"
      currency="USD"
      decimalPlaces={2}
      formattingStyle="currency"
      label="Subtotal"
      labelCaption="For selected options"
      padDecimal={true}
      positiveTrend="{{ self.value >= 0 }}"
      secondaryCurrency="USD"
      secondaryDecimalPlaces={0}
      secondaryPositiveTrend="{{ self.secondaryValue >= 0 }}"
      secondaryShowSeparators={true}
      secondaryValue=""
      showSeparators={true}
      value="{{ quoteCalculator.value.subtotal || 0 }}"
    />
    <Statistic
      id="laborStatistic"
      currency="USD"
      decimalPlaces={2}
      formattingStyle="currency"
      label="Labor Costs"
      labelCaption="Current quote"
      padDecimal={true}
      positiveTrend="{{ self.value >= 0 }}"
      secondaryCurrency="USD"
      secondaryFormattingStyle="percent"
      secondaryPositiveTrend="{{ self.secondaryValue >= 0 }}"
      secondaryShowSeparators={true}
      secondaryValue=""
      showSeparators={true}
      value="{{ quoteCalculator.value.labor || 0 }}"
    />
    <Statistic
      id="grandTotalStatistic"
      currency="USD"
      decimalPlaces={2}
      formattingStyle="currency"
      label="Quote Total"
      labelCaption="Current quote total"
      padDecimal={true}
      positiveTrend="{{ self.value >= 0 }}"
      secondaryCurrency="USD"
      secondaryDecimalPlaces={1}
      secondaryFormattingStyle="percent"
      secondaryPositiveTrend="{{ self.secondaryValue >= 0 }}"
      secondaryShowSeparators={true}
      secondarySignDisplay="trendArrows"
      secondaryValue=""
      showSeparators={true}
      value="{{ quoteCalculator.value.total || 0 }}"
    />
    <Button id="newQuoteButton" text="New Quote">
      <Event
        id="e4728614"
        event="click"
        method="run"
        params={{ map: { src: "clearQuote.trigger();" } }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Button id="saveQuoteButton" styleVariant="outline" text="Save Quote">
      <Event
        id="1ccfe6d6"
        event="click"
        method="run"
        params={{ map: { src: "saveQuote.trigger();" } }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Button id="editQuoteButton" styleVariant="outline" text="Edit Quote">
      <Event
        id="77060330"
        event="click"
        method="run"
        params={{ map: { src: "loadQuote.trigger();" } }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Button id="deleteQuoteButton" styleVariant="outline" text="Delete Quote">
      <Event
        id="f02ddb40"
        event="click"
        method="run"
        params={{ map: { src: "deleteQuote.trigger();" } }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </View>
</Container>

<ModalFrame
  id="modalReviewChanges"
  footerPadding="8px 12px"
  headerPadding="8px 12px"
  hidden={true}
  hideOnEscape={true}
  isHiddenOnMobile={true}
  overlayInteraction={true}
  padding="8px 12px"
  showFooter={true}
  showOverlay={true}
  size="large"
>
  <Body>
    <Text
      id="textChangesSummary"
      value="{{ priceChangeSummary.value }}"
      verticalAlign="center"
    />
    <Table
      id="tableChangesSummary"
      cellSelection="none"
      clearChangesetOnSave={true}
      data="{{ compareApiWithDatabase.value }}"
      defaultSelectedRow={{ mode: "none", indexType: "display", index: 0 }}
      emptyMessage="No rows found"
      enableSaveActions={true}
      primaryKeyColumnId="4a508"
      rowHeight="medium"
      showBorder={true}
      showFooter={true}
      showHeader={true}
      style={{ rowSeparator: "rgb(226, 232, 240)" }}
      toolbarPosition="bottom"
    >
      <Column
        id="4a508"
        alignment="right"
        format="decimal"
        groupAggregationMode="countDistinct"
        key="id"
        label="ID"
        position="center"
        size={32}
        summaryAggregationMode="none"
      />
      <Column
        id="45460"
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
        key="newSell"
        label="New Sell"
        position="center"
        referenceId="newSell"
        size={110}
        summaryAggregationMode="none"
        valueOverride="{{ item / 100 }}"
      />
      <Column
        id="29499"
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
        key="oldSell"
        label="Old Sell"
        position="center"
        referenceId="oldSell"
        size={110}
        summaryAggregationMode="none"
        valueOverride="{{ item / 100 }}"
      />
      <Column
        id="20a51"
        alignment="right"
        editableOptions={{ showStepper: true }}
        format="percent"
        formatOptions={{ showSeparators: false }}
        groupAggregationMode="none"
        key="newGp"
        label="New GP %"
        position="center"
        referenceId="newGp"
        size={110}
        summaryAggregationMode="none"
      />
      <Column
        id="f18d1"
        alignment="right"
        editableOptions={{ showStepper: true }}
        format="percent"
        formatOptions={{ showSeparators: false }}
        groupAggregationMode="none"
        key="oldGp"
        label="Old GP %"
        position="center"
        referenceId="oldGp"
        size={110}
        summaryAggregationMode="none"
      />
      <Column
        id="0bf6a"
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
        key="newCost"
        label="New Cost"
        position="center"
        referenceId="newCost"
        size={110}
        summaryAggregationMode="none"
        valueOverride="{{ item / 100 }}"
      />
      <Column
        id="6e75c"
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
        key="oldCost"
        label="Old Cost"
        position="center"
        referenceId="oldCost"
        size={110}
        summaryAggregationMode="none"
        valueOverride="{{ item / 100 }}"
      />
      <Column
        id="6eb2b"
        alignment="left"
        cellTooltipMode="overflow"
        format="multilineString"
        groupAggregationMode="none"
        key="description"
        label="Description"
        position="center"
        referenceId="description"
        size={260}
        summaryAggregationMode="none"
      />
      <Column
        id="d41d9"
        alignment="left"
        cellTooltipMode="overflow"
        editableOptions={{ spellCheck: false }}
        format="string"
        groupAggregationMode="none"
        key="partNumber"
        label="Part Number"
        position="center"
        referenceId="partNumber"
        size={140}
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
          id="2c6dcdb3"
          event="clickToolbar"
          method="exportData"
          pluginId="tableChangesSummary"
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
          id="6aed8e6c"
          event="clickToolbar"
          method="refresh"
          pluginId="tableChangesSummary"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
      </ToolbarButton>
    </Table>
  </Body>
  <Footer>
    <Button id="buttonCancelChanges" styleVariant="outline" text="Cancel">
      <Event
        id="10103690"
        event="click"
        method="run"
        params={{ map: { src: "modalReviewChanges.hide();" } }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Button id="buttonRevertChanges" styleVariant="outline" text="Revert">
      <Event
        id="eb3a939a"
        event="click"
        method="run"
        params={{ map: { src: "revertDatabaseToAPI.trigger();" } }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Button id="buttonSubmitChanges" text="Submit">
      <Event
        id="6304924b"
        event="click"
        method="run"
        params={{ map: { src: "modalReviewChanges.hide();" } }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        id="20ec54b6"
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
        pluginId="submitChangesToAPI"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        id="9220bcdf"
        event="click"
        method="run"
        params={{ map: { src: "submitChangesToAPI.trigger();" } }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        id="3bc57da6"
        event="click"
        method="run"
        params={{
          map: {
            src: "utils.showNotification({title: 'Submitting...', message: 'Sending changes to API'});",
          },
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        id="ecc89539"
        event="click"
        method="run"
        params={{ map: { src: "submitChangesToAPI.trigger();" } }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Footer>
</ModalFrame>

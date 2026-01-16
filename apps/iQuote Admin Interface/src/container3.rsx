<Container
  id="container3"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  padding="12px"
  showBody={true}
  showHeader={true}
>
  <Header>
    <Text id="containerTitle3" value="#### Bulk Edit" verticalAlign="center" />
  </Header>
  <View id="00030" viewKey="View 1">
    <Select
      id="columnBulkEditSelect"
      emptyMessage="No options"
      itemMode="static"
      label="Select Column"
      labelPosition="top"
      overlayMaxHeight={375}
      placeholder="Select an option"
      showSelectionIndicator={true}
      value="Cost"
    >
      <Option id="00030" label="Cost" value="Cost" />
      <Option id="00031" label="Gross Profit" value="GP" />
    </Select>
    <NumberInput
      id="editableBulkPriceText2"
      _validate={true}
      allowNull={true}
      currency="USD"
      customValidation="{{ editableBulkPriceText2.value !== null && editableBulkPriceText2.value !== 0 && editableBulkPriceText2.value >= -10 && editableBulkPriceText2.value <= 10 || 'Between -10 and 10 (excluding 0). ' }}"
      label="Bulk Adjustment %"
      labelPosition="top"
      max={100}
      min={-100}
      placeholder="e.g. 5 for +5% or -3 for -3%"
      showSeparators={true}
      showStepper={true}
      tooltipText="Enter a percentage to adjust selected item sell prices in bulk."
      validationMessage="Please enter a value between -10 and 10 (excluding 0). Example: 5 for +5% or -3 for -3%"
    />
    <Button id="buttonReviewChanges" text="Review Changes">
      <Event
        id="60984f12"
        event="click"
        method="run"
        params={{ map: { src: "modalReviewChanges.show();" } }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Button
      id="bulkSubmit"
      text="Apply bulk {{columnBulkEditSelect.value}} adjustment"
      tooltipText="Apply the percentage adjustment to selected items in the table."
    >
      <Event
        id="c00bf9f4"
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
        pluginId="triggerBulkUpdate"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        id="6d103da8"
        event="click"
        method="confetti"
        params={{}}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Button
      id="buttonRefreshData"
      hidden="true"
      styleVariant="outline"
      text="🔄 Refresh Data (with fresh token)"
    >
      <Event
        id="d765648d"
        event="click"
        method="run"
        params={{ map: { src: "refreshDatabaseFromAPI.trigger();" } }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        id="f1381542"
        event="click"
        method="run"
        params={{ map: { src: "loadApiDataWithFreshToken.trigger();" } }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </View>
</Container>

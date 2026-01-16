<ModalFrame
  id="modalFrame1"
  footerPadding="8px 12px"
  headerPadding="8px 12px"
  hidden={true}
  hideOnEscape={true}
  isHiddenOnMobile={true}
  overlayInteraction={true}
  padding="8px 12px"
  showFooter={true}
  showHeader={true}
  showOverlay={true}
  size="medium"
>
  <Header>
    <Text id="modalTitle1" value="### iQuote Form" verticalAlign="center" />
    <Button
      id="modalCloseButton1"
      ariaLabel="Close"
      horizontalAlign="right"
      iconBefore="bold/interface-delete-1"
      style={{ map: { border: "transparent" } }}
      styleVariant="outline"
    >
      <Event
        id="5704204e"
        event="click"
        method="setHidden"
        params={{ map: { hidden: true } }}
        pluginId="modalFrame1"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Header>
  <Body>
    <Form
      id="form1"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      hidden=""
      initialData="{{ table1.selectedRow }}"
      padding="12px"
      requireValidation={true}
      resetAfterSubmit={true}
      scroll={true}
      showBody={true}
      showFooter={true}
    >
      <Header>
        <Text id="formTitle1" value="#### Form title" verticalAlign="center" />
      </Header>
      <Body>
        <TextInput
          id="partNumberInput"
          formDataKey="partNumber"
          label="Part Number"
          labelPosition="top"
          placeholder="Enter value"
          required={true}
        />
        <NumberInput
          id="baseModelInput"
          currency="USD"
          formDataKey="baseModel"
          inputValue={0}
          label="Base Model"
          labelPosition="top"
          placeholder="Enter value"
          required={true}
          showSeparators={true}
          showStepper={true}
          value={0}
        />
        <TextInput
          id="descriptionInput"
          formDataKey="description"
          label="Description"
          labelPosition="top"
          placeholder="Enter value"
          required={true}
        />
        <Select
          id="vendorInput"
          emptyMessage="No options"
          formDataKey="vendor"
          itemMode="static"
          label="Vendor"
          labelPosition="top"
          labels={null}
          overlayMaxHeight={375}
          placeholder="Select an option"
          required={true}
          showSelectionIndicator={true}
          values={null}
        >
          <Option id="00030" value="Option 1" />
          <Option id="00031" value="Option 2" />
          <Option id="00032" value="Option 3" />
        </Select>
        <TextInput
          id="additionalDetailsInput"
          formDataKey="extraDescription"
          label="Additional Details"
          labelPosition="top"
          placeholder="Enter value"
          required={true}
        />
        <NumberInput
          id="costInput"
          currency="USD"
          format="currency"
          formDataKey="costAmount"
          inputValue={0}
          label="Cost"
          labelPosition="top"
          placeholder="Enter value"
          required={true}
          showSeparators={true}
          showStepper={true}
          value={0}
        />
        <NumberInput
          id="sellPriceInput"
          currency="USD"
          format="currency"
          formDataKey="sellAmount"
          inputValue={0}
          label="Sell Price"
          labelPosition="top"
          placeholder="Enter value"
          required={true}
          showSeparators={true}
          showStepper={true}
          value={0}
        />
        <NumberInput
          id="grossProfitInput"
          currency="USD"
          format="percent"
          formDataKey="grossProfitPercent"
          inputValue={0}
          label="Gross Profit"
          labelPosition="top"
          max={1}
          min={0}
          placeholder="Enter value"
          required={true}
          showSeparators={true}
          showStepper={true}
          value={0}
        />
        <Select
          id="statusInput"
          emptyMessage="No options"
          formDataKey="localItemStatus"
          itemMode="static"
          label="Status"
          labelPosition="top"
          labels={null}
          overlayMaxHeight={375}
          placeholder="Select an option"
          required={true}
          showSelectionIndicator={true}
          values={null}
        >
          <Option id="00030" value="Option 1" />
          <Option id="00031" value="Option 2" />
          <Option id="00032" value="Option 3" />
        </Select>
      </Body>
      <Footer>
        <Button
          id="formButton1"
          submit={true}
          submitTargetId="form1"
          text="Submit"
        />
      </Footer>
    </Form>
  </Body>
</ModalFrame>

<ModalFrame
  id="settingsModal"
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
    <Text
      id="settingsModalTitle"
      value="#### Email to Teams POC Settings"
      verticalAlign="center"
    />
    <Button
      id="closeSettingsButton"
      ariaLabel="Close"
      horizontalAlign="right"
      iconBefore="bold/interface-delete-1"
      style={{ map: { border: "transparent" } }}
      styleVariant="outline"
    >
      <Event
        id="8c640f89"
        event="click"
        method="run"
        params={{ map: { src: "settingsModal.hide();" } }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Header>
  <Body>
    <TextInput
      id="apiKeyInput"
      label="Email API endpoint (optional)"
      labelPosition="top"
      placeholder="https://..."
      showClear={true}
    />
    <TextInput
      id="teamsWebhookInput"
      label="Teams webhook URL (optional)"
      labelPosition="top"
      placeholder="https://..."
      showClear={true}
    />
    <TextInput
      id="emailServerInput"
      label="Email account identifier"
      labelPosition="top"
      placeholder="e.g. support@company.com"
      showClear={true}
    />
    <NumberInput
      id="refreshIntervalInput"
      currency="USD"
      inputValue={0}
      label="Refresh Interval (seconds)"
      labelPosition="top"
      placeholder="Enter value"
      showSeparators={true}
      showStepper={true}
      value={0}
    />
  </Body>
  <Footer>
    <Button id="cancelSettingsButton" styleVariant="outline" text="Cancel">
      <Event
        id="07cd1e4d"
        event="click"
        method="run"
        params={{ map: { src: "settingsModal.hide();" } }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Button id="saveSettingsButton" text="Save Settings" />
  </Footer>
</ModalFrame>

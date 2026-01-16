<DrawerFrame
  id="Chatbot"
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
  width="medium"
>
  <Header>
    <Text id="drawerTitle1" value="### SmartyCat" verticalAlign="center" />
    <Button
      id="drawerCloseButton1"
      ariaLabel="Close"
      horizontalAlign="right"
      iconBefore="bold/interface-delete-1"
      style={{ map: { border: "transparent" } }}
      styleVariant="outline"
    >
      <Event
        id="14cc9876"
        event="click"
        method="setHidden"
        params={{ map: { hidden: true } }}
        pluginId="Chatbot"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Header>
  <Body>
    <TextInput
      id="textInput1"
      label=""
      labelPosition="top"
      placeholder="Ask me anyting about pricing"
    >
      <Event
        id="6f92dc68"
        event="submit"
        method="trigger"
        params={{}}
        pluginId="query1"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </TextInput>
    <Text id="text1" value="{{ query1.data }}" verticalAlign="center" />
  </Body>
</DrawerFrame>

<Container
  id="aiSummaryTeamsContainer"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  padding="12px"
  showBody={true}
  showHeader={true}
  style={{ border: "surfacePrimaryBorder", borderRadius: "8px" }}
>
  <Header>
    <Text
      id="aiSummaryTeamsTitle"
      value="#### AI Summary & Teams"
      verticalAlign="center"
    />
  </Header>
  <View id="00030" viewKey="View 1">
    <Button
      id="generateSummaryButton"
      styleVariant="outline"
      text="Gen Summary"
    >
      <Event
        id="cf4467fc"
        event="click"
        method="run"
        params={{ map: { src: "generateAISummary_page3.trigger();" } }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <TextArea
      id="aiSummaryTextArea"
      autoResize={true}
      label="AI Summary"
      labelPosition="top"
      minLines={2}
      placeholder="Click 'Gen Summary' to generate a summary"
      value="{{ aiGeneratedSummary_page3.value }}"
    />
    <TextInput
      id="teamsChannelInput"
      label="Teams Channel"
      labelPosition="top"
      placeholder="e.g. #customer-escalations"
      showClear={true}
    />
    <Button id="postToTeamsButton" text="Post Teams">
      <Event
        id="6310a54c"
        event="click"
        method="run"
        params={{ map: { src: "postToTeams_page3.trigger();" } }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Text
      id="statusText"
      value="{{ postStatus_page3.value ? `_Status: ${postStatus_page3.value}_` : '_Status: Ready to post_' }}"
      verticalAlign="center"
    />
  </View>
</Container>

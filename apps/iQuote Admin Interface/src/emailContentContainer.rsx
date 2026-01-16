<Container
  id="emailContentContainer"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  padding="12px"
  showBody={true}
  showHeader={true}
  style={{ border: "surfacePrimaryBorder", borderRadius: "8px" }}
>
  <Header>
    <Text
      id="emailContentTitle"
      value="#### Email Content"
      verticalAlign="center"
    />
  </Header>
  <View id="00030" viewKey="View 1">
    <Text
      id="emailSubjectText"
      value="**Subject:** {{ emailsTable.selectedSourceRow?.subject || 'Select an email' }}"
      verticalAlign="center"
    />
    <Text
      id="emailFromText"
      value="**From:** {{ emailsTable.selectedSourceRow?.from || '—' }}"
      verticalAlign="center"
    />
    <Text
      id="emailDateText"
      value="**Date:** {{ emailsTable.selectedSourceRow?.date || '—' }}"
      verticalAlign="center"
    />
    <TextArea
      id="emailBodyTextArea"
      autoResize={true}
      disabled={true}
      label="Email Body"
      labelPosition="top"
      minLines={2}
      placeholder="Enter value"
      value="{{ emailsTable.selectedSourceRow?.body || 'No email selected' }}"
    />
  </View>
</Container>

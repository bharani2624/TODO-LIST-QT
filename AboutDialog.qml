import QtQuick

AboutDialogForm  {
    appVersionText.text: qsTr("Application version: ") + backend.appVersion()
    privacyPolicyTextAreaId.onLinkActivated: {
        Qt.openUrlExternally(link)
    }
}

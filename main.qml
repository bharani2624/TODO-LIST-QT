import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Dialogs
import "qrc:/edit"

ApplicationWindow {
    id: rootId
    visible: true
    width: 360
    height: 640

    Image {

        source: "qrc:/edit/photo-1557682250-33bd709cbe85.jpeg"
        width: parent.width
        height: parent.height

    }

    header: ToolBar {
        ToolButton {
            text: qsTr("☰")
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.verticalCenter: parent.verticalCenter
            onClicked: aboutDialogId.open()
        }
        Text {
            text: pageIndicator.currentIndex === 0 ? qsTr("Tasks") : qsTr("Completed")
            anchors.centerIn: parent
            font.bold: true
        }

        ToolButton {
            text: pageIndicator.currentIndex === 0 ? qsTr("Completed") : qsTr("Tasks")
            anchors.right: parent.right
            anchors.rightMargin: 10
            anchors.verticalCenter: parent.verticalCenter
            onClicked: swipeViewId.setCurrentIndex(pageIndicator.currentIndex === 0 ? 1 : 0)
        }
    }

    Dialog {
        id: aboutDialogId
        contentItem: AboutDialogForm {
            id: aboutContentItemId
            anchors.fill: parent

        }

    }

    SwipeView {
        id: swipeViewId

        currentIndex: pageIndicator.currentIndex
        anchors.fill: parent

        MainPage{
        }

        DonePage {

        }
    }

    PageIndicator {
          id: pageIndicator
          interactive: true
          count: swipeViewId.count
          currentIndex: swipeViewId.currentIndex

          anchors.bottom: parent.bottom
          anchors.horizontalCenter: parent.horizontalCenter
      }

}

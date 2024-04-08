import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
    id: item1
    width: 200
    height: 600
    StackView {
        id: stackView


       }

    ColumnLayout {
        id: column
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width * policyOffset


       Button {
            text: qsTr("Pomodoro")
            background: Rectangle{
            color:"lightblue"}

             // Align to the left
            onClicked: {

                stackView.push(("qrc:/edit/pomodoro.qml"))
                stackView.viewTransition.direction = Transition.Up
            }
        }

        Button {
            background: Rectangle{
            color:"lightblue"}
            text: qsTr("Profile")

          // Align to the left
            onClicked: {
                stackView.push(("qrc:/edit/profile.qml"))
                stackView.viewTransition.direction = Transition.Up
            }
        }
    }
}

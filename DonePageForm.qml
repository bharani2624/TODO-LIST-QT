import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

//import iproapps.besttodolist 1.0

Item {
    width: 400
    height: 400
    property alias doneListView: doneListView

    Text {
        anchors.centerIn: parent
        text: qsTr("You don't have completed tasks yet!")
        visible: !doneListView.count
    }

    ColumnLayout {
        anchors.fill: parent

        ListView {
            id: doneListView
            anchors {left: parent.left; right: parent.right}
            Layout.fillHeight: true
            boundsBehavior: Flickable.StopAtBounds
            highlightRangeMode: ListView.NoHighlightRange
        }
    }
}

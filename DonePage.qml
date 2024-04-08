import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

//import iproapps.besttodolist 1.0

DonePageForm {
    TaskListDelegateModel {
        id: delegateModelId
        visualModel.model: backend.doneTaskModel
        listView: parent.doneListView
    }

    doneListView.model: delegateModelId.visualModel
    doneListView.spacing: 4
}

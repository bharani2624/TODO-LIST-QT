import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQml.Models


MainPageForm {
    toolButton.onClicked: {
        newTaskInputRowId.visible = true;
        toDoTextField.enabled = true;
        toolButton.visible = false;
        toDoTextField.forceActiveFocus();
    }

    TaskListDelegateModel {
        id: delegateModelId
        visualModel.model: backend.newTaskModel
        listView: parent.listView
    }

    listView.model: delegateModelId.visualModel
    listView.spacing: 4

    createTaskButtonId.onClicked: {
        var textValue = toDoTextField.text.trim();
        if (textValue === "")
            return;

        toDoTextField.enabled = false;
        toDoTextField.text = "";
        newTaskInputRowId.visible = false;
        toolButton.visible = true;

        Qt.inputMethod.hide()
        backend.newTask(textValue, colorPickerId.selectedColor);
        listView.positionViewAtBeginning()
    }
}

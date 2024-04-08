import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    visible: true
    width: 360
    height: 640 // Increased height to accommodate the layout
    Image{
    source:"qrc:/edit/photo-1557682250-33bd709cbe85.jpeg"}

    title: "Pomodoro Timer"

    property int totalDurationHours: 2
    property int workDuration: 25 * 60
    property int breakDuration: 5 * 60
    property bool isWorking: true
    property int remainingTime: workDuration
    property bool isRunning: false

    Timer {

        id: timer
        interval: 1000
        running: isRunning
        repeat: true
        onTriggered: {
            if (remainingTime > 0) {
                remainingTime--;
            } else {
                isWorking = !isWorking;
                if (isWorking) {
                    remainingTime = workDuration;
                } else {
                    remainingTime = breakDuration;
                }
            }
        }
    }

    Row {
        anchors.centerIn: parent
        spacing: 100

        Button {



            x: parent.width * -0.9 - width * -0.3
            y: parent.width * 0.8 - width * 0.4

            text: isRunning? "Stop" : "Start"
            onClicked: {
                isRunning = !isRunning;
                if (isRunning) {
                    timer.start();
                } else {
                    timer.stop();
                }
            }
            background: Rectangle {
                implicitWidth: 90
                implicitHeight: 40
                opacity: enabled ? 5 : 0.3


                ColorAnimation {
                    from: "blue"
                    to: "black"
                    duration: 2
                }
                border.color: "#ADD8E6"
                border.width: 10
                radius: 200

            }}
    }

    Text {
        anchors.horizontalCenter: parent
        text: formatTime(remainingTime)
        font.pixelSize: 30
    }

    Row {
        anchors.centerIn: parent
        spacing: 10

        TextField {
            placeholderText: "Work Duration (min)"
            text: (workDuration / 60).toString() // Display current work duration
            onEditingFinished: {
                workDuration = parseInt(text) * 60;
                updateIntervals();
            }
        }

        TextField {
            placeholderText: "Break Duration (min)"
            text: (breakDuration / 60).toString() // Display current break duration
            onEditingFinished: {
                breakDuration = parseInt(text) * 60;
                updateIntervals();
            }
        }
    }

    Row {
        anchors.centerIn: parent
        spacing: 10

        Button {
            text: "Store Input"
            x: parent.width * 1.0 - width * 0.6
            y: parent.width * 0.8 - width * 0.4
            onClicked: {
                // Store the user input for work and break durations
                // Add your storage logic here
            }

            background: Rectangle {
                implicitWidth: 90
                implicitHeight: 40
                opacity: enabled ? 5 : 0.3

                ColorAnimation {
                    from: "blue"
                    to: "black"
                    duration: 2
                }
                border.color: "#ADD8E6"
                border.width: 10
                radius: 200
            }
        }

    }

    function updateIntervals() {
        // Calculate the new intervals based on total duration and work/break durations
        var totalDurationSeconds = totalDurationHours * 3600; // Convert hours to seconds
        var totalIntervals = Math.floor(totalDurationSeconds / (workDuration + breakDuration));

        // Adjust remaining time based on the current session
        remainingTime = isWorking ? workDuration : breakDuration;

        // Output the calculated intervals
        console.log("Total Intervals: " + totalIntervals);
    }

    function formatTime(timeInSeconds) {
        var minutes = Math.floor(timeInSeconds / 60);
        var seconds = timeInSeconds % 60;
        return minutes.toString() + ":" + (seconds < 10 ? "0" : "") + seconds.toString();
    }
}

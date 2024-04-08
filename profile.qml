import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    visible: true
    width: 360
    height: 640
    title: "User Profile"

    Rectangle {
        width: parent.width
        height: parent.height
        color: "#f2f2f2"
        Image {

            source: "qrc:/edit/photo-1557682250-33bd709cbe85.jpeg"
            height:screen.height
        }

        Column {
            spacing: 10
            anchors.centerIn: parent
            width: parent.width * 0.8

            Text {
              id:a1
                text: "User Profile"
                font.bold: true
                font.pixelSize: 20
                color: "#333333"

            }


            Rectangle {
                width: parent.width
                height: 1
                color: "#cccccc"
            }

            Row {
                spacing: 10

                Image {
                    width: 80
                    height: 80
                    source: "user_profile_image.png" // Replace with the user's profile image
                }

                Column {
                    spacing: 5

                    Text {
                        text: "Name:ABD "
                        font.pixelSize: 16
                    }

                    Text {
                        text: "Email:ABD@GMAIL.COM "
                        font.pixelSize: 14
                    }

                    Text {
                        text: "Phone: 9994359099"
                        font.pixelSize: 14
                    }
                }
            }

            Rectangle {
                width: parent.width
                height: 1
                color: "white"
            }




        }
    }

    // Object to store user details
    property var user: {
        name: "John Doe"

    }
}

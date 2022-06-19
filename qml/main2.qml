import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Window 2.12
Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")
    id: mainwindow

    DynamicTableView {
        id: tableview
        height: mainwindow.height - 50
        width: mainwindow.width
        y: 5
        x: 0
        model: myModel
    }

    Rectangle {
        id: abutton
        anchors.top: tableview.bottom
        height: 40
        width: mainwindow.width

        Text {
            text: "Click to Add"
            anchors.fill: parent
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                TableController.AddEntry()
            }
        }
    }
}


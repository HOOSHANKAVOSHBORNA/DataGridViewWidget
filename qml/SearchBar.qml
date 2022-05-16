import QtQuick 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import Qt.labs.settings 1.1
import QtQuick.Controls.Styles 1.4

Rectangle{
    id: recsearch
    color: "transparent"
    border.width: 1.2
    border.color: "white"
    radius: 10

    MouseArea{
        anchors.fill: parent
        hoverEnabled: true
        onEntered: {
            parent.color="#22FFFFFF"
        }
        onExited: {
            parent.color = "transparent"
        }
    }

    TextInput{
        text: "Search"
        padding: 8
        color: "white"
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/

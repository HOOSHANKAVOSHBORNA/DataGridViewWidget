import QtQuick 2.0


Rectangle{
    anchors.fill: parent
    color: "#403d39"
    width: 300
    height: 100
    Rectangle{
        anchors.right: parent.right
        id:recadd

        width: 70
        height: 30
        radius: 3
        property color gradcolor : "#8BC34A"
        gradient: Gradient {
                GradientStop { position: 0.0; color:recadd.gradcolor}
                GradientStop { position: 1.0; color: "#4CAF50" }
            }
        Text {
            id: add
            text: qsTr("Add")
            anchors.centerIn: parent
        }
        MouseArea{
            anchors.fill: parent
            hoverEnabled: true
            onClicked: {
            }
            onEntered: {
                recadd.gradcolor = "#E6EE9C";
            }
            onExited: {
                recadd.gradcolor ="#8BC34A"

        }
    }
   }
    Rectangle{
        anchors.right: recadd.left
        anchors.rightMargin: 10
        id:recquit

        width: 70
        height: 30
        radius: 3
        property color gradcolor : "#F44336"
        gradient: Gradient {
                GradientStop { position: 0.0; color:recquit.gradcolor}
                GradientStop { position: 1.0; color: "#EF9A9A" }
            }
        Text {
            id: quit
            text: qsTr("Quit")
            anchors.centerIn: parent
        }
        MouseArea{
            anchors.fill: parent
            hoverEnabled: true
            onClicked: {
               form.close()
            }
            onEntered: {
                recquit.gradcolor = "#EF9A9A";
            }
            onExited: {
                recquit.gradcolor ="#F44336"

        }
    }
   }

}

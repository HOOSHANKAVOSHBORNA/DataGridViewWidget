/// SearchBar in qml for gridview
import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Controls 1.4
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import Qt.labs.settings 1.1
import QtQuick.Controls.Styles 1.4
import QtQuick.Dialogs 1.2

Rectangle{
    property var namesearch:[]
    Component.onCompleted: {
        function f (){
            for (var i=0 ;i< 3;i++){
                namesearch[i]=false;
            }
        }
    }

    id: recsearch
    color: "transparent"
    border.width: 1.2
    border.color: bordercolor
    radius: 10
    width: 300
    height: 30
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
    Rectangle{


        id:recadd
        anchors.right: parent.right
        width: 50
        height: 30
        radius: 15
        anchors.rightMargin: 1
        anchors.verticalCenter: parent.verticalCenter
        color: "transparent"
        Image {
            id: add
            width: 12
            height: 12
            anchors.centerIn:parent
            source: "qrc:/icon/icons8-triangle-arrow-24.png"
        }

        MouseArea{
            anchors.fill: parent
            hoverEnabled: true
            onClicked: {
                if(menusearch.x===800){
                    inm2.start()
                }else
                    inm1.start()

            }
            onEntered: {
                add.source ="qrc:/icon/icons8-triangle-arrow-241.png"
                recadd.color ="#22FFFFFF"
            }
            onExited: {
                add.source = "qrc:/icon/icons8-triangle-arrow-24.png"
                recadd.color ="transparent"

            }

        }

        NumberAnimation {
            id : inm1
            target: menusearch
            property: "x"
            from: recadd.x -100
            to :800
            duration: 100
            easing.type: Easing.InOutBack
        }
        NumberAnimation {
            id : inm2
            target: menusearch
            property: "x"
            from: 800
            to :recadd.x -100
            duration: 100
            easing.type: Easing.InCirc
        }
    }
    Rectangle{
        id:menusearch
        x:800
        y:recadd.y +32
        visible: true
        radius: 15
        border.width: 1.2

        color: "#88000000"
        width: 150
        height: 200
        ListModel{
            id: listModel
            dynamicRoles: true

            Component.onCompleted: {
                var listcolumn = listrol
                for(var i in listcolumn){
                    var column = listcolumn[i]
                    listModel.append({"name": column, "checked": true})
                }
            }
        }

        ListView {
            id: multiSelectCheckList
            model: listModel
            height: parent.height -100
            width: parent.width
            anchors {
                top: parent.top
                margins: 10
            }

            delegate: CheckBox {
                id: modelCheckBoxes
                checked: model.checked
                text:"<font color=\"white\">"+model.name+"</font>"
                indicator: Rectangle {
                    implicitWidth: 24
                    implicitHeight: 24

                    x: modelCheckBoxes.leftPadding
                    y: parent.height / 2 - height / 2
                    radius: 5
                    border.color: modelCheckBoxes.down ? "#2980b9" : "#2980b9"

                    Text {
                        width: 14
                        height: 14
                        x: 1
                        y: -2
                        text: "✔"
                        font.pointSize: 18
                        color: modelCheckBoxes.down ? "#2980b9" : "#2980b9"
                        visible: modelCheckBoxes.checked
                    }
                }
            }
        }


    }
    TextInput{
        id : input
        height: 36
        text: "Search"
        padding: 8
        color: fontcolor
        anchors.verticalCenter: recadd.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.right: recadd.left
        anchors.rightMargin: 3
        onTextChanged: {
            sampleModel.searchFilter(input.text,namesearch)
        }

        onAccepted: {
            text ="Search"
        }


        onActiveFocusChanged: {
            text = ""
        }



    }

}



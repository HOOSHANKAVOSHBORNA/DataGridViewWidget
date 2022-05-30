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
        id: rectangle
        anchors.right:  recsearch.right
        anchors.rightMargin: 0
        width: 100
        height: 30
        radius: 10
        anchors.verticalCenter: parent.verticalCenter
        color: "transparent"
        border.color: bordercolor
        ComboBox{
            id: combosearch
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.left: parent.left

            onActivated: {
                sampleModel.getNameSearch(currentText)
            }

            model:["ID","Name","Lastname"]
            delegate: ItemDelegate {
                width: combosearch.width *6
                contentItem: Text {
                    text: modelData
                    color: fontcolor
                    font: combosearch.font
                    elide: Text.ElideRight
                    verticalAlignment: Text.AlignVCenter
                }
                highlighted: combosearch.highlightedIndex === index

                background: Rectangle {
                    anchors.fill: parent
                    id:i
                    width: 50
                    color: "transparent"
                    radius: 0


                }
            }

            background: Rectangle {
                anchors.fill: parent
                color: "transparent"
                //border.color: combosearch.pressed ? "#C0C0C0" : bordercolor
                // border.width: combosearch.visualFocus ? 2 : 1
                radius: 0

            }
            contentItem: Text {
                leftPadding: 3
                rightPadding:80

                text: combosearch.displayText
                font: combosearch.font
                color: combosearch.pressed ? "#FFFF00" : fontcolor
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }

            popup: Popup{
                id:popup
                y: combosearch.height - 1
                width: combosearch.width
                height: combosearch.height * 6
                padding: 1
                enter: Transition {
                    NumberAnimation { property: "height"; duration: 1000;from: 0.0; to: combosearch.height * 6 }
                }
                exit: Transition {
                    NumberAnimation { property: "height";duration: 1000 ;from: combosearch.height * 6 ; to: 0.0 }
                }
                background: Rectangle {
                    radius: 5
                    anchors.fill: parent
                    color: "#88000000"
                    border.width: 1
                    border.color:bordercolor
                }
                contentItem: ListView {

                    id: listview

                    implicitHeight: popup.height
                    clip: true
                    model:combosearch.delegateModel
                    currentIndex: combosearch.highlightedIndex
                    interactive: true
                    highlightMoveDuration: 5
                    boundsBehavior: ListView.StopAtBounds
                    highlight: highlight


                    ScrollBar.vertical:ScrollBar {}
                }

            }

            Component {
                id: highlight
                Rectangle {
                    width: 10; height: 20

                    color: "#11FFFFFF"; radius: 0
                    //y: listview.currentItem.y
                    Behavior on y {
                        SpringAnimation {
                            spring: 3
                            damping: 0.2
                        }
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
        anchors.verticalCenter: rectangle.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.right: rectangle.left
        anchors.rightMargin: 3
        onTextChanged: {
            sampleModel.searchFilter(input.text)
        }

        onAccepted: {
            text ="Search"
        }


        onActiveFocusChanged: {
            text = ""
        }



    }

}



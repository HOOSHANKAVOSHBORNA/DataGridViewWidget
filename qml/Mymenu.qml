import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Dialogs 1.2
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls.Styles 1.4
Rectangle {
    property bool  horizontalLinesCheckbox: horzent.checked
    property  bool verticalLinesCheckbox: vertical.checked
    property bool showThirdColumnMenu: lastname.checked
    property bool showTowColumnMenu: name.checked
    property bool showoneColumnMenu: id.checked

    property bool  fitCheckbox: false
    property color colorclom
    radius: 5
    //border.width: 1
    //border.color: bprdercolor
    color: backgroundColor1
    id: menu

    Rectangle{


        id:recadd
        anchors.right: parent.right
        width: 50
        height: 30
        radius: 15
        anchors.rightMargin: 10
        anchors.verticalCenter: parent.verticalCenter
        color: "transparent"
        border.width: 1.2
        border.color: bordercolor
        Image {
            id: add
            width: 25
            height: 25
            anchors.centerIn:parent
            source: "qrc:/icon/icons8-circled-menu-100.png"
        }

        MouseArea{
            anchors.fill: parent
            hoverEnabled: true
            onClicked: {
                if(submenu.x===recadd.x -90){
                    inm2.start()
                }else
                    inm1.start()

            }
            onEntered: {
                add.source ="qrc:/icon/icons8-circled-menu-96.png"
                recadd.color ="#22FFFFFF"
            }
            onExited: {
                add.source = "qrc:/icon/icons8-circled-menu-100.png"
                recadd.color ="transparent"

            }

        }

        NumberAnimation {
            id : inm1
            target: submenu
            property: "x"
            to :recadd.x -90
            duration: 1000
            easing.type: Easing.InOutBack
        }
        NumberAnimation {
            id : inm2
            target: submenu
            property: "x"
            to :recadd.x + 100
            duration: 1000
            easing.type: Easing.InCirc
        }
    }
    Rectangle{
        id:submenu
        x:recadd.x + 100
        y:recadd.y +32
        visible: true
        radius: 15
        border.width: 1.2

        color: "#44000000"
        width: 150
        height: 300

        ColumnLayout {
            CheckBox {
                id : id
                indicator: Rectangle {
                    implicitWidth: 24
                    implicitHeight: 24

                    x: id.leftPadding
                    y: parent.height / 2 - height / 2
                    radius: 5
                    border.color: id.down ? "#2980b9" : "#2980b9"

                    Text {
                        width: 14
                        height: 14
                        x: 1
                        y: -2
                        text: "✔"
                        font.pointSize: 18
                        color: id.down ? "#2980b9" : "#2980b9"
                        visible: id.checked
                    }
                }

                checked: true
                text: "<font color=\"white\">ID</font>"

            }
            CheckBox {
                id : name
                indicator: Rectangle {
                    implicitWidth: 24
                    implicitHeight: 24

                    x: name.leftPadding
                    y: parent.height / 2 - height / 2
                    radius: 5
                    border.color: name.down ? "#2980b9" : "#2980b9"

                    Text {
                        width: 14
                        height: 14
                        x: 1
                        y: -2
                        text: "✔"
                        font.pointSize: 18
                        color: name.down ? "#2980b9" : "#2980b9"
                        visible: name.checked
                    }
                }

                checked: true
                text: "<font color=\"white\">Name</font>"
            }
            CheckBox {
                id : lastname
                indicator: Rectangle {
                    implicitWidth: 24
                    implicitHeight: 24

                    x: lastname.leftPadding
                    y: parent.height / 2 - height / 2
                    radius: 5
                    border.color: lastname.down ? "#2980b9" : "#2980b9"

                    Text {
                        width: 14
                        height: 14
                        x: 1
                        y: -2
                        text: "✔"
                        font.pointSize: 18
                        color: lastname.down ? "#2980b9" : "#2980b9"
                        visible: lastname.checked
                    }
                }

                checked: true
                text: "<font color=\"white\">LastName</font>"
            }
            CheckBox {
                id : horzent
                indicator: Rectangle {
                    implicitWidth: 24
                    implicitHeight: 24

                    x: horzent.leftPadding
                    y: parent.height / 2 - height / 2
                    radius: 5
                    border.color: horzent.down ? "#2980b9" : "#2980b9"

                    Text {
                        width: 14
                        height: 14
                        x: 1
                        y: -2
                        text: "✔"
                        font.pointSize: 18
                        color: horzent.down ? "#2980b9" : "#2980b9"
                        visible: horzent.checked
                    }
                }

                checked: true
                text: "<font color=\"white\">Horizontal lines</font>"
            }
            CheckBox {
                id : vertical
                indicator: Rectangle {
                    implicitWidth: 24
                    implicitHeight: 24

                    x: vertical.leftPadding
                    y: parent.height / 2 - height / 2
                    radius: 5
                    border.color: vertical.down ? "#2980b9" : "#2980b9"

                    Text {
                        width: 14
                        height: 14
                        x: 1
                        y: -2
                        text: "✔"
                        font.pointSize: 18
                        color: vertical.down ? "#2980b9" : "#2980b9"
                        visible: vertical.checked
                    }
                }

                checked: true
                text: "<font color=\"white\">Vertical lines</font>"
            }


        }

    }
    Rectangle{
        id:recrefre
        anchors.right: recadd.left
        anchors.rightMargin: 10
        width: 50
        height: 30
        radius: 15
        anchors.verticalCenter: parent.verticalCenter
        color: "transparent"
        border.width: 1.2
        border.color: bordercolor
        Image {
            id: refresh
            width: 25
            height: 25
            anchors.centerIn:parent
            source: "qrc:/icon/icons8-refresh-100.png"
        }

        MouseArea{
            anchors.fill: parent
            hoverEnabled: true
            onClicked: {
                sampleModel.loadSampel();

            }
            onEntered: {
                refresh.source ="qrc:/icon/icons8-refresh-64.png"
                recrefre.color ="#22FFFFFF"
            }
            onExited: {
                refresh.source = "qrc:/icon/icons8-refresh-100.png"
                recrefre.color ="transparent"

            }

        }


    }
    Rectangle{
        id:recpdf
        anchors.right: recrefre.left
        anchors.rightMargin: 10
        width: 50
        height: 30
        radius: 15
        anchors.verticalCenter: parent.verticalCenter
        color: "transparent"
        border.width: 1.2
        border.color: bordercolor
        Image {
            id: pdf
            width: 25
            height: 25
            anchors.centerIn:parent
            source: "qrc:/icon/icons8-pdf-100_1.png"
        }

        MouseArea{
            anchors.fill: parent
            hoverEnabled: true
            onClicked: {
                sampleModel.onClickedpdf()
                messagepdf.open()

            }
            onEntered: {
                pdf.source ="qrc:/icon/icons8-pdf-80.png"
                recpdf.color ="#22FFFFFF"
            }
            onExited: {
                pdf.source = "qrc:/icon/icons8-pdf-100_1.png"
                recpdf.color ="transparent"

            }

        }


    }
    Rectangle{
        id:recexe
        anchors.right: recpdf.left
        anchors.rightMargin: 10
        width: 50
        height: 30
        radius: 15
        anchors.verticalCenter: parent.verticalCenter
        color: "transparent"
        border.width: 1.2
        border.color: bordercolor
        Image {
            id: exe
            width: 25
            height: 25
            anchors.centerIn:parent
            source: "qrc:/icon/icons8-exe-100.png"
        }

        MouseArea{
            anchors.fill: parent
            hoverEnabled: true
            onClicked: {
             sampleModel.onClickedexel()
            messagecsv.open()

            }
            onEntered: {
                exe.source ="qrc:/icon/icons8-exe-80.png"
                recexe.color ="#22FFFFFF"
            }
            onExited: {
                exe.source = "qrc:/icon/icons8-exe-100.png"
                recexe.color ="transparent"

            }

        }


    }
    SearchBar{
        id:searc
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.right: recexe.left
        anchors.rightMargin:10
        height: 30
        width: 200
        anchors.verticalCenter: parent.verticalCenter
    }
//    Rectangle{
//        id: rectangle
//        anchors.right:  searc.left
//        anchors.rightMargin: 10
//        width: 150
//        height: 30
//        radius: 15
//        anchors.verticalCenter: parent.verticalCenter
//        //anchors.verticalCenter: parent.verticalCenter
//        color: "transparent"
//        border.width: 1.2
//        border.color: bordercolor
//        ComboBox{
//            id: combosearch
//            anchors.verticalCenter: parent.verticalCenter
//            anchors.right: parent.right
//            anchors.left: parent.left

//            onActivated: {
//                    sampleModel.getNameSearch(currentText)
//            }

//            model:["ID","Name","Lastname"]
//            delegate: ItemDelegate {
//                width: combosearch.width *6
//                contentItem: Text {
//                    text: modelData
//                    color: fontcolor

//                   // elide: Text.ElideRight
//                    //verticalAlignment: Text.AlignVCenter
//                }
//                background: Rectangle {
//                    anchors.fill: parent
//                    id:i
//                    width: 50
//                    color: "transparent"
//                    radius: 20


//                }
//            }
//            background: Rectangle {
//                anchors.fill: parent
//                color: "transparent"
//                border.color: combosearch.pressed ? "#C0C0C0" : bordercolor
//                border.width: combosearch.visualFocus ? 2 : 1
//                radius: 30

//            }

//            popup: Popup{
//                id:popup
//                y: combosearch.height - 1
//                width: combosearch.width
//                height: combosearch.height * 6
//                padding: 1
//                enter: Transition {
//                          NumberAnimation { property: "height"; duration: 1000;from: 0.0; to: combosearch.height * 6 }
//                      }
//                exit: Transition {
//                          NumberAnimation { property: "height";duration: 1000 ;from: combosearch.height * 6 ; to: 0.0 }
//                      }
//                background: Rectangle {
//                    radius: 5
//                    anchors.fill: parent
//                    color: "#88000000"
//                    border.width: 1
//                    border.color:bordercolor
//                }
//                contentItem: ListView {

//                    id: listview

//                    implicitHeight: popup.height
//                    clip: true
//                    model:combosearch.delegateModel
//                    currentIndex: combosearch.highlightedIndex
//                    interactive: true
//                    highlightMoveDuration: 5
//                    boundsBehavior: ListView.StopAtBounds
//                    highlight: highlight


//                    ScrollBar.vertical:ScrollBar {}
//                }

//            }

//            Component {
//                  id: highlight
//                  Rectangle {
//                      width: 10; height: 20

//                      color: "#11FFFFFF"; radius: 0
//                      //y: listview.currentItem.y
//                      Behavior on y {
//                          SpringAnimation {
//                              spring: 3
//                              damping: 0.2
//                          }
//                      }
//                  }
//              }
//        }
//    }

            MessageDialog {

                id: messagepdf
                title: "Information"
                text: "creat pdf"
                onAccepted: {
                    Qt.quit()
                }
        }
            MessageDialog {

                id: messagecsv
                title: "Information"
                text: "creat Csv"
                onAccepted: {
                    Qt.quit()
                }
        }





}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/

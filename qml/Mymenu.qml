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

    property bool  fitCheckbox: true
    property color colorclom
    radius: 5
    border.width: 1
    border.color: bprdercolor
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
        border.color: bprdercolor
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
        border.color: bprdercolor
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
                //_loader.reload()

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
        border.color: bprdercolor
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
        border.color: bprdercolor
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
        anchors.right: recexe.left
        anchors.rightMargin: 10
        height: 30
        width: 200
        anchors.verticalCenter: parent.verticalCenter
    }


        Rectangle{
            id:aleert
            anchors.left: parent.left
            anchors.leftMargin: 10
            width: 50
            height: 30
            radius: 15
            anchors.verticalCenter: parent.verticalCenter
            color: "transparent"
            border.width: 1.2
            border.color: bprdercolor
            Image {
                id: row
                width: 25
                height: 25
                anchors.centerIn:parent
                source: "qrc:/icon/icons8-row-100.png"
            }

            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onClicked: {
                    messageDialog.open()

                }
                onEntered: {
                    row.source ="qrc:/icon/icons8-row-96.png"
                    aleert.color ="#22FFFFFF"
                }
                onExited: {
                    row.source = "qrc:/icon/icons8-row-100.png"
                    aleert.color ="transparent"

                }

            }
            MessageDialog {
                id: messageDialog
                title: "Show selected"
                text: dataGridView.currentValue.id + ',' + dataGridView.currentValue.name
                onAccepted: {
                    Qt.quit()
                }
        }



    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/

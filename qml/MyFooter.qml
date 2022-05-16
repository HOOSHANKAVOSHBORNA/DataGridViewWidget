import QtQuick 2.0
import QtQuick.Controls 2.12
Rectangle {
    width: parent.width -1
    height: 50
    color: "#2980b9"
    radius: 5
    Rectangle{
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.top: parent.top
        width: 80
        height: 30
        radius: 15
        //anchors.verticalCenter: parent.verticalCenter
        color: "transparent"
        border.width: 1.2
        border.color: "white"
        ComboBox{
            id: styleSelector
            anchors.fill: parent
            onCurrentIndexChanged: {
                console.log(currentText)
            }
            model: [8,32 ,64,100]
            delegate: ItemDelegate {
                width: styleSelector.width *6
                contentItem: Text {
                    text: modelData
                    color: "#FFFFFF"

                    elide: Text.ElideRight
                    verticalAlignment: Text.AlignVCenter
                }
                background: Rectangle {
                    id:item
                    width: 150
                    color: "transparent"
                    radius: 20


                }
                highlighted: styleSelector.highlightedIndex === index
            }
            background: Rectangle {
                anchors.fill: parent
                color: "transparent"
                border.color: styleSelector.pressed ? "#C0C0C0" : "#FFFFFF"
                border.width: styleSelector.visualFocus ? 2 : 1
                radius: 30
            }

            popup: Popup{
                id:popup
                y: styleSelector.height - 1
                width: styleSelector.width *2
                height: styleSelector.height * 6
                padding: 1

                contentItem: ListView {
                    id: listview
                    implicitHeight: popup.height
                    clip: true
                    model:styleSelector.delegateModel
                    currentIndex: styleSelector.highlightedIndex
                    interactive: true
                    highlightMoveDuration: 0
                    boundsBehavior: ListView.StopAtBounds


                    ScrollBar.vertical:ScrollBar {}
                }
                background: Rectangle {
                    radius: 20
                    color: "#88000000"
                    border.width: 1
                    border.color:"#95A4A8"
                }
            }


        }
    }
    Image {
        id: next
        anchors.right: parent.right
        width: 32
        height: 32

        anchors.rightMargin: 10
        source: "qrc:/icon/icons8-next-page-100(2).png"
        MouseArea{
            hoverEnabled: true
            anchors.fill: parent
            enabled: view.currentIndex < view.count - 1
            onEntered: next.source ="qrc:/icon/icons8-next-page-100(1).png"
            onExited: next.source ="qrc:/icon/icons8-next-page-100(2).png"
            onClicked: view.setCurrentIndex(view.currentIndex +1)

        }
    }
    Label {
        id: lbl
        color: "white"
        anchors.right: next.left
        anchors.rightMargin: 5
        anchors.top: parent.top
        anchors.topMargin: 5
        text:  (view.currentIndex).toString() + "/" + (view.count - 1).toString()
    }
    Image {
        id: prev
        anchors.right: lbl.left
        width: 32
        height: 32

        anchors.rightMargin: 10
        source: "qrc:/icon/icons8-back-to-100(1).png"
        MouseArea{
            enabled: view.currentIndex > 0
            //enabled:
            hoverEnabled: true
            anchors.fill: parent
            onEntered: prev.source ="qrc:/icon/icons8-back-to-100c.png"
            onExited: prev.source ="qrc:/icon/icons8-back-to-100(1).png"
            onClicked: view.setCurrentIndex(view.currentIndex -1)

        }
    }

}

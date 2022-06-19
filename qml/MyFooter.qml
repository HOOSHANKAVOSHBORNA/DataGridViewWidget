import QtQuick 2.0
//import Test 1.0
import QtQuick.Controls 2.12
Rectangle {
    id: rectangle1

    width: parent.width
    height: 50
    color: backgroundColor2
    //radius: 5
    Rectangle{
        id: rectangle
        anchors.left: parent.left
        anchors.leftMargin: 10
        width: 80
        height: 30
        radius: 15
        anchors.verticalCenter: parent.verticalCenter
        //anchors.verticalCenter: parent.verticalCenter
        color: "transparent"
        border.width: 1.2
        border.color: bordercolor
        ComboBox{
            id: styleSelector
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.left: parent.left

            onActivated: {
                samplemodel.getCount(styleSelector.currentText)
                samplemodel.loadcountsampel();
                //console.log(dataGridView.get(12))
            }
            model: [Math.round(samplemodel.rowCount()),Math.round(samplemodel.rowCount()/2),Math.round(samplemodel.rowCount()/4) ,Math.round(samplemodel.rowCount()/8)]
            delegate: ItemDelegate {
                width: styleSelector.width *6
                contentItem: Text {
                    text: modelData
                    color: fontcolor

                   // elide: Text.ElideRight
                    //verticalAlignment: Text.AlignVCenter
                }
                background: Rectangle {
                    anchors.fill: parent
                    id:i
                    width: 50
                    color: "transparent"
                    radius: 20


                }
            }
            background: Rectangle {
                anchors.fill: parent
                color: "transparent"
                border.color: styleSelector.pressed ? "#C0C0C0" : bordercolor
                border.width: styleSelector.visualFocus ? 2 : 1
                radius: 30

            }

            popup: Popup{
                id:popup
                y: styleSelector.height - 1
                width: styleSelector.width *2
                height: styleSelector.height * 6
                padding: 1
                enter: Transition {
                          NumberAnimation { property: "height"; duration: 1000;from: 0.0; to: styleSelector.height * 6 }
                      }
                exit: Transition {
                          NumberAnimation { property: "height";duration: 1000 ;from: styleSelector.height * 6 ; to: 0.0 }
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
                    model:styleSelector.delegateModel
                    currentIndex: styleSelector.highlightedIndex
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

    Image {
        id: next
        anchors.right: parent.right
        width: 32
        height: 32
        anchors.verticalCenter: parent.verticalCenter

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
        color: fontcolor
        anchors.right: next.left
        anchors.rightMargin: 5
        font.pixelSize: fontsize_col
        text:  (view.currentIndex).toString() + "/" + (view.count - 1).toString()
        anchors.verticalCenter: parent.verticalCenter
    }
    Image {
        id: prev
        anchors.right: lbl.left
        width: 32
        height: 32
        anchors.verticalCenter: parent.verticalCenter

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

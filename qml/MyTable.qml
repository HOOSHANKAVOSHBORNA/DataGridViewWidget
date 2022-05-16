import QtQuick 2.12
import Test 1.0
import QtQuick.Controls.Material 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import Qt.labs.settings 1.1
import QtQuick.Controls.Styles 1.4

    Rectangle{
        id: rectangle
        anchors.fill: parent
        //color: "#5c6b73"
        radius: 5
        MyFooter{
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
        }

        SampleModel {
            id: sampleModel

        }

        Settings {

            property alias fit: menu.fitCheckbox
            property alias horizontalLines: menu.horizontalLinesCheckbox
            property alias verticalLines: menu.verticalLinesCheckbox
            property alias showThirdColumnMenu: menu.showThirdColumnMenu
        }

        Component {
            id: hilightComponent
            Rectangle {
                //            property ListView listView: null

                color: "#22FFFFFF"
                radius: 15
                //    visible: (listView != null && listView.currentItem != null)
                y: (ListView.view.currentIndex !== -1)
                   ? ListView.view.currentItem.y : 0

                height: (ListView.view.currentIndex !== -1)
                        ? ListView.view.currentItem.height : 0

                width: ListView.view.width - 16//ListView.view.ScrollBar.horizontal.width

                Behavior on y {
                    SpringAnimation {
                        duration: 300
                        spring: 3
                        damping: 0.2
                    }
                }
            }

        }




        DataGridView {
            id: dataGridView
            width: parent.width
            height: parent.height -70
            anchors.topMargin: 2
            //anchors.fill: parent
            anchors.top: menu.bottom
            anchors.margins: 1

            model: sampleModel

            borderColor: Material.dropShadowColor
            headerBackgroundColor: '#2c3e50'

            fitColumns: menu.fitCheckbox

            horizontalLines: menu.horizontalLinesCheckbox
            verticalLines: menu.verticalLinesCheckbox
            headerSepratorLine: true

            interactive: true
            highlight: hilightComponent
            keyNavigationEnabled: true
            highlightFollowsCurrentItem: false

            onRowClicked: {
                console.log('row clicked', model.id)
            }


            DataGridColumnBinding {
                role: "id"
                title: "Id"
                size: 100

                fillWidth: true
                visible: menu.showoneColumnMenu

            }
            DataGridColumnBinding {
                id: col2
                role: "name"
                title: "Name"
                size: 100
                visible: menu.showTowColumnMenu
            }
            DataGridColumnBinding {
                role: "last_name"
                title: "Last name"
                size: 100
                visible: menu.showThirdColumnMenu
            }
//            DataGridColumnCustom {
//                size: 100
//                title: "Sample custom"
//                getTextEvent: function(model) {
//                    return "%1-%2".arg(model.name).arg(model.last_name)
//                }
//            }

            DataGridColumnDelegate {
                title: "Actiron"
                size: 100
                delegate:Rectangle{
                    anchors.fill: parent
                    color: "transparent"
                    Image {
                        anchors.centerIn: parent
                        width: 20
                        height: 20
                        id: update
                        source: "qrc:/icon/icons8-edit-64.png"
                        MouseArea{
                            anchors.fill: parent
                            hoverEnabled: true
                            onClicked: {
                                console.log("Edit")
                            }
                            onEntered: {
                                update.source = "qrc:/icon/icons8-edit.png"
                            }
                            onExited: {
                                update.source = "qrc:/icon/icons8-edit-64.png"
                            }
                        }
                    }
                    Image {
                        anchors.left:update.right
                        y :5
                        width: 25
                        height: 25
                        //anchors.horizontalCenter: parent.horizontalCenter
                        id: del
                        source: "qrc:/icon/icons8-delete-100.png"
                        MouseArea{
                            hoverEnabled: true
                            anchors.fill: parent
                            onClicked: {
                                console.log("dlete")
                            }
                            onEntered: {
                                del.source = "qrc:/icon/icons8-delete.png"
                            }
                            onExited: {
                                del.source = "qrc:/icon/icons8-delete-100.png"
                            }
                        }
                    }
                }
            }
        }
        Mymenu{
            id:menu
            width: parent.width
            height: 40
            anchors.top: parent.top

        }
        MyFooter{
            anchors.bottom: parent.bottom
            anchors.bottomMargin: -16
        }



    }





/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/

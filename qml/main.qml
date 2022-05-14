import QtQuick 2.12
import Test 1.0
import QtQuick.Controls.Material 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import Qt.labs.settings 1.1
import QtQuick.Controls.Styles 1.4
Item {
    anchors.fill: parent
    Rectangle{
        id: rectangle
        anchors.fill: parent
        //color: "#5c6b73"
        radius: 5

    SampleModel {
        id: sampleModel
    }

    Settings {

        property alias fit: menu.fitCheckbox
        property alias horizontalLines: menu.horizontalLinesCheckbox
        property alias verticalLines: menu.verticalLinesCheckbox
        property alias seprateHeaderLine: menu.seprateHeaderLineCheckbox
        property alias showThirdColumnMenu: menu.showThirdColumnMenu
    }

    Component {
        id: hilightComponent
        Rectangle {
//            property ListView listView: null

            gradient: Gradient {
                   GradientStop { position: 0.0; color: "#284b63" }
                   GradientStop { position: 1.0; color: "#90CAF9" }
               }
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
        height: parent.height -45
        anchors.topMargin: 2
        //anchors.fill: parent
        anchors.top: menu.bottom
        anchors.margins: 9

        model: sampleModel

        borderColor: Material.dropShadowColor
        headerBackgroundColor: '#4C4843'

        fitColumns: menu.fitCheckbox

        horizontalLines: menu.horizontalLinesCheckbox
        verticalLines: menu.verticalLinesCheckbox
        headerSepratorLine: menu.seprateHeaderLineCheckbox

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
        }
        DataGridColumnBinding {
            id: col2
            role: "name"
            title: "Name"
            size: 100
        }
        DataGridColumnBinding {
            role: "last_name"
            title: "Last name"
            size: 100
            visible: menu.showThirdColumnMenu
        }
        DataGridColumnCustom {
            size: 100
            title: "Sample custom"
            getTextEvent: function(model) {
                return "%1-%2".arg(model.name).arg(model.last_name)
            }
        }
        DataGridColumnDelegate {
            title: "Remove button"
            size: 90
            delegate: Button {
               background:Rectangle {
                   implicitWidth: 100
                   implicitHeight: 25
                   border.color: "#888"
                   radius: 10
                   gradient: Gradient {
                          GradientStop { position: 0.0; color: "#F44336" }
                          GradientStop { position: 1.0; color: "#EF9A9A" }
                      }
               }
                text: "Remove"
                anchors.fill:  parent
                onClicked: console.log("Goint to remove ", parent.model.name, parent.model.last_name)
            }
        }
        DataGridColumnDelegate {
            title: "Update button"
            size: 90
            delegate: Button {
               background:Rectangle {
                   implicitWidth: 100
                   implicitHeight: 25
                   border.color: "#888"
                   radius: 10
                   gradient: Gradient {
                          GradientStop { position: 0.0; color: "#3c6e71" }
                          GradientStop { position: 1.0; color: "#90CAF9" }
                      }
               }
                text: "Updata"
                anchors.fill:  parent
                onClicked: console.log("Goint to Add ", parent.model.name, parent.model.last_name)
            }
        }
    }
    Mymenu{
        id:menu
        width: parent.width
        height: 40
        anchors.top: parent.top
        colorclom: col2.color

    }

}

 }

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/

import QtQuick 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.12
import Qt.labs.settings 1.1
import QtQuick.Controls.Styles 1.4
Rectangle{
    id: rectangle
    anchors.fill: parent
    color: backgroundColor1
    radius: 10
    property var listrol: samplemodel.userRoleName



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


//    DataGridView {

//        id: dataGridView
//        width: parent.width
//        height: parent.height -100
//        anchors.topMargin: 2
//        //anchors.fill: parent
//        anchors.top: menu.bottom
//        anchors.margins: 1


//        borderColor: Material.dropShadowColor
//        headerBackgroundColor: backgroundColor1

//        fitColumns: menu.fitCheckbox

//        horizontalLines: menu.horizontalLinesCheckbox
//        verticalLines: menu.verticalLinesCheckbox
//        headerSepratorLine: true

//        interactive: true
//        highlight: hilightComponent
//        keyNavigationEnabled: true
//        highlightFollowsCurrentItem: false

//        onRowClicked: {
//            samplemodel.onClickedcurrentindex(currentIndex)
//            samplemodel.onclickgetid(model.id)

//        }
//         model: samplemodel
//        resources: {
//            var roleList = model.userRoleName
//                    var temp = []
//                    for(var i = 0; i < roleList.length; i++)
//                    {
//                        var role  = roleList[i]
//                        console.log(role)
//                        temp.push(columnC.createObject(dataGridView, { "role": role, "title": role}))
//                    }
//                    return temp
//        }

////        DataGridColumnBinding {
////            role:listrol[0]
////            title: "Name"
////            size: 100
////            visible: menu.showTowColumnMenu
////        }

////        DataGridColumnBinding {
////            role: listrol[2]
////            title: "Last name"
////            size: 100
////            visible: menu.showThirdColumnMenu
////        }
////        DataGridColumnCustom {
////            size: 100
////            title: "Sample custom"
////            getTextEvent: function(model) {
////                return "%1-%2".arg(model.name).arg(model.last_name)
////            }
////        }

////        DataGridColumnDelegate {
////            title: "Actiron"
////            size: 100
////            delegate:Rectangle{
////                anchors.fill: parent
////                color: "transparent"
////                Image {
////                    anchors.centerIn: parent
////                    width: 20
////                    height: 20
////                    id: update
////                    source: "qrc:/icon/icons8-edit-64.png"
////                    MouseArea{
////                        anchors.fill: parent
////                        hoverEnabled: true
////                        onClicked: {
////                            console.log("Edit")
////                        }
////                        onEntered: {
////                            update.source = "qrc:/icon/icons8-edit.png"
////                        }
////                        onExited: {
////                            update.source = "qrc:/icon/icons8-edit-64.png"
////                        }
////                    }
////                }
////                Image {
////                    anchors.left:update.right
////                    y :5
////                    width: 25
////                    height: 25
////                    //anchors.horizontalCenter: parent.horizontalCenter
////                    id: del
////                    source: "qrc:/icon/icons8-delete-100.png"
////                    MouseArea{
////                        hoverEnabled: true
////                        anchors.fill: parent
////                        onClicked: {
////                            console.log("dlete")
////                        }
////                        onEntered: {
////                            del.source = "qrc:/icon/icons8-delete.png"
////                        }
////                        onExited: {
////                            del.source = "qrc:/icon/icons8-delete-100.png"
////                        }
////                    }
////                }
////            }
////        }
    //}
    Mymenu{
        id:menu
        width: parent.width
        height: 40
        anchors.topMargin: 10
        anchors.top: parent.top

    }
    TableView {
        id: tableView
        height: parent.height -100
        width: parent.width
        anchors.bottom: footer.top
        anchors.bottomMargin: 0
        anchors.top: menu.bottom
        anchors.topMargin: 0

        columnWidthProvider: function (column) { return rectangle.width / table_model.columnCount(); }
        rowHeightProvider: function (column) { return 60; }
            leftMargin: rowsHeader.implicitWidth
            topMargin: columnsHeader.implicitHeight
            model: table_model
            ScrollBar.horizontal: ScrollBar{}
            ScrollBar.vertical: ScrollBar{}
            delegate: Rectangle {
                color: "transparent"

                Text {
                    text: display
                    anchors.fill: parent
                    anchors.margins: 10
                    color: fontcolor
                    font.pixelSize: 15
                    verticalAlignment: Text.AlignVCenter
                }
            }


            Row {
                id: columnsHeader
                y: tableView.contentY
                z: 2
                Repeater {
                    model: tableView.columns > 0 ? tableView.columns : 1
                    Label {
                        width: rectangle.width / table_model.columnCount()
                        height: 35
                        text: table_model.headerData(modelData, Qt.Horizontal)
                        color: '#aaaaaa'
                        font.pixelSize: 15
                        padding: 10
                        verticalAlignment: Text.AlignVCenter

                        background: Rectangle { color: "transparent" }
                    }
                }
            }
            Column {
                id: rowsHeader
                x: tableView.contentX
                z: 2
                Repeater {
                    Label {
                        width: 60
                        height: tableView.rowHeightProvider(modelData)
                        text: table_model.headerData(modelData, Qt.Vertical)
                        color: '#aaaaaa'
                        font.pixelSize: 15
                        padding: 10
                        verticalAlignment: Text.AlignVCenter

                        background: Rectangle { color: "#333333" }
                    }
                }
            }

            ScrollIndicator.horizontal: ScrollIndicator { }
            ScrollIndicator.vertical: ScrollIndicator { }
        }


    MyFooter{
        id : footer
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
    }



}





/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/

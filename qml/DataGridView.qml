import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import QtQml.Models 2.12

ListView {
    id: root

    //apreance properties
    property color borderColor: Ui.getBordercolor()
    property color headerBackgroundColor: 'red'

    property bool horizontalLines: true
    property bool verticalLines: true
    property bool headerSepratorLine: horizontalLines
    property bool fitColumns: true

    // signals
    signal rowClicked(var model)
    signal rowDoubleClicked(var model)

    default property list<DataGridColumnBase> columns

    property DataGridHeader headerRow: null
    property var currentValue: currentIndex === -1
                               ? null
                               : currentItem._model
    onColumnsChanged: {
        for (var i = 0; i < columns; i++)
            widthModel.append({size: -1})
    }

    displayMarginBeginning: 150

    boundsBehavior: Flickable.StopAtBounds

    Rectangle {
        anchors.fill: parent
        gradient:
            Gradient {
               GradientStop { position: 0.0; color: backgroundColor1}
               GradientStop { position: 1.0; color: backgroundColor2 }
           }
        //border.color: borderColor
        //border.width: 1
        //radius: 5
        z: -1
    }

    ScrollBar.vertical: ScrollBar{
        id: verticalScrollBar
        policy: ScrollBar.AlwaysOn
            contentItem: Rectangle {
                implicitWidth: 6
                color: backgroundColor1
                radius: 10
            }

    }
    ScrollBar.horizontal: ScrollBar{
        id: horizontalScrollBar
        policy: ScrollBar.AsNeeded
            contentItem: Rectangle {
                implicitWidth: 6
                color: backgroundColor1
                radius: 10
            }
    }
/////
    Rectangle {
        anchors.fill: parent
        border.color: borderColor
        border.width: 1
        color: 'transparent'
        z:  0
        visible: false
    }

    headerPositioning: ListView.OverlayHeader
    header: DataGridHeader {
        id: _headerRow2
        width: parent.width - verticalScrollBar.width
        //                        anchors.left: parent.left
        //                        anchors.right: parent.right
        //                        anchors.top: parent.top
        columns: root.columns

        fitColumn: root.fitColumns

        endMargin: 0//verticalScrollBar.width
        horizontalLine: root.headerSepratorLine
        borderColor: root.borderColor
        color: root.headerBackgroundColor

        z: 10

        Component.onCompleted: {
            root.headerRow = _headerRow2
            root.model = root.model
        }
    }

    clip: true

    delegate: DataGridRow {
        property var _model: model

        width: parent == null ? 0 : (fitColumns ? parent.width : root.headerRow.actualWidth)
        //            width: parent.width
        //                parent=== null ? 0 : parent.width - verticalScrollBar.width
        z: 5
        header: root.headerRow
        columns: root.columns
        borderColor: root.borderColor
        horizontalLine: root.horizontalLines
        verticalLine: root.verticalLines
        checked: root.currentIndex == index
        onClicked: {
            root.currentIndex = index
            root.rowClicked(model)
        }
        onDoubleClicked: root.rowDoubleClicked(model)
    }
}

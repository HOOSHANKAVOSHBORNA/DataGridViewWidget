import QtQuick 2.0
import QtQuick.Controls 2.13

Item {
    id: cell
    property alias text: label.text
    property int w: handler.x + handler.width
    width: handler.x + handler.width + 4

    property int initialWidth: 0
    onInitialWidthChanged: if (initialWidth !== 0) cell.width = initialWidth - handler.width
    Component.onCompleted: {
        handler.x = cell.width - handler.width
    }

    Label {
        id: label
        text: modelData.title
        color: fontcolor
        font.pixelSize: fontsizehedear
        font.family: foheader.name
        font.bold: true
        anchors.fill: parent
        anchors.rightMargin: handler.width
        verticalAlignment: "AlignVCenter"
        clip: true
        elide: "ElideRight"

//        leftPadding: 4

        background: Rectangle {
            color: modelData.color
        }
    }

    DataGridHeaderResizeHandler {
        id: handler
        color: 'gray'

        width: 4
        height: parent.height

        MouseArea {
            anchors.fill: parent
            cursorShape: Qt.SplitHCursor
            drag.target: handler
            drag.axis: Drag.XAxis
            drag.minimumX: 0
        }
    }
}

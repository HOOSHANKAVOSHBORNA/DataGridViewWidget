import QtQuick 2.13
import QtQuick.Controls 2.13

Label {
    text: "---"
    anchors.fill: parent
    verticalAlignment: "AlignVCenter"
    clip: true
    elide: "ElideRight"
    leftPadding: 4

    background: Rectangle {
        color: modelData.color
    }
}

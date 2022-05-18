import QtQuick 2.13
import QtQuick.Controls 2.13

Label {
    text: "---"
    anchors.fill: parent
    verticalAlignment: "AlignVCenter"
    clip: true
    elide: "ElideRight"
    leftPadding: 4
    font.family: focol.name
    font.pixelSize: fontsize_col
    color: fontcolor
    anchors.centerIn: parent

    background: Rectangle {
        color: modelData.color
    }
}

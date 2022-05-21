import QtQuick 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import Qt.labs.settings 1.1
import QtQuick.Controls.Styles 1.4
import QtQuick.Dialogs 1.2

Rectangle{
    id: recsearch
    color: "transparent"
    border.width: 1.2
    border.color: bprdercolor
    radius: 10

    MouseArea{
        anchors.fill: parent
        hoverEnabled: true
        onEntered: {
            parent.color="#22FFFFFF"

        }
        onExited: {
            parent.color = "transparent"

        }
    }

    TextInput{
        id : input
        text: "Search"
        padding: 8
        color: fontcolor
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        onTextChanged: {

        }

        onAccepted:{

            for(var i = 0 ;i<sampleModel.rowCount();i++){
                if (sampleModel.get_name(i)===input.text || sampleModel.get_lastname(i)===input.text){
                    accept.open();
                    break
                }
                else
                    rejected.open()
            }
        }



        onActiveFocusChanged: {
            text = ""
        }
    }
    MessageDialog {
        id: accept
        title: "Show selected"
        text: "fined"
        onAccepted: {
            Qt.quit()
        }
    }
    MessageDialog {
        id: rejected
        title: "Show selected"
        text: "not find"
        onAccepted: {
            Qt.quit()
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/

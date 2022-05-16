import QtQuick 2.12
import QtQuick.Controls 2.12
Item {
    id: name
    anchors.fill: parent
    SwipeView {
        id: view

        currentIndex: 1
        anchors.fill: parent

        Item {
            MyTable{

            }
        }
        Item {
            MyTable{

            }
        }
        Item {
            MyTable{

            }
        }
    }
    MyFooter{
        id:footer
        anchors.bottom: parent.bottom
        anchors.bottomMargin: -16

    }
}

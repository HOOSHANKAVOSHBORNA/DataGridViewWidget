import QtQuick 2.12
import QtQuick.Controls 2.12
Item {


    property color backgroundColor1: ui.getGradiantColor1()//"#2c3e50"
    property color backgroundColor2: ui.getGradiantColor2()//'#2980b9'
    property color bordercolor: ui.getBordercolor()//'#2980b9'
    property color fontcolor: ui.getFontcolor()//'#2980b9'
    property  int fontsize_col: ui.getFontsize_col()
    property  int fontsizehedear: ui.getFontsizeHeader()
    id: main1
    anchors.fill: parent
   
    FontLoader{
        id:focol
        source: ui.getFontColumn()
    }
    FontLoader{
        id:foheader
        source: ui.getFontHeder()
    }
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

}

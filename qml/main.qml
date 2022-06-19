import QtQuick 2.12
import QtQuick.Controls 2.12
Item {


    property color backgroundColor1: Ui.getGradiantColor1()//"#2c3e50"
    property color backgroundColor2: Ui.getGradiantColor2()//'#2980b9'
    property color bordercolor: Ui.getBordercolor()//'#2980b9'
    property color fontcolor: Ui.getFontcolor()//'#2980b9'
    property  int fontsize_col: Ui.getFontsize_col()
    property  int fontsizehedear: Ui.getFontsizeHeader()
    id: main1
    anchors.fill: parent
   
    FontLoader{
        id:focol
        source: Ui.getFontColumn()
    }
    FontLoader{
        id:foheader
        source: Ui.getFontHeder()
    }
    SwipeView {
        id: view

        currentIndex: 1
        anchors.fill: parent

        Item {
            MyTable{

            }
        }

    }

}

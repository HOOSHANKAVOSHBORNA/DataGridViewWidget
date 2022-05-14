import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Dialogs 1.2
Rectangle {
    property bool  horizontalLinesCheckbox: false
    property  bool verticalLinesCheckbox: false
    property  bool seprateHeaderLineCheckbox: false
    property bool showThirdColumnMenu: true
    property bool  fitCheckbox: true
    property color colorclom
    radius: 5
    border.width: 1
    border.color: "gray"
    color: "#4C4843"
    id: menu

    Rectangle{


        id:recadd
        anchors.right: parent.right
        width: 70
        height: 30
        radius: 5
        anchors.rightMargin: 10
        anchors.verticalCenter: parent.verticalCenter
        property color gradcolor : "#8BC34A"
        gradient: Gradient {
                GradientStop { position: 0.0; color:recadd.gradcolor}
                GradientStop { position: 1.0; color: "#4CAF50" }
            }
        Text {
            id: add
            text: qsTr("Add")
            anchors.centerIn: parent
        }
        MouseArea{
            anchors.fill: parent
            hoverEnabled: true
            onClicked: {
               form.show()
            }
            onEntered: {
                recadd.gradcolor = "#E6EE9C";
            }
            onExited: {
                recadd.gradcolor ="#8BC34A"

        }
    }
}
    Row{
        id: row
        anchors.fill: parent
        Rectangle{
            id: menu1
            width: 80
            height: 35
            radius: 5
            anchors.verticalCenter: parent.verticalCenter
            color: "transparent"
            Text {
                text: qsTr("View")
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                      animRect.start()
                    menubeha.visible= false
                }
            }
            NumberAnimation { id:animRect; target: menuview; property: "opacity"; from: 0; to:1; duration: 2000;
            onStarted: { menuview.visible=true; console.log(menuview.visible)}




        }

        }
        Rectangle{
            id: menu2
            radius: 5
            anchors.verticalCenter: parent.verticalCenter
            width: 80
            height: 35
            color: "transparent"
            Text {
                anchors.centerIn: parent
                text: qsTr("Behavior")
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    animRect1.start()
                    menuview.visible =false
                }
            }
                NumberAnimation { id:animRect1; target: menubeha; property: "opacity"; from: 0; to:1; duration: 2000;
                onStarted: { menubeha.visible=true; console.log(menubeha.visible)}
                }
        }

    }
    Rectangle{
        id: menubeha
        visible: false
        width: 200
        height: 250
        y:menu1.y + 40
        x:menu2.x
        border.width: 1
        border.color: "gray"
        color: "#ffefd3"
        radius: 10
        Column{
            spacing: 2
            anchors.fill: parent
            Rectangle{
                id:rec1
                width:menuview.width
                height: menuview.height/4
                color:  "transparent"
                radius: 10
                Text {
                    text: qsTr("Fit columns")
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                }
                MouseArea{
                    anchors.fill: parent
                    hoverEnabled: true
                    onClicked: {
                       if  (fitCheckbox=== false){
                        fitCheckbox =true
                           rec1.state="clicked"
                        menubeha.visible=false
                       }else{
                           fitCheckbox =false
                           menubeha.visible=false

                       }
                    }
                    onEntered: {
                        rec1.color="#adb6c4"
                    }
                    onExited: {
                        rec1.color ="transparent"
                    }
                }


            }
            Rectangle{
                id:rec2
                width:menuview.width
                height: menuview.height/4
                color:  "transparent"
                radius: 10
                Text {
                    text: qsTr("Hilight second col")
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                }
                MouseArea{
                    anchors.fill: parent
                    hoverEnabled: true
                    onClicked: {

                       if  (colorclom =='#00000000'){
                        col2.color ='#8ecae6'

                        menubeha.visible=false
                       }else{
                           col2.color ='transparent'
                           menubeha.visible=false

                       }
                    }
                    onEntered: {
                        rec2.color="#adb6c4"
                    }
                    onExited: {
                        rec2.color ="transparent"
                    }
                }


            }
            MenuSeparator {}
            Rectangle{
                id:rec3
                width:menuview.width
                height: menuview.height/4
                color:  "transparent"
                radius: 10
                Text {
                    text: qsTr("Show selected")
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                }
                MessageDialog {
                    id: messageDialog
                    title: "Show selected"
                    text: dataGridView.currentValue.id + ',' + dataGridView.currentValue.name
                    onAccepted: {
                        Qt.quit()
                    }

                }
                MouseArea{
                    hoverEnabled: true
                    anchors.fill: parent
                    onClicked:{
                        messageDialog.visible=true
                        menubeha.visible=false

                     }
                     onEntered: {
                         rec3.color="#adb6c4"
                     }
                     onExited: {
                         rec3.color ="transparent"
                     }

                }

            }
            Rectangle{
                id:rec4
                width:menuview.width
                height: menuview.height/4
                color:  "transparent"
                radius: 10
                Text {
                    text: qsTr("Show third column")
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                }
                MouseArea{
                    hoverEnabled: true
                    anchors.fill: parent
                    onClicked: {
                        if  (showThirdColumnMenu=== false){
                         showThirdColumnMenu =true
                         menubeha.visible=false
                        }else{
                            showThirdColumnMenu =false
                            menubeha.visible=false

                        }
                     }
                     onEntered: {
                         rec4.color="#adb6c4"
                     }
                     onExited: {
                         rec4.color ="transparent"
                     }


                }

            }
        }
    }
   Rectangle{
       id: menuview
       visible: false
       width: 200
       height: 200
       y:menu1.y + 40
       border.width: 1
       border.color: "gray"
       color: "#ffefd3"
       radius: 10
       Column{
           spacing: 2
           anchors.fill: parent
           Rectangle{
               id:rec12
               width:menuview.width
               height: menuview.height/3.5
               color:  "transparent"
               radius: 10
               Text {
                   text: qsTr("Horizontal lines")
                   anchors.horizontalCenter: parent.horizontalCenter
                   anchors.verticalCenter: parent.verticalCenter
               }
               MouseArea{
                   anchors.fill: parent
                   hoverEnabled: true
                   onClicked: {
                      if  (horizontalLinesCheckbox=== false){
                       horizontalLinesCheckbox =true
                          rec1.state="clicked"
                       menuview.visible=false
                      }else{
                          horizontalLinesCheckbox =false
                          menuview.visible=false

                      }
                   }
                   onEntered: {
                       rec12.color="#adb6c4"
                   }
                   onExited: {
                       rec12.color ="transparent"
                   }
               }


           }
           Rectangle{
               id:rec22
               width:menuview.width
               height: menuview.height/3.5
               color:  "transparent"
               radius: 10
               Text {
                   text: qsTr("Vertical lines")
                   anchors.horizontalCenter: parent.horizontalCenter
                   anchors.verticalCenter: parent.verticalCenter
               }
               MouseArea{
                   hoverEnabled: true
                   anchors.fill: parent
                   onClicked:{
                       if  (verticalLinesCheckbox=== false){
                        verticalLinesCheckbox =true
                        menuview.visible=false
                       }else{
                           verticalLinesCheckbox =false
                           menuview.visible=false
                       }
                    }
                    onEntered: {
                        rec22.color="#adb6c4"
                    }
                    onExited: {
                        rec22.color ="transparent"
                    }

               }

           }
           Rectangle{
               id:rec32
               width:menuview.width
               height: menuview.height/3.5
               color:  "transparent"
               radius: 10
               Text {
                   text: qsTr("Sepraete line")
                   anchors.horizontalCenter: parent.horizontalCenter
                   anchors.verticalCenter: parent.verticalCenter
               }
               MouseArea{
                   hoverEnabled: true
                   anchors.fill: parent
                   onClicked: {
                       if  (seprateHeaderLineCheckbox=== false){
                        seprateHeaderLineCheckbox =true
                        menuview.visible=false
                       }else{
                           seprateHeaderLineCheckbox =false
                           menuview.visible=false

                       }
                    }
                    onEntered: {
                        rec32.color="#adb6c4"
                    }
                    onExited: {
                        rec32.color ="transparent"
                    }


               }

           }
       }
   }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/

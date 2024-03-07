import QtQuick
import QtQuick.Window
import "Components"

Window {

    // color properties
    property color bgColor: '#182328'

    id: mainWindow
    width: 1024
    height: 500
    visible: true
    title: qsTr("Hello World")
    color: '#182328'

    // Roulette Table
    RouletteTable{

    }

    // Balance Text and Icon
    Text{
        anchors.left: inputBetForm.left
        anchors.bottom: inputBetForm.top
        anchors.bottomMargin: 20
        id:balanceText
        font.bold: true
        color: 'white'
        font.pixelSize: 20
        text: 'Balance:'
    }

    InputBetForm{
        id: inputBetForm
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        anchors.rightMargin: 30

    }

    Connections{
        target: gameManager
        function onRand_numberChanged(number){
            console.log(number)
        }
    }
}

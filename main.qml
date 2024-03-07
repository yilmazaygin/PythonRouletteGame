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
         onAnimationFinished: {
            gameManager.check_spin('r', 10) // security problem
        }
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
        text: 'Balance: 1000'
    }

    InputBetForm{
        id: inputBetForm
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        anchors.rightMargin: 30
       
    }
    Connections{
        target: gameManager.get_player
        function onBalanceChanged(number){
            balanceText.text = "Balance: " + number
            if(number < 0){
                balanceText = '0'
            }
        }        
    }
    Connections{
        target: gameManager
        function onIsWon(b){
            console.log(b)
        }
    }

}

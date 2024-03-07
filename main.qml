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
        id: rouletteTable
        onAnimationFinished: {
            var p = gameManager.get_player
            var b = p.get_bet
            var c = b.get_color
            var a = b.get_amount
            var roundNumber = gameManager.get_round_number
            gameManager.check_spin(c, roundNumber)
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
        text: "Balance: " + gameManager.get_player.get_balance
    }

    InputBetForm{
        id: inputBetForm
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        anchors.rightMargin: 30
        onUpdateBalance: {
            var x = gameManager.get_player
            balanceText.text = "Balance: " + x.get_balance
        }
       
    }
    Connections{
        target: gameManager
        function onIsWon(b){
            if(b == true) console.log('win')
            else console.log('loose')
            balanceText.text = "Balance: " + gameManager.get_player.get_balance

        }
    }


}

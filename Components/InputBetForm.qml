import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    signal updateBalance()

    // Color properties
    property color bgColor: '#19343F'
    property color buttonAreaColor: '#224A5B'

    // Other properties
    property int radiusValue: 10

    // inputField properties
    property int inputFieldWidth: 400
    property int inputFieldHeight: 40

    // Text properties
    property string textValue: 'Place a bet:'

    id: inputBetForm
    implicitWidth: 450
    implicitHeight: 250
    Rectangle{
        anchors.fill: parent
        color: inputBetForm.bgColor
        radius: inputBetForm.radiusValue
    }
    Rectangle{
        id: buttonArea
        width: 400
        height: 40
        color: inputBetForm.buttonAreaColor
        radius: inputBetForm.radiusValue
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter

        anchors.topMargin: 20
        Text{
            text: 'Bet Field'
            font.pixelSize: 20
            anchors.centerIn: parent
            color: 'white'
        }

    }

    TextField{
        id: inputField
        width: inputBetForm.inputFieldWidth
        height: inputBetForm.inputFieldHeight
        font.pixelSize: 25

        anchors.top: buttonArea.bottom
        anchors.horizontalCenter: parent.horizontalCenter

        anchors.topMargin: 20
    }
    Text{
        id: mainText
        text: inputBetForm.textValue
        color: '#FFF'
        font.pixelSize: 20

        anchors.top: inputField.bottom
        anchors.left: parent.left

        anchors.leftMargin: 20
        anchors.topMargin: 20
    }
    Row{
        anchors.top: mainText.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 20
        spacing: 20
        BetButton{
            id: redButton
            textValue: '2x'
            function onClick(){
                var asd = gameManager.get_player
                asd.place_bet('r', parseInt(inputField.text))
                updateBalance()
                gameManager.spin_wheel()
            }
        }
        BetButton{
            id: greenButton
            bgColor: 'green'
            textValue: '14x'
            function onClick(){
                var asd = gameManager.get_player
                asd.place_bet('g', parseInt(inputField.text))
                updateBalance()
                gameManager.spin_wheel()
            }
        }
        BetButton{
            id: blackButton
            bgColor: 'black'
            textValue: '2x'
            function onClick(){
                var asd = gameManager.get_player
                asd.place_bet('b', parseInt(inputField.text))
                updateBalance()
                gameManager.spin_wheel()

            }
        }
    }
}

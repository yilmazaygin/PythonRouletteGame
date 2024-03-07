import QtQuick 2.15

Item {
    signal animationFinished()
    implicitWidth: childrenRect.width
    implicitHeight: childrenRect.height
    anchors.verticalCenter: parent.verticalCenter
    Image {
        id: rouletteTable
        source: "../images/roulette.png"
        property real targetAngle: 256
        property real spinAngle: 256

        transform: Rotation {
            id: rouletteTableRotation
            origin.x: rouletteTable.width / 2
            origin.y: rouletteTable.height / 2
            angle: rouletteTable.targetAngle
            NumberAnimation on angle{
                id: rotationAnimation
                from: 256
                to: rouletteTable.targetAngle
                duration: 5000
                running: false
                easing.type: Easing.OutQuad
                onFinished: {
                    animationFinished()
                }
            }

        }
        MouseArea {
            anchors.fill: parent
            enabled: !rotationAnimation.running
            onClicked: {

            }
        }
//        onTargetAngleChanged: {
//            rouletteTableRotation.angle = rouletteTable.targetAngle;
//            rouletteTable.spinAngle = 0;
//            rouletteTableRotation.angle = 0;
//            rouletteTableRotation.angle = rouletteTable.targetAngle;
//        }
    }

    Image{
        id: rouletteTableArrow
        width: 50
        height: 50
        source: "../images/ok.png"
        anchors.right: rouletteTable.right
        anchors.rightMargin: 7
        anchors.verticalCenter: parent.verticalCenter
    }
    Connections{
        target: gameManager
        function onRandNumberChanged(number){
            rouletteTable.targetAngle = 360 + 360 + 360 + number
            rotationAnimation.running = true
        }
        
    }
}

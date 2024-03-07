import QtQuick 2.15

Item {
    implicitWidth: childrenRect.width
    implicitHeight: childrenRect.height
    anchors.verticalCenter: parent.verticalCenter
    Image {
        id: rouletteTable
        source: "../images/roulette.png"
        property real targetAngle: 0
        property real spinAngle: 0

        transform: Rotation {
            id: rouletteTableRotation
            origin.x: rouletteTable.width / 2
            origin.y: rouletteTable.height / 2
            angle: rouletteTable.targetAngle
            NumberAnimation on angle{
                id: rotationAnimation
                from: 0
                to: rouletteTable.targetAngle
                duration: 5000
                running: false
                easing.type: Easing.OutQuad
            }

        }
        MouseArea {
            anchors.fill: parent
            enabled: !rotationAnimation.running
            onClicked: {
                rouletteTable.targetAngle = Math.floor(Math.random() * 360) + 360 + 360 + 360;
                rouletteTable.spinAngle = rouletteTable.targetAngle; //
                rouletteTableRotation.angle = 0;
                rouletteTableRotation.angle = rouletteTable.targetAngle;
                rouletteTableRotation.angle = rouletteTable.spinAngle;
                rotationAnimation.running = true

            }
        }
        onTargetAngleChanged: {
            rouletteTableRotation.angle = rouletteTable.targetAngle;
            rouletteTable.spinAngle = 0;
            rouletteTableRotation.angle = 0;
            rouletteTableRotation.angle = rouletteTable.targetAngle;
        }
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
}

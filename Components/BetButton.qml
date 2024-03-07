import QtQuick 2.15

Item {
    id: main
    implicitWidth: 120
    implicitHeight: 40

    // color properties
    property color bgColor: '#DF2D24'

    // text properties
    property string textValue: ''

    Rectangle{
        width: main.width
        height: main.height
        color: main.bgColor
        Text{
            anchors.centerIn: parent
            color: 'white'
            font.pixelSize: 20
            text: main.textValue
        }
    }

}

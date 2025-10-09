import QtQuick

Rectangle {
    implicitWidth: 130
    implicitHeight: 40

    radius: Theme.rounding

    border.width: Theme.border_width
    border.color: Theme.border_color

    gradient: Theme.background_gradient

    Row {
        anchors.fill: parent
        anchors.margins: 5
        spacing: 15
        Column {
            Text {
                color: Theme.text

                anchors.margins: 2
                anchors.rightMargin: 4

                font.family: Theme.font
                font.bold: true
                font.pixelSize: 14

                text: Time.time
            }

            Text {
                color: Theme.subtext

                font.family: Theme.font
                font.pixelSize: 10

                text: Time.date
            }
        }

        Text {
            color: Theme.bell
            anchors.verticalCenter: parent.verticalCenter

            font.family: Theme.font
            font.pixelSize: 30
            text: ""
        }
    }
}

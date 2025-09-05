import QtQuick

Rectangle {
    implicitWidth: 110
    implicitHeight: 40

    radius: 5

    border.width: 1
    border.color: "#AAAAAA"

    gradient: Theme.background_gradient

    Text {
        color: Theme.text
        anchors.right: parent.right
        anchors.top: parent.top

        anchors.margins: 2
        anchors.rightMargin: 4

        font.bold: true
        font.pixelSize: 18

        text: Time.time
    }

    Text {
        color: Theme.subtext
        anchors.right: parent.right
        anchors.bottom: parent.bottom

        anchors.margins: 2
        anchors.rightMargin: 4

        font.pixelSize: 12

        text: Time.date
    }
}

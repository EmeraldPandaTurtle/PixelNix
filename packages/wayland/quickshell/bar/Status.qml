import QtQuick

Rectangle {
    width: 90
    height: 40

    signal clicked

    radius: Theme.rounding

    border.width: Theme.border_width
    border.color: Theme.border_color

    gradient: Theme.background_gradient

    Row {
        anchors.margins: 10
        spacing: 15

        anchors.fill: parent
        Battery {}
        Bluetooth {}
    }

    MouseArea {
        anchors.fill: parent
        onClicked: parent.clicked()
    }
}

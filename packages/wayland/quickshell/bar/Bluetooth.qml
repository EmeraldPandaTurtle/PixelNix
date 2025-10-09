import QtQuick
import Quickshell.Hyprland

Text {
    text: ""

    anchors.verticalCenter: parent.verticalCenter

    color: mouse.containsMouse ? Theme.bluetooth_hover : Theme.bluetooth
    font.pixelSize: 20

    MouseArea {
        id: mouse

        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor

        onClicked: Hyprland.dispatch("exec pavucontrol")
    }
}

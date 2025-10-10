import QtQuick
import Quickshell.Services.UPower

Row {
    anchors.verticalCenter: parent.verticalCenter
    spacing: 3

    Text {
        text: `${Math.floor(UPower.displayDevice.percentage * 100.0)}%`

        font.pixelSize: Theme.font_size_small
        font.family: Theme.font

        anchors.verticalCenter: parent.verticalCenter

        color: Theme.text
    }

    Text {
        text: UPower.onBattery ? "󱊢" : ""

        font.family: Theme.font
        font.bold: true
        font.pixelSize: Theme.font_size_med

        anchors.verticalCenter: parent.verticalCenter

        color: UPower.onBattery ? Theme.on_battery : Theme.charging
    }
}

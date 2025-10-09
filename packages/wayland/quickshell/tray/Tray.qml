import Quickshell
import Quickshell.Wayland

import QtQuick

PanelWindow {
    id: root

    color: "transparent"

    anchors {
        right: true
        top: true
        bottom: true
    }

    WlrLayershell.layer: WlrLayer.Overlay
    WlrLayershell.exclusiveZone: 0

    implicitWidth: 515

    property bool contentVisible: false

    Rectangle {
        id: content

        x: root.contentVisible ? 0 : width + 15

        Behavior on x {
            NumberAnimation {
                duration: 100
                easing.type: Easing.OutExpo
            }
        }

        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.margins: 15

        width: 500

        radius: 25

        color: "#AA222222"

        Column {
            anchors.fill: parent

            Text {
                text: "System Tray"
                font.pixelSize: 50

                color: "white"

                anchors.horizontalCenter: parent.horizontalCenter
            }
        }
    }
}

import Quickshell
import Quickshell.Wayland

import QtQuick
import QtQuick.Layouts

PanelWindow {
    id: root

    color: "transparent"

    property var tray

    anchors {
        bottom: true
        left: true
        right: true
    }

    WlrLayershell.layer: WlrLayer.Top

    implicitHeight: 50

    Rectangle {
        color: "transparent"
        anchors.fill: parent
        anchors.bottomMargin: 5
        implicitHeight: 40

        Row {
            id: right

            anchors.right: parent.right
            anchors.rightMargin: 20

            spacing: 10

            Status {
                onClicked: root.tray.visible = !root.tray.visible
            }
            ClockWidget {}
        }

        Row {
            id: left

            anchors.left: parent.left
            anchors.leftMargin: 20

            Workspaces {

                workspaces: [
                    {
                        icon: "",
                        id0: 1,
                        id1: 6
                    },
                    {
                        icon: "",
                        id0: 2,
                        id1: 6
                    },
                    {
                        icon: "",
                        id0: 3,
                        id1: 6
                    },
                    {
                        icon: "",
                        id0: 4,
                        id1: 6
                    },
                    {
                        icon: "",
                        id0: 5,
                        id1: 6
                    },
                    {
                        icon: "",
                        id0: 8,
                        id1: 9
                    }
                ]
            }
        }
    }
}

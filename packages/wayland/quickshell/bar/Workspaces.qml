import QtQuick
import Quickshell.Hyprland

Rectangle {
    id: root

    implicitWidth: 220
    implicitHeight: 40

    radius: 5

    border.width: 1
    border.color: "#AAAAAA"

    gradient: Theme.background_gradient

    required property var workspaces

    property var activeWorkspace: Hyprland.focusedMonitor?.activeWorkspace

    Row {
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
        anchors.margins: 5

        Repeater {
            model: root.workspaces

            Rectangle {
                required property var modelData

                width: 35
                height: 20

                color: mouseArea.containsMouse ? "#44FFFFFF" : "transparent"

                property bool isActive: root.activeWorkspace?.id === modelData.id0

                Text {
                    anchors.centerIn: parent

                    color: Theme.inactive_workspace
                    text: modelData.icon

                    font.pixelSize: 20
                }

                MouseArea {
                    id: mouseArea
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor

                    onClicked: {
                        Hyprland.dispatch(`workspace ${modelData.id1.toString()}`);
                        Hyprland.dispatch(`workspace ${modelData.id0.toString()}`);
                    }
                }
            }
        }
    }
}

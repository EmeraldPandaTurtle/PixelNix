import QtQuick
import Quickshell.Hyprland

Rectangle {
    id: root

    implicitWidth: 220
    implicitHeight: 40

    radius: Theme.rounding

    border.width: Theme.border_width
    border.color: Theme.border_color

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
                height: 30

                anchors.margins: 5

                property bool isActive: root.activeWorkspace?.id === modelData.id0

                color: isActive ? Theme.active_workspace : mouseArea.containsMouse ? Theme.hovered_workspace : Theme.inactive_workspace

                Text {
                    anchors.centerIn: parent

                    color: Theme.text
                    text: modelData.icon
                    font.family: Theme.font

                    font.pixelSize: Theme.icon_size
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

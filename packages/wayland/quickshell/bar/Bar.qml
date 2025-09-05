import Quickshell
import QtQuick

Scope {
    Variants {
        model: Quickshell.screens

        PanelWindow {
            color: "transparent"

            required property var modelData
            screen: modelData

            anchors {
                bottom: true
                left: true
                right: true
            }

            implicitHeight: 50

            Rectangle {
                color: "transparent"
                anchors.fill: parent
                anchors.bottomMargin: 5
                implicitHeight: 40

                Row {
                    anchors.right: parent.right
                    anchors.rightMargin: 20

                    ClockWidget {}
                }

                Row {
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
    }
}

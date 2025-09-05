pragma Singleton

import Quickshell
import QtQuick

Singleton {
    id: theme

    readonly property string text: "#CCCCCC"
    readonly property string subtext: "#FFFFFF"
    readonly property string inactive_workspace: "#CCCCCC"
    readonly property string active_workspace: "#CCCCCC"
    readonly property Gradient background_gradient: Gradient {
        GradientStop {
            position: 0.0
            color: "#CC555555"
        }

        GradientStop {
            position: 1.0
            color: "#88222222"
        }
    }
}

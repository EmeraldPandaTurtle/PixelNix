pragma Singleton

import Quickshell
import QtQuick

Singleton {
    id: theme

    // --------
    // - TEXT -
    // --------
    readonly property string text: "#CCCCCC"
    readonly property string subtext: "#FFFFFF"

    // -----------
    // - General -
    // -----------
    readonly property string font: "Hack Nerd Font Mono"

    readonly property int rounding: 5
    readonly property int border_width: 1
    readonly property string border_color: "#FF333333"

    readonly property string bell: "white"

    // -----------
    // - Battery -
    // -----------
    readonly property string on_battery: "#99BB99"
    readonly property string charging: "#FFFF55"

    // -------------
    // - Bluetooth -
    // -------------
    readonly property string bluetooth: "#9999FF"
    readonly property string bluetooth_hover: "#99CCFF"

    // -------------
    // - WORKSPACE -
    // -------------
    readonly property string inactive_workspace: "transparent"
    readonly property string active_workspace: "#88AA88"
    readonly property string hovered_workspace: "#AAAAAA"

    // -------------
    // - GRADIENTS -
    // -------------
    readonly property Gradient background_gradient: Gradient {
        GradientStop {
            position: 0.0
            color: "#88222222"
        }

        GradientStop {
            position: 1.0
            color: "#AA111111"
        }
    }
}

import QtQuick
import Quickshell.Services.Pipewire

Text {
    anchors.verticalCenter: parent.verticalCenter

    color: Theme.volume
    font.pixelSize: Theme.font_size_med
    font.family: Theme.font

    property real volume: Pipewire.defaultAudioSink?.audio.volume ?? 0
    property bool muted: Pipewire.defaultAudioSink?.audio.muted ?? false

    text: {
        if (muted || volume === 0) {
            return "󰖁";  // Muted icon
        } else if (volume < 0.33) {
            return "󰕿";  // Low volume
        } else if (volume < 0.66) {
            return "󰖀";  // Medium volume
        } else {
            return "󰕾";  // High volume
        }
    }
}

import QtQuick
import Quickshell
import Quickshell.Io

Text {
    anchors.verticalCenter: parent.verticalCenter

    color: Theme.network
    font.pixelSize: Theme.font_size_med
    font.family: Theme.font

    property string networkStatus: "none"
    property int wifiStrength: 0

    text: {
        if (networkStatus === "ethernet") {
            return "󰈀";  // Ethernet icon
        } else if (networkStatus === "wifi") {
            // Show wifi strength icon
            if (wifiStrength >= 75) {
                return "󰤨";  // Full wifi
            } else if (wifiStrength >= 50) {
                return "󰤥";  // Good wifi
            } else if (wifiStrength >= 25) {
                return "󰤢";  // Medium wifi
            } else {
                return "󰤟";  // Weak wifi
            }
        } else {
            return "󰪎";  // No internet
        }
    }

    Process {
        id: networkCheck
        running: true
        command: ["sh", "-c", "nmcli -t -f DEVICE,TYPE,STATE device | grep ':connected$' | head -n1"]

        stdout: SplitParser {
            onRead: data => {
                var line = data.trim();
                if (line.includes(":ethernet:")) {
                    networkStatus = "ethernet";
                } else if (line.includes(":wifi:")) {
                    networkStatus = "wifi";
                } else {
                    networkStatus = "none";
                }
            }
        }
    }

    Process {
        id: wifiStrengthCheck
        running: networkStatus === "wifi"
        command: ["sh", "-c", "nmcli -t -f IN-USE,SIGNAL dev wifi | grep '^\\*' | cut -d: -f2"]

        stdout: SplitParser {
            onRead: data => {
                var strength = parseInt(data.trim());
                if (!isNaN(strength)) {
                    wifiStrength = strength;
                }
            }
        }
    }

    Timer {
        interval: 5000
        running: true
        repeat: true
        onTriggered: {
            networkCheck.running = true;
            if (networkStatus === "wifi") {
                wifiStrengthCheck.running = true;
            }
        }
    }
}

import Quickshell
import Quickshell.Io
import QtQuick
import "./bar"
import "./wallpaper"
import "./tray"

ShellRoot {
    id: root
    property var targetScreen: null
    property var trayInstance: null
    property var barInstance: null

    function updateScreens() {
        if (Quickshell.screens.length > 0) {
            var newScreen = Quickshell.screens[Quickshell.screens.length - 1];

            // Destroy old instances
            if (barInstance)
                barInstance.destroy();
            if (trayInstance)
                trayInstance.destroy();

            // Create new instances on the new screen
            var trayComp = Qt.createComponent("./tray/Tray.qml");
            var barComp = Qt.createComponent("./bar/Bar.qml");

            trayInstance = trayComp.createObject(root, {
                screen: newScreen
            });
            barInstance = barComp.createObject(root, {
                screen: newScreen,
                tray: trayInstance
            });
        }
    }

    Component.onCompleted: updateScreens()

    Connections {
        target: Quickshell
        function onScreensChanged() {
            root.updateScreens();
        }
    }

    Wallpaper {}
}

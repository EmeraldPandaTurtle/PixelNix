import Quickshell
import Quickshell.Wayland
import QtQuick
import QtQuick.Layouts
import Qt.labs.folderlistmodel

Scope {
    Variants {
        model: Quickshell.screens

        PanelWindow {
            id: wallpaperWindow
            required property var modelData
            screen: modelData
            color: "black"

            anchors {
                left: true
                right: true
                top: true
                bottom: true
            }

            WlrLayershell.layer: WlrLayer.Background
            WlrLayershell.exclusionMode: ExclusionMode.Ignore

            property string currentWallpaper: ""
            property string nextWallpaper: ""
            property int currentIndex: 0
            property var wallpapers: []
            property string wallpaperFolder: "file:///home/brightonlcox/dotfiles/assets/wallpapers/"

            // Folder model to read images
            FolderListModel {
                id: folderModel
                folder: wallpaperWindow.wallpaperFolder
                nameFilters: ["*.*"]
                showDirs: false
                showDotAndDotDot: false

                onStatusChanged: if (folderModel.status == FolderListModel.Ready) {
                    init();
                }

                function init() {
                    wallpaperWindow.wallpapers = [];
                    for (var i = 0; i < count; i++) {
                        wallpaperWindow.wallpapers.push(get(i, "fileURL"));
                    }
                    if (wallpaperWindow.wallpapers.length > 0) {
                        wallpaperWindow.currentWallpaper = wallpaperWindow.wallpapers[0];
                    }
                }
            }

            function changeWallpaper(newPath) {
                nextWallpaper = newPath;
                fadeAnimation.start();
            }

            function nextWallpaperCycle() {
                if (wallpapers.length === 0)
                    return;
                currentIndex = (currentIndex + 1) % wallpapers.length;
                changeWallpaper(wallpapers[currentIndex]);
            }

            Image {
                id: currentImage
                anchors.fill: parent
                source: wallpaperWindow.currentWallpaper
                fillMode: Image.PreserveAspectCrop
                opacity: 1.0
            }

            Image {
                id: nextImage
                anchors.fill: parent
                source: wallpaperWindow.nextWallpaper
                fillMode: Image.PreserveAspectCrop
                opacity: 0.0
                z: currentImage.z + 1
            }

            SequentialAnimation {
                id: fadeAnimation
                ParallelAnimation {
                    NumberAnimation {
                        target: nextImage
                        property: "opacity"
                        to: 1.0
                        duration: 1000
                        easing.type: Easing.InOutQuad
                    }
                    NumberAnimation {
                        target: currentImage
                        property: "opacity"
                        to: 0.0
                        duration: 1000
                        easing.type: Easing.InOutQuad
                    }
                }
                ScriptAction {
                    script: {
                        wallpaperWindow.currentWallpaper = wallpaperWindow.nextWallpaper;
                        currentImage.opacity = 1.0;
                        nextImage.opacity = 0.0;
                    }
                }
            }

            Timer {
                interval: 30000
                running: true
                repeat: true
                onTriggered: wallpaperWindow.nextWallpaperCycle()
            }
        }
    }
}

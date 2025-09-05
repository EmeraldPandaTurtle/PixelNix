pragma Singleton

import Quickshell
import QtQuick

Singleton {
    id: time
    readonly property string time: {
        Qt.formatDateTime(clock.date, "hh:mm AP");
    }
    readonly property string date: {
        Qt.formatDateTime(clock.date, "ddd MMM d yyyy");
    }

    SystemClock {
        id: clock
        precision: SystemClock.Seconds
    }
}

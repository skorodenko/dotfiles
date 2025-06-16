pragma ComponentBehavior: Bound

import quickshell.widgets 1.0
import quickshell.config 1.0
import Quickshell
import QtQuick

Scope {
    id: root

    required property ShellScreen screen
    required property Item bar

    ExclusionZone {
        anchors.left: true
        exclusiveZone: root.bar.implicitWidth
    }

    ExclusionZone {
        anchors.top: true
    }

    ExclusionZone {
        anchors.right: true
    }

    ExclusionZone {
        anchors.bottom: true
    }

    component ExclusionZone: StyledWindow {
        screen: root.screen
        name: "border-exclusion"
        exclusiveZone: Config.border.thickness
        mask: Region {}
    }
}

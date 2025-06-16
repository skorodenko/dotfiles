import "root:/widgets"
import quickshell.services 1.0
import quickshell.config 1.0
import Quickshell
import QtQuick
import QtQuick.Effects

Item {
    id: root

    required property Item bar

    anchors.fill: parent

    StyledRect {
        id: rect

        anchors.fill: parent
        color: Colours.alpha(Config.border.colour, false)
        visible: false
    }

    Item {
        id: mask

        anchors.fill: parent
        layer.enabled: true
        visible: false

        Rectangle {
            anchors.fill: parent
            anchors.margins: Config.border.thickness
            anchors.leftMargin: root.bar.implicitWidth
            radius: Config.border.rounding
        }
    }

    MultiEffect {
        anchors.fill: parent
        maskEnabled: true
        maskInverted: true
        maskSource: mask
        source: rect
        maskThresholdMin: 0.5
        maskSpreadAtMin: 1
    }
}

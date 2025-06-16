import quickshell.widgets 1.0
import quickshell.services 1.0
import quickshell.config 1.0
import QtQuick

Column {
    id: root

    spacing: Appearance.spacing.normal

    StyledText {
        text: qsTr("Connected to: %1").arg(Network.active?.ssid ?? "None")
    }

    StyledText {
        text: qsTr("Strength: %1/100").arg(Network.active?.strength ?? 0)
    }

    StyledText {
        text: qsTr("Frequency: %1 MHz").arg(Network.active?.frequency ?? 0)
    }
}

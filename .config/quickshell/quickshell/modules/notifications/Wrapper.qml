import quickshell.config 1.0
import QtQuick

Item {
    id: root

    visible: height > 0
    implicitHeight: content.implicitHeight
    implicitWidth: content.implicitWidth

    Content {
        id: content
    }
}

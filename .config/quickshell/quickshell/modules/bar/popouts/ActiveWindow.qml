import quickshell.widgets 1.0
import quickshell.services 1.0
import quickshell.utils 1.0
import quickshell.config 1.0
import Quickshell.Widgets
import Quickshell.Wayland
import QtQuick

Item {
    id: root

    implicitWidth: Hyprland.activeClient ? child.implicitWidth : -Appearance.padding.large * 2
    implicitHeight: child.implicitHeight

    Column {
        id: child

        anchors.centerIn: parent
        spacing: Appearance.spacing.normal

        Row {
            id: detailsRow

            spacing: Appearance.spacing.normal

            IconImage {
                id: icon

                implicitSize: details.implicitHeight
                source: Icons.getAppIcon(Hyprland.activeClient?.wmClass ?? "", "image-missing")
            }

            Column {
                id: details

                StyledText {
                    text: Hyprland.activeClient?.title ?? ""
                    font.pointSize: Appearance.font.size.normal

                    elide: Text.ElideRight
                    width: preview.implicitWidth - icon.implicitWidth - detailsRow.spacing
                }

                StyledText {
                    text: Hyprland.activeClient?.wmClass ?? ""
                    color: Colours.palette.m3onSurfaceVariant

                    elide: Text.ElideRight
                    width: preview.implicitWidth - icon.implicitWidth - detailsRow.spacing
                }
            }
        }

        ClippingWrapperRectangle {
            color: "transparent"
            radius: Appearance.rounding.small

            ScreencopyView {
                id: preview

                captureSource: ToplevelManager.toplevels.values.find(t => t.title === Hyprland.activeClient?.title) ?? null
                live: visible

                constraintSize.width: Config.bar.sizes.windowPreviewSize
                constraintSize.height: Config.bar.sizes.windowPreviewSize
            }
        }
    }

    component Anim: NumberAnimation {
        duration: Appearance.anim.durations.normal
        easing.type: Easing.BezierSpline
        easing.bezierCurve: Appearance.anim.curves.emphasized
    }
}

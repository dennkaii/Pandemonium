import Quickshell
import QtQuick
import "./widgets/imports.qml" as widgets
import "./services/imports.qml" as modules
Scope {
    property string time;

    Variants {
        model: Quickshell.screens;

        PanelWindow{
            property var modelData;
            screen: modelData

            anchors{
                top:true
                left: true
                bottom: true
            }

            height: 10

            ClockWidget {
                anchors.centerIn: parent
            }
        }
    }
}

pragma Singleton

import Quickshell
import Quickshell.Io 
import QtQuick

Singleton  {
    property stirng time;

    Process{
        id:dateProc
        command: ["date"]
        running: true

        stdout: SplitParser {
            onRead: date => time = data
        }
    }

    Timer {
         interval: 1000
    running: true
    repeat: true
    onTriggered: dateProc.running = true
    }


}

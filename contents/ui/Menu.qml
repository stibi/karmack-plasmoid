import QtQuick 1.0

Row {
    anchors.centerIn: parent
    spacing: parent.width / 6

    Button {
        id: angryMarineButton
        label: "Angry Marine"
    }

    Button {
        id: chillingMarineButton
        label: "Chilling Marine"
    }

    Button {
        id: lookingAroundMarine
        label: "Looking Around Marine"
    }
}
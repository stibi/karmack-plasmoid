import QtQuick 1.1

Rectangle {

    width: buttonLabel.width + 20
    height: buttonLabel.height + 5

    property string label: "No label set!"
    property color buttonColor: "lightblue"
    property color onHoverColor: "gold"
    property color borderColor: Qt.darker(activePalette.button)

    border {width: 1; color: borderColor}
    color: buttonMouseArea.pressed ? Qt.darker(buttonColor, 1.5) : buttonColor
    radius: 6

    signal buttonClick()
    onButtonClick: {
        console.log(buttonLabel.text + " clicked")
    }

    Text {
        id: buttonLabel
        anchors.centerIn: parent
        text: label
        color: activePalette.buttonText
    }

    MouseArea {
        id: buttonMouseArea
        hoverEnabled: true
        anchors.fill: parent
        onClicked: buttonClick()
        //onEntered: parent.border.color = onHoverColor
        //onExited: parent.border.color = borderColor
    }


    gradient: Gradient {
        GradientStop {
            position: 0.0
            color: {
                if(buttonMouseArea.pressed)
                    return activePalette.dark
                else
                    return activePalette.light
                }
            }
        GradientStop {position: 1.0; color: activePalette.button}
    }
}

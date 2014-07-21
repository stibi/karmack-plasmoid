//contents of Button.qml
import QtQuick 1.0

Rectangle {
   id: button
   width: 145; height: 60
   color: "blue"
   smooth: true; radius: 9
   property alias text: label.text
   border {color: "#B9C5D0"; width: 1}

   gradient: Gradient {
       GradientStop {color: "#CFF7FF"; position: 0.0}
       GradientStop {color: "#99C0E5"; position: 0.57}
       GradientStop {color: "#719FCB"; position: 0.9}
   }

   Text {
       id: label
       anchors.centerIn: parent
       text: "Click Me!"
       font.pointSize: 12
       color: "blue"
   }

   MouseArea {
       anchors.fill: parent
       onClicked: console.log(text + " clicked")
   }
}

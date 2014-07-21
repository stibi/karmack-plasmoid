import QtQuick 1.1
import org.kde.plasma.core 0.1 as PlasmaCore

Column {
    id: screen
    spacing: 2

    //width: 490; height: 720

    SystemPalette { id: activePalette }

    Row {

        id: menicko
        spacing: 1
        anchors.horizontalCenter: parent.horizontalCenter

        Button {
            id: angryMarineButton
            label: "Angry Marine"
            onButtonClick: marine.angryMarine()
        }

        Button {
            id: lookingAroundMarine
            label: "Looking Around Marine"
            onButtonClick: marine.lookingAroundMarine()
        }

        Button {
            id: chillingMarineButton
            label: "Chilling Marine"
        }

        Button {
            id: hypnoMarineButtom
            label: "Hypno Marine"
            onButtonClick: marine.hypnoMarine()
        }
    }

    Marine {
        id: marine
        anchors.horizontalCenter: parent.horizontalCenter
        // anchors.left: menicko.right
        // anchors.leftMargin: 50
        //anchors.top: menicko.bottom
        //anchors.right: parent.right
        //anchors.bottom: parent.bottom
    }

    Text {
       id: cpuload
       //anchors { top: flynn.bottom; verticalCenter: parent.verticalCenter }
       text: ""
       color: "red"
    }

    PlasmaCore.DataSource {
        id: dataSource
        engine: "systemmonitor"
        connectedSources: ["cpu/system/TotalLoad"]
        interval: 1000

        onNewData: {
            cpuload.text = data.value + " " + data.units
            //console.log("data.value=" + data.value + "\n" + "data.units=" + data.units)
        }
    }

    //property int foo: 0

   //  Image {
   //      id: flynnimg
   //      width: 144; height: 174
   //      //anchors.fill: parent
   //      source: "plasmapackage:/img/" + soubor
   //      fillMode: Image.PreserveAspectFit
   //  }

   //  Timer {
   //          interval: 1000; running: true; repeat: true
   //          onTriggered: increment()
   //      }

   //      function increment() {
   //      //test.text = Date().toString()
   //          test.text = "Foo je: " + foo;
   //          flynnimg.source = "plasmapackage:/img/" + foo + ".gif";
   //      // flynnimg.source: "../img/"+foo+".gif";
   //      // flynnimg.source: "plasmapackage:/img/" + soubor;
   //          foo += 1;
   //      }

   // Text {
   //     id: test
   //     anchors { top: flynn.bottom; verticalCenter: parent.verticalCenter }
   //     text: "Score: Who knows?"
   //     color: "#ffffff"
   //  }

   //  Text {
   //      id: cpuload
   //      anchors {top: test.bottom; verticalCenter: parent.verticalCenter}
   //      text: "CPU load budeme merit voe!"
   //      color: "#ffffff"
   //  }

    // Item {
    //     width: parent.width
    //     anchors { top: parent.top; bottom: parent.bottom }

    //     Image {
    //         id: flynn
    //         anchors.fill: parent
    //         source: "plasmapackage:/img/0000.gif"
    //         fillMode: Image.PreserveAspectFit
    //     }



            // SmoothedAnimation on x {
        //     to: 50;
        //     //loops: Animation.Infinite;
        //     velocity: 50
        //     onComplete: { restart (); }
        // }
}


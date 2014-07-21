import QtQuick 1.1

Rectangle {

    width: 144
    height: 174

    property int oneTick : 1000
    property int hurt : 0

    state: "CHILL"

    signal angryMarine()
    signal lookingAroundMarine()
    signal hypnoMarine()

    onAngryMarine: makeMarineAngry()
    onLookingAroundMarine: marineIsLookingAround()
    onHypnoMarine: marineIsHypno()

    Image {
        id: marineImage
        width: parent.width
        height: parent.height
        source: "plasmapackage:/img/" + getMarineFace("00")
        fillMode: Image.PreserveAspectFit
    }

    function getRandomTrueFalse() {
        return "true"
    }

    function getRandomDuration(maxLength) {
        var randomNumber = Math.floor((Math.random()*maxLength)+1);
        console.log("randomNumber=" + randomNumber)
        var randomDuration = randomNumber * oneTick
        console.log("randomDuration=" + randomDuration)
        return randomDuration
    }

    function chillingMarine() {
        state = "CHILL"
    }

    function makeMarineAngry() {
        state = "ANGRY"
    }

    function marineIsLookingAround() {
        state = "LOOKING_AROUND"
    }

    function marineIsHypno() {
        state = "HYPNO"
    }

    states: [
        State {
            name: "CHILL";
            //console.log("Yeah, chilling...");
            //PropertyChanges {target: marineImage; source: "plasmapackage:/img/" + getMarineFace("00")}
            PropertyChanges {target: chillingAnimation; running: true}
            //PropertyChanges {target: blinkRight; running: true}
        },
        State {
            name: "ANGRY"
            //console.log("Bwaaaah ANGRY Marine!!!!!")
            //PropertyChanges {target: marineImage; source: "plasmapackage:/img/27.gif"}
            PropertyChanges {target: angryAnimation; running: true}
        },
        State {
            name: "LOOKING_AROUND"
            PropertyChanges {target: lookingAroundAnimation; running: true}
        },
        State {
            name: "HYPNO"
            PropertyChanges {target: hypnoAnimation; running: true}
        }
    ]

    function getMarineFace(number) {
        //console.log(number + "_" + hurt + ".gif")
        return number + "_" + hurt + ".gif"
    }

    SequentialAnimation {
        id: blinkLeft
        loops: 1
        PropertyAnimation {target: marineImage; properties: "source"; to: "plasmapackage:/img/" + getMarineFace("03"); duration: getRandomDuration(3)}
    }

    SequentialAnimation {
        id: blinkRight
        loops: 1
        PropertyAnimation {target: marineImage; properties: "source"; to: "plasmapackage:/img/" + getMarineFace("04"); duration: getRandomDuration(3)}
    }

    SequentialAnimation {
        id: chillingAnimation
        loops: Animation.Infinite
        PropertyAnimation {target: marineImage; properties: "source"; to: "plasmapackage:/img/" + getMarineFace("03"); duration: getRandomDuration(3)}
        PropertyAnimation {target: marineImage; properties: "source"; to: "plasmapackage:/img/" + getMarineFace("00"); duration: getRandomDuration(3)}
        PropertyAnimation {target: marineImage; properties: "source"; to: "plasmapackage:/img/" + getMarineFace("04"); duration: getRandomDuration(3)}
    }

    SequentialAnimation {
        id: angryAnimation
        loops: Animation.Infinite
        PropertyAnimation {target: marineImage; properties: "source"; to: "plasmapackage:/img/" + getMarineFace("01"); duration: oneTick}
        PropertyAnimation {target: marineImage; properties: "source"; to: "plasmapackage:/img/" + getMarineFace("02"); duration: oneTick}
        PropertyAnimation {target: marineImage; properties: "source"; to: "plasmapackage:/img/" + getMarineFace("05"); duration: oneTick}
    }

    SequentialAnimation {
        id: lookingAroundAnimation
        loops: Animation.Infinite
        PropertyAnimation {target: marineImage; properties: "source"; to: "plasmapackage:/img/15.gif"; duration: oneTick}
        PropertyAnimation {target: marineImage; properties: "source"; to: "plasmapackage:/img/20.gif"; duration: oneTick}
    }

    SequentialAnimation {
        id: hypnoAnimation
        loops: Animation.Infinite
        PropertyAnimation {target: marineImage; properties: "source"; to: "plasmapackage:/img/41.gif"; duration: oneTick / 10}
        PropertyAnimation {target: marineImage; properties: "source"; to: "plasmapackage:/img/0.gif"; duration: oneTick / 10}
    }
}

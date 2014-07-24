import QtQuick 1.1

Rectangle {

    width: 144
    height: 174

    property int oneTick : 1000
    property int hurt : 0

    state: "CHILL"

    signal chillMarine()
    signal angryMarine()
    signal lookingAroundMarine()
    signal hypnoMarine()
    signal stress1()
    signal windowAdded()
    signal windowRemoved()

    onChillMarine: {
        state = "CHILL"
    }

    onAngryMarine: {
        state = "ANGRY"
    }

    onLookingAroundMarine: {
        state = "LOOKING_AROUND"
    }

    onHypnoMarine: {
        state = "HYPNO"
    }

    onStress1: {
        state = "STRESS1"
    }

    onWindowAdded: {
        state = "WINDOW_ADDED"
    }

    onWindowRemoved: {
        state = "WINDOW_REMOVED"
    }

    Image {
        id: marineImage
        width: parent.width
        height: parent.height
        source: "../img/" + getMarineFace("00")
        fillMode: Image.PreserveAspectFit
    }

    function getRandomTrueFalse() {
        return "true"
    }

    function setHurt(hurtLevel) {
        hurt = hurtLevel
    }

    function getRandomDuration(maxLength) {
        var randomNumber = Math.floor((Math.random()*maxLength)+1);
        console.log("randomNumber=" + randomNumber)
        var randomDuration = randomNumber * oneTick
        console.log("randomDuration=" + randomDuration)
        return randomDuration
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
        },
        State {
            name: "STRESS1"
            PropertyChanges {target: stress1Animation; running: true}
        },
        State {
            name: "WINDOW_ADDED"
            PropertyChanges {target: windowAddedAnimation; running: true}
            PropertyChanges {target: chillingAnimation; running: true}
        },
        State {
            name: "WINDOW_REMOVED"
            PropertyChanges {target: windowRemovedAnimation; running: true}
            PropertyChanges {target: chillingAnimation; running: true}
        }
    ]

    function getMarineFace(number) {
        //console.log(number + "_" + hurt + ".gif")
        return number + "_" + hurt + ".gif"
    }

    SequentialAnimation {
        id: blinkLeft
        loops: 1
        PropertyAnimation {target: marineImage; properties: "source"; to: "../img/" + getMarineFace("03"); duration: getRandomDuration(3)}
    }

    SequentialAnimation {
        id: blinkRight
        loops: 1
        PropertyAnimation {target: marineImage; properties: "source"; to: "../img/" + getMarineFace("04"); duration: getRandomDuration(3)}
    }

    SequentialAnimation {
        id: windowAddedAnimation
        loops: 1
        PropertyAnimation {
            target: marineImage;
            properties: "source";
            to: "../img/" + getMarineFace("07");
            duration: oneTick}
    }

    SequentialAnimation {
        id: windowRemovedAnimation
        loops: 1
        PropertyAnimation {
            target: marineImage;
            properties: "source";
            to: "../img/" + getMarineFace("06");
            duration: oneTick}
    }

    SequentialAnimation {
        id: chillingAnimation
        loops: Animation.Infinite
        PropertyAnimation {target: marineImage; properties: "source"; to: "../img/" + getMarineFace("03"); duration: getRandomDuration(3)}
        PropertyAnimation {target: marineImage; properties: "source"; to: "../img/" + getMarineFace("00"); duration: getRandomDuration(3)}
        PropertyAnimation {target: marineImage; properties: "source"; to: "../img/" + getMarineFace("04"); duration: getRandomDuration(3)}
    }

    SequentialAnimation {
        id: angryAnimation
        loops: Animation.Infinite
        PropertyAnimation {target: marineImage; properties: "source"; to: "../img/" + getMarineFace("01"); duration: oneTick}
        PropertyAnimation {target: marineImage; properties: "source"; to: "../img/" + getMarineFace("02"); duration: oneTick}
        PropertyAnimation {target: marineImage; properties: "source"; to: "../img/" + getMarineFace("05"); duration: oneTick}
    }

    SequentialAnimation {
        id: lookingAroundAnimation
        loops: Animation.Infinite
        PropertyAnimation {target: marineImage; properties: "source"; to: "../img/" + getMarineFace("03"); duration: oneTick}
        PropertyAnimation {target: marineImage; properties: "source"; to: "../img/" + getMarineFace("04"); duration: oneTick}
    }

    SequentialAnimation {
        id: hypnoAnimation
        loops: Animation.Infinite
        PropertyAnimation {target: marineImage; properties: "source"; to: "../img/" + getMarineFace("41"); duration: oneTick / 10}
        PropertyAnimation {target: marineImage; properties: "source"; to: "../img/" + getMarineFace("0"); duration: oneTick / 10}
    }

    SequentialAnimation {
        id: stress1Animation
        loops: Animation.Infinite
        PropertyAnimation {target: marineImage; properties: "source"; to: "../img/" + getMarineFace("00"); duration: oneTick}
    }
}

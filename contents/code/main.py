# -*- coding: utf-8 -*-

import sys

from PyQt4.QtCore import QObject, QUrl, pyqtSignal, SIGNAL, SLOT, Qt, PYQT_VERSION_STR
from PyQt4.QtGui import QApplication, QGraphicsLinearLayout, QLabel
from PyQt4 import QtDeclarative
from PyKDE4.plasma import Plasma
from PyKDE4 import plasmascript
from PyKDE4.kdeui import *

# Kouknout:
# qmlView.setResizeMode(QDeclarativeView.SizeRootObjectToView)
# view.setGeometry(100, 100, 400, 240)

class Karmack4(plasmascript.Applet):
    def __init__(self, parent, args=None):
        plasmascript.Applet.__init__(self, parent)

    def init(self):
        self.applet.resize(480.0, 300.0)

        qmlView = Plasma.DeclarativeWidget()
        qmlView.setQmlPath("karmack4/contents/ui/main.qml")

        self.layout = QGraphicsLinearLayout(self.applet)
        self.layout.setOrientation(Qt.Vertical)
        self.layout.addItem(qmlView)

        helloLabel = Plasma.Label(self.applet)
        helloLabel.setText(PYQT_VERSION_STR)
        self.layout.addItem(helloLabel)

        buttonek = Plasma.PushButton(self.applet)
        buttonek.setText("Klikni a uvidis!")
        self.layout.addItem(buttonek)

        self.qmlRootObject = qmlView.rootObject()

        self.connect(buttonek, SIGNAL("clicked()"), self.buttonClicked)
        self.connect(KWindowSystem.self(), SIGNAL("windowAdded(WId)"), self.onWokynkoNove)
        self.connect(KWindowSystem.self(), SIGNAL("windowRemoved(WId)"), self.onWokynkoFuc)

    def buttonClicked(self):
        #print dir(self.qmlRootObject)
        self.qmlRootObject.updateQml()

    def onWokynkoNove(self):
        self.qmlRootObject.windowAdded()

    def onWokynkoFuc(self):
        self.qmlRootObject.windowRemoved()

def CreateApplet(parent):
    return Karmack4(parent)

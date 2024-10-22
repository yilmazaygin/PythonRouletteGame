# This Python file uses the following encoding: utf-8
import sys
from pathlib import Path

# kod degisikligi

from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine

from Classes.classes import GameManager


if __name__ == "__main__":
    app = QGuiApplication(sys.argv)

    game_manager = GameManager()

    engine = QQmlApplicationEngine()
    engine.rootContext().setContextProperty("gameManager", game_manager)



    qml_file = Path(__file__).resolve().parent / "main.qml"
    engine.load(qml_file)
    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec())

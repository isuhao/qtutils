DESTDIR  = ../bin
TEMPLATE = lib
TARGET   = qtutils
CONFIG += staticlib c++14

OBJECTS_DIR = ../build/qtutils
MOC_DIR     = ../build/qtutils
UI_DIR      = ../build/qtutils
RCC_DIR     = ../build/qtutils

QT = core gui

#check Qt version
greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

HEADERS += \
    imageprocessing/resize/cimageinterpolationkernel.h

INCLUDEPATH += ../cpputils

win*{
    QMAKE_CXXFLAGS += /MP /wd4251
    DEFINES += WIN32_LEAN_AND_MEAN NOMINMAX
    QMAKE_CXXFLAGS_WARN_ON = -W4
}

linux*{

}

linux*|mac*{
    QMAKE_CXXFLAGS += -pedantic-errors
    QMAKE_CFLAGS += -pedantic-errors
    QMAKE_CXXFLAGS_WARN_ON = -Wall -Wno-c++11-extensions -Wno-local-type-template-args -Wno-deprecated-register

    CONFIG(release, debug|release):CONFIG += Release
    CONFIG(debug, debug|release):CONFIG += Debug

    Release:DEFINES += NDEBUG=1
    Debug:DEFINES += _DEBUG
}

include(settings/settings.pri)
include(taskbarprogress/taskbarprogress.pri)
include(utils/utils.pri)
include(settingsui/settingsui.pri)
include(mouseclickdetector/mouseclickdetector.pri)
include(historylist/historylist.pri)
include(imageprocessing/imageprocessing.pri)
include(widgets/widgets.pri)

win*{
    include(windows/windows.pri)
}

win32*:!*msvc2012:*msvc*:!*msvc2010:*msvc* {
    QMAKE_CXXFLAGS += /FS
}

SOURCES += \
    utils/naturalsorting/naturalsorting_qt.cpp \
    imageprocessing/resize/cimageinterpolationkernel.cpp


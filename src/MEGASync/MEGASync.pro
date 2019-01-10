#-------------------------------------------------
#
# Project created by QtCreator 2013-10-17T12:41:38
#
#-------------------------------------------------

DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x000000

debug_and_release {
    CONFIG -= debug_and_release
    CONFIG += debug_and_release
}
CONFIG(debug, debug|release) {
    CONFIG -= debug release
    CONFIG += debug
}
CONFIG(release, debug|release) {
    CONFIG -= debug release
    CONFIG += release
}

QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

unix:!macx {
    QT += svg
    TARGET = megasync

#    Uncomment the following if "make install" doesn't copy megasync in /usr/bin directory
#    isEmpty(PREFIX) {
#        PREFIX = /usr
#    }
#    target.path = $$PREFIX/bin
#    INSTALLS += target
}
else {
    TARGET = MEGAsync
}

TEMPLATE = app

#DEFINES += LOG_TO_LOGGER
#DEFINES += LOG_TO_FILE
#DEFINES += LOG_TO_STDOUT

debug {
    CONFIG += console
    DEFINES += CREATE_COMPATIBLE_MINIDUMPS
    DEFINES += LOG_TO_STDOUT
#   DEFINES += LOG_TO_FILE
    DEFINES += LOG_TO_LOGGER
}

CONFIG += USE_LIBUV
CONFIG += USE_MEGAAPI
CONFIG += USE_MEDIAINFO
CONFIG += USE_LIBRAW
CONFIG += USE_FFMPEG

unix:!macx {
        exists(/usr/include/ffmpeg-mega)|exists(mega/bindings/qt/3rdparty/include/ffmpeg)|packagesExist(ffmpeg)|packagesExist(libavcodec) {
            CONFIG += USE_FFMPEG
        }
}
else {
    CONFIG += USE_FFMPEG
}

include(gui/gui.pri)
include(mega/bindings/qt/sdk.pri)
include(control/control.pri)
include(platform/platform.pri)
include(google_breakpad/google_breakpad.pri)
include(qtlockedfile/qtlockedfile.pri)

DEPENDPATH += $$PWD
INCLUDEPATH += $$PWD

DEFINES += QT_NO_CAST_FROM_ASCII QT_NO_CAST_TO_ASCII

SOURCES += MegaApplication.cpp
HEADERS += MegaApplication.h

TRANSLATIONS = \
    gui/translations/MEGASyncStrings_ar.ts \
    gui/translations/MEGASyncStrings_de.ts \
    gui/translations/MEGASyncStrings_en.ts \
    gui/translations/MEGASyncStrings_es.ts \
    gui/translations/MEGASyncStrings_fr.ts \
    gui/translations/MEGASyncStrings_id.ts \
    gui/translations/MEGASyncStrings_it.ts \
    gui/translations/MEGASyncStrings_ja.ts \
    gui/translations/MEGASyncStrings_ko.ts \
    gui/translations/MEGASyncStrings_nl.ts \
    gui/translations/MEGASyncStrings_pl.ts \
    gui/translations/MEGASyncStrings_pt_BR.ts \
    gui/translations/MEGASyncStrings_pt.ts \
    gui/translations/MEGASyncStrings_ro.ts \
    gui/translations/MEGASyncStrings_ru.ts \
    gui/translations/MEGASyncStrings_th.ts \
    gui/translations/MEGASyncStrings_tl.ts \
    gui/translations/MEGASyncStrings_tr.ts \
    gui/translations/MEGASyncStrings_uk.ts \
    gui/translations/MEGASyncStrings_vi.ts \
    gui/translations/MEGASyncStrings_zh_CN.ts \
    gui/translations/MEGASyncStrings_zh_TW.ts

CODECFORTR = UTF8

win32 {
    greaterThan(QT_MAJOR_VERSION, 4) {
        greaterThan(QT_MINOR_VERSION, 1) {
            QT += winextras
        }
    }

    RC_FILE = icon.rc
    QMAKE_LFLAGS += /LARGEADDRESSAWARE
    QMAKE_LFLAGS_WINDOWS += /SUBSYSTEM:WINDOWS,5.01
    QMAKE_LFLAGS_CONSOLE += /SUBSYSTEM:CONSOLE,5.01
    DEFINES += PSAPI_VERSION=1
}


macx {
    QMAKE_CXXFLAGS += -DCRYPTOPP_DISABLE_ASM -D_DARWIN_C_SOURCE
    MAC_ICONS_RESOURCES.files += folder.icns
    MAC_ICONS_RESOURCES.files += folder_yosemite.icns
    MAC_ICONS_RESOURCES.files += appicon32.tiff
    MAC_ICONS_RESOURCES.path = Contents/Resources
    QMAKE_BUNDLE_DATA += MAC_ICONS_RESOURCES
    ICON = app.icns

    QMAKE_INFO_PLIST = Info_MEGA.plist

    QMAKE_MACOSX_DEPLOYMENT_TARGET = 10.9
    QMAKE_CXXFLAGS += -fvisibility=hidden -fvisibility-inlines-hidden
    QMAKE_LFLAGS += -F /System/Library/Frameworks/Security.framework/
}


CONFIG(FULLREQUIREMENTS) {
DEFINES += REQUIRE_HAVE_FFMPEG
DEFINES += REQUIRE_HAVE_LIBUV
DEFINES += REQUIRE_HAVE_LIBRAW
DEFINES += REQUIRE_USE_MEDIAINFO
#DEFINES += REQUIRE_ENABLE_CHAT
#DEFINES += REQUIRE_ENABLE_BACKUPS
#DEFINES += REQUIRE_ENABLE_WEBRTC
#DEFINES += REQUIRE_ENABLE_EVT_TLS
#DEFINES += REQUIRE_USE_PCRE
}

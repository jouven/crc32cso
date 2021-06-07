#message($$QMAKESPEC)
#linux requires core to use the "qtGlobal" include like in windows
QT -= gui

TEMPLATE = lib

!android:QMAKE_CXXFLAGS += -std=c++17
android:QMAKE_CXXFLAGS += -std=c++14

CONFIG += no_keywords plugin
#(only windows) fixes the extra tier of debug and release build directories inside the first build directories
win32:CONFIG -= debug_and_release

# The following define makes your compiler emit warnings if you use
# any feature of Qt which as been marked as deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

DEFINES += CRC32CSO_LIBRARY



!win32:MYPATH = "/"
win32:MYPATH = "H:/veryuseddata/portable/msys64/"

#mine
INCLUDEPATH += $${MYPATH}home/jouven/mylibs/include

#don't new line the "{"
#release
if (!android){
CONFIG(release, debug|release){
    LIBS += -L$${MYPATH}home/jouven/mylibs/release/
    DEPENDPATH += $${MYPATH}home/jouven/mylibs/release
    QMAKE_RPATHDIR += $${MYPATH}home/jouven/mylibs/release
}
#debug
CONFIG(debug, debug|release){
    QT += core
    LIBS += -L$${MYPATH}home/jouven/mylibs/debug/ -lessentialQtso
    DEPENDPATH += $${MYPATH}home/jouven/mylibs/debug
    QMAKE_RPATHDIR += $${MYPATH}home/jouven/mylibs/debug
    DEFINES += DEBUGJOUVEN
}

}

if (android){
LIBS += -L$${MYPATH}home/jouven/Android/openssl/lib
INCLUDEPATH += $${MYPATH}home/jouven/Android/openssl/include
#crear noves carpetes
CONFIG(release, debug|release){
    LIBS += -L$${MYPATH}home/jouven/mylibsAndroid/release/
    DEPENDPATH += $${MYPATH}home/jouven/mylibsAndroid/release
    QMAKE_RPATHDIR += $${MYPATH}home/jouven/mylibsAndroid/release
}
#debug
CONFIG(debug, debug|release){
    LIBS += -L$${MYPATH}home/jouven/mylibsAndroid/debug/
    DEPENDPATH += $${MYPATH}home/jouven/mylibsAndroid/debug
    QMAKE_RPATHDIR += $${MYPATH}home/jouven/mylibsAndroid/debug
    DEFINES += DEBUGJOUVEN

}

}

#compiles with this flag but it should work with a processor with SSE4.2 since the code checks if the cpu has this feature
QMAKE_CXXFLAGS += -msse4.2

QMAKE_CXXFLAGS_DEBUG -= -g
QMAKE_CXXFLAGS_DEBUG += -pedantic -Wall -Wextra -g3

linux:QMAKE_CXXFLAGS_RELEASE += -flto=jobserver
win32:QMAKE_CXXFLAGS_RELEASE += -flto
!android:QMAKE_CXXFLAGS_RELEASE += -mtune=sandybridge

#for -flto=jobserver in the link step to work with -jX
linux:!android:QMAKE_LINK = +g++

linux:QMAKE_LFLAGS += -fuse-ld=gold
QMAKE_LFLAGS_RELEASE += -fvisibility=hidden

linux:QMAKE_LFLAGS_RELEASE += -flto=jobserver
win32:QMAKE_LFLAGS_RELEASE += -flto

HEADERS += \
    crc32c.hpp \
    crossPlatformMacros.hpp

SOURCES += \
    crc32c.cpp



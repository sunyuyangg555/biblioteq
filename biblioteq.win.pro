cache()
include(biblioteq-source.pro)

purge.commands = del *~ && del *\\*~

CONFIG		+= qt release thread warn_on windows
LANGUAGE	= C++
QT		+= network sql printsupport widgets
QT		-= webkit

QMAKE_CLEAN	+= BiblioteQ.exe
QMAKE_CXXFLAGS_RELEASE -= -O2
QMAKE_CXXFLAGS_RELEASE += -O3 \
                          -Wall \
                          -Wcast-align \
                          -Wcast-qual \
                          -Wdouble-promotion \
                          -Wextra \
                          -Wformat=2 \
                          -Woverloaded-virtual \
                          -Wpointer-arith \
                          -Wstrict-overflow=5 \
                          -fwrapv \
                          -pedantic \
                          -pie \
                          -std=c++11
QMAKE_DISTCLEAN += -r temp .qmake.cache .qmake.stash
QMAKE_EXTRA_TARGETS = purge

ICON		= Icons\\book.png
INCLUDEPATH	+= Include.win32 \
                   Source \
                   temp
LIBS		+= -L"." \
		   -L"Libraries.win32\\sqlite3" \
                   -L"Libraries.win32\\yaz" \
                   -lsqlite3 \
                   -lyaz5
RC_FILE		= biblioteq.win.rc
RESOURCES	= Icons\\icons.qrc
PROJECTNAME	= BiblioteQ
TARGET		= BiblioteQ
TEMPLATE        = app

biblioteq.files = biblioteq.conf
biblioteq.path = release\\.
documentation.files = Documentation\\*.pdf \
                      Documentation\\Contributed \
                      Documentation\\TO-DO
documentation.path = release\\Documentation\\.
libraries.files = Libraries.win32\\miscellaneous\\*.dll \
                  Libraries.win32\\postgresql\\*.dll \
                  Libraries.win32\\postgresql\\*.manifest \
                  Libraries.win32\\sqlite3\\*.dll \
                  Libraries.win32\\yaz\\*.dll \
                  Libraries.win32\\yaz\\*.exe \
                  Libraries.win64\\*.exe
libraries.path = release\\.
plugins1.files = $$[QT_INSTALL_PLUGINS]\\*
plugins1.path = release\\plugins\\.
plugins2.files = $$[QT_INSTALL_PLUGINS]\\gamepads\\xinputgamepad.dll
plugins2.path = release\\plugins\\gamepads\\.
plugins3.files = $$[QT_INSTALL_PLUGINS]\\platforms\\qdirect2d.dll
plugins3.path = release\\plugins\\platforms\\.
plugins4.files = $$[QT_INSTALL_PLUGINS]\\renderplugins\\scene2d.dll
plugins4.path = release\\plugins\\renderplugins\\.
pluginspurge.extra = del /q /s *d.dll
pluginspurge.path = release\\plugins\\.
qt.files = Qt\\qt.conf
qt.path = release\\.
qtlibraries.files = $$[QT_INSTALL_BINS]\\Qt5Concurrent.dll \
                    $$[QT_INSTALL_BINS]\\Qt5Core.dll \
                    $$[QT_INSTALL_BINS]\\Qt5Gui.dll \
                    $$[QT_INSTALL_BINS]\\Qt5Network.dll \
                    $$[QT_INSTALL_BINS]\\Qt5PrintSupport.dll \
                    $$[QT_INSTALL_BINS]\\Qt5Sql.dll \
                    $$[QT_INSTALL_BINS]\\Qt5Widgets.dll \
                    $$[QT_INSTALL_BINS]\\Qt5Xml.dll \
                    $$[QT_INSTALL_BINS]\\libgcc_s_dw2-1.dll \
                    $$[QT_INSTALL_BINS]\\libstdc++-6.dll \
                    $$[QT_INSTALL_BINS]\\libwinpthread-1.dll
qtlibraries.path = release\\.
sql1.files = SQL\\README*
sql1.path = release\\SQL\\.
sql2.files = SQL\\*.sql
sql2.path = release\\SQL\\.
translations.files = Translations\\*.qm
translations.path = release\\Translations\\.

INSTALLS = biblioteq \
           plugins1 \
           pluginspurge \
           libraries \
           documentation \
           plugins2 \
           plugins3 \
           plugins4 \
           qt \
           qtlibraries \
           sql1 \
           sql2 \
           translations

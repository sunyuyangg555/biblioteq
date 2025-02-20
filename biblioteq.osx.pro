include(biblioteq-source.pro)

purge.commands = rm -f *~ && rm -f */*~

CONFIG		+= app_bundle qt release thread warn_on
DEFINES		+= QT_DEPRECATED_WARNINGS
LANGUAGE	= C++
QT		+= network sql
QT		-= webkit

exists(/usr/local/opt/poppler-qt5/include/poppler/cpp) {
DEFINES         += BIBLIOTEQ_POPPLER_VERSION_DEFINED
INCLUDEPATH     += /usr/local/opt/poppler-qt5/include/poppler/cpp
} else {
message("The directory " \
        "/usr/local/opt/poppler-qt5/include/poppler/cpp " \
        "does not exist. Poppler version information will not be available.")
}

exists(/usr/local/opt/poppler-qt5)
{
DEFINES     += BIBLIOTEQ_LINKED_WITH_POPPLER
INCLUDEPATH += /usr/local/opt/poppler-qt5/include/poppler/qt5
LIBS        += -L/usr/local/opt/poppler-qt5/lib -lpoppler-qt5
QT          += printsupport widgets
}

QMAKE_CLEAN	+= BiblioteQ
QMAKE_CXX       = clang++
QMAKE_CXXFLAGS_RELEASE -= -O2
QMAKE_CXXFLAGS_RELEASE += -O3 \
                          -Wall \
                          -Wcast-align \
                          -Wcast-qual \
                          -Wdouble-promotion \
                          -Wextra \
                          -Wformat=2 \
                          -Wno-deprecated-declarations \
                          -Woverloaded-virtual \
                          -Wpointer-arith \
                          -Wstack-protector \
                          -Wstrict-overflow=5 \
                          -fPIE \
                          -fstack-protector-all \
                          -fwrapv \
                          -pedantic \
                          -std=c++17
QMAKE_DISTCLEAN += -r temp .qmake.cache .qmake.stash
QMAKE_EXTRA_TARGETS = purge
QMAKE_MACOSX_DEPLOYMENT_TARGET = 10.13

ICON		= Icons/book.icns
INCLUDEPATH	+= /usr/local/include \
                   Source \
                   temp
LIBS		+= -L/usr/local/lib \
                   -framework Cocoa \
                   -lpq \
                   -lsqlite3 \
                   -lyaz
RESOURCES	= Icons/icons.qrc

OBJECTIVE_HEADERS += Source/CocoaInitializer.h
OBJECTIVE_SOURCES += Source/CocoaInitializer.mm

PROJECTNAME	= BiblioteQ
TARGET		= BiblioteQ
TEMPLATE        = app

biblioteq.files		= BiblioteQ.app/*
biblioteq.path		= /Applications/BiblioteQ.d/BiblioteQ.app
conf.files		= biblioteq.conf
conf.path		= /Applications/BiblioteQ.d
doc1.files		= Documentation/*.pdf Documentation/*.txt Documentation/TO-DO
doc1.path		= /Applications/BiblioteQ.d/Documentation
doc2.files		= Documentation/Contributed/*.docx Documentation/Contributed/*.pdf
doc2.path		= /Applications/BiblioteQ.d/Documentation/Contributed
install_name_tool1.extra     = install_name_tool -change /usr/local/Cellar/poppler/21.08.0/lib/libpoppler.112.dylib @executable_path/../Frameworks/libpoppler.112.dylib /Applications/BiblioteQ.d/BiblioteQ.app/Contents/Frameworks/libpoppler-qt5.1.dylib
install_name_tool1.path = .
install_name_tool2.extra= install_name_tool -change /usr/local/Cellar/poppler/21.08.0/lib/libpoppler.112.dylib @executable_path/../Frameworks/libpoppler.112.dylib /Applications/BiblioteQ.d/BiblioteQ.app/Contents/Frameworks/libpoppler-qt5.1.dylib
install_name_tool2.path = .
lrelease.extra          = $$[QT_INSTALL_BINS]/lrelease biblioteq.osx.pro
lrelease.path           = .
lupdate.extra           = $$[QT_INSTALL_BINS]/lupdate biblioteq.osx.pro
lupdate.path            = .
macdeployqt.extra	= $$[QT_INSTALL_BINS]/macdeployqt ./BiblioteQ.app -verbose=0 2>/dev/null; echo;
macdeployqt.path	= BiblioteQ.app
postinstall.extra	= cp -r BiblioteQ.app /Applications/BiblioteQ.d/.
postinstall.path	= /Applications/BiblioteQ.d
preinstall.extra        = rm -rf /Applications/BiblioteQ.d/BiblioteQ.app/*
preinstall.path         = /Applications/BiblioteQ.d
sql.files		= SQL/*.sql
sql.path		= /Applications/BiblioteQ.d
translations.files	= Translations/*.qm
translations.path	= /Applications/BiblioteQ.d/Translations
zzz.extra               = chown -Rh root:wheel /Applications/BiblioteQ.d
zzz.path                = /Applications/BiblioteQ.d

INSTALLS	= preinstall \
		  macdeployqt \
		  biblioteq \
		  conf \
		  doc1 \
		  doc2 \
		  sql \
		  translations \
                  postinstall \
                  install_name_tool1 \
                  install_name_tool2 \
                  zzz

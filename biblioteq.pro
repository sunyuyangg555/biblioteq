cache()
include(biblioteq-source.pro)

doxygen.commands = doxygen biblioteq.doxygen
purge.commands = rm -f *~ && rm -f */*~

CONFIG		+= copy_dir_files qt release thread warn_on
DEFINES		+= BIBLIOTEQ_CONFIGFILE="'\"biblioteq.conf\"'" \
                   QT_DEPRECATED_WARNINGS
LANGUAGE	= C++
QMAKE_CLEAN	+= BiblioteQ
QT              += network printsupport sql widgets
QT              -= webkit
TEMPLATE	= app

lessThan(QT_MAJOR_VERSION, 6) {
exists(/usr/include/poppler/cpp) {
DEFINES         += BIBLIOTEQ_POPPLER_VERSION_DEFINED
INCLUDEPATH     += /usr/include/poppler/cpp
}
} else {
message("The directory /usr/include/poppler/cpp does not exist. " \
        "Poppler version information will not be available.")
}

lessThan(QT_MAJOR_VERSION, 6) {
exists(/usr/include/poppler/qt5) {
DEFINES         += BIBLIOTEQ_LINKED_WITH_POPPLER
INCLUDEPATH     += /usr/include/poppler/qt5
LIBS            += -lpoppler-qt5
}
}

QMAKE_CXXFLAGS_RELEASE -= -O2
QMAKE_CXXFLAGS_RELEASE += -O3 \
                          -Wall \
                          -Wcast-align \
                          -Wcast-qual \
                          -Wdouble-promotion \
                          -Werror=format-security \
                          -Wextra \
                          -Wfloat-equal \
                          -Wformat-overflow=2 \
                          -Wformat=2 \
                          -Wlogical-op \
                          -Woverloaded-virtual \
                          -Wpointer-arith \
                          -Wstack-protector \
                          -Wstrict-overflow=1 \
                          -Wundef \
                          -fPIE \
                          -fstack-protector-all \
                          -fwrapv \
                          -pedantic \
                          -pie \
                          -std=c++11
QMAKE_DISTCLEAN += -r temp .qmake.cache .qmake.stash
QMAKE_EXTRA_TARGETS = doxygen purge

ICON		= Icons/book.png
INCLUDEPATH	+= Source temp
LIBS		+= -lsqlite3 -lyaz
RESOURCES	= Icons/icons.qrc
PROJECTNAME	= BiblioteQ
TARGET		= BiblioteQ

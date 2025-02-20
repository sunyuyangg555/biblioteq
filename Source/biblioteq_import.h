#ifndef _BIBLIOTEQ_IMPORT_H_
#define _BIBLIOTEQ_IMPORT_H_

#include "ui_biblioteq_import.h"

class QProgressDialog;
class biblioteq;

class biblioteq_import: public QMainWindow
{
  Q_OBJECT

 public:
  biblioteq_import(biblioteq *parent);
  void closeEvent(QCloseEvent *event);
  void show(QMainWindow *parent);

 private:
  enum BooksColumns
    {
     BIBLIOTEQ_BOOKS_TABLE_FIELD_NAME = 1,
     CSV_COLUMN_NUMBER = 0,
     SUBSTITUTE_VALUE = 2
    };

  QMap<int, QPair<QString, QString> > m_booksMappings;
  Ui_importBrowser m_ui;
  biblioteq *m_qmain;
  void changeEvent(QEvent *event);
  void importBooks(QProgressDialog *progress,
		   QStringList &errors,
		   qint64 *imported,
		   qint64 *notImported);

 private slots:
  void setGlobalFonts(const QFont &font);
  void slotAddBookRow(void);
  void slotBooksTemplates(int index);
  void slotClose(void);
  void slotDeleteBookRow(void);
  void slotImport(void);
  void slotReset(void);
  void slotSelectCSVFile(void);
};

#endif

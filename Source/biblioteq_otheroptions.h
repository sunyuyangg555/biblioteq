#ifndef _BIBLIOTEQ_OTHEROPTIONS_H_
#define _BIBLIOTEQ_OTHEROPTIONS_H_

#include "ui_biblioteq_otheroptions.h"

class biblioteq;

class biblioteq_otheroptions: public QMainWindow
{
  Q_OBJECT

 public:
  biblioteq_otheroptions(biblioteq *parent);
  ~biblioteq_otheroptions();
  QColor availabilityColor(const QString &it) const;
  QString publicationDateFormat(const QString &it) const;
  bool showMainTableImages(void) const;
  int booksAccessionNumberIndex(void) const;
  void prepareSettings(void);

 private:
  enum ItemsColumns
    {
     AVAILABILITY_COLOR = 1,
     ITEM_TYPE = 0,
     PUBLICATION_DATE_FORMAT = 1
    };

  Ui_otheroptions m_ui;
  biblioteq *qmain;
  void changeEvent(QEvent *event);
  void closeEvent(QCloseEvent *event);
  void keyPressEvent(QKeyEvent *event);
  void prepareAvailability(void);

 private slots:
  void setGlobalFonts(const QFont &font);
  void slotClose(void);
  void slotPreviewCanvasBackgroundColor(const QColor &color);
  void slotSave(void);
  void slotSelectAvailabilityColor(void);
  void slotSelectMainwindowCanvasBackgroundColor(void);

 public slots:
  void showNormal(void);

 signals:
  void mainWindowCanvasBackgroundColorChanged(const QColor &color);
  void mainWindowCanvasBackgroundColorPreview(const QColor &color);
  void saved(void);
};

#endif

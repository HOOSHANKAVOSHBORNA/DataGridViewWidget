#ifndef UI_GRIDVIEW_H
#define UI_GRIDVIEW_H

#include <QObject>

class UI_GridView : public QObject
{
    Q_OBJECT
public:
    explicit UI_GridView(QObject *parent = nullptr);

signals:

public slots:
    void setGradiantColor1 (QString color);
    QString getGradiantColor1 ();
    void setGradiantColor2 (QString color);
    QString getGradiantColor2 ();
    void setBordercolor (QString color);
    QString getBordercolor ();
    void setFontcolor (QString color);
    QString getFontcolor ();
    void setFontColumn (QString color);
    QString getFontColumn ();
    void setFontHeader (QString color);
    QString getFontHeder ();
    void setFontszie_col (int color);
    int getFontsize_col ();
    void setFontsizeHedear (int color);
    int getFontsizeHeader ();

private:
       QString color1="#2c3e50";
       QString color2="#2980b9";
       QString bordercolor = "white";
       QString fontcolor = "white";
       QString font_col = "qrc:/Font/Times New Roman/times new roman italic.ttf";
       QString font_header = "qrc:/Font/Times New Roman/times new roman bold italic.ttf";
       int fontsizecol = 12;
       int fontsizehedear = 14;

};

#endif // UI_GRIDVIEW_H

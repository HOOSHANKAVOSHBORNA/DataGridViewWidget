#include "ui_gridview.h"

UI_GridView::UI_GridView(QObject *parent) : QObject(parent)
{

}

void UI_GridView::setGradiantColor1(QString color)
{
    color1 = color;
}

QString UI_GridView::getGradiantColor1()
{
    return color1;
}

void UI_GridView::setGradiantColor2(QString color)
{
    color2 = color;
}

QString UI_GridView::getGradiantColor2()
{
    return color2;
}

void UI_GridView::setBordercolor(QString color)
{
    bordercolor =color;

}

QString UI_GridView::getBordercolor()
{
    return bordercolor;
}

void UI_GridView::setFontcolor(QString color)
{
    fontcolor = color;
}

QString UI_GridView::getFontcolor()
{
    return fontcolor;
}

void UI_GridView::setFontColumn(QString font)
{
    font_col=font;
}

QString UI_GridView::getFontColumn()
{
    return font_col;
}

void UI_GridView::setFontHeader(QString font)
{
    font_header = font;

}

QString UI_GridView::getFontHeder()
{
    return font_header;
}

void UI_GridView::setFontszie_col(int size)
{
    fontsizecol=size;
}

 int UI_GridView::getFontsize_col()
{
    return fontsizecol;
}

void UI_GridView::setFontsizeHedear(int size)
{
    fontsizehedear =size;
}

int UI_GridView::getFontsizeHeader()
{
    return fontsizehedear;
}

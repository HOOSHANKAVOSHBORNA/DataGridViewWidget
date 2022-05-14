#ifndef FORM1_H
#define FORM1_H

#include <QWidget>
#include <QQuickView>
//  library for display qml  in widget
#include <QWidget>
#include <QQmlContext>
#include <QQmlEngine>
namespace Ui {
class Form1;
}

class Form1 : public QWidget
{
    Q_OBJECT

public:
    explicit Form1(QWidget *parent = nullptr);
    ~Form1();
     void closeapp(){
        this->close();
    }

private:
    Ui::Form1 *ui;
    QQuickView *view;
    // class widget for display qml
    QWidget *qmlwidget;
};

#endif // FORM1_H

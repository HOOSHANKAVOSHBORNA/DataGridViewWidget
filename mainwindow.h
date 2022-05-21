#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QQuickView>
//  library for display qml  in widget
#include <QWidget>
#include <QQmlContext>
#include <QQmlEngine>
QT_BEGIN_NAMESPACE
namespace Ui { class MainWindow; }
QT_END_NAMESPACE

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    MainWindow(QWidget *parent = nullptr);
    ~MainWindow();

private slots:


private:
    Ui::MainWindow *ui;
    QQuickView *view;
    // class widget for display qml
    QWidget *qmlwidget;
};
#endif // MAINWINDOW_H

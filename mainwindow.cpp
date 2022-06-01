#include "mainwindow.h"
#include "ui_mainwindow.h"
#include "samplemodel.h"
#include <QQuickStyle>
#include <form1.h>
#include <QQmlContext>
MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    qmlRegisterType<SampleModel>("Test", 1, 0, "SampleModel");
    view= new QQuickView(QUrl(QLatin1String("qrc:/qml/main.qml")));
    ///UI
    //Ui.setGradiantColor1("yellow");
    //Ui->setGradiantColor2("white");
    //Ui->setBordercolor("yellow");
    //Ui->setFontcolor("yellow");
    //Ui->setFontszie_col(12);
    Ui.setFontsizeHedear(16);
    view->rootContext()->setContextProperty("ui",&Ui);
    ///set qml to widget
    qmlwidget=QWidget::createWindowContainer(view);

    /// horizontalLayout creat in ui
    ui->horizontalLayout->addWidget(qmlwidget);



}

MainWindow::~MainWindow()
{
    delete ui;
}



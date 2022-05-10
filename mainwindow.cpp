#include "mainwindow.h"
#include "ui_mainwindow.h"
#include "samplemodel.h"
MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    qmlRegisterType<SampleModel>("Test", 1, 0, "SampleModel");
    view= new QQuickView(QUrl(QLatin1String("qrc:/qml/main.qml")));

    ///set qml to widget
    qmlwidget=QWidget::createWindowContainer(view);
    /// horizontalLayout creat in ui
    ui->horizontalLayout->addWidget(qmlwidget);


}

MainWindow::~MainWindow()
{
    delete ui;
}


#include "mainwindow.h"
#include "ui_mainwindow.h"
#include "samplemodel.h"
#include <QQuickStyle>
#include <form1.h>
#include <QQmlContext>
#include <QSqlDatabase>
#include <QSqlError>
#include <QDebug>
#include <QSqlTableModel>
#include <QSqlQuery>
MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    QSqlDatabase db=QSqlDatabase::addDatabase("QPSQL");
    db.setHostName("localhost");
    db.setPort(5432);
    db.setDatabaseName("tabelviewtest");

    db.setPassword("qazwsx");

    db.setUserName("postgres");
    if(db.open())
    {
    qDebug() <<"opened" ;
    db.close();

    }
    else
    {
    qDebug() << db.lastError().text();
    exit(1);
    }
    db.open();
    QSqlQueryModel *model = new QSqlQueryModel();
    QSqlQuery* query= new QSqlQuery(db);
    query->exec("select * from t");
    model->setQuery(*query);
    view= new QQuickView(QUrl(QLatin1String("qrc:/qml/main.qml")));
    //sampel = new SampleModel();
    ///UI
    //Ui.setGradiantColor1("yellow");
    //Ui->setGradiantColor2("white");
    //Ui->setBordercolor("yellow");
    //Ui->setFontcolor("yellow");
    //Ui->setFontszie_col(12);
    Ui.setFontsizeHedear(16);
    view->engine()->rootContext()->setContextProperty("Ui",&Ui);
    view->engine()->rootContext()->setContextProperty("table_model",model);
    ///set qml to widget
    qmlwidget=QWidget::createWindowContainer(view);

    /// horizontalLayout creat in ui
    ui->horizontalLayout->addWidget(qmlwidget);


}

MainWindow::~MainWindow()
{
    delete ui;
}



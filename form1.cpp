#include "form1.h"
#include "ui_form1.h"

Form1::Form1(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::Form1)
{
    ui->setupUi(this);

    view= new QQuickView(QUrl(QLatin1String("qrc:/Btnwidget.qml")));
    qmlwidget=QWidget::createWindowContainer(view);
    view->engine()->rootContext()->setContextProperty("form",this);
    /// horizontalLayout creat in ui
    ui->horizontalLayout->addWidget(qmlwidget);
}

Form1::~Form1()
{
    delete ui;
}

#include "samplemodel.h"

#include <QRandomGenerator>
#include <QDebug>
#include <QModelIndex>
#include <QStandardItemModel>
#include <QTextDocument>
#include <QTextCursor>
#include <QTextTableCell>
#include <QPrinter>
#include <QDebug>
#include <QModelIndex>
#include <QFileDialog>
SampleModel::SampleModel(QObject *parent) : QStandardItemModel(parent)
{

    this->clear();
    fillSampleData();
}

SampleModel::~SampleModel()
{
    //qDeleteAll(_data);
}

int SampleModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent)

    return count;
}

QString SampleModel::get_name(int i) const
{
    QModelIndex it =index(i,0);
    QString b =data(it, NameRole).toString();
    return  b;


}

QString SampleModel::get_lastname(int i) const
{
    QModelIndex it =index(i,0);
    QString b = data(it, LastNameRole).toString();
    return  b;
}

QString SampleModel::get_ID(int i) const
{
    QModelIndex it =index(i,0);
    QString b = data(it, IdRole).toString();
    return  b;
}

void SampleModel::getCount(int t)
{
    count = t;
    emit countChanged(count);
    qDebug()<< count;

}

void SampleModel::getNameSearch(QString name)
{
    namesearch = name;
}

void SampleModel::onClickedcurrentindex(int index)
{
    qDebug()<<index;
}

void SampleModel::onclickgetid(int id)
{
    qDebug()<<id;
}




void SampleModel::loadSampel()
{
    this->beginResetModel();
    this->clear();
    count =100;
    this->fillSampleData();
    this->endResetModel();

}

void SampleModel::loadcountsampel()
{
    this->beginResetModel();
    this->clear();
    this->fillSampleData();
    this->endResetModel();
}

QHash<int, QByteArray> SampleModel::roleNames() const
{
    return {
        {IdRole, "id"},
        {NameRole, "name"},
        {LastNameRole, "last_name"}

    };
}



void SampleModel::onClickedpdf()
{
    QTextDocument *doc = new QTextDocument;
    doc->setDocumentMargin(10);
    QTextCursor cursor(doc);
    QTextTable *table = cursor.insertTable(count, 3);
    QTextTableCell headerCell = table->cellAt(0, 0);
    QTextCursor headerCellCursor = headerCell.firstCursorPosition();
    headerCellCursor.insertText(QObject::tr("ID"));
    headerCell = table->cellAt(0, 1);
    headerCellCursor = headerCell.firstCursorPosition();
    headerCellCursor.insertText(QObject::tr("Name"));
    headerCell = table->cellAt(0, 2);
    headerCellCursor = headerCell.firstCursorPosition();
    headerCellCursor.insertText(QObject::tr("LastName"));
    for(int i = 0; i <count-1; ++i){
        //QTextCharFormat cellFormat = i % 2 == 0 ? textFormat : alternateCellFormat;
        QTextTableCell cell = table->cellAt(i + 1, 0);
        //cell.setFormat(cellFormat);
        QTextCursor cellCursor = cell.firstCursorPosition();
        QModelIndex it =index(i,0);
        cellCursor.insertText(data(it, IdRole).toString());

        cell = table->cellAt(i + 1, 1);
        //cell.setFormat(cellFormat);
        cellCursor = cell.firstCursorPosition();
        QModelIndex it1 =index(i,0);
        cellCursor.insertText(data(it1, NameRole).toString());
        cell = table->cellAt(i + 1, 2);
        //cell.setFormat(cellFormat);
        cellCursor = cell.firstCursorPosition();
        QModelIndex it2 =index(i,0);
        cellCursor.insertText(data(it2, LastNameRole).toString());
    }

    cursor.movePosition(QTextCursor::End);
    cursor.insertBlock();

    //Print to PDF
    QString fname = QFileDialog::getSaveFileName(nullptr, "Save name", ".", "Pdf File (*.pdf)" );
    QPrinter printer(QPrinter::HighResolution) ;
    printer.setOutputFormat(QPrinter::PdfFormat);
    printer.setOutputFileName(fname);
    doc->print(&printer);

}

void SampleModel::onClickedexel()
{
    QString textdata;

    for (int i=0;i<count;++i) {

        textdata+=data(index(i,0),IdRole).toString();
        textdata+=" ,";
        textdata+=data(index(i,0),NameRole).toString();
        textdata+=" ,";
        textdata+=data(index(i,0),LastNameRole).toString();
        textdata+=" ,";
        textdata+ "\n";
    }
    QString fname = QFileDialog::getSaveFileName(nullptr, "Save name", ".", "Csv File (*.csv)" );
    QFile csvFile(fname);
    if(csvFile.open(QIODevice::WriteOnly | QIODevice::Truncate)) {

        QTextStream out(&csvFile);
        out << textdata;
    }
    csvFile.close();
}



void SampleModel::fillSampleData()
{
    for (int i = 1; i <= 100; ++i) {
        row = new QStandardItem;
        row->setData(i,IdRole);
        row->setData(getSampleString(),NameRole);
        row->setData(getSampleString(),LastNameRole);
        this->appendRow(row);
        //_data.append(row);
        //        auto d = new DataEntry;
        //        d->name = getSampleString();
        //        d->lastName = getSampleString();
        //        _data.append(d);
    }
}


QString SampleModel::getSampleString() const
{
    static QString chars = "qwertyuiopasdfghjklzxcvbnm ";
    auto len = QRandomGenerator::global()->bounded(4, 10);
    QString ret;
    for (int i = 0; i < len; ++i) {
        ret.append(chars.midRef(QRandomGenerator::global()->bounded(0, chars.size() - 1), 1));
    }
    return ret;
}

void SampleModel::searchFilter(QString string,QList<bool> b1 )
{
    dataID.clear();
    dataName.clear();
    dataLastname.clear();
    if(string.isEmpty()){
        loadSampel();
        return;}
    qDebug()<<b1[0];
//     if (namesearch==""){
//         for (int i=0;i <count;++i) {
//             if (get_ID(i).contains(string) or get_name(i).contains(string) or get_lastname(i).contains(string)) {
//                 dataID.append(get_ID(i));
//                 dataName.append(get_name(i));
//                 dataLastname.append(get_lastname(i));
//             }
//         }
//     }
//    else if (namesearch=="ID"){

//        //qDebug()<<"ID";
//        for (int i=0;i<count;++i) {
//            if (get_ID(i).contains(string)){
//                dataID.append(get_ID(i));
//                dataName.append(get_name(i));
//                dataLastname.append(get_lastname(i));

//            }
//        }
//    }
//    else if (namesearch=="Name") {
//        for (int i=0;i<count;++i) {
//            if (get_name(i).contains(string)){
//                dataID.append(get_ID(i));
//                dataName.append(get_name(i));
//                dataLastname.append(get_lastname(i));
//            }
//        }
//    }
//    else {
//        for (int i=0;i<count;++i) {
//            if (get_lastname(i).contains(string)){
//                dataID.append(get_ID(i));
//                dataName.append(get_name(i));
//                dataLastname.append(get_lastname(i));
//            }
//        }
//    }
//    this->beginResetModel();
//    this->clear();
//    count =dataID.size();
//    for (int i =0;i<count;++i) {
//        row = new QStandardItem;
//        row->setData(dataID[i],IdRole);
//        row->setData(dataName[i],NameRole);
//        row->setData(dataLastname[i],LastNameRole);
//        this->appendRow(row);
//    }
//    //this->fillSampleData();
//    this->endResetModel();

}

#ifndef SAMPLEMODEL_H
#define SAMPLEMODEL_H

#include <QStandardItemModel>
#include <QSortFilterProxyModel>
class SampleModel : public QStandardItemModel
{
    Q_OBJECT
public:
    explicit SampleModel(QObject *parent = nullptr);
    ~SampleModel();
    int rowCount(const QModelIndex &parent) const override;
     Q_INVOKABLE QString get_name(int i) const ;
    Q_INVOKABLE QString get_lastname(int i) const ;
     Q_INVOKABLE QString get_ID(int i) const ;
    Q_INVOKABLE void loadSampel();
    Q_INVOKABLE void loadcountsampel();
    QHash<int, QByteArray> roleNames() const override;
    void Search (QString name);
signals:
    void countChanged(int c);

public slots:
    void onClickedpdf();
    void onClickedexel();
    void getCount(int count) ;
    void getNameSearch (QString name);
    void onClickedcurrentindex(int  index);
    void searchFilter(QString string);




private:
    enum Roles {
        IdRole = Qt::UserRole + 1,
        NameRole,
        LastNameRole
    };
    QStandardItem *row;
    void fillSampleData();
    QString getSampleString() const;
     QSortFilterProxyModel *proxyModel;
    int count=100;
    QString namesearch = "ID";
    QList <QString> dataID;
    QList <QString> dataName;
    QList <QString> dataLastname;

};

#endif // SAMPLEMODEL_H

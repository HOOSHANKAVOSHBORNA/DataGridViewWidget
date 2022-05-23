#ifndef SAMPLEMODEL_H
#define SAMPLEMODEL_H

#include <QStandardItemModel>

class SampleModel : public QStandardItemModel
{
    Q_OBJECT
public:
    explicit SampleModel(QObject *parent = nullptr);
    ~SampleModel();
    int rowCount(const QModelIndex &parent) const override;
     Q_INVOKABLE QString get_name(int i) const ;
    Q_INVOKABLE QString get_lastname(int i) const ;
    Q_INVOKABLE bool loadSampel();
    QHash<int, QByteArray> roleNames() const override;

signals:
    void countChanged(int c);

public slots:
    void onClickedpdf();
    void onClickedexel();
    int getCount (int count) ;
    void onClickedcurrentindex(int  index);


private:
    enum Roles {
        IdRole = Qt::UserRole + 1,
        NameRole,
        LastNameRole
    };
    QStandardItem *row;
    void fillSampleData();
    QString getSampleString() const;
    int count=100;

};

#endif // SAMPLEMODEL_H

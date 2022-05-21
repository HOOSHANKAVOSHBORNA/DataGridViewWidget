#ifndef SAMPLEMODEL_H
#define SAMPLEMODEL_H

#include <QAbstractListModel>

class SampleModel : public QAbstractListModel
{
    Q_OBJECT
public:
    explicit SampleModel(QObject *parent = nullptr);
    ~SampleModel();
    int rowCount(const QModelIndex &parent) const override;
    QVariant data(const QModelIndex &index, int role) const override;
     Q_INVOKABLE QString get_name(int index) const { return _data.at(index)->name; }
    Q_INVOKABLE QString get_lastname(int index) const { return _data.at(index)->lastName; }
     Q_INVOKABLE bool loadSampel();
    QHash<int, QByteArray> roleNames() const override;

signals:
    void countChanged(int c);

public slots:
    void onClickedpdf();
    void onClickedexel();
    int getCount (int count) ;


private:
    enum Roles {
        IdRole = Qt::UserRole + 1,
        NameRole,
        LastNameRole,
        GroupRole
    };
    struct DataEntry {
        QString name;
        QString lastName;
    };
    QList<DataEntry*> _data;
    void fillSampleData();
    QString getSampleString() const;
    int count=100;

};

#endif // SAMPLEMODEL_H

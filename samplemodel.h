#ifndef SAMPLEMODEL_H
#define SAMPLEMODEL_H

#include <QStandardItemModel>
#include <QSortFilterProxyModel>
class SampleModel : public QStandardItemModel
{
    Q_OBJECT
      Q_PROPERTY(QStringList userRoleName READ userRoleNames CONSTANT)
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
    void setColumnHeadings(const QList<QString> &ColumnHeadings);
    QStringList userRoleNames();

signals:
    void countChanged(int c);

public slots:
    void onClickedpdf();
    void onClickedexel();
    void getCount(int count) ;
    void getNameSearch (QString name);
    void onClickedcurrentindex(int  index);
    void onclickgetid(int id);
    void searchFilter(QString string, QList<bool> b1);





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
    QString namesearch = "ID";
    QList <QString> dataID;
    QList <QString> dataName;
    QList <QString> dataLastname;
    QList<QString> m_Headings;
    QList<QString> m_ColumnHeadings={"id","name","lasr_name"} ;
    QMap<int, QString> m_roleNames;
    QStringList userRoleName;


};

#endif // SAMPLEMODEL_H

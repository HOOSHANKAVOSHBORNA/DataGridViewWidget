#ifndef TABLEMODEL_H
#define TABLEMODEL_H

#include <QObject>
#include <QAbstractItemModel>
#include <QModelIndex>
#include <QVariant>
#include <QList>
#include <QString>
#include <QHash>

namespace TE {

namespace TDT {

class TableModel : public QAbstractTableModel
{
  Q_OBJECT
  Q_PROPERTY(QStringList userRoleNames READ userRoleNames CONSTANT)
public:
    explicit TableModel(QObject *parent = 0);

    enum MyModelRoles {
        UserRole1 = Qt::UserRole + 1,
        UserRole2,
    };

  void setFirstColumn(const QList<QString> &FirstColumn);

  void setColumnHeadings(const QList<QString> &ColumnHeadings);

  void addElement(const QHash<QString, QVariant> Entry);

  QStringList userRoleNames();

signals:

public slots:

// QAbstractTableModel interface
public:
  int rowCount(const QModelIndex &parent) const override;
  int columnCount(const QModelIndex &parent) const override;
  QVariant data(const QModelIndex &index, int role) const override;
  QVariant headerData(int section, Qt::Orientation orientation, int role) const override;
  QHash<int, QByteArray> roleNames() const override;

private:
  QList<QHash<QString, QVariant>> m_TableData;
  QList<QString> m_ColumnHeadings;
  QMap<int, QString> m_roleNames;

};

}// TDT

}// TE

#endif // TABLEMODEL_H

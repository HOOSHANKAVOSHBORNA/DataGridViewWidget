#include "tablemodel.h"
#include <QDebug>
#include <QAbstractListModel>

TE::TDT::TableModel::TableModel(QObject *parent) : QAbstractTableModel(parent)
{

}

int TE::TDT::TableModel::rowCount(const QModelIndex &parent) const
{
  Q_UNUSED(parent);
  return m_TableData.count();
}

int TE::TDT::TableModel::columnCount(const QModelIndex &parent) const
{
  Q_UNUSED(parent);
  return m_ColumnHeadings.count();
}

QVariant TE::TDT::TableModel::data(const QModelIndex &index, int role) const
{
  QVariant retVal;
  try {
     if(!index.isValid())
     {
         throw QString("Invalid index for inherited data function");
     }
     // Check row index
     if(index.row() >= m_TableData.count() || index.row() < 0)
     {
         throw QString("Index (row) out of bounds for data function");
     }
     //Check column index
     if(index.column() >= m_ColumnHeadings.count() || index.column() < 0)
     {
         throw QString("Index (column) out of bounds for data function");
     }

     QList<int> keys = m_roleNames.keys();

     if(role == Qt::DisplayRole || role == Qt::EditRole)
     {
         QString colKey = m_ColumnHeadings.at(index.column());
         if (m_TableData.at(index.row()).value(colKey).isNull())
         {
             retVal = QVariant();
         } else {
             retVal = m_TableData.at(index.row()).value(colKey);
         }
     } else if (m_roleNames.keys().contains(role)) {
         QHash<QString, QVariant> temp1 = m_TableData.at(index.row());
         retVal = m_TableData.at(index.row()).value(m_roleNames.value(role));
     }
     return retVal;

  } catch (QString &e) {
     qDebug() << e;
     return QVariant();
  }
}

QVariant TE::TDT::TableModel::headerData(int section, Qt::Orientation orientation, int role) const
{
  Q_UNUSED(orientation);
  QVariant retVal;
  if (role == Qt::DisplayRole)
  {
     retVal = m_ColumnHeadings.at(section);
  }
  return retVal;
}

QHash<int, QByteArray> TE::TDT::TableModel::roleNames() const {
  // Populate the roles - basically the column headings
  QHash<int, QByteArray> roles = QAbstractTableModel::roleNames();

  // Should not overwrite existing roles
  int LastIndexOfUserRole = Qt::UserRole;
  for (int x = 1; x <= m_ColumnHeadings.count(); x++)
  {
     roles[LastIndexOfUserRole + x] = m_ColumnHeadings.at(x-1).toUtf8();
  }
  return roles;
}

QStringList TE::TDT::TableModel::userRoleNames() // Return ordered List of user-defined roles
{
  QHashIterator<int, QByteArray> i(roleNames());
  while (i.hasNext())
  {
     i.next();
     if(i.key() > Qt::UserRole)
     {
         m_roleNames[i.key()] = i.value();
     }
  }
  return m_roleNames.values();
}

void TE::TDT::TableModel::setColumnHeadings(const QList<QString> &ColumnHeadings)
{
  m_ColumnHeadings = ColumnHeadings;
}

void TE::TDT::TableModel::addElement(const QHash<QString, QVariant> Entry)
{
   beginInsertRows(QModelIndex(), this->rowCount(QModelIndex()), this->rowCount(QModelIndex()));
   m_TableData.append(Entry);
   endInsertRows();
}

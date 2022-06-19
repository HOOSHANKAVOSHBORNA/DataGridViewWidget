import QtQuick 2.0
import QtQuick.Controls 1.4

TableView {
    //it's better not to set positioning properties in a component definition file.
    Component {
        id: columnComponent
        TableViewColumn { width: 100 }
    }
    resources:
    {
        var roleList = model.userRoleNames // here you expect all your models to be an instance of your TableModel
        var temp = []
        for(var i = 0; i < roleList.length; i++)
        {
            var role  = roleList[i]
            temp.push(columnComponent.createObject(tableview, { "role": role, "title": role}))
        }
        return temp
    }
}

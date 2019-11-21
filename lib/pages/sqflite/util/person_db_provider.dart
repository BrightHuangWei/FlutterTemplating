import 'package:sqflite/sqlite_api.dart';

import '../user_model.dart';
import 'base_db_provider.dart';

class PersonDbProvider extends BaseDbProvider {
  ///表名
  final String name = 'PresonInfo';

  final String columnId = "id";
  final String columnMobile = "mobile";
  final String columnHeadImage = "headImage";

  PersonDbProvider();

//  close() {
//    super.close();
//  }

  @override
  tableName() {
    return name;
  }

  @override
  createTableString() {
    return '''
        create table $name (
        $columnId integer primary key,$columnHeadImage text not null,
        $columnMobile text not null)
      ''';
  }

  ///查询数据
  Future _getPersonProvider(Database db, int id) async {
    List<Map<String, dynamic>> maps =
    await db.rawQuery("select * from $name where $columnId = $id");
//    close();

    return maps;
  }

  ///插入数据
  Future<int> insert(UserModel model) async {
    Database db = await getDataBase();
    var userProvider = await _getPersonProvider(db, model.id);
    if (userProvider != null) {
      ///删除数据
      await db.delete(name, where: "$columnId = ?", whereArgs: [model.id]);
    }

//    if(db.isOpen){
//      print('db opened');
//    }

    return await db.rawInsert(
        "insert into $name ($columnId,$columnMobile,$columnHeadImage) values (?,?,?)",
        [model.id, model.mobile, model.headImage]);
  }

  ///更新数据
  Future<void> update(UserModel model) async {
    Database database = await getDataBase();
    await database.rawUpdate(
        "update $name set $columnMobile = ?,$columnHeadImage = ? where $columnId= ?",
        [model.mobile, model.headImage, model.id]);
  }

  ///删除数据
  Future<int> delete(UserModel model) async {
    Database database = await getDataBase();
    return await database
        .delete(name, where: "$columnId = ?", whereArgs: [model.id]);
  }

  ///获取事件数据
  Future<UserModel> getPersonInfo(int id) async {
    Database db = await getDataBase();
    List<Map<String, dynamic>> maps = await _getPersonProvider(db, id);

    if (maps.length > 0) {
      return UserModel.fromJson(maps[0]);
    }
    return null;
  }
}

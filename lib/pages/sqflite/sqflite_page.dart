import 'package:flutter/material.dart';

import 'user_model.dart';
import 'util/person_db_provider.dart';

class SqflitePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SqflitePageState();
}

class _SqflitePageState extends State<SqflitePage> {
  String logText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SQLite Demo'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: MaterialButton(
                child: Text('Insert'),
                textColor: Colors.white,
                color: Colors.blue,
                onPressed: () {
                  insert();
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: MaterialButton(
                child: Text('Delete'),
                textColor: Colors.white,
                color: Colors.blue,
                onPressed: () => delete(),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: MaterialButton(
                child: Text('Query'),
                textColor: Colors.white,
                color: Colors.blue,
                onPressed: () => query(),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: MaterialButton(
                child: Text('Update'),
                textColor: Colors.white,
                color: Colors.blue,
                onPressed: () => update(),
              ),
            ),
//            Text(logText),
          ],
        ),
      ),
    );
  }

  static insert() async {
    PersonDbProvider provider = new PersonDbProvider();
    UserModel userModel = UserModel();
    userModel.id = 1;
    userModel.mobile = "1";
    userModel.headImage = "http://www.img";
    int res = await provider.insert(userModel);
    if (res > 0) print('insert seccuess');
  }

  static delete() async {
    PersonDbProvider provider = new PersonDbProvider();
    int id = 1;
    UserModel userModel = await provider.getPersonInfo(id);
    if (userModel != null) {
      int k = await provider.delete(userModel);
      print('the number of rows affected k = $k');
    }
  }

  static query() async {
    PersonDbProvider provider = new PersonDbProvider();
    int id = 1;
    UserModel model = await provider.getPersonInfo(id);
    if (model != null)
      print(
          'query id= ${model.id} ,mobile = ${model.mobile} , headImage = ${model.headImage}');
    else
      print('query no data!');
  }

  static update() async {
    PersonDbProvider provider = new PersonDbProvider();
    UserModel userModel = await provider.getPersonInfo(1);
    userModel.mobile = "1";
    userModel.headImage = " update http://www.img1";
    provider.update(userModel);
  }

  @override
  void dispose() {
    PersonDbProvider().close();
    super.dispose();
  }
}

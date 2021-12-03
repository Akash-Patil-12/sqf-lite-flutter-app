import 'package:flutter/material.dart';
import 'package:sqflite_application/dbhelper.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final dbhelper = Databasehelper.instance;
  Future<void> inserdata() async {
    Map<String, dynamic> row = {
      Databasehelper.columnName: "akash",
      Databasehelper.columnage: 20
    };
    final id = await dbhelper.insert(row);
    print("..............");
    print(id);
  }

  Future<void> queryall() async {
    var allrows = await dbhelper.queryall();
    for (var row in allrows) {
      print(row);
    }
  }

  Future<void> querySpecific() async {
    var allrows = await dbhelper.querySpecific(18);
    for (var row in allrows) {
      print(row);
    }
  }

  Future<void> delete() async {
    var id = await dbhelper.deleteData(1);
    print(id);
  }

  Future<void> update() async {
    var row = await dbhelper.updateData(2);
    print(row);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Database'),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              //Text(id.toString()),
              ElevatedButton(
                onPressed: () {
                  inserdata();
                },
                child: Text('Insert'),
              ),
              ElevatedButton(
                onPressed: () {
                  queryall();
                },
                child: Text('Query'),
              ),
              ElevatedButton(
                onPressed: () {
                  querySpecific();
                },
                child: Text('Query Specific'),
              ),
              ElevatedButton(
                onPressed: () {
                  delete();
                },
                child: Text('Delete'),
              ),
              ElevatedButton(
                onPressed: () {
                  update();
                },
                child: Text('Update'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

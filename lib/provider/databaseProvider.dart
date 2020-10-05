
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider {

  static final DatabaseProvider dbProvider = DatabaseProvider();

  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await createDatabase();
    return _database;
  }

  createDatabase() async {
    String path = join(await getDatabasesPath(), 'staff.db');
    var database = await openDatabase(path, version: 1, onCreate: initDB,);
    return database;
  }

  void initDB(Database db, int version) async {
    await db.execute(
        "CREATE TABLE staff(id INTEGER PRIMARY KEY AUTOINCREMENT, email TEXT, phone TEXT)");
  }
}

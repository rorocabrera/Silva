import 'dart:io';
import 'package:path/path.dart';
import 'package:silva_admin/models/biometric_user.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static final _databaseName = "MyDatabase.db";
  static final _databaseVersion = 1;

  static final table = 'users';
  static final columnId = 'cedula';
  static final columnModelData = 'model_data';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    print("trying to retrieve database");
    if (_database != null) {
      print("database is not null");
      return _database!;
    }
    print("_Database is null");
    _database = await _initDatabase();

    return _database!;
  }

  _initDatabase() async {
    print("befpr getApplication document directory");
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    print("after getApplication document directory");
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnId TEXT PRIMARY KEY,
            $columnModelData TEXT NOT NULL
          )
          ''');
  }

  Future<int> insert(BioUser user) async {
    print("trying to insert data");
    Database db = await instance.database;
    print("after instance.database");
    return await db.insert(table, user.toMap());
  }

  Future<List<BioUser>> queryAllUsers() async {
    Database db = await instance.database;
    List<Map<String, dynamic>> users = await db.query(table);
    return users.map((u) => BioUser.fromMap(u)).toList();
  }

  Future<int> deleteAll() async {
    Database db = await instance.database;
    return await db.delete(table);
  }
}

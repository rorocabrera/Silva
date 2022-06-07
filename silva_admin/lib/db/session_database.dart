import 'package:silva_admin/models/session_db_model.dart';
import 'package:silva_admin/models/user.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SessionDatabase {
  static final SessionDatabase instance = SessionDatabase.init();
  static Database? _database;

  SessionDatabase.init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDb('session.db');
    return _database!;
  }

  Future<Database> _initDb(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path,
        version: 1, onCreate: _createDB, onConfigure: _onConfigure);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY';
    final intType = 'INTEGER NOT NULL';
    final textType = 'TEXT NOT NULL';
    final textNullable = 'TEXT';

    await db.execute(''' CREATE TABLE 
    $tableUsers (
      ${UserField.id} $intType,
      ${UserField.level} $intType,
      ${UserField.email} $textType,
      ${UserField.nombre} $textType,
      ${UserField.password} $textType,
      ${UserField.roles} $textType,
      ${UserField.updated_at} $textType


    ) ''');

    await db.execute(''' CREATE TABLE 
    $tablePerfil (
      ${PerfilesField.cedula} $textType,
      ${PerfilesField.nombre} $textType,
      ${PerfilesField.apellido} $textType,
      ${PerfilesField.biometrics} $textType,
      ${PerfilesField.email} $textType,
      ${PerfilesField.telefono} $textType,
      ${PerfilesField.updated_at} $textType

    ) ''');
  }

  Future _onConfigure(Database db) async {
    await db.execute("PRAGMA foreign_keys = ON");
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }

  Future<bool> insertUser(User user) async {
    final db = await instance.database;
    int t = await db.insert(tableUsers, user.toJson());
    if (t != 0) {
      return true;
    } else {
      return false;
    }
  }
}

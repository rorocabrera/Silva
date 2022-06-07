import 'package:silva_admin/models/session_db_model.dart';
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
      ${UserField.created_at} $textType,
      ${UserField.modified_at} $textType

    ) ''');

    await db.execute(''' CREATE TABLE 
    $tablePerfil (
      ${PerfilesField.cedula} $textType,
      ${PerfilesField.nombre} $textType,
      ${PerfilesField.apellido} $textType,
      ${PerfilesField.biometrics} $textType,
      ${PerfilesField.email} $textType,
      ${PerfilesField.telefono} $textType,
      ${PerfilesField.created_at} $textType,
      ${PerfilesField.modified_at} $textType
    ) ''');

    await db.execute(''' CREATE TABLE 
    $tableRoles (
      ${RolesField.id} $intType,
      ${RolesField.nombre} $textType,
      ${RolesField.created_at} $textType,
      ${RolesField.modified_at} $textType
    ) ''');

    await db.execute(''' CREATE TABLE 
    $tableModulos (
      ${ModulosField.id} $intType,
      ${ModulosField.id_rol} $intType,
      ${ModulosField.nombre} $textType,
      ${ModulosField.created_at} $textType,
      ${ModulosField.modified_at} $textType,
      FOREIGN KEY (${ModulosField.id_rol})
      REFERENCES $tableRoles(${RolesField.id})
    ) ''');

    await db.execute(''' CREATE TABLE 
    $tableUHR (
      ${UHRField.id_user} $intType,
      ${UHRField.id_rol} $intType,
      ${UHRField.created_at} $textType,
      ${UHRField.modified_at} $textType
      FOREIGN KEY (${UHRField.id_user})
      REFERENCES $tableUsers(${UserField.id})
      FOREIGN KEY (${UHRField.id_rol})
      REFERENCES $tableRoles(${RolesField.id})
    ) ''');
  }

  Future _onConfigure(Database db) async {
    await db.execute("PRAGMA foreign_keys = ON");
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}

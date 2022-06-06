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

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int vesion) async {}

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}

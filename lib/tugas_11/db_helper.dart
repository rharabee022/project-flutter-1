import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'user_model.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();
  factory DBHelper() => _instance;
  DBHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();

    final path = join(dbPath, 'kaeri_workspace.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE users(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nama TEXT,
            email TEXT UNIQUE,
            nomor_hp TEXT,
            asal_kota TEXT,
            password TEXT
          )
        ''');
      },
    );
  }

  Future<bool> registerUser(UserModelSQL pengguna) async {
    final db = await database;
    try {
      await db.insert('users', pengguna.toMap());
      return true; // Sukses menyimpan
    } catch (e) {
      return false;
    }
  }

  Future<List<UserModelSQL>> getAllPeserta() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('users');

    return List.generate(maps.length, (i) {
      return UserModelSQL.fromMap(maps[i]);
    });
  }

  Future<UserModelSQL?> loginUser(String email, String password) async {
    final db = await database;
    final List<Map<String, dynamic>> results = await db.query(
      'users',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );

    if (results.isNotEmpty) {
      return UserModelSQL.fromMap(results.first);
    }
    return null;
  }
}

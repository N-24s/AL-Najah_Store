import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
     String dbFolder=await getDatabasesPath();
  print(dbFolder);
  String dbName='address.db';
 String path= join(dbFolder,dbName);
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE address(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, address TEXT, phone TEXT)',
        );
      },
    );
  }

  // Create
  Future<void> insertAddress(Map<String, dynamic> address) async {
    final db = await database;
    await db.insert(
      'address',
      address,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Read all
  Future<List<Map<String, dynamic>>> getAddresses() async {
    final db = await database;
    return await db.query('address');
  }

  // Update
  Future<void> updateAddress(Map<String, dynamic> address) async {
    final db = await database;
    await db.update(
      'address',
      address,
      where: 'id = ?',
      whereArgs: [address['id']],
    );
  }

  // Delete
  Future<void> deleteAddress(int id) async {
    final db = await database;
    await db.delete(
      'address',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}

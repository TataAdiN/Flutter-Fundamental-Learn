import 'package:flutter_fundamental/data/models/restaurant.dart';
import 'package:sqflite/sqflite.dart';

class SqliteService {
  static SqliteService? _instance;
  static Database? _database;

  SqliteService._internal() {
    _instance = this;
  }

  factory SqliteService() => _instance ?? SqliteService._internal();

  static const String _tblFavorite = 'favorite_restaurants';

  Future<Database> _initializeDb() async {
    var path = await getDatabasesPath();
    var db = openDatabase(
      '$path/favorite_restaurants.db',
      onCreate: (db, version) async {
        await db.execute('''CREATE TABLE $_tblFavorite (
             id TEXT PRIMARY KEY,
             name TEXT,
             description TEXT,
             pictureId TEXT,
             city TEXT,
             rating TEXT,
           )     
        ''');
      },
      version: 1,
    );

    return db;
  }

  Future<Database?> get database async {
    _database ??= await _initializeDb();
    return _database;
  }

  Future<void> insertFavorite(Restaurant restaurant) async {
    final db = await database;
    await db!.insert(_tblFavorite, restaurant.toJson());
  }

  Future<List<Restaurant>> fetchFavorites() async {
    final db = await database;
    List<Map<String, dynamic>> results = await db!.query(_tblFavorite);
    return results.map((res) {
      return Restaurant.fromJson(res);
    }).toList();
  }

  Future<Map> findById(String restaurantId) async {
    final db = await database;

    List<Map<String, dynamic>> results = await db!.query(
      _tblFavorite,
      where: 'id = ?',
      whereArgs: [restaurantId],
    );

    if (results.isNotEmpty) {
      return results.first;
    } else {
      return {};
    }
  }

  Future<void> removeById(String restaurantId) async {
    final db = await database;

    await db!.delete(
      _tblFavorite,
      where: 'id = ?',
      whereArgs: [restaurantId],
    );
  }
}

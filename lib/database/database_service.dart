import 'dart:async';

import 'package:path/path.dart';
import 'package:petfinders/models/pet_display_model.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static DatabaseService? _databaseService;
  static Database? _database;

  // named constructor to create instance of this class
  DatabaseService._createInstance();

  factory DatabaseService() {
    // ignore: unnecessary_null_comparison
    if (_databaseService == null) {
      _databaseService = DatabaseService._createInstance();
    }
    return _databaseService!;
  }

  Future<Database> get database async {
    if (_database != null) return _database!;

    // Initialize the DB first time it is accessed
    _database = await initDB();
    return _database!;
  }

  Future<Database> initDB() async {
    final String path = await getDatabasesPath();

    return await openDatabase(join(path, 'pets.db'),
        onCreate: _onCreate, version: 1);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute("""CREATE TABLE pets (
        uid INTEGER PRIMARY KEY,
        name TEXT NOT NULL,
        breed TEXT NOT NULL,
        gender TEXT NOT NULL,
        age INTEGER NOT NULL,
        adopted INTEGER NOT NULL,
        price INTEGER NOT NULL,
        image BLOB )
        """);
  }

  Future<int> insertPet(PetDisplayModel pet) async {
    Database db = await database;
    int result = await db.insert('pets', pet.toMap());
    return result;
  }

  Future<int> updatePet(PetDisplayModel pet) async {
    Database db = await database;
    int result = await db
        .update('pets', pet.toMap(), where: "uid = ?", whereArgs: [pet.uid]);
    return result;
  }

  Future<List<PetDisplayModel>> retrievePets() async {
    Database db = await database;
    final List<Map<String, Object?>> queryResult =
        await db.query('pets');
    return queryResult.map((e) => PetDisplayModel.fromMap(e)).toList();
  }

  Future<void> deletepet(int id) async {
    Database db = await database;
    await db.delete(
      'pets',
      where: "uid = ?",
      whereArgs: [id],
    );
  }
}

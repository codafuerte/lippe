// Code taken from: https://www.tutorialkart.com/flutter/flutter-sqlite-tutorial/
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const _databaseName = "lippe.db";
  static const _databaseVersion = 1;

  static const table = 'saving_item';

  static const columnId = 'id';
  static const columnTitle = 'title';
  static const columnAmount = 'amount';
  static const columnCurrency = 'currency';
  static const columnDate = 'date';

  // make this a singleton class
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // only have a single app-wide reference to the database
  Future<Database> get database async {
    return await _initDatabase();
  }

  // this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  // SQL code to create the database table
  // Date as ISO8601 strings ("YYYY-MM-DD HH:MM:SS.SSS")
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnId TEXT PRIMARY KEY,
            $columnTitle TEXT NOT NULL,
            $columnAmount REAL NOT NULL,
            $columnCurrency TEXT NOT NULL,
            $columnDate TEXT NOT NULL
          )
          ''');
  }
}

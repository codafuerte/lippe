import 'package:lippe/saving_items_overview/models/saving_item.dart';
import 'package:lippe/shared/data-access/database_helper.dart';
import 'package:sqflite/sqflite.dart';

class SavingItemDbProvider {
  final Database db;

  const SavingItemDbProvider({required this.db});

  // Helper methods

  // Inserts a row in the database where each key in the Map is a column name
  // and the value is the column value. The return value is the id of the
  // inserted row.
  Future<int> insert(SavingItem savingItem) async {
    return await db.insert(DatabaseHelper.table, {
      DatabaseHelper.columnId: savingItem.id,
      DatabaseHelper.columnTitle: savingItem.title,
      DatabaseHelper.columnAmount: savingItem.amount,
      DatabaseHelper.columnCurrency: savingItem.currency,
      DatabaseHelper.columnDate: savingItem.date
    });
  }

  // All of the rows are returned as a list of maps, where each map is
  // a key-value list of columns.
  Future<List<SavingItem>> queryAllSavingItems() async {
    final List<Map<String, dynamic>> maps =
        await db.query(DatabaseHelper.table);

    return List.generate(maps.length, (i) {
      return SavingItem.fromMap(maps[i]);
    });
  }

  // All of the methods (insert, query, update, delete) can also be done using
  // raw SQL commands. This method uses a raw query to give the row count.
  Future<int?> queryRowCount() async {
    return Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM $DatabaseHelper.table'));
  }

  // We are assuming here that the id column in the map is set. The other
  // column values will be used to update the row.
  Future<int> update(SavingItem savingItem) async {
    int id = savingItem.toMap()['id'];
    return await db.update(DatabaseHelper.table, savingItem.toMap(),
        where: '$DatabaseHelper.columnId = ?', whereArgs: [id]);
  }

  // Deletes the row specified by the id. The number of affected rows is
  // returned. This should be 1 as long as the row exists.
  Future<int> delete(String id) async {
    return await db.delete(DatabaseHelper.table,
        where: '$DatabaseHelper.columnId = ?', whereArgs: [id]);
  }
}

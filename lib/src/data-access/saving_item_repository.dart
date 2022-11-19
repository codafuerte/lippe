import 'dart:async';
import 'package:lippe/src/data-access/saving_item_db_provider.dart';
import 'package:lippe/src/models/saving_item.dart';

class SavingItemRepository {
  final savingItemDbProvider = SavingItemDbProvider();

  Future<List<SavingItem>> queryAllSavingItems() => savingItemDbProvider.queryAllSavingItems();
}
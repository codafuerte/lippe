import 'dart:async';

import 'package:lippe/saving_items_overview/data-access/saving_item_db_provider.dart';
import 'package:lippe/saving_items_overview/models/saving_item.dart';

class SavingItemRepository {

  const SavingItemRepository({
    required SavingItemDbProvider savingItemDbProvider,
  }) : _savingItemDbProvider = savingItemDbProvider;

  final SavingItemDbProvider _savingItemDbProvider;

  Future<List<SavingItem>> queryAllSavingItems() => _savingItemDbProvider.queryAllSavingItems();

  Future<int> addSavingItem(SavingItem item) => _savingItemDbProvider.insert(item);
}
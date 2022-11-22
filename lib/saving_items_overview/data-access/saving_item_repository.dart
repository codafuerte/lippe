import 'dart:async';

import 'package:lippe/saving_items_overview/data-access/saving_item_db_provider.dart';
import 'package:lippe/saving_items_overview/models/saving_item.dart';

class SavingItemRepository {
  const SavingItemRepository({
    required SavingItemDbProvider savingItemDbProvider,
  }) : _savingItemDbProvider = savingItemDbProvider;

  final SavingItemDbProvider _savingItemDbProvider;

  // TODO: Work with Streams

  Future<List<SavingItem>> queryAllSavingItems() =>
      _savingItemDbProvider.queryAllSavingItems();

  Future<List<SavingItem>> addSavingItem(SavingItem item) async {
    await _savingItemDbProvider.insert(item);
    return queryAllSavingItems();
  }
}

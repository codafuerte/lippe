import 'dart:async';

import 'package:intl/intl.dart';
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

  Future<Map<String, List<SavingItem>>> addSavingItem(SavingItem item) async {
    await _savingItemDbProvider.insert(item);
    return queryAllSavingItemsGroupedByDate();
  }

  Future<Map<String, List<SavingItem>>>
      queryAllSavingItemsGroupedByDate() async { // TODO: groupBy als Attribut in UI Komponente packen, und nicht im data-access
    final Map<String, List<SavingItem>> savingItemsGroupedByDate = {};
    List<SavingItem> savingItems = await queryAllSavingItems();
    formatDate(String date) => DateFormat('dd.MM.yyyy').format(DateTime.parse(date)).toString();

    for (final item in savingItems) {
      savingItemsGroupedByDate.containsKey(formatDate(item.date))
          ? savingItemsGroupedByDate[formatDate(item.date)]?.add(item)
          : savingItemsGroupedByDate[formatDate(item.date)] = [item];
    }

    return savingItemsGroupedByDate;
  }
}

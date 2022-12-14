import 'package:flutter/material.dart';
import 'package:lippe/saving_items_overview/models/saving_item.dart';

enum SavingItemStateStatus { initial, loading, success, failure }

@immutable
class SavingItemsState {
  final SavingItemStateStatus status;
  final Map<String, List<SavingItem>> savingItemsGroupedByDate;

  const SavingItemsState(this.status, this.savingItemsGroupedByDate);
}

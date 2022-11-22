import 'package:flutter/material.dart';
import 'package:lippe/saving_items_overview/models/saving_item.dart';

@immutable
abstract class SavingItemsOverviewState {
  const SavingItemsOverviewState();
}

class SavingItemsOverviewLoading extends SavingItemsOverviewState {
  const SavingItemsOverviewLoading();
}

class SavingItemsOverviewSuccess extends SavingItemsOverviewState {
  final List<SavingItem> savingItems;
  const SavingItemsOverviewSuccess(this.savingItems);
}

class SavingItemsOverviewError extends SavingItemsOverviewState {
  final String errorMessage;
  const SavingItemsOverviewError(this.errorMessage);
}

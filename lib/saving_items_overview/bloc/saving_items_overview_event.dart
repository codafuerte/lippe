part of 'saving_items_overview_bloc.dart';

@immutable
abstract class SavingItemsOverviewEvent {
  const SavingItemsOverviewEvent();
}

class GetSavingItemsOverviewEvent extends SavingItemsOverviewEvent {
  const GetSavingItemsOverviewEvent();
}

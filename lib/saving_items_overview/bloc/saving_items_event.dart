part of 'saving_items_bloc.dart';

@immutable
abstract class SavingItemsEvent {
  const SavingItemsEvent();
}

class GetSavingItemsOverviewEvent extends SavingItemsEvent {
  const GetSavingItemsOverviewEvent();
}

class AddSavingItemEvent extends SavingItemsEvent {
  final SavingItem savingItem; 
  const AddSavingItemEvent(this.savingItem);
}

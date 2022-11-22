import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:lippe/saving_items_overview/bloc/saving_items_state.dart';
import 'package:lippe/saving_items_overview/data-access/saving_item_repository.dart';

part 'saving_items_event.dart';

class SavingItemsBloc extends Bloc<SavingItemsEvent, SavingItemsState> {
  final SavingItemRepository _savingItemRepository;

  SavingItemsBloc({required SavingItemRepository savingItemRepository})
      : _savingItemRepository = savingItemRepository,
        super(const SavingItemsState(SavingItemStateStatus.initial, [])) {
    on<GetSavingItemsOverviewEvent>((event, emit) async {
      try {
        final savingItems = await _savingItemRepository.queryAllSavingItems();
        emit(SavingItemsState(SavingItemStateStatus.success, savingItems));
      } catch (err) {
        emit(const SavingItemsState(SavingItemStateStatus.failure, []));
      }
    });
    on<AddSavingItemEvent>((event, emit) async {
      try {
        final savingItems = await _savingItemRepository.addSavingItem(event.savingItem);
        emit(SavingItemsState(SavingItemStateStatus.success, savingItems));
      } catch (err) {
        emit(const SavingItemsState(SavingItemStateStatus.failure, []));
      }
    });
  }
}

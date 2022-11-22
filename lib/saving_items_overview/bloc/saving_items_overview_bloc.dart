import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:lippe/saving_items_overview/bloc/saving_items_overview_state.dart';
import 'package:lippe/saving_items_overview/data-access/saving_item_repository.dart';

part 'saving_items_overview_event.dart';

class SavingItemsOverviewBloc
    extends Bloc<SavingItemsOverviewEvent, SavingItemsOverviewState> {
  final SavingItemRepository _savingItemRepository;

  SavingItemsOverviewBloc({required SavingItemRepository savingItemRepository})
      : _savingItemRepository = savingItemRepository,
        super(const SavingItemsOverviewLoading()) {
    on<GetSavingItemsOverviewEvent>((event, emit) async {
      try {
        final savingItems = await _savingItemRepository.queryAllSavingItems();
        emit(SavingItemsOverviewSuccess(savingItems));
      } catch (err) {
        emit(SavingItemsOverviewError(err.toString()));
      }
    });
  }
}

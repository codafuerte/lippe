import 'package:bloc/bloc.dart';
import 'package:lippe/saving_items_overview/data-access/saving_item_repository.dart';
import 'package:lippe/saving_items_overview/models/saving_item.dart';
import 'package:meta/meta.dart';

part 'saving_items_overview_event.dart';
part 'saving_items_overview_state.dart';

class SavingItemsOverviewBloc extends Bloc<SavingItemsOverviewEvent, SavingItemsOverviewState> {
  final SavingItemRepository savingItemRepository;
  
  SavingItemsOverviewBloc(this.savingItemRepository) : super(const SavingItemsOverviewLoading()) {
    on<GetSavingItemsOverviewEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

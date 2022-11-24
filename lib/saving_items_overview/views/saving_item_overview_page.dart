import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lippe/saving_items_overview/bloc/saving_items_bloc.dart';
import 'package:lippe/saving_items_overview/bloc/saving_items_state.dart';
import 'package:lippe/saving_items_overview/data-access/saving_item_repository.dart';
import 'package:lippe/saving_items_overview/models/saving_item.dart';
import 'package:lippe/saving_items_overview/widgets/saving_item_card.dart';

class SavingItemOverviewPage extends StatelessWidget {
  const SavingItemOverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => SavingItemsBloc(
            savingItemRepository: context.read<SavingItemRepository>())
          ..add(const GetSavingItemsOverviewEvent())
          ..add(AddSavingItemEvent(
              SavingItem(title: "Cola", amount: 2.00, currency: "EUR"))),
        child: const SavingItemOverviewView());
  }
}

class SavingItemOverviewView extends StatelessWidget {
  const SavingItemOverviewView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("You have following savings!"),
      ),
      body: BlocBuilder<SavingItemsBloc, SavingItemsState>(
        builder: (context, state) {
          print(state.toString());

          if (state.status == SavingItemStateStatus.loading) {
            return const Center(
                child: CupertinoActivityIndicator()); //TODO: Cupertino is iOS
          }

          if (state.status == SavingItemStateStatus.failure) {
            return Text("Error");
          }

          if (state.status == SavingItemStateStatus.success) {
            return SingleChildScrollView(
                    child: Column(
              children: [
                const SizedBox(
                  height: 200,
                  child: Text("Congrats, you´ve saved xxx €"),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: state.savingItemsGroupedByDate.length,
                  itemBuilder: (context, index) => SavingItemCard(
                      savingItems: state.savingItemsGroupedByDate.entries
                          .elementAt(index)
                          .value,
                      date: state.savingItemsGroupedByDate.entries
                          .elementAt(index)
                          .key),
                ),
              ],
            ));
          }

          return const SizedBox();
        },
      ),
    );
  }
}

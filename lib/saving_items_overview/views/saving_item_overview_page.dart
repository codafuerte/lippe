import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lippe/saving_items_overview/bloc/saving_items_bloc.dart';
import 'package:lippe/saving_items_overview/bloc/saving_items_state.dart';
import 'package:lippe/saving_items_overview/data-access/saving_item_repository.dart';
import 'package:lippe/saving_items_overview/models/saving_item.dart';
import 'package:lippe/saving_items_overview/widgets/saving_item_card.dart';
import 'package:lippe/saving_items_overview/widgets/sum_of_savings.dart';

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
        body: Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
      child: BlocBuilder<SavingItemsBloc, SavingItemsState>(
        builder: (context, state) {
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
                Container(
                    padding: const EdgeInsets.only(top: 50.0, bottom: 20.0),
                    child: Center(
                      child: Text("Your savings this month:",
                          style: GoogleFonts.roboto(
                            textStyle:
                                Theme.of(context).textTheme.headlineLarge,
                          )),
                    )),
                SumOfSavings(
                    savingItems: state.savingItemsGroupedByDate.values
                        .expand((element) => element)
                        .toList(),
                    sumOfSavingsTimeWindow: SumOfSavingsTimeWindow.month),
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
    ));
  }
}

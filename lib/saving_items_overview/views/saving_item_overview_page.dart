import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lippe/saving_items_overview/bloc/saving_items_overview_bloc.dart';
import 'package:lippe/saving_items_overview/bloc/saving_items_overview_state.dart';
import 'package:lippe/saving_items_overview/data-access/saving_item_repository.dart';

class SavingItemOverviewPage extends StatelessWidget {
  const SavingItemOverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => SavingItemsOverviewBloc(
            savingItemRepository: context.read<SavingItemRepository>())
          ..add(const GetSavingItemsOverviewEvent()),
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
      body: BlocBuilder<SavingItemsOverviewBloc, SavingItemsOverviewState>(
        builder: (context, state) {
          print(state.toString());

          if (state is SavingItemsOverviewLoading) {
            return const Center(child: CupertinoActivityIndicator());
          }

          if (state is SavingItemsOverviewError) {
            return Text(state.errorMessage);
          }

          if (state is SavingItemsOverviewSuccess) {
            print(state.savingItems);
            return CupertinoScrollbar(
              child: ListView(
                children: [
                  for (final savingItem in state.savingItems)
                    ListTile(
                      title: Text(savingItem.title),
                    ),
                ],
              ),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}

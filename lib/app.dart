import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lippe/saving_items_overview/data-access/saving_item_repository.dart';
import 'package:lippe/saving_items_overview/views/saving_item_overview_page.dart';

class LippeApp extends StatelessWidget {
  final SavingItemRepository savingItemRepository;

  const LippeApp({super.key, required this.savingItemRepository});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: savingItemRepository,
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: GoogleFonts.robotoTextTheme(
          ThemeData(brightness: Brightness.dark).textTheme
        )
      ),
      // TODO: localizationsDelegates: AppLocalizations.localizationsDelegates,
      // TODO: supportedLocales: AppLocalizations.supportedLocales,
      home: const SavingItemOverviewPage(),
    );
  }
}

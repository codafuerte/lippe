import 'package:flutter/material.dart';
import 'package:lippe/app.dart';
import 'package:lippe/saving_items_overview/data-access/saving_item_db_provider.dart';
import 'package:lippe/saving_items_overview/data-access/saving_item_repository.dart';
import 'package:lippe/shared/data-access/database_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final savingItemDbProvider =
      SavingItemDbProvider(db: await DatabaseHelper.instance.database);

  final savingItemRepository =
      SavingItemRepository(savingItemDbProvider: savingItemDbProvider);

  runApp(LippeApp(savingItemRepository: savingItemRepository));
}

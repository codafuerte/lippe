import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lippe/app.dart';
import 'package:lippe/saving_items_overview/data-access/saving_item_db_provider.dart';
import 'package:lippe/saving_items_overview/data-access/saving_item_repository.dart';
import 'package:lippe/shared/data-access/database_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('assets/google_fonts/roboto/LICENSE.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });

  final savingItemDbProvider =
      SavingItemDbProvider(db: await DatabaseHelper.instance.database);

  final savingItemRepository =
      SavingItemRepository(savingItemDbProvider: savingItemDbProvider);

  runApp(LippeApp(savingItemRepository: savingItemRepository));
}

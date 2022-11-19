import 'package:lippe/src/data-access/database_helper.dart';

class SavingItem {
  String id;
  String title;
  double amount;
  String currency;
  DateTime date;

  SavingItem(
      {required this.id,
      required this.title,
      required this.amount,
      required this.currency,
      required this.date});

  SavingItem.fromMap(Map<String, dynamic> map)
      : id = map[DatabaseHelper.columnId],
        title = map[DatabaseHelper.columnTitle],
        amount = map[DatabaseHelper.columnAmount],
        currency = map[DatabaseHelper.columnCurrency],
        date = map[DatabaseHelper.columnDate];

  Map<String, dynamic> toMap() {
    return {
      DatabaseHelper.columnId: id,
      DatabaseHelper.columnTitle: title,
      DatabaseHelper.columnAmount: amount,
      DatabaseHelper.columnCurrency: currency,
      DatabaseHelper.columnDate: date
    };
  }
}

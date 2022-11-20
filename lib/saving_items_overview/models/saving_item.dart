import 'package:flutter/cupertino.dart';
import 'package:lippe/shared/data-access/database_helper.dart';

@immutable
class SavingItem {
  final String id;
  final String title;
  final double amount;
  final String currency;
  final DateTime date;

  const SavingItem(
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

  SavingItem copyWith(
      {String? id,
      String? title,
      double? amount,
      String? currency,
      DateTime? date}) {
    return SavingItem(
        id: id ?? this.id,
        title: title ?? this.title,
        amount: amount ?? this.amount,
        currency: currency ?? this.currency,
        date: date ?? this.date);
  }
}

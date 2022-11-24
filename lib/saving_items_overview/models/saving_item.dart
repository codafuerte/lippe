import 'package:flutter/cupertino.dart';
import 'package:lippe/shared/data-access/database_helper.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

@immutable
class SavingItem {
  final String id;
  final String title;
  final double amount;
  final String currency;
  final String date;

  SavingItem({
    required this.title,
    required this.amount,
    required this.currency,
  })  : id = uuid.v4(),
        date = DateTime.now().toIso8601String();

  const SavingItem.copyWith({
      required this.id,
      required this.title,
      required this.amount,
      required this.currency,
      required this.date
  });

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
      String? date}) {
    return SavingItem.copyWith(
        id: id ?? this.id,
        title: title ?? this.title,
        amount: amount ?? this.amount,
        currency: currency ?? this.currency,
        date: date ?? this.date);
  }
}

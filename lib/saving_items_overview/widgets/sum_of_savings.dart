import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lippe/saving_items_overview/models/saving_item.dart';

enum SumOfSavingsTimeWindow { day, month, year, total }

class SumOfSavings extends StatelessWidget {
  final List<SavingItem> savingItems;
  final SumOfSavingsTimeWindow sumOfSavingsTimeWindow;

  const SumOfSavings(
      {super.key,
      required this.savingItems,
      required this.sumOfSavingsTimeWindow});

  _getTotalSavingsAmount(List<SavingItem> savingItems,
      SumOfSavingsTimeWindow sumOfSavingsTimeWindow) {
    final now = DateTime.now();

    final keyYear = sumOfSavingsTimeWindow == SumOfSavingsTimeWindow.total
        ? 1970
        : now.year;

    final keyMonth = (sumOfSavingsTimeWindow == SumOfSavingsTimeWindow.month ||
            sumOfSavingsTimeWindow == SumOfSavingsTimeWindow.day)
        ? now.month
        : 1;

    final keyDay =
        sumOfSavingsTimeWindow == SumOfSavingsTimeWindow.day ? now.day : 1;

    final keyDate = DateTime(keyYear, keyMonth, keyDay);

    double sum = savingItems
        .where((item) => DateTime.parse(item.date).isAfter(keyDate))
        .toList()
        .map((item) => item.amount)
        .reduce((amount, totalAmount) => amount + totalAmount);

    return sum;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        width: 200,
        decoration: BoxDecoration(
            color: Colors.lime.shade100,
            borderRadius: BorderRadius.circular(100)),
        child: Center(
            child: Text(
                "${_getTotalSavingsAmount(savingItems, sumOfSavingsTimeWindow).toString()} €",
                style: GoogleFonts.roboto(
                    textStyle: Theme.of(context).textTheme.displayMedium,
                    color: Color.fromARGB(255, 34, 106, 40)))));
  }
}

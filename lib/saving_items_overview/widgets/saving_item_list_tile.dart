import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lippe/saving_items_overview/models/saving_item.dart';

class SavingItemListTile extends StatelessWidget {
  final SavingItem savingItem;

  const SavingItemListTile({super.key, required this.savingItem});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
        margin: const EdgeInsets.only(bottom: 10.0),
        child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(savingItem.title,
                  style: GoogleFonts.roboto(
                      textStyle: Theme.of(context).textTheme.headlineSmall)),
              Text("${savingItem.amount.toString()} ${savingItem.currency}",
                  style: GoogleFonts.roboto(
                      textStyle: Theme.of(context).textTheme.headlineSmall)),
            ]));
  }
}

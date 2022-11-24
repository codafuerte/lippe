import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lippe/saving_items_overview/models/saving_item.dart';
import 'package:intl/intl.dart';
import 'package:lippe/saving_items_overview/widgets/saving_item_list_tile.dart';

class SavingItemCard extends StatelessWidget {
  final List<SavingItem> savingItems;
  final String date;

  const SavingItemCard(
      {super.key, required this.savingItems, required this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(date,style: GoogleFonts.roboto( // TODO: fix order: newest date on the top
                      textStyle: Theme.of(context).textTheme.subtitle1)),
            const Divider(),
            ...savingItems.map((item) {
              return SavingItemListTile(savingItem: item);
            }).toList(),
          ],
        ));
  }
}

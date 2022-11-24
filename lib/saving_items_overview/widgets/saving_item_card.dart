import 'package:flutter/material.dart';
import 'package:lippe/saving_items_overview/models/saving_item.dart';
import 'package:intl/intl.dart';

class SavingItemCard extends StatelessWidget {
  final List<SavingItem> savingItems;
  final String date;

  const SavingItemCard(
      {super.key, required this.savingItems, required this.date});

  @override
  Widget build(BuildContext context) {
    return 
        Column(
          children: [
            Text(date),
            const Divider(),
            SizedBox(
                height: 120,
                child: ListView.builder(
                  primary: false,
                  itemCount: savingItems.length,
                  itemBuilder: ((BuildContext context, int index) {
                    return ListTile(title: Text(savingItems[index].title));
                  }),
                ))
          ],
        );
  }
}

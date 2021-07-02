import 'package:flutter/material.dart';
import 'historyItem.dart';
import 'models/product.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        children: [
          HistoryItem(product: Product(name: 'Urlaub')),
          HistoryItem(product: Product(name: 'Ferien')),
          HistoryItem(product: Product(name: 'Festivals')),
          HistoryItem(product: Product(name: 'Festivals')),
          HistoryItem(product: Product(name: 'Festivals')),
          HistoryItem(product: Product(name: 'Festivals')),
          HistoryItem(product: Product(name: 'Festivals')),
          HistoryItem(product: Product(name: 'Festivals')),
        ],
      ),
    );
  }
}

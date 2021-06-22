import 'package:flutter/material.dart';
import 'detailScreen.dart';

class Product {
  const Product({required this.name});
  final String name;
}

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        children: [
          ListItem(product: Product(name: 'Urlaub')),
          ListItem(product: Product(name: 'Ferien')),
          ListItem(product: Product(name: 'Festivals')),
        ],
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  ListItem({required this.product}) : super(key: ObjectKey(product));

  final Product product;

  @override
  Widget build(BuildContext context) {
    void NavigateToDetail() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DetailScreen()),
      );
    }

    return Container(
      child: TextButton(
        onPressed: NavigateToDetail,
        child: Row(
          children: [
            Image(
              image: AssetImage('assets/image1.png'),
              fit: BoxFit.contain,
              width: 100,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(product.name),
            ),
          ],
        ),
      ),
      margin: new EdgeInsets.only(bottom: 8.0),
    );
  }
}

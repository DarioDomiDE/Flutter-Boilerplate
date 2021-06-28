import 'package:flutter/material.dart';
import 'package:fluttertest/obj/hashtagData.dart';
import 'detailScreen.dart';
import 'obj/product.dart';

class HistoryItem extends StatelessWidget {
  HistoryItem({required this.product}) : super(key: ObjectKey(product));

  final Product product;

  @override
  Widget build(BuildContext context) {
    var data = new HashtagData("Foto #1", [
      'indonesiaBagus',
      'travelparadise',
      'heisnotlost',
      'thailandisnice',
      'ahoitotheworld',
      '10xdario',
      'hashtagBuddy',
      'niceApp',
    ]);
    void NavigateToDetail() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DetailScreen(data: data)),
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

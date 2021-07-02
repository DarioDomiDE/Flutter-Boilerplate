import 'package:flutter/material.dart';
import 'package:fluttertest/models/hashtagData.dart';
import 'detailScreen.dart';
import '../../models/photoData.dart';
import '../../models/product.dart';

class HistoryItem extends StatelessWidget {
  HistoryItem({required this.product}) : super(key: ObjectKey(product));

  final Product product;

  @override
  Widget build(BuildContext context) {
    var data = PhotoData('Foto #1', [
      HashtagData('indonesiaBagus', false),
      HashtagData('travelparadise', false),
      HashtagData('heisnotlost', true),
      HashtagData('thailandisnice', false),
      HashtagData('ahoitotheworld', true),
      HashtagData('10xdario', false),
      HashtagData('hashtagBuddy', true),
      HashtagData('niceApp', false),
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
              image: AssetImage('assets/images/image1.png'),
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

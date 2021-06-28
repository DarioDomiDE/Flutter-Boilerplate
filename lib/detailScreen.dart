import 'package:flutter/material.dart';
import 'obj/hashtagData.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, required this.data}) : super(key: key);
  final HashtagData data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          data.title,
        ),
      ),
      body: Column(children: [
        Text(
          'Start as dasd ad sad asa sa dsad sa dsad sad sa dad asa sa dsad sa dsad sad sa dad asa dsad sasa dsad sad sa dad asa dsad sad sa d Ende.',
          overflow: TextOverflow.clip,
        ),
        Row(children: [
          ...data.hashtags.map(
            (hashtag) => Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Text(
                '#' + hashtag,
                style: TextStyle(
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(6),
                color: Color.fromRGBO(230, 230, 230, 1),
              ),
              margin: EdgeInsets.all(4),
            ),
          )
        ]),
      ]),
    );
  }
}

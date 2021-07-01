import 'package:flutter/material.dart';
import 'obj/photoData.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, required this.data}) : super(key: key);
  final PhotoData data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          data.title,
        ),
      ),
      body: Column(children: [
        Image(
          image: AssetImage('assets/image1.png'),
          fit: BoxFit.cover,
          height: 150,
          width: MediaQuery.of(context).size.width,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                'Start as dasd ad sad asa sa dsad sa dsad sad sa dad asa sa dsad sa dsad sad sa dad asa dsad sasa dsad sad sa dad asa dsad sad sa d Ende.',
                overflow: TextOverflow.clip,
              ),
              SizedBox(
                width: double.infinity,
                child: Text(
                  'Headline',
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Wrap(
                  children: [
                    ...data.hashtags.map(
                      (hashtag) => TextButton(
                        onPressed: () {},
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                          child: Text(
                            '#' + hashtag.title,
                            style: TextStyle(
                              fontSize: 12,
                              color: hashtag.isSelected
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            gradient: hashtag.isSelected
                                ? LinearGradient(
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft,
                                    colors: [
                                      Color(0xFFFF8C64),
                                      Color(0xFFFF5070),
                                    ],
                                  )
                                : null,
                            color: Color.fromRGBO(230, 230, 230, 1),
                          ),
                          margin: EdgeInsets.all(4),
                        ),
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.all(0)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}

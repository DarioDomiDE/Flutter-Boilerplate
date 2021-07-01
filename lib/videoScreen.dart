import 'package:flutter/material.dart';

class VideoScreen extends StatelessWidget {
  const VideoScreen({Key? key, required this.player}) : super(key: key);
  final Widget player;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      player,
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
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
            child: Text(
              '\nHerzlich Willkommen zu Eurer 1. Stunde!\n\nGroßartig, dass du den Weg zum Schwimmen lernen mit deinem Kind gemeinsam gehst.\n\n●  Tauchen\n	    ○  Part 1\n    	○  Part 2\n\n●  Springen\n	    ○  Part 3\n    	○  Part 4\n\nBlaaa...',
            ),
          ),
        ]),
      ),
    ]));
  }
}

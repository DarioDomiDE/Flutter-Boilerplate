import 'package:flutter/material.dart';
import 'package:fluttertest/di/service_locator.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'hashtags/historyScreen.dart';
import 'video/videoScreen.dart';
import 'quiz/quizScreen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hashtag Buddy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(title: 'Dario\'s App'),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  int _selectedPage = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget?> _widgetOptions = <Widget?>[
    QuizScreen(),
    HistoryScreen(),
    VideoScreen(),
  ];

  late YoutubePlayer player;
  // YoutubePlayer player = YoutubePlayer(
  //     controller: YoutubePlayerController(
  //   initialVideoId: 'KxQIcxlMudw',
  //   flags: YoutubePlayerFlags(
  //     autoPlay: false,
  //     mute: false,
  //     captionLanguage: 'de',
  //   ),
  // ));

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    player = getIt<YoutubePlayer>();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: player,
      builder: (context, player) {
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: _widgetOptions.elementAt(_selectedPage),
          floatingActionButton: FloatingActionButton(
            onPressed: () => {},
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Quiz',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.business),
                label: 'Hashtags',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.school),
                label: 'Video',
              ),
            ],
            currentIndex: _selectedPage,
            selectedItemColor: Colors.amber[800],
            onTap: _onItemTapped,
          ),
        );
      },
    );
  }
}

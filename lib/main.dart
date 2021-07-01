import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'history.dart';
import 'videoScreen.dart';
import 'quizScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
    null
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'KxQIcxlMudw',
    flags: YoutubePlayerFlags(
      autoPlay: false,
      mute: false,
      captionLanguage: 'de',
    ),
  );

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _controller,
      ),
      builder: (context, player) {
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: _selectedPage != 2
              ? _widgetOptions.elementAt(_selectedPage)
              : VideoScreen(player: player),
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
                label: 'History',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.school),
                label: 'Detail',
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

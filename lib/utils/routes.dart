// import 'package:boilerplate/ui/home/home.dart';
// import 'package:boilerplate/ui/login/login.dart';
// import 'package:boilerplate/ui/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:fluttertest/ui/hashtags/historyScreen.dart';
import 'package:fluttertest/ui/quiz/quizScreen.dart';
import 'package:fluttertest/ui/video/videoScreen.dart';

class Routes {
  Routes._();

  //static variables
  static const String home = '/home';
  static const String history = '/history';
  static const String video = '/video';

  static final routes = <String, WidgetBuilder>{
    home: (BuildContext context) => QuizScreen(),
    history: (BuildContext context) => HistoryScreen(),
    video: (BuildContext context) => VideoScreen(),
  };
}

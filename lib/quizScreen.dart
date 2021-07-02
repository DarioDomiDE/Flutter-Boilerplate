import 'dart:async';

import 'package:flutter/material.dart';
import 'answerButton.dart';
import 'models/questionData.dart';
import 'question.dart';
import 'package:fluttertest/data/repository.dart';
import 'data/apis/post_api.dart';
import 'data/clients/rest_client.dart';
import 'models/post_list.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);
  @override
  QuizScreenState createState() => QuizScreenState();
}

class QuizScreenState extends State<QuizScreen> {
  // ToDo store globally, in a store of as Singleton somewhere?
  PostList posts = PostList(posts: []);
  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    // var response = await http.get(Uri.parse(Endpoints.getPosts));
    // var jsonData = JsonDecoder().convert(response.body);
    // posts = PostList.fromJson(jsonData);

    var client = RestClient();
    var postApi = PostApi(client);
    var respository = Repository(postApi);
    posts = await respository.getPosts();
  }

  static const data = [
    QuestionData(
      'Whats your fav. color?',
      ['Rot', 'Blau'],
    ),
    QuestionData(
      'Whats your fav. Pet?',
      ['Hund', 'Katze'],
    ),
    QuestionData(
      'Whats your fav. Car?',
      ['Sportwagen', 'CamperVan'],
    ),
    QuestionData(
      'Programming Language?',
      ['C#', 'Java'],
    ),
  ];
  int index = 0;

  void answerQuestion(int id) {
    setState(() {
      print('Answer chosen: ' + id.toString());
      index++;
      if (index == data.length) {
        index = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Question((index + 1).toString() + ': ' + data[index].question),
        Row(
          children: [
            Answer(data[index].answers[0], 1, answerQuestion),
            Answer(data[index].answers[1], 2, answerQuestion),
          ],
        ),
        ...posts.posts!.map((post) => Text(post.title ?? ''))
      ]),
    );
  }
}

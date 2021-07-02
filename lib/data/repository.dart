import 'dart:async';

import 'package:fluttertest/data/apis/post_api.dart';
import 'package:fluttertest/models/post_list.dart';

class Repository {
  final PostApi _postApi;

  Repository(this._postApi);

  Future<PostList> getPosts() async {
    return await _postApi.getPosts().then((postsList) {
      return postsList;
    }).catchError((error) => throw error);
  }
}

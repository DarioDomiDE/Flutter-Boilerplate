import 'dart:async';

import '../models/post_list.dart';
import 'network/apis/post_api.dart';

class Repository {
  final PostApi _postApi;

  Repository(this._postApi);

  Future<Posts> getPosts() async {
    return await _postApi.getPosts().then((postsList) {
      return postsList;
    }).catchError((error) => throw error);
  }

  // Language: -----------------------------------------------------------------
  // Future<void> changeLanguage(String value) =>
  //     _sharedPrefsHelper.changeLanguage(value);

  // String? get currentLanguage => _sharedPrefsHelper.currentLanguage;
}

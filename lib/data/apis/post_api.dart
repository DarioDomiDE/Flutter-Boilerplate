import 'dart:async';

import 'package:fluttertest/data/clients/rest_client.dart';
import 'package:fluttertest/data/constants/endpoints.dart';
import 'package:fluttertest/data/exceptions/network_exceptions.dart';
import 'package:fluttertest/models/post_list.dart';

class PostApi {
  // rest-client instance
  final RestClient _restClient;

  // injecting instance
  PostApi(this._restClient);

  Future<PostList> getPosts() {
    return _restClient
        .get(Endpoints.getPosts)
        .then((dynamic res) => PostList.fromJson(res))
        .catchError((error) => throw NetworkException(message: error));
  }
}

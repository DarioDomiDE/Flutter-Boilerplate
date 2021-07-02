import 'dart:async';

import '../../../models/post_list.dart';
import '../endpoints.dart';
import '../network_exceptions.dart';
import '../rest_client.dart';

class PostApi {
  // rest-client instance
  final RestClient _restClient;

  // injecting instance
  PostApi(this._restClient);

  Future<Posts> getPosts() {
    return _restClient
        .get(Endpoints.getPosts)
        .then((dynamic res) => Posts.fromJson(res))
        .catchError((error) => throw NetworkException(message: error));
  }
}

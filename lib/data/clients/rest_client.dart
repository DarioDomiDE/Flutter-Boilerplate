import 'dart:async';
import 'dart:convert';

import 'package:fluttertest/data/exceptions/network_exceptions.dart';
import 'package:http/http.dart' as http;

class RestClient {
  // instantiate json decoder for json serialization
  final JsonDecoder _decoder = JsonDecoder();

  // Get:-----------------------------------------------------------------------
  Future<dynamic> get(String path) {
    return http.get(Uri.parse(path)).then(createResponse);
  }

  // Post:----------------------------------------------------------------------
  Future<dynamic> post(String path,
      {Map<String, String>? headers, body, encoding}) {
    return http
        .post(Uri.parse(path), body: body, headers: headers, encoding: encoding)
        .then(createResponse);
  }

  // Put:----------------------------------------------------------------------
  Future<dynamic> put(String path,
      {Map<String, String>? headers, body, encoding}) {
    return http
        .put(Uri.parse(path), body: body, headers: headers, encoding: encoding)
        .then(createResponse);
  }

  // Delete:----------------------------------------------------------------------
  Future<dynamic> delete(String path,
      {Map<String, String>? headers, body, encoding}) {
    return http
        .delete(Uri.parse(path),
            body: body, headers: headers, encoding: encoding)
        .then(createResponse);
  }

  // Response:------------------------------------------------------------------
  dynamic createResponse(http.Response response) {
    final String res = response.body;
    final int statusCode = response.statusCode;

    if (statusCode < 200 || statusCode > 400) {
      throw NetworkException(
          message: 'Error fetching data from server', statusCode: statusCode);
    }
    return _decoder.convert(res);
  }
}

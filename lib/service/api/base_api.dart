import 'dart:io';

import 'package:dio/dio.dart';

class BaseApi {
  static final String _baseUrl =
      "http://mayadin.tehran.ir/DesktopModules/TM_ArticleList/API";

  final dio = Dio()..options.baseUrl = _baseUrl;

  Future<dynamic> get(String path, Map<String, dynamic> params) async {
    var responseJson;
    try {
      final response = await dio.get(path, queryParameters: params);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw Exception('No Internet connection');
    }

    return responseJson;
  }

  Future<dynamic> post(String path, Map<String, dynamic> params) async {
    var responseJson;
    try {
      final response = await dio.post(path, data: FormData.from(params));
      responseJson = _returnResponse(response);
    } on SocketException {
      throw Exception('No Internet connection');
    } on DioError {
      throw Exception('No Internet connection');
    }

    return responseJson;
  }

  dynamic _returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = response.data;
        print(responseJson);
        return responseJson;
      case 400:
        throw Exception(response.data.toString());
      case 401:
      case 403:
        throw Exception(response.data.toString());
      case 500:
      default:
        throw Exception(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}

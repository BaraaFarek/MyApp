import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class DioHelper {
  static var dio;
  static init() {
    dio = Dio(BaseOptions(
      baseUrl: 'http://127.0.0.1:8000/api/',
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> get(
      {required String? url, required Map<String, dynamic>? query}) async {
    return await dio.get(url, queryParameters: query);
  }

  static Future<Response> getData(
      {required String? url, required Map<String, dynamic>? query}) async {
    return await dio.get(url, queryParameters: query);
  }
}

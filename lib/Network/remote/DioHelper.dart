import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class DioHelper {
  static var dio;
  static init() {
    dio = Dio(BaseOptions(
      baseUrl: 'http://127.0.0.1:8000',
      receiveDataWhenStatusError: true,
    ));
    // headers: {'Content-Type': 'application/json'}));
  }

  static Future<Response> getcategory({required String? url}) async {
    return await dio.get(url);
  }

  static Future<Response> postData(
      {required String? url,
      // String lang ='ar';
      // String token ;
      Map<String, dynamic>? query,
      required Map<String, dynamic> data}) async {
    //لو عنا headerمتغيرة
    // dio.options.headers{
    //     'lang' : lang,
    //     'token' : token,
    //   }
    // );
    return await dio.post(url, queryParameters: query, data: data);
  }
}

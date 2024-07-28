import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled/models/Products_Model.dart';

import '../../models/CategoriesModel.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('11184130:60-dayfreetrial'));

    // dio?.interceptors.add(
    //   InterceptorsWrapper(
    //     onError: (DioError error, handler) {
    //       if (error.response?.statusCode == 401) {
    //         Fluttertoast.showToast(
    //           msg: 'error 401',
    //           textColor: Colors.black,
    //           backgroundColor: Colors.white,
    //           fontSize: 16.0,
    //           toastLength: Toast.LENGTH_LONG,
    //           gravity: ToastGravity.BOTTOM,
    //           timeInSecForIosWeb: 1,
    //         );
    //       }
    //       return handler.next(error);
    //     },
    //   ),
    // );

    dio = Dio(
      BaseOptions(
        validateStatus: (_) => true,
        contentType: Headers.jsonContentType,
        responseType: ResponseType.json,
        baseUrl: 'http://joudalbakkour-001-site1.ltempurl.com/',
        receiveDataWhenStatusError: true,
        headers: {
          'Authorization': basicAuth,
        },
        connectTimeout: Duration(seconds: 60),
        // 60 seconds
        receiveTimeout: Duration(seconds: 60),
      ),
    );
  }

  static Future<Response?> getDataWithToken(String url,
      {required String? token}) async {
    dio?.options.headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    };

    return await dio?.get(url);
  }

  static Future<Response?> postData({
    required String url,
    required Map<String, dynamic> data,
  }) async {
    return await dio?.post(url, data: data);
  }

  static Future<Response?> postDataWithToken({
    String? token,
    required String url,
    required Map<String, dynamic> data,
  }) async {
    dio?.options.headers = {'token': token};
    return await dio?.post(url, data: data);
  }

  static Future<Response?> getData(
    String url,
    // {String? token}
  ) async {
    try {
      final response = await dio?.get(url);
      return response;
    } catch (e) {
      print('Dio error: $e');
      return null;
    }
  }
}

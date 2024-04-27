import 'package:dio/dio.dart';

class DioNetwork {
  static late Dio dio;
  static void initDio() {
    dio = Dio(BaseOptions(
      baseUrl: ' ',
      receiveDataWhenStatusError: true,
    ));
  }

  Future<Response> post(
      {required String url, required Map<String, dynamic> data}) async {
    dio.options.headers = {'Content-type': 'application/json'};
    return await dio.post(url, data: data);
  }
}

import 'package:untitled/core/Errors/error_model.dart';
import 'package:dio/dio.dart';

class Failure implements Exception {
  final errorModel;

  Failure({required this.errorModel});
}

void handleDioExceptions(DioException e) {
  switch (e.type) {
    // أول سبع أنواع أنو الريكويست ما وصل أبداً للداتابيز\
    case DioExceptionType.connectionTimeout:
      throw Failure(errorModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.sendTimeout:
      throw Failure(errorModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.receiveTimeout:
      throw Failure(errorModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.badCertificate:
      throw Failure(errorModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.cancel:
      throw Failure(errorModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.connectionError:
      throw Failure(errorModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.unknown:
      throw Failure(errorModel: ErrorModel.fromJson(e.response!.data));
    // وصل للداتابيز بس بجوز باعت داتا خطأ أو في مشكلة
    case DioExceptionType.badResponse:
      switch (e.response?.statusCode) {
        case 400: // Bad request
          throw Failure(errorModel: ErrorModel.fromJson(e.response!.data));
        case 401: // unauthorized
          throw Failure(errorModel: ErrorModel.fromJson(e.response!.data));
        case 403: // forbidden
          throw Failure(errorModel: ErrorModel.fromJson(e.response!.data));
        case 404: // not found
          throw Failure(errorModel: ErrorModel.fromJson(e.response!.data));
        case 409: // confficient
          throw Failure(errorModel: ErrorModel.fromJson(e.response!.data));
        case 422: // Unprocessable Entity
          throw Failure(errorModel: ErrorModel.fromJson(e.response!.data));
        case 504: // Server Exception
          throw Failure(errorModel: ErrorModel.fromJson(e.response!.data));
      }
  }
}

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:untitled/Network/remote/DioHelper.dart';
import 'package:untitled/models/LogoutModel.dart';

import '../../../Network/local/cache_Helper.dart';
import '../../../models/LoginModel.dart';
import 'login_states.dart';

class login_cubit extends Cubit<login_states> {
  login_cubit() : super(intial_login_states());

  static login_cubit get(context) => BlocProvider.of(context);
  final TextEditingController email_controller = TextEditingController();
  final TextEditingController password_controller = TextEditingController();
  final TextEditingController name_controller = TextEditingController();
  var form_key = GlobalKey<FormState>();
  late LoginModel loginModel;
  late LogoutModel logoutModel;
  Future<void> signIn() async {
    emit(loading_login_states());
    await DioHelper.postData(url: 'api/login', data: {
      'email': email_controller.text,
      'password': password_controller.text,
    }).then((value) async {
      if (value?.statusCode == 200 || value?.statusCode == 401)
        final response = LoginModel.fromJson(value?.data);
      emit(success_login_states(value?.data));
    }).catchError((e) {
      print(e.toString());
      emit(Error_login_states(e));
    });
  }

  Future<void> Register() async {
    emit(loading_login_states());
    await DioHelper.postData(url: 'api/register', data: {
      'name': name_controller.text,
      'email': email_controller.text,
      'password': password_controller.text,
    }).then((value) {
      if (value?.statusCode == 200 || value?.statusCode == 401)
        print(loginModel.message);
      emit(success_login_states(loginModel));
    }).catchError((e) {
      print(e.toString());
      emit(Error_login_states(e));
    });
  }

  Future<void> Logout() async {
    emit(loadingLogoutstates());
    await DioHelper.postData(url: 'api/logout', data: {
      'token': CacheHelper.getData(key: 'token'),
    }).then((value) {
      emit(successLogoutstates(logoutModel));
    }).catchError((e) {
      print(e.toString());
      emit(ErrorLogoutstates(e));
    });
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:untitled/Network/remote/DioHelper.dart';
import 'package:untitled/modules/login/Login_cubit/login_states.dart';

import '../../../models/LoginModel/LoginModel.dart';

class login_cubit extends Cubit<login_states> {
  login_cubit() : super(intial_login_states());

  static login_cubit get(context) => BlocProvider.of(context);
  final TextEditingController email_controller = TextEditingController();
  final TextEditingController password_controller = TextEditingController();
  var form_key = GlobalKey<FormState>();
  bool isloading = false;
  late LoginModel loginModel;
  Future<void> signIn() async {
    isloading = true;
    emit(loading_login_states());
    await DioHelper.postData(url: '/api/login', data: {
      'email': email_controller.text,
      'password': password_controller.text,
    }).then((value) {
      if (value?.statusCode == 200 || value?.statusCode == 401)
        loginModel = LoginModel.fromJson(value?.data);
      print(loginModel.message);
      emit(success_login_states(loginModel));
    }).catchError((e) {
      print(e.toString());
      emit(Error_login_states(e));
    });
  }
}

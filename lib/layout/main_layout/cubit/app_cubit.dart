import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/Network/endpoints.dart';
import 'package:untitled/Network/local/cache_Helper.dart';
import 'package:untitled/Network/remote/DioHelper.dart';
import 'package:untitled/layout/main_layout/basket.dart';
import 'package:http/http.dart' as http;
import 'package:untitled/layout/main_layout/messenger1.dart';
import 'package:untitled/layout/main_layout/cubit/app_states.dart';
import 'package:flutter/material.dart';
import 'package:untitled/layout/main_layout/delivery_screen.dart';
import 'package:untitled/layout/main_layout/categories.dart';
import 'package:untitled/models/Login/Login_Model.dart';

class app_cubit extends Cubit<app_states> {
  app_cubit() : super(initial_app_states());

  static app_cubit get(context) => BlocProvider.of(context);
  int currentindex = 0;
  bool isdark = true;
  TextEditingController email_controller = TextEditingController();
  TextEditingController password_controller = TextEditingController();
  ThemeMode appMode = ThemeMode.dark;
  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
        icon: Icon(Icons.category_outlined), label: 'Categories'),
    BottomNavigationBarItem(
        icon: Icon(Icons.messenger_outline), label: 'messeges'),
    BottomNavigationBarItem(
        icon: Icon(Icons.shopping_bag_outlined), label: 'basket'),
    BottomNavigationBarItem(
      icon: Icon(Icons.delivery_dining_outlined),
      label: 'delivery ',
    ),
  ];
  late LoginModel loginModel;
  List<Widget> screens = [
    Categories_screen(),
    Messenger_screen(),
    basket_screen(),
    delivery_screen(),
  ];
  List<String> titles = [
    'Categories',
    'Messages',
    'basket',
    'delivery',
  ];

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(LogInLoading());
    DioHelper.postData(url: LoginPath, data: {
      'email': email,
      'password': password,
    }).then((value) {
      print(value.data);
      loginModel = LoginModel.fromJson(value.data);
      print(loginModel.message);
      emit(LogInSuccess(loginModel));
    }).catchError((error) {
      emit(LogInFailure(errorMessage: error.toString()));
    });
  }

  void changeIndex(int index) {
    currentindex = index;
    emit(app_changebottomnav_states());
  }

  void changeMode() {
    // if (fromshared != null) {
    emit(app_changeMode_states());
    //   // isdark = fromshared;
    // } else {
    isdark = !isdark;
    // }
    // }
    // CacheHelper.setData(key: 'isdark', value: isdark).then((value) {
    //   emit(app_changeMode_states());
    // });
  }

  LogIn() async {
    try {
      emit(SignInLoading());
      final response = await Dio().post("http://127.0.0.1:8000/api/users/",
          // body
          data: {
            "email": email_controller.text,
            "password": password_controller.text,
          });
      emit(SignInSuccess());
      print(response);
    } catch (e) {
      emit(SignInFailure(errorMessage: e.toString()));
      print(e.toString());
    }
  }

  Future<http.Response> getData(String url) async {
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<http.Response> createData(String url, Map<String, String> body) async {
    var response = await http.post(Uri.parse(url),
        headers: <String, String>{
          'Content_type': 'applicatio/json; charset=UTF-8',
        },
        body: jsonEncode(body));
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed to create data');
    }
  }

  Future<http.Response> updateData(String url, Map<String, String> body) async {
    var response = await http.put(
      Uri.parse(url),
      headers: <String, String>{
        'Content_type': 'applicatio/json; charset=UTF-8'
      },
      body: jsonEncode(body),
    );
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed to update data');
    }
  }

  Future<http.Response> DeleteData(String url) async {
    var response = await http.delete(
      Uri.parse(url),
      headers: <String, String>{
        'Content_type': 'applicatio/json; charset=UTF-8'
      },
    );
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed to delete data');
    }
  }

  List<dynamic> category = [];
  void getCategory() {
    emit(CategoriesLoadingState());
    DioHelper.getcategory(
            url: 'https://testsala.000webhostapp.com/api/categories')
        .then((value) {
      category = value.data['articles'];
      print(category[0]['title']);
      emit(CategoriesSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(CategoriesErrorState(error.toString()));
    });
  }
}

// what contain the response:
// 1.headers
// 2.body that contain data
//3.statuscode = 200,400,403
// if (resons.statuscode == 200){
// Navigator.pushNamed(context,'\home'); }
// else {
// print('network error');
// print (response.body);}

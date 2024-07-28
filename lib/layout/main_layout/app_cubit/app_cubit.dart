import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled/Network/local/cache_Helper.dart';
import 'package:untitled/layout/main_layout/Categories.dart';
import 'package:untitled/layout/main_layout/Delivery.dart';
import 'package:untitled/layout/main_layout/app_cubit/app_states.dart';
import 'package:untitled/layout/main_layout/shoppingCart.dart';
import 'package:untitled/models/DeliveryComapanies.dart';
import '../../../Network/remote/DioHelper.dart';
import '../../../models/CategoriesModel.dart';
import '../../../models/StoresModel.dart';

class app_cubit extends Cubit<app_states> {
  app_cubit() : super(initial_app_states());

  static app_cubit get(context) => BlocProvider.of(context);

  Future<void> fetchCategories() async {
    emit(loadingCategoriesState());
    try {
      final response = await DioHelper.getData('api/category');
      print(response?.data); // قم بإضافة هذا السطر للتحقق من البيانات المستلمة
      if (response?.statusCode == 200) {
        List<CategoriesModel> salats = (response?.data as List)
            .map((salat) => CategoriesModel.fromJson(salat))
            .toList();
        emit(successCategoriessState(salats));
      } else if (response?.statusCode == 401) {
        emit(errorCategoriesState('Unauthorized'));
      } else {
        emit(errorCategoriesState('Something went wrong'));
      }
    } catch (e) {
      emit(errorCategoriesState(e.toString()));
    }
  }

  Future<void> fetchStoresByCategory(int categoryId) async {
    try {
      emit(loadingStoresByCategoryState());
      final response = await DioHelper.getData(
          'api/StoresByCategory/$categoryId'); // افتراض أنك تمرر رابط API هنا
      final List<dynamic> responseData =
          jsonDecode(response?.data); // فك ترميز JSON
      final List<StoresByCategories> stores = responseData
          .map((json) => StoresByCategories.fromJson(json))
          .toList();
      emit(successStoresByCategoryState(stores));
    } catch (e) {
      emit(errorStoresByCategoryState(e.toString()));
    }
  }

  Future<void> fetchDeliveryCompanies() async {
    emit(loadingDeliveryCompaniesState());
    try {
      final response = await DioHelper.getData('api/deliveryCompanies');
      print(response?.data); // قم بإضافة هذا السطر للتحقق من البيانات المستلمة
      if (response?.statusCode == 200) {
        List<Deliverycomapanies> salats = (response?.data as List)
            .map((salat) => Deliverycomapanies.fromJson(salat))
            .toList();
        emit(successDeliveryCompaniesState(salats));
      } else if (response?.statusCode == 401) {
        emit(errorsDeliveryCompaniesState('Unauthorized'));
      } else {
        emit(errorsDeliveryCompaniesState('Something went wrong'));
      }
    } catch (e) {
      emit(errorsDeliveryCompaniesState(e.toString()));
    }
  }

  late bool isdark = false;

  int currentindex = 0;
  List<Widget> screens = [
    CategoriesScreen(),
    shoppingCart_screen(),
    Delivery_screen(),
  ];
  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
        icon: Icon(
          Icons.home_outlined,
          size: 20,
        ),
        label: 'الرئيسية'),
    BottomNavigationBarItem(
      icon: Icon(
        FontAwesomeIcons.cartShopping,
        size: 20,
      ),
      label: 'السلة',
    ),
    BottomNavigationBarItem(
        icon: Icon(
          FontAwesomeIcons.shippingFast,
          size: 20,
        ),
        label: 'توصيل'),
  ];

  void changeIndex(int index) {
    currentindex = index;
    emit(changebottoNav_States());
  }

  Future<void> changeMode({bool? isDrakFromShared}) async {
    if (isDrakFromShared != null) {
      isdark = isDrakFromShared;
      emit(app_changeMode_states());
    } else {
      isdark = !isdark;
      CacheHelper.setData(key: 'isdark', value: isdark).then((value) {
        emit(app_changeMode_states());
      });
    }
  }
}

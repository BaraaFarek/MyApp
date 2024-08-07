import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled/Network/local/cache_Helper.dart';
import 'package:untitled/modules/Login&Register/Register_screen.dart';

import '../../layout/main_layout/Home_Screen.dart';
import 'Login_cubit/login_cubit.dart';
import 'Login_cubit/login_states.dart';

class Login_screen extends StatefulWidget {
  const Login_screen({super.key});

  @override
  State<Login_screen> createState() => _login_screenState();
}

class _login_screenState extends State<Login_screen> {
  // uinque id for form/widget

  bool ispasswordShow = true;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => login_cubit(),
        child: BlocConsumer<login_cubit, login_states>(
            listener: (BuildContext context, login_states state) {
          if (state is success_login_states) {
            print(state.loginModel.token);
            Fluttertoast.showToast(
              msg: state.loginModel.message,
              textColor: Colors.black,
              backgroundColor: Colors.white,
              fontSize: 16.0,
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
            );
            CacheHelper.setData(key: 'token', value: state.loginModel.token);
            CacheHelper.setData(key: 'name', value: state.loginModel.user.name);
            if (state.loginModel.message == 'تم تسجيل الدخول') {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (BuildContext context) => home1()),
              );
            } else {
              Fluttertoast.showToast(
                msg: state.loginModel.message,
                textColor: Colors.black,
                backgroundColor: Colors.white,
                fontSize: 16.0,
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
              );
            }
          }
        }, builder: (BuildContext context, login_states state) {
          EasyLoading.init();
          final loginCubit = context.read<login_cubit>();
          return Directionality(
            textDirection: TextDirection.ltr,
            child: Scaffold(
              key: scaffoldKey,
              body: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
                    colors: [
                      // Color(0xffFEC37B),
                      // HexColor('333739'),
                      Colors.deepPurple,
                      Colors.purple,

                      Colors.purpleAccent.withOpacity(0.2),
                    ],
                  ),
                ),
                child: Center(
                  child: SingleChildScrollView(
                    child: Container(
                      width: 340,
                      height: 400,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(17),
                      ),
                      child: Form(
                        key: loginCubit.form_key,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 30.0, horizontal: 20.0),
                          child: Column(
                            children: [
                              Text(
                                'Login',
                                style: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54,
                                ),
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              Container(
                                width: double.infinity,
                                height: 55,
                                child: TextFormField(
                                  textAlign: TextAlign.right,
                                  controller: loginCubit.email_controller,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'email must not be empty';
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.grey.shade50,
                                    label: Text(
                                      'Email',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black.withOpacity(0.5),
                                      ),
                                    ),
                                    hintText: 'enter your email',
                                    hintStyle: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(25),
                                        borderSide: BorderSide(
                                            width: 1.5, color: Colors.purple)),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      borderSide: BorderSide(
                                        // يمكنك إضافة أي حدود أخرى تريدها هنا, مثلا:
                                        // bottom: BorderSide.none,
                                        // right: BorderSide.none,
                                        // left: BorderSide.none,
                                        width: 0.9,
                                        color: Colors.redAccent,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      borderSide: BorderSide(
                                        width: 0.01,
                                        color: Colors.black,
                                      ),
                                    ),
                                    prefixIcon: Icon(Icons.email_outlined),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              Container(
                                width: double.infinity,
                                height: 55,
                                child: TextFormField(
                                  textAlign: TextAlign.right,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'password must not be empty';
                                    }
                                    return null;
                                  },
                                  controller: loginCubit.password_controller,
                                  obscureText: ispasswordShow,
                                  keyboardType: TextInputType.visiblePassword,
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.grey.shade50,
                                      label: Text(
                                        'Password',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black.withOpacity(0.5),
                                        ),
                                      ),
                                      hintText: 'enter your password',
                                      hintStyle: TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          borderSide: BorderSide(
                                              width: 1.5,
                                              color: Colors.purple)),
                                      errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(25),
                                        borderSide: BorderSide(
                                          width: 0.9,
                                          color: Colors.redAccent,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(25),
                                        borderSide: BorderSide(
                                          width: 0.01,
                                          color: Colors.black,
                                        ),
                                      ),
                                      suffixIcon: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              ispasswordShow = !ispasswordShow;
                                            });
                                          },
                                          icon: ispasswordShow
                                              ? Icon(Icons.visibility_outlined)
                                              : Icon(Icons
                                                  .visibility_off_outlined)),
                                      prefixIcon:
                                          Icon(Icons.lock_outline_rounded)),
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  state is! loading_login_states
                                      ? ElevatedButton(
                                          onPressed: () {
                                            if (loginCubit
                                                .form_key.currentState!
                                                .validate()) {
                                              loginCubit.signIn();
                                            }
                                          },
                                          style: ButtonStyle(
                                              minimumSize: MaterialStateProperty
                                                  .resolveWith((states) =>
                                                      Size(120, 40))),
                                          child: Text(
                                            'login',
                                            style: TextStyle(
                                              color: Colors.purple,
                                            ),
                                          ))
                                      : Center(
                                          child: SpinKitThreeBounce(
                                            color: Colors.purpleAccent,
                                            size: 20.0,
                                          ),
                                        ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  RegisterScreen()));
                                    },
                                    child: Text(
                                      'Don\'t have an account?',
                                      style: TextStyle(
                                        color: Colors.purple,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        }));
  }
}

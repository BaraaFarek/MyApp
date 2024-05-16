import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled/layout/main_layout/Home_Screen.dart';
import 'package:untitled/layout/main_layout/cubit/app_cubit.dart';
import 'package:untitled/layout/main_layout/cubit/app_states.dart';
import 'package:untitled/models/Login/Login_Model.dart';
import 'package:untitled/models/Login/Login_Model.dart';

import 'package:untitled/modules/Sign_up/Sign_up.dart';
import 'package:untitled/salad/flutter_app.dart';

import 'dart:ui';

import '../../shared/components/components.dart';
import '../../shared/components/constants/TextFormField.dart';

// reusable components
// 1. timing
// 2. refactor
// 3. quality

class login_screen extends StatefulWidget {
  login_screen({super.key});

  @override
  State<login_screen> createState() => _login_screenState();
}

class _login_screenState extends State<login_screen> {
  var form_key = GlobalKey<FormState>(); // uinque id for form/widget
  // any widget can gave it a key
  String emailerror = 'email address msut not be empty';
  final TextEditingController email_controller = TextEditingController();
  final TextEditingController password_controller = TextEditingController();
  bool ispasswordShow = true;

  // @override
  // void initState() {
  //   super.initState();
  //   createDatabase();
  // }
  @override
  void dispose() {
    // Clean up the controllers when the widget is disposed
    email_controller.dispose();
    password_controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = app_cubit.get(context);
    var message = 'تم تسجيل الدخول بنجاح';
    return BlocProvider(
        create: (BuildContext context) => app_cubit(),
        child: BlocConsumer<app_cubit, app_states>(
            listener: (BuildContext context, app_states state) {
          if (state is LogInSuccess) {
            print(state.loginModel.message);
            print(state.loginModel.token);
            Fluttertoast.showToast(
              msg: state.loginModel.message,
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 5,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0,
            );
          }
        }, builder: (BuildContext context, app_states state) {
          return Scaffold(
            body: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    // Color(0xffFEC37B),
                    // HexColor('333739'),
                    Colors.blueAccent,
                    Colors.blueGrey,
                  ],
                ),
              ),
              child: Center(
                child: SingleChildScrollView(
                  child: Container(
                    width: 340,
                    height: 500,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(17),
                    ),
                    child: Form(
                      key: form_key,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 50.0, horizontal: 20.0),
                        child: Column(
                          children: [
                            Text(
                              'Log In',
                              style: TextStyle(
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54,
                              ),
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'email must not be empty';
                                }
                                return null;
                              },
                              controller: cubit.email_controller,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey.shade50,
                                label: Text(
                                  'email',
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
                                    borderRadius: BorderRadius.circular(13),
                                    borderSide: BorderSide(width: 0.9)),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(13),
                                  borderSide: BorderSide(
                                    width: 0.01,
                                    color: Colors.black,
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(13),
                                  borderSide: BorderSide(
                                    width: 0.9,
                                    color: Colors.redAccent,
                                  ),
                                ),
                                prefixIcon: Icon(Icons.email_outlined),
                              ),
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'password must not be empty';
                                }
                                return null;
                              },
                              onFieldSubmitted: (value) {
                                if (form_key.currentState!.validate()) {
                                  app_cubit.get(context).userLogin(
                                      email: email_controller.text,
                                      password: password_controller.text);
                                }
                              },
                              controller: cubit.password_controller,
                              obscureText: ispasswordShow,
                              keyboardType: TextInputType.visiblePassword,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.grey.shade50,
                                  label: Text(
                                    'password',
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
                                      borderRadius: BorderRadius.circular(13),
                                      borderSide: BorderSide(width: 0.9)),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(13),
                                    borderSide: BorderSide(
                                      width: 0.9,
                                      color: Colors.redAccent,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(13),
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
                                          : Icon(
                                              Icons.visibility_off_outlined)),
                                  prefixIcon: Icon(Icons.lock_outline_rounded)),
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Sign_up_screen()));
                                  },
                                  child: Text(
                                    'create new account',
                                    style: TextStyle(
                                      color: Colors.blueAccent,
                                    ),
                                  ),
                                ),
                                Spacer(),
                                TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'Forgotten password',
                                      style: TextStyle(
                                        color: Colors.blueAccent,
                                      ),
                                    ))
                              ],
                            ),
                            SizedBox(
                              height: 1.0,
                            ),
                            state is SignInLoading
                                ? CircularProgressIndicator()
                                : ElevatedButton(
                                    onPressed: () {
                                      if (form_key.currentState!.validate()) {
                                        cubit.userLogin(
                                          email: email_controller.text,
                                          password: password_controller.text,
                                        );
                                        Fluttertoast.showToast(
                                          msg: message,
                                          toastLength: Toast.LENGTH_LONG,
                                          gravity: ToastGravity.BOTTOM,
                                          timeInSecForIosWeb: 5,
                                          backgroundColor: Colors.white,
                                          textColor: Colors.purpleAccent,
                                          fontSize: 16.0,
                                        );
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => home1()));
                                        print(message);
                                      } else {
                                        print('error');
                                      }
                                    },
                                    child: Text('log in ')),
                            // ConditionalBuild er(
                            //   condition: state is! LogInLoading,
                            //   builder: (context) => ElevatedButton(
                            //       onPressed: () {
                            //         // context.read<app_cubit>().LogIn();
                            //
                            //         Navigator.push(
                            //             context,
                            //             MaterialPageRoute(
                            //                 builder: (context) => home1()));
                            //       },
                            //       child: Text('log in ')),
                            //   fallback: (context) =>
                            //       Center(child: CircularProgressIndicator()),
                          ],
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

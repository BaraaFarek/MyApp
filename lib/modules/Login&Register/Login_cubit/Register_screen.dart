import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/modules/Login&Register/login_screen.dart';

import 'login_cubit.dart';
import 'login_states.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _signUp_screenState();
}

class _signUp_screenState extends State<RegisterScreen> {
  var form_key = GlobalKey<FormState>(); // uinque id for form/widget

  final TextEditingController email_controller = TextEditingController();
  final TextEditingController password_controller = TextEditingController();
  final TextEditingController name_controller = TextEditingController();
  bool ispasswordShow = true;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => login_cubit(),
        child: BlocConsumer<login_cubit, login_states>(
            listener: (BuildContext context, login_states state) {},
            builder: (BuildContext context, login_states state) {
              // print(state);
              if (state is loading_login_states) {
                return Center(child: CircularProgressIndicator());
              } else {
                return Directionality(
                  textDirection: TextDirection.rtl,
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
                                      'إنشاء حساب',
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
                                      controller: name_controller,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'الاسم لا يجب أن يكون فارغاً';
                                        }
                                        return null;
                                      },
                                      keyboardType: TextInputType.name,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.grey.shade50,
                                        label: Text(
                                          'الاسم',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color:
                                                Colors.black.withOpacity(0.5),
                                          ),
                                        ),
                                        hintText: 'ادخل اسمك',
                                        hintStyle: TextStyle(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(13),
                                            borderSide: BorderSide(
                                                width: 1.5,
                                                color: Colors.purple)),
                                        errorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(13),
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
                                          borderRadius:
                                              BorderRadius.circular(13),
                                          borderSide: BorderSide(
                                            width: 0.01,
                                            color: Colors.black,
                                          ),
                                        ),
                                        prefixIcon: Icon(
                                          Icons.person,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15.0,
                                    ),
                                    TextFormField(
                                      controller: email_controller,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'البريد الإلكتروني لا يجب أن يكون فارغاً';
                                        }
                                        return null;
                                      },
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.grey.shade50,
                                        label: Text(
                                          'البريد الإلكتروني',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color:
                                                Colors.black.withOpacity(0.5),
                                          ),
                                        ),
                                        hintText: 'ادخل بريدك الإلكتروني ',
                                        hintStyle: TextStyle(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(13),
                                            borderSide: BorderSide(
                                                width: 1.5,
                                                color: Colors.purple)),
                                        errorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(13),
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
                                          borderRadius:
                                              BorderRadius.circular(13),
                                          borderSide: BorderSide(
                                            width: 0.01,
                                            color: Colors.black,
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
                                          return 'كلمة المرور لا يجب أن تكون فارغة';
                                        }
                                        return null;
                                      },
                                      controller: password_controller,
                                      obscureText: ispasswordShow,
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Colors.grey.shade50,
                                          label: Text(
                                            'كلمة المرور',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                            ),
                                          ),
                                          hintText: 'ادخل كلمة المرور',
                                          hintStyle: TextStyle(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(13),
                                              borderSide: BorderSide(
                                                  width: 1.5,
                                                  color: Colors.purple)),
                                          errorBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(13),
                                            borderSide: BorderSide(
                                              width: 0.9,
                                              color: Colors.redAccent,
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(13),
                                            borderSide: BorderSide(
                                              width: 0.01,
                                              color: Colors.black,
                                            ),
                                          ),
                                          suffixIcon: IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  ispasswordShow =
                                                      !ispasswordShow;
                                                });
                                              },
                                              icon: ispasswordShow
                                                  ? Icon(
                                                      Icons.visibility_outlined)
                                                  : Icon(Icons
                                                      .visibility_off_outlined)),
                                          prefixIcon:
                                              Icon(Icons.lock_outline_rounded)),
                                    ),
                                    SizedBox(
                                      height: 15.0,
                                    ),
                                    Row(
                                      children: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Login_screen()));
                                          },
                                          child: Text(
                                            'هل لديك حساب بالفعل',
                                            style: TextStyle(
                                              color: Colors.purple,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 80),
                                        ElevatedButton(
                                            onPressed: () {
                                              // cubit.signIn();
                                            },
                                            child: Text('إنشاء')),
                                      ],
                                    )
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
              }
            }));
  }
}

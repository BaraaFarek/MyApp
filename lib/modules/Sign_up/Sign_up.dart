import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/main_layout/Home_Screen.dart';
import 'package:untitled/layout/main_layout/cubit/app_states.dart';
import 'package:untitled/modules/login/login_screen.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/shared/components/constants/TextFormField.dart';

import '../../layout/main_layout/cubit/app_cubit.dart';

class Sign_up_screen extends StatefulWidget {
  const Sign_up_screen({super.key});

  @override
  State<Sign_up_screen> createState() => _Sign_up_screenState();
}

class _Sign_up_screenState extends State<Sign_up_screen> {
  bool ispasswordShow = true;
  var Form1_key = GlobalKey<FormState>();
  TextEditingController email1_controller = TextEditingController();
  TextEditingController name_controller = TextEditingController();
  TextEditingController password1_controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => app_cubit(),
        child: BlocConsumer<app_cubit, app_states>(
            listener: (BuildContext context, app_states state) {
          if (state is SignInSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('success'),
            ));
          } else if (state is SignInFailure) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.errorMessage),
            ));
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
                  //Color(0xffFF4184),
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
                    key: Form1_key,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 50.0, horizontal: 20.0),
                      child: Column(
                        children: [
                          Text(
                            'Rigester',
                            style: TextStyle(
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(86, 86, 86, 0.9)),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Container(
                            width: 400.0,
                            height: 50.0,
                            child: DefaultTextFormField(
                              prefix: Icons.person,
                              control: name_controller,
                              hint: 'enter your name',
                              obscure: false,
                              suffix: null,
                              type: TextInputType.name,
                              lab: 'User name',
                              ontap: () {},
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Container(
                            width: 400.0,
                            height: 50.0,
                            child: DefaultTextFormField(
                              prefix: Icons.email_outlined,
                              control: email1_controller,
                              hint: 'enter your email',
                              obscure: false,
                              suffix: null,
                              type: TextInputType.emailAddress,
                              lab: 'Email Address',
                              ontap: () {},
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Container(
                            width: 400.0,
                            height: 50.0,
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'password must not be empty';
                                }
                                return null;
                              },
                              controller: password1_controller,
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
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          state is SignInLoading
                              ? CircularProgressIndicator()
                              : ElevatedButton(
                                  onPressed: () {
                                    // context.read<app_cubit>().LogIn();

                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => home1()));
                                  },
                                  child: Text('log in '))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ));
        }));
  }
}

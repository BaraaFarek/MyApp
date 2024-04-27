import 'package:flutter/material.dart';
import 'package:untitled/modules/login/login_screen.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/shared/components/constants/TextFormField.dart';

class Sign_up_screen extends StatefulWidget {
  const Sign_up_screen({super.key});

  @override
  State<Sign_up_screen> createState() => _Sign_up_screenState();
}

class _Sign_up_screenState extends State<Sign_up_screen> {
  var Form1_key = GlobalKey<FormState>();
  TextEditingController email1_controller = TextEditingController();
  TextEditingController name_controller = TextEditingController();
  TextEditingController password1_controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                        child: DefaultTextFormField(
                          prefix: Icons.lock_outline_rounded,
                          control: password1_controller,
                          hint: 'enter your password',
                          obscure: true,
                          suffix: Icons.remove_red_eye_outlined,
                          type: TextInputType.visiblePassword,
                          lab: 'password',
                          ontap: () {},
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     TextButton(
                      //       onPressed: () {
                      //         Navigator.push(
                      //             context,
                      //             MaterialPageRoute(
                      //                 builder: (context) => login_screen()));
                      //       },
                      //       child: Text(
                      //         'create new account',
                      //         style: TextStyle(
                      //           color: Colors.blueAccent,
                      //         ),
                      //       ),
                      //     ),
                      //     // ElevatedButton(
                      //     //   onPressed: () {},
                      //     //   style: ElevatedButton.styleFrom(
                      //     //     backgroundColor: Colors.blueAccent,
                      //     //   ),
                      //     //   child: Text(
                      //     //     'LOGIN',
                      //     //     style: TextStyle(
                      //     //       color: Colors.white.withOpacity(0.8),
                      //     //     ),
                      //     //   ),
                      //     // ),
                      //     Spacer(),
                      //     TextButton(
                      //         onPressed: () {},
                      //         child: Text(
                      //           'Forgotten password',
                      //           style: TextStyle(
                      //             color: Colors.blueAccent,
                      //           ),
                      //         ))
                      //   ],
                      // ),
                      SizedBox(
                        height: 1.0,
                      ),
                      // defaultButton(
                      //   text: 'Sign up',
                      //   radius: 15,
                      //
                      //   // background: Colors.green, // ما بياخد الافتراضي إذا عطينا قيمة بيعمل override
                      //   function: () {
                      //     // if (form_key.currentState!.validate()) {
                      //     //   print(email_controller.text);
                      //     //   print(password_controller.text);
                      //     //   print(name_controller.text);
                      //     // }
                      //     return null;
                      //   },
                      //   // isUpperCase: false,
                      // ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        width: 100,
                        child: MaterialButton(
                          onPressed: () {},
                          child: Text(
                            'rigester',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 1.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

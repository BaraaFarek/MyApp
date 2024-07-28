import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Widget defaultButton({
  // as default
  double width = 100, // common use
  Color background = Colors.blue,
  bool isUpperCase = true,
  required void function,
  required String text,
  // Function onpressed = () { },
  double radius = 20,
}) =>
    Container(
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(radius),
      ),
      width: width,
      child: MaterialButton(
        onPressed: () {},
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            color: Colors.white.withOpacity(0.8),
          ),
        ),
      ),
    );

bool isLast = false;
// void submit() {
//   CacheHelper.savaData(key: 'onBoarding', value: true).then((dynamic value) {
//     if (value) {
//       // navigatAndFinish(context,home1());
//     }
//   });
// }

//////////////////////////////////////////////////////////
void showToast({required String text, required ToastStates state}) {
  Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 5,
    backgroundColor: Colors.white,
    textColor: chooseToastColor(state),
    fontSize: 16.0,
  );
}

enum ToastStates { Success, Error, Warning }

Color chooseToastColor(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.Success:
      color = Colors.green;
      break;
    case ToastStates.Error:
      color = Colors.red;
      break;
    case ToastStates.Warning:
      color = Colors.amber;
      break;
    // TODO: Handle this case.
  }
  return color;
}

//////////////////////////////////////////////////////
Widget BuildProductsItem() => Container(
      height: 120,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage('assets/images/photo.png'),
                  fit: BoxFit.cover, // يغطي الصورة كامل الوعاء
                ),
              ), /* قم بإضافة الويدجت الخاص بك هنا */
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                'name',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );

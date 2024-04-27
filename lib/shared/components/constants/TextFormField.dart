import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget DefaultTextFormField({
  required TextEditingController control,
  required TextInputType type,
  required bool obscure,
  required String hint,
  required String lab,
  required IconData prefix,
  IconData? suffix,
  required Function? ontap,

  // Function onsubmit,
  // Function onChange,
  // required Function validate,
}) =>
    TextFormField(
      cursorColor: Colors.blueGrey,
      obscureText: obscure,
      controller: control,
      keyboardType: type,
      // onFieldSubmitted: () {},
      // onChanged: () {},

      onTap: ontap != null ? () {} : null,
      decoration: InputDecoration(
        filled: true,
        hintText: hint,
        hintStyle: TextStyle(
          fontSize: 12.0,
          fontWeight: FontWeight.w400,
        ),
        fillColor: Colors.grey.shade50,
        prefixIcon: Icon(prefix),
        suffixIcon: suffix != null ? Icon(suffix) : null,
        label: Text(
          lab,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.black.withOpacity(0.5),
          ),
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
      ),
    );

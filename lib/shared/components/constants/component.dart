import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildCategoryItem() => Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(children: [
      Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: NetworkImage('link'),
                fit: BoxFit.cover,
              ))),
      SizedBox(width: 20),
      Expanded(
          child: Container(
              height: 120.0,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        'Title',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text('2024',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                        )),
                  ]))),
    ]));

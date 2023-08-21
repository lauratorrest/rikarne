// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({super.key, required this.width, required this.sideText});
  final double width;
  final String sideText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 25,
          width: width,
          child: TextField(
            keyboardType: TextInputType.number,
            style: TextStyle(fontSize: 14),
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 1, color: Colors.grey), //<-- SEE HERE
              ),
              border: InputBorder.none,
              hintText: '',
            )
          )
        ),
        SizedBox(width: 5),
        Text(sideText, style: TextStyle(fontWeight: FontWeight.bold))
      ],
    );
  }
}
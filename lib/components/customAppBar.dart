import 'package:flutter/material.dart';
import 'package:flutter_blog/const/color.dart';

class CustomAppBar {
  static AppBar customAppBar() {
    return AppBar(
      backgroundColor: outSideColor,
      title: const Text(
        "B L O G",
        style: TextStyle(
          color: bgColor,
          fontSize: 20.0,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

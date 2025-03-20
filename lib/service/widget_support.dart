import 'package:flutter/material.dart';

class AppWidget {
  static TextStyle HeadlineTextfeildStyle(double textsize) {
    return TextStyle(
        color: Colors.black, fontSize: textsize, fontWeight: FontWeight.bold);
  }

  static TextStyle SimpleTextfeildStyle() {
    return TextStyle(
        color: Colors.black38, fontSize: 20.0, fontWeight: FontWeight.w500);
  }

  static TextStyle buttonTextfeildStyle() {
    return TextStyle(
        color: Colors.white, fontSize: 24.0, fontWeight: FontWeight.bold);
  }

  static TextStyle soloTextfeildStyle() {
    return TextStyle(
        color: Colors.white60, fontSize: 16.0, fontWeight: FontWeight.bold);
  }
  static TextStyle thinTextfeildStyle() {
    return TextStyle(
        color: Colors.black38, fontSize: 15.0, fontWeight: FontWeight.w500);
  }
}

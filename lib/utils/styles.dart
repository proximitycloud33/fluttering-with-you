import 'package:flutter/material.dart';

abstract class ThemeText {
  static const TextStyle headingOne = TextStyle(
    fontFamily: 'Poppins',
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle paragraph = TextStyle(
    fontFamily: 'Poppins',
    color: Colors.white,
    fontSize: 13,
    fontWeight: FontWeight.w400,
    height: 2,
  );
}

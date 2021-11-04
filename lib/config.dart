import 'package:flutter/material.dart';

class Config {
  static final String appName = "DADJOKES";
  static final String appVersion = '1.0.0';
  static final String apiUrl = "https://icanhazdadjoke.com";

  static final ThemeData theme = ThemeData(
    fontFamily: 'Montserrat',
    primarySwatch: Colors.deepPurple,
    primaryColor: kDefaultColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

const double kMyPadding = 20;
const Color kDefaultColor = Color(0xffff5e00);
const Color kDefaultColorGrey = Color(0xfff5f6fa);
const Color kButtonColor = Color(0xff390073);

Decoration kDecoration = BoxDecoration(
    // color: index % 2 == 0
    //     ? Colors.white
    //     : kDefaultColorGrey,
    color: Colors.white,
    borderRadius: BorderRadius.circular(kMyPadding * 0.5),
    boxShadow: [
      BoxShadow(
        offset: Offset(0, 3),
        blurRadius: kMyPadding / 4,
        color: Colors.black.withOpacity(0.05),
      ),
    ]);

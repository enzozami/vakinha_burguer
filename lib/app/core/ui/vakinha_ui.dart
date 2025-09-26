import 'package:flutter/material.dart';

class VakinhaUi {
  VakinhaUi._();

  static final ThemeData theme = ThemeData(
    primaryColor: Color(0xFF007D21),
    primaryColorDark: Color(0xff00343F),
    fontFamily: 'mplus1',
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xff007D21),
        foregroundColor: Colors.white,
        textStyle: TextStyle(fontFamily: 'mplus1'),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Colors.black,
      selectedIconTheme: IconThemeData(color: Colors.black),
      selectedLabelStyle: textBold,
      unselectedItemColor: Colors.grey[400],
      unselectedIconTheme: IconThemeData(
        color: Colors.grey[400],
      ),
    ),
  );
  static const TextStyle textBold = TextStyle(fontWeight: FontWeight.bold);
}

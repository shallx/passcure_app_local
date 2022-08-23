import 'package:flutter/material.dart';

class CLThemeData {
  CLThemeData();

  ThemeData light() {
    return getTheme(ColorPalette.light());
  }

  ThemeData dark() {
    return getTheme(ColorPalette.dark());
  }

  ThemeData getTheme(ColorPalette c) {
    return ThemeData(
      scaffoldBackgroundColor: c.scaffold,
      iconTheme: IconThemeData(
        color: c.primary,
      ), // Just Icon and IconButton
      colorScheme: ColorScheme(
        primary: c.primary, // Elevated Button Background,
        //TextButton's child's text/icon color,outlinedbutton's
        //child's text/icon color
        onPrimary: c.onPrimary, // Elevated Buttons innerText color
        background: c.background,
        onBackground: Colors.black,
        secondary: c.secondary,
        onSecondary: c.onSecondary,
        error: c.error,
        onError: c.onError,
        surface: Colors.white,
        onSurface: Colors.black,
        brightness: Brightness.light,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: c.background,
        actionsIconTheme: IconThemeData(color: c.primary),
        iconTheme: IconThemeData(
          color: c.primary, // Leading Widget's Color
        ),
        titleTextStyle: TextStyle(
          color: c.primary,
          fontWeight: FontWeight.w500,
          fontSize: 17,
        ),
        elevation: 1,
      ),
      textTheme: TextTheme(
        headline4: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,
          color: Colors.black,
        ),
        headline5: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        headline6: TextStyle(
          color: c.onBackground,
          fontWeight: FontWeight.bold,
        ),
        subtitle1: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: c.primary,
        foregroundColor: c.onPrimary,
      ),
    );
  }
}

class ColorPalette {
  Color primary = Color(0xFFD80E64);
  Color onPrimary = Colors.white;
  Color secondary = Color(0xFFFED271);
  Color onSecondary = Colors.white;
  Color error = Colors.red;
  Color onError = Colors.white;
  Color scaffold = Colors.grey[100];
  Color background = Colors.white;
  Color onBackground = Colors.black;

  ColorPalette({
    this.primary,
    this.onPrimary,
    this.secondary,
    this.onSecondary,
    this.error,
    this.onError,
    this.scaffold,
    this.background,
    this.onBackground,
  });

  factory ColorPalette.light() {
    return ColorPalette(
      primary: Color(0xFFD80E64),
      onPrimary: Colors.white,
      secondary: Color(0xFFFED271),
      onSecondary: Colors.black,
      error: Colors.red,
      onError: Colors.white,
      scaffold: Colors.white,
      background: Colors.white,
      onBackground: Colors.black,
    );
  }

  factory ColorPalette.dark() {
    return ColorPalette(
      primary: Colors.teal.shade400,
      onPrimary: Colors.white,
      secondary: Colors.teal.shade400,
      onSecondary: Colors.white,
      error: Colors.red,
      onError: Colors.white,
      scaffold: Color(0xFF121212),
      background: Color(0xFF1F1F1F),
      onBackground: Colors.white,
    );
  }
}

class Margin {
  double unitMargin = 15;
  EdgeInsetsGeometry all,
      topLeft,
      horizontal,
      vertical,
      cave,
      bowl,
      top,
      left,
      bottom,
      right;

  Margin([this.unitMargin = 15]) {
    all = EdgeInsets.all(unitMargin);
    topLeft = EdgeInsets.only(top: unitMargin, left: unitMargin);
    horizontal = EdgeInsets.symmetric(horizontal: unitMargin);
    vertical = EdgeInsets.symmetric(vertical: unitMargin);
    cave = EdgeInsets.fromLTRB(unitMargin, unitMargin, unitMargin, 0);
    bowl = EdgeInsets.fromLTRB(unitMargin, 0, unitMargin, unitMargin);
    left = EdgeInsets.only(left: unitMargin);
    top = EdgeInsets.only(top: unitMargin);
    right = EdgeInsets.only(right: unitMargin);
    bottom = EdgeInsets.only(bottom: unitMargin);
  }
}

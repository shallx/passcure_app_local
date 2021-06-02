import 'package:flutter/material.dart';

class ColorPalette {
  Color primary = Colors.teal.shade400;
  Color onPrimary = Colors.white;
  Color secondary = Colors.amber.shade400;
  Color onSecondary = Colors.white;
  Color error = Colors.red;
  Color onError = Colors.white;
  Color scaffold = Colors.grey[100];
  Color background = Colors.white;

  ColorPalette({
    this.primary,
    this.onPrimary,
    this.secondary,
    this.onSecondary,
    this.error,
    this.onError,
    this.scaffold,
    this.background,
  });

  factory ColorPalette.light() {
    return ColorPalette(
      primary: Colors.teal.shade400,
      onPrimary: Colors.white,
      secondary: Colors.amber.shade400,
      onSecondary: Colors.white,
      error: Colors.red,
      onError: Colors.white,
      scaffold: Colors.grey[100],
      background: Colors.white,
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
    );
  }
}

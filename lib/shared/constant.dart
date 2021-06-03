import 'package:flutter/material.dart';

class Constants {
  Constants._();
  static InputDecoration inputDec = InputDecoration(
    labelText: 'Email',
    border: OutlineInputBorder(),
  );
}

const TextField tf = TextField(
  decoration: InputDecoration(
    labelText: 'Name',
    border: OutlineInputBorder(),
  ),
);

class Helper {
  /// First letter uppercase
  static String toUC(String value) {
    return value[0].toUpperCase() + value.substring(1);
  }
}

import 'package:flutter/material.dart';
import 'package:passcure/screens/home_screen.dart';
import 'package:passcure/shared/themedata.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CLThemeData().light(),
      home: HomeScreen(),
    );
  }
}
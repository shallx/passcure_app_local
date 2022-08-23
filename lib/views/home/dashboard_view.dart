import 'package:flutter/material.dart';

import '../tabs/add_account_screen.dart';
import '../tabs/add_email_screen.dart';
import '../tabs/home_view.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key key}) : super(key: key);

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  int currentIndex = 0;

  onTabClick(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Passcure"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTabClick,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Add Email",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Add Accounts",
          ),
        ],
      ),
      body: IndexedStack(
        index: currentIndex,
        children: [
          HomeView(),
          AddEmailScreen(),
          AddAccountScreen(),
        ],
      ),
    );
  }
}

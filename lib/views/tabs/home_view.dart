import 'package:flutter/material.dart';

import '../../services/db_services.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Text("Quick Linksl"),
          ElevatedButton(
            onPressed: () async {
              await DBService().dropTable();
              print("DB Reset Successfully");
            },
            child: Text("Reset DB"),
          ),
        ],
      ),
    );
  }
}

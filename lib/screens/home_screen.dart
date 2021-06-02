import 'package:flutter/material.dart';
import 'package:passcure/models/student.dart';
import 'package:passcure/services/db_services.dart';
import 'package:passcure/shared/textfield_unfocus.dart';
import '../shared/themedata.dart' show Margin;

class HomeScreen extends StatelessWidget {
  HomeScreen({Key key}) : super(key: key);
  final Margin margin = Margin();
  TextEditingController name = TextEditingController();
  TextEditingController roll = TextEditingController();
  GlobalKey _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    print(margin.unitMargin);
    return Unfocus(
      child: Scaffold(
        appBar: AppBar(),
        body: Container(
          margin: margin.all,
          child: Form(
            key: _key,
            child: Column(
              children: [
                ListTile(
                  // leading: Text("Hello world"),
                  title: Text("Rafat Rashid"),
                  subtitle: Text("001"),
                ),
                TextField(
                  controller: name,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: margin.unitMargin,
                ),
                TextField(
                  controller: roll,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Roll',
                    border: OutlineInputBorder(),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    print(name.text);
                    print(roll.text);
                    Student student =
                        Student(name: name.text, roll: int.parse(roll.text));
                    name.text = '';
                    roll.text = '';
                    await DBService().addStudent(student);
                  },
                  child: Text("Add this shit"),
                ),
                ElevatedButton(
                    onPressed: () async {
                      List<Student> list = await DBService().getStudent();
                      // print(list.length);
                      list.forEach((e) {
                        print("Name: ${e.name}");
                        print("Roll: ${e.roll}");
                      });
                    },
                    child: Text("Get"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

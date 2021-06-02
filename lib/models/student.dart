import 'model.dart';

class Student extends Model {
  String name;
  int roll;
  static String table = 'students';

  Student({this.name, this.roll});

  static Student fromMap(Map<String, dynamic> map) {
    return Student(name: map['name'], roll: map['roll']);
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {'name': name, 'roll': roll};
    return map;
  }
}

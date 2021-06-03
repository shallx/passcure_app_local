import 'model.dart';

class Provider extends Model {
  int id;
  String type;

  static String table = 'providers';

  Provider({this.id, this.type});

  static Provider fromMap(Map<String, dynamic> map) {
    return Provider(
      id: map['id'],
      type: map['type'],
    );
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'id': id,
      'type': type,
    };
    return map;
  }
}

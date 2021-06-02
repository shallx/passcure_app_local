import 'model.dart';

class Category extends Model {
  int id;
  String accountType;

  static String table = 'students';

  Category({this.id, this.accountType});

  static Category fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'],
      accountType: map['accountType'],
    );
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'id': id,
      'accountType': accountType,
    };
    return map;
  }
}

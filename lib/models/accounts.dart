import 'package:passcure/utils/parser.dart';

import 'model.dart';

class Account extends Model {
  int id, emailId, categoryId;
  String userName, password, domainName, domainLink, domainPicture, notes;

  Account(
      {this.id,
      this.emailId,
      this.categoryId,
      this.userName,
      this.password,
      this.domainName,
      this.domainLink,
      this.domainPicture,
      this.notes});

  static String table = 'accounts';

  static Account fromMap(Map<String, dynamic> map) {
    return Account(
      id: map['id'],
      emailId: toInteger(map['emailId']),
      categoryId: toInteger(map['categoryId']),
      userName: map['userName'],
      password: map['password'],
      domainName: map['domainName'],
      domainLink: map['domainLink'],
      domainPicture: map['domainPicture'],
      notes: map['notes'],
    );
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'id': id,
      'emailId': emailId,
      'categoryId': categoryId,
      'userName': userName,
      'password': password,
      'domainName': domainName,
      'domainLink': domainLink,
      'domainPicture': domainPicture,
      'notes': notes,
    };
    return map;
  }
}

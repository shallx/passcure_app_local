import 'model.dart';

class Email extends Model {
  int id;
  String provider;
  String email;
  String password;
  String refNumber;
  String refEmail;
  String notes;

  static String table = 'emails';

  Email(
      {this.id,
      this.provider,
      this.email,
      this.password,
      this.refNumber,
      this.refEmail,
      this.notes});

  static Email fromMap(Map<String, dynamic> map) {
    return Email(
      id: map['id'],
      provider: map['provider'],
      email: map['email'],
      password: map['password'],
      refNumber: map['refNumber'],
      refEmail: map['refEmail'],
      notes: map['notes'],
    );
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'id': id,
      'provider': provider,
      'email': email,
      'password': password,
      'refNumber': refNumber,
      'refEmail': refEmail,
      'notes': notes,
    };
    return map;
  }
}

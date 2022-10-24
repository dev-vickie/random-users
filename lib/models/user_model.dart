import 'package:rest_api_call/models/user_name_model.dart';

class User {
  final String gender;
  final String email;
  final String phone;
  final String cell;
  final String nat;
  final UserName name;
  final Registered registered;

  User({
    required this.gender,
    required this.email,
    required this.phone,
    required this.cell,
    required this.nat,
    required this.name,
    required this.registered,
  });
  String get fullName {
    return '$name.title $name.first $name.last';
  }
}

class Registered {
  final String date;
  final int age;
  Registered({
    required this.date,
    required this.age,
  });
}

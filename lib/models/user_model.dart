import 'package:rest_api_call/models/user_dob.dart';
import 'package:rest_api_call/models/user_location.dart';
import 'package:rest_api_call/models/user_name.dart';
import 'package:rest_api_call/models/user_picture.dart';

class User {
  final String gender;
  final String email;
  final String phone;
  final String cell;
  final String nat;
  final UserName name;
  final UserDob dob;
  final UserLocation location;
  final UserPicture picture;

  User({
    required this.gender,
    required this.email,
    required this.phone,
    required this.cell,
    required this.nat,
    required this.name,
    required this.dob,
    required this.location,
    required this.picture,
  });

  factory User.fromMap(Map<String, dynamic> e) {
    final name = UserName.fromMap(e['name']);

    final dob = UserDob.fromMap(e['dob']);
    final location = UserLocation.fromMap(e['location']);

    final picture = UserPicture.fromMap(e['picture']);
    return User(
      gender: e['gender'],
      email: e['email'],
      phone: e['phone'],
      cell: e['cell'],
      nat: e['nat'],
      dob: dob,
      name: name,
      location: location,
      picture: picture,
    );
  }
  String get fullName => '${name.title} ${name.first} ${name.last}';
}

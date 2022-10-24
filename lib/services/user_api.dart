import 'dart:convert';
import 'package:rest_api_call/models/user_model.dart';
import 'package:rest_api_call/models/user_name_model.dart';
import 'package:http/http.dart' as http;

class UserApi {
  static Future<List<User>> fetchUsers() async {
    const url = 'https://randomuser.me/api/?results=15';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['results'] as List<dynamic>;
    final users = results.map((e) {
      final name = UserName(
          title: e['name']['title'],
          first: e['name']['first'],
          last: e['name']['last']);
      final reg = Registered(
        date: e['registered']['date'],
        age: e['registered']['age'],
      );
      return User(
          registered: reg,
          name: name,
          gender: e['gender'],
          email: e['email'],
          phone: e['phone'],
          cell: e['cell'],
          nat: e['nat']);
    }).toList();
    return users;
  }
}

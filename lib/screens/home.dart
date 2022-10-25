import 'package:flutter/material.dart';

import 'package:rest_api_call/models/user_model.dart';
import 'package:rest_api_call/services/user_api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> users = [];
  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[300],
      appBar: AppBar(
        centerTitle: true,
        title: const Text('REST-API call'),
      ),
      body: GridView.builder(
        itemCount: users.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          final user = users[index];
          final color = user.gender == 'male' ? Colors.green : Colors.purple;
          return Container(
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: NetworkImage(
                    user.picture.large,
                  ),
                  fit: BoxFit.contain),
            ),
          );
        },
      ),
    );
  }

  Future<void> fetchUsers() async {
    final response = await UserApi.fetchUsers();
    setState(() {
      users = response;
    });
  }
}

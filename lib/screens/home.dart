import 'package:flutter/material.dart';

import 'package:rest_api_call/models/user_model.dart';
import 'package:rest_api_call/services/user_api.dart';

String name = '';

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

  Future<void> fetchUsers() async {
    final response = await UserApi.fetchUsers();
    setState(() {
      users = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey[200],
        title: Text(
          name,
          style: const TextStyle(
            color: Colors.pink,
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
        centerTitle: true,
        leading: const Padding(
          padding: EdgeInsets.all(3),
          child: ClipOval(
            child: Icon(
              Icons.person,
              color: Colors.pink,
              size: 50,
            ),
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 5),
            child: Icon(
              Icons.notifications,
              color: Colors.pink,
              size: 40,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
              flex: 5,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];

                  name = user.name.first;

                  final width = MediaQuery.of(context).size.width;

                  return Container(
                    width: width * 0.95,
                    margin: const EdgeInsets.all(40),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.pinkAccent, width: 1),
                      image: DecorationImage(
                        image: NetworkImage(user.picture.large),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                begin: Alignment.center,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.transparent,
                                  Colors.black.withOpacity(0.35),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 20,
                          left: 20,
                          right: 30,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                user.fullName,
                                style: const TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                user.location.country,
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.location_on_rounded,
                                  size: 25,
                                  color: Colors.pink,
                                ),
                                const SizedBox(width: 3),
                                Text(
                                  user.location.city,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    backgroundColor: Colors.pink,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              )),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Icon(Icons.cancel, color: Colors.pink, size: 50),
                Icon(Icons.favorite, color: Colors.pink, size: 100),
                Icon(Icons.flash_auto, color: Colors.pink, size: 40),
              ],
            ),
          )
        ],
      ),
    );
  }
}

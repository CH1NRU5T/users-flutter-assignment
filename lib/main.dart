// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:users/constants/constants.dart';
import 'package:users/models/user.dart';
import 'package:users/services/network_helper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // primaryColor: Colors.white,
          ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<User> users = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          currentIndex: 1,
          items: [
            BottomNavigationBarItem(
              label: 'Home',
              activeIcon: const Icon(
                IconlyBold.home,
              ),
              icon: const Icon(
                IconlyLight.home,
              ),
            ),
            BottomNavigationBarItem(
              activeIcon: const Icon(
                IconlyBold.user_3,
              ),
              label: 'Users',
              icon: const Icon(
                IconlyBold.user_3,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Create',
              icon: const Icon(
                IconlyLight.plus,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Activities',
              icon: const Icon(
                IconlyLight.heart,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Profile',
              icon: const Icon(
                IconlyLight.profile,
              ),
            ),
          ],
        ),
        appBar: AppBar(
          elevation: 0,
          title: Image.asset('assets/images/logo.png'),
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black),
          actions: [
            IconButton(
              icon: const Icon(IconlyLight.notification),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(IconlyLight.search),
              onPressed: () {},
            ),
          ],
        ),
        body: FutureBuilder(
          future: NetworkHelper.getRequest(url: allUsersUrl),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.done:
                List temp = jsonDecode(snapshot.data!.body);
                temp.forEach((element) {
                  users.add(User(
                      name: element['name'],
                      username: element['username'],
                      email: element['email'],
                      phone: element['phone'],
                      address:
                          '${element['street']} ${element['suite']} ${element['city']}',
                      website: element['website']));
                });
                return ListView.builder(
                    itemCount: temp.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          leading: Image.asset(
                            'assets/images/user.png',
                          ),
                        ),
                      );
                    });
                return const Center(
                  child: Text('hehe'),
                );
              default:
                return const Center(
                  child: Text(
                    'Loading',
                  ),
                );
            }
          },
        ),
      ),
    );
  }
}

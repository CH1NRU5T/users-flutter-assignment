import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:users/widgets/user_card.dart';
import '../constants/constants.dart';
import '../models/user.dart';
import '../services/network_helper.dart';

class UserList extends StatelessWidget {
  UserList({super.key});
  final users = [];
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: NetworkHelper.getRequest(url: allUsersUrl),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            jsonDecode(snapshot.data!.body).forEach((element) {
              users.add(User(
                  name: element['name'],
                  username: element['username'],
                  email: element['email'],
                  phone: element['phone'],
                  address:
                      '${element['address']['street']} ${element['address']['suite']} ${element['address']['city']}',
                  website: element['website']));
            });
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    return UserCard(user: users[index]);
                  }),
            );
          default:
            return const Center(
              child: Text(
                'Loading',
              ),
            );
        }
      },
    );
  }
}

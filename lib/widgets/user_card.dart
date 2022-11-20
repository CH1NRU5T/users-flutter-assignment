import 'package:flutter/material.dart';
import 'package:users/models/user.dart';
import 'package:users/widgets/animated_page_route.dart';

import 'user_details.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key, required this.user});
  final User user;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(
            color: Color(0xffeeeeee),
          ),
        ),
        child: ListTile(
          trailing: OutlinedButton(
            onPressed: () {
              Navigator.of(context).push(AnimatedPageRoute(
                  child: UserDetails(
                user: user,
              )));
            },
            child: const Text(
              'View',
              style: TextStyle(color: Color(0xff7000ff)),
            ),
          ),
          title: Text(
            user.name,
          ),
          subtitle: Text('@${user.username}'),
          contentPadding: const EdgeInsets.all(20),
          leading: Image.asset(
            'assets/images/user56x56.png',
          ),
        ),
      ),
    );
  }
}

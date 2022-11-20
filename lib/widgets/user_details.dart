import 'package:flutter/material.dart';
import 'package:users/models/user.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({super.key, required this.user});
  final User user;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          elevation: 1,
          title: Text(
            user.name,
            style: const TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ListTile(
                contentPadding: const EdgeInsets.all(10),
                leading: Image.asset('assets/images/user.png'),
                title: Text(
                  user.name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  '@${user.username}',
                  style: const TextStyle(fontSize: 15),
                ),
              ),
              generateTextField(context, 'Email', user.email),
              generateTextField(context, 'Address', user.address),
              generateTextField(context, 'Phone', user.phone),
              generateTextField(context, 'Website', user.website),
            ],
          ),
        ),
      ),
    );
  }

  Widget generateTextField(BuildContext context, String label, String value) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 9, top: 12, bottom: 12),
          child: Text(
            '$label: ',
            style: TextStyle(color: Theme.of(context).disabledColor),
          ),
        ),
        Text(value),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:users/models/user.dart';
import 'package:users/widgets/user_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
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
  int currentIndex = 1;
  final screens = [
    const Center(
      child: Text('Home'),
    ),
    UserList(),
    const Center(
      child: Text('Create'),
    ),
    const Center(
      child: Text('Activities'),
    ),
    const Center(
      child: Text('Profile'),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: const Color(0xff7000ff),
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          items: const [
            BottomNavigationBarItem(
              label: 'Home',
              activeIcon: Icon(
                IconlyBold.home,
              ),
              icon: Icon(
                IconlyLight.home,
              ),
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                IconlyBold.user_3,
              ),
              label: 'Users',
              icon: Icon(
                IconlyLight.user_1,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Create',
              activeIcon: Icon(
                IconlyBold.plus,
              ),
              icon: Icon(
                IconlyLight.plus,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Activities',
              activeIcon: Icon(
                IconlyBold.heart,
              ),
              icon: Icon(
                IconlyLight.heart,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Profile',
              activeIcon: Icon(
                IconlyBold.profile,
              ),
              icon: Icon(
                IconlyLight.profile,
              ),
            ),
          ],
        ),
        appBar: AppBar(
          elevation: 1,
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
        body: IndexedStack(
          children: screens,
          index: currentIndex,
        ),
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/interfaces/home/cards.dart';
import 'package:flutter_firebase/interfaces/settings/settings.dart';

const List<String> list = <String>['One'];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 13, 13, 45),
        leading: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Column(
            children: [
              Image.asset(
                'images/Logo.png',
                height: 35,
                width: 35,
              ),
            ],
          ),
        ),
        title: const Text('Submarine Cart'),
        actions: [
          Theme(
            data: Theme.of(context).copyWith(
              iconTheme: const IconThemeData(
                color: Colors.white,
              ),
              dividerColor: const Color.fromARGB(255, 94, 111, 119),
            ),
            child: PopupMenuButton<int>(
              onSelected: (item) => onSelected(context, item),
              icon: const Icon(Icons.account_circle_outlined),
              itemBuilder: (context) => [
                PopupMenuItem<int>(
                  value: 0,
                  child: Row(
                    children: const [
                      Icon(
                        Icons.settings,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text('Settings'),
                    ],
                  ),
                ),
                const PopupMenuDivider(),
                PopupMenuItem<int>(
                  value: 1,
                  child: Row(
                    children: const [
                      Icon(
                        Icons.logout_outlined,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text('Sign Out'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        children: const [
          SizedBox(
            height: 20,
          ),
          FoodCard(),
        ],
      ),
    );
  }
}

void onSelected(BuildContext context, int item) {
  switch (item) {
    case 0:
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const SettingsPage(),
        ),
      );
      break;
    case 1:
      FirebaseAuth.instance.signOut();
      break;
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.account_circle_outlined),
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
    );
  }
}

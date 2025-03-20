import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final user = FirebaseAuth.instance.currentUser!;

//Sign User out Method
  void signUserOutt() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        actions: [
          IconButton(onPressed: signUserOutt, icon: const Icon(Icons.logout))
        ],
      ),
      body: Center(
          child: Text(
        "LOGGED IN AS: ${user.email!}",
        style: const TextStyle(fontSize: 20),
      )),
    );
  }
}

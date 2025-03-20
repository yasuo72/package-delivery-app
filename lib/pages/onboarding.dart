import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_loginout_auth/service/widget_support.dart';

import 'home.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final User? user = FirebaseAuth.instance.currentUser;

  // Sign-out function
  void signUserOutt() {
    FirebaseAuth.instance.signOut();
    Navigator.pushReplacementNamed(context, '/login'); // Navigate to login screen
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
      body: Container(
        margin: const EdgeInsets.only(top: 90.0),
        alignment: const Alignment(0.08, 2),
        child: Column(
          children: [
            Image.asset("lib/images/Vector.png"),
            const SizedBox(height: 50.0),
            Text(
              "Track your parcel\nfrom anywhere",
              textAlign: TextAlign.center,
              style: AppWidget.HeadlineTextfeildStyle(30.0),
            ),
            const SizedBox(height: 30.0),
            Text(
              "Check the progress\nof your delivery",
              textAlign: TextAlign.center,
              style: AppWidget.SimpleTextfeildStyle(),
            ),
            const SizedBox(height: 40.0),
            Material(
              elevation: 3.0,
              borderRadius: BorderRadius.circular(30.0),
              color: Colors.transparent, // Ensures ripple effect
              child: InkWell(
                borderRadius: BorderRadius.circular(30),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                  );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color(0xfff8ae39),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: Text(
                      "Track Now",
                      style: AppWidget.buttonTextfeildStyle(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

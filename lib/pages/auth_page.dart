import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_loginout_auth/pages/login_or_register_page.dart';
import 'package:firebase_loginout_auth/pages/onboarding.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: StreamBuilder<User?>(
  stream: FirebaseAuth.instance.authStateChanges(),
  builder: (context, snapshot){
    //user logged in
    if (snapshot.hasData)
    {
      return Onboarding();
    }
    //user is not logged in
    else
    {
      return const LoginOrRegister();
    }
  },
),
        );
  }
}

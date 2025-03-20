import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';
import 'pages/auth_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Avoid reinitialization if Firebase is already running
  try {
    if (Firebase.apps.isEmpty) {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
    }
  } catch (e) {
    debugPrint("Firebase initialization error: $e");
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
      ),
      home: const AuthPage(), // Redirects to authentication page
    );
  }
}

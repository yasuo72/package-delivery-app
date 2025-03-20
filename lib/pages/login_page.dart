import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_loginout_auth/elements/my_button.dart';
import 'package:firebase_loginout_auth/elements/my_textfield.dart';
import 'package:firebase_loginout_auth/elements/square_tile.dart';
import 'package:firebase_loginout_auth/service/auth_service.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final AuthService _authService = AuthService();

  // Sign user in with email & password
  void signUserIn() async {
    showDialog(
      context: context,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: usernameController.text,
        password: passwordController.text,
      );

      Navigator.pop(context); // Close loading dialog
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      wrongErrorMessage(e.code);
    }
  }

  // Google Sign-In
  void signInWithGoogle() async {
    final userCredential = await _authService.signInWithGoogle();
    if (userCredential != null) {
      Navigator.pushReplacementNamed(context, '/home'); // Navigate to Home
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Google Sign-In failed!")),
      );
    }
  }

  // Wrong credentials message popup
  void wrongErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.black,
        title: Center(
          child: Text(message, style: const TextStyle(color: Colors.white)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              const Icon(Icons.lock, size: 100),
              const SizedBox(height: 50),

              // Welcome text
              Text(
                "Welcome back you've been missed!",
                style: TextStyle(color: Colors.grey[700], fontSize: 16),
              ),
              const SizedBox(height: 25),

              // Username & password fields
              MyTextField(controller: usernameController, hintText: "Username", obscureText: false),
              const SizedBox(height: 10),
              MyTextField(controller: passwordController, hintText: "Password", obscureText: true),
              const SizedBox(height: 10),

              // Forgot password
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Text("Forgot Password?", style: TextStyle(color: Colors.grey[600])),
                  ),
                ],
              ),
              const SizedBox(height: 25),

              // Sign In button
              MyButton(text: "Sign In", onTap: signUserIn),
              const SizedBox(height: 50),

              // Divider
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(child: Divider(thickness: 3)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text("Or Continue with", style: TextStyle(color: Colors.grey)),
                    ),
                    Expanded(child: Divider(thickness: 3)),
                  ],
                ),
              ),
              const SizedBox(height: 50),

              // Google & Apple Sign-In buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SquareTile(imagePath: "lib/images/apple.png"),
                  const SizedBox(width: 25),
                  GestureDetector(
                    onTap: signInWithGoogle, // Google Sign-In action
                    child: const SquareTile(imagePath: "lib/images/google.png"),
                  ),
                ],
              ),

              const SizedBox(height: 35),

              // Register Now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Not a member?", style: TextStyle(color: Colors.grey[700])),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      "Register now",
                      style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

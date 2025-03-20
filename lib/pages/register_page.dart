import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_loginout_auth/elements/my_button.dart';
import 'package:firebase_loginout_auth/elements/my_textfield.dart';
import 'package:firebase_loginout_auth/elements/square_tile.dart';
import 'package:flutter/material.dart';

import '../service/auth_service.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final AuthService _authService = AuthService();

  //sign user in method
  void signUserUp() async {
    //show loading circle
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });

    //try  creating the user
    try {
      //check if pwd == cpwd
      if (passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: usernameController.text, password: passwordController.text);
      } else {
        //pop the loading circle
        // ignore: use_build_context_synchronously
        Navigator.pop(context);
        //show error message pwd dont match
        wrongErrorMessage("Passwords Don't match!");
      }
      //pop the loading circle
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      //pop the loading circle
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
      print(e);
      //WRONG EMAIL
      wrongErrorMessage(e.code);
      // if (e.code == 'invalid-login-credentials') {
      //show error to user
      //   wrongErrorMessage(e.code);
      //   print("email");
      // }
    }
  }
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

//wrong credentials message popup
  void wrongErrorMessage(String message) {
    showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.black,
            title: Center(
                child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            )),
          );
        });
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
              const SizedBox(
                height: 20,
              ),
              //logo
              const Icon(
                Icons.lock,
                size: 100,
              ),
              const SizedBox(
                height: 25,
              ),

              //lets create an account
              Text(
                "Let's create an account for you!",
                style: TextStyle(color: Colors.grey[700], fontSize: 16),
              ),
              const SizedBox(
                height: 25,
              ),
              //uname txtfld
              MyTextField(
                  controller: usernameController,
                  hintText: "Username",
                  obscureText: false),
              const SizedBox(
                height: 10,
              ),
              //pwd txtfld
              MyTextField(
                  controller: passwordController,
                  hintText: "Password",
                  obscureText: true),
              const SizedBox(
                height: 10,
              ),
              //conform textfield
              MyTextField(
                  controller: confirmPasswordController,
                  hintText: "Confirm Password",
                  obscureText: true),
              const SizedBox(
                height: 10,
              ),
              //forgot pwd

              const SizedBox(
                height: 25,
              ),
              //sign in button
              MyButton(
                text: "Sign Up",
                onTap: signUserUp,
              ),
              const SizedBox(
                height: 50,
              ),
              //or continue with
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                        child: Divider(
                      thickness: 3,
                    )),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "Or Continue with",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    Expanded(
                        child: Divider(
                      thickness: 3,
                    )),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              //google + apple sign in button
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
              //not a member?register now
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an Account?",
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      "Login now",
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

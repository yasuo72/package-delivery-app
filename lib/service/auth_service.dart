import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Google Sign-In
  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Trigger authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return null; // User canceled sign-in

      // Obtain auth details from the request
      final GoogleSignInAuthentication googleAuth =
      await googleUser.authentication;

      // Create a credential from Google Auth
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in with Firebase
      return await _auth.signInWithCredential(credential);
    } catch (e) {
      print("Google Sign-In Error: $e");
      return null;
    }
  }

  // Sign out user
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut(); // Important to disconnect Google account
  }
}

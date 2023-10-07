import 'package:auth_using_firebase/pages/home_page.dart';
import 'package:auth_using_firebase/pages/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService{
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  signInWithGoogle(BuildContext context) async{
    final GoogleSignInAccount? gUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;
    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken
    );
    return await FirebaseAuth.instance.signInWithCredential(credential).then((value) => Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    ));
  }

  singOutFromGoogle(BuildContext context) async{
    if(await _googleSignIn.isSignedIn())
    {
      await _googleSignIn.disconnect();
      await _googleSignIn.signOut();
    }
    await FirebaseAuth.instance.signOut().then((value) => Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    ));
  }
}
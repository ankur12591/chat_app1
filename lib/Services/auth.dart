
import 'package:firebase/firebase_io.dart';

import 'package:chat_app1/Screens/home.dart';
import 'package:chat_app1/Screens/sign_in.dart';
import 'package:chat_app1/Services/shared_pref.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthMethods{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //
  getCurrentUser () {
    return _auth.currentUser;
  }

  // Sign In

  signWithEmailAndPassword (String email, String password, BuildContext context) async {
    UserCredential userCredential = await
    _auth.signInWithEmailAndPassword(
        email: email, password: password);

    User user = userCredential.user;
    SharedPreferenceHelper().saveEmail(user.email);
    SharedPreferenceHelper().saveIsLoggedIn(true);
    
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage() ));
  }

  // Sign Up and Save data to Shared Preference

  signUpWithEmailAndPassword (String email, String password, BuildContext context) async {
    UserCredential userCredential = await
    _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    User user = userCredential.user;
    SharedPreferenceHelper().saveEmail(user.email);
    SharedPreferenceHelper().saveIsLoggedIn(true);

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage() ));
  }

  // Sign Out

  void signOut(BuildContext context) {
    _auth.signOut();
    SharedPreferenceHelper().saveIsLoggedIn(false);
    SharedPreferenceHelper().saveEmail("");

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignIn()));

  }
}
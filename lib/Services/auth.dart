
import 'package:chat_app1/Services/database.dart';
import 'package:chat_app1/Screens/home.dart';
import 'package:chat_app1/Screens/sign_in.dart';
import 'package:chat_app1/Services/shared_pref.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthMethods{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //
  getCurrentUser () async {
    return await _auth.currentUser;
  }

  // Sign In

  signInWithEmailAndPassword (String userName, String email, String password, BuildContext context) async {
    UserCredential userCredential = await
    _auth.signInWithEmailAndPassword(
        email: email, password: password);

    User user = userCredential.user;

    SharedPreferenceHelper().saveEmail(user.email);
    SharedPreferenceHelper().saveUserName(userName);
    SharedPreferenceHelper().saveIsLoggedIn(true);

    DatabaseMethods().uploadUserInfo(user.email, user.email.replaceAll
      ("gmail.com", "")).then((value) => {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context)
      => MyHomePage() ))
    });
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage() ));
  }

  // Sign Up and Save data to Shared Preference

  signUpWithEmailAndPassword (String userName, String email, String password, BuildContext context) async {
    UserCredential userCredential =
    await _auth
        .createUserWithEmailAndPassword(
        email: email, password: password);


    User user = userCredential.user;


    SharedPreferenceHelper().saveEmail(user.email);
    SharedPreferenceHelper().saveUserName(userName);
    SharedPreferenceHelper().saveIsLoggedIn(true);

    DatabaseMethods().uploadUserInfo(user.email, userName).then((value) =>
    {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MyHomePage()))
    }).catchError((error) {
      print(error);
    });


  }

  // Sign Out

  void signOut(BuildContext context) {
    _auth.signOut();
    SharedPreferenceHelper().saveIsLoggedIn(false);
    SharedPreferenceHelper().saveEmail("");
    SharedPreferenceHelper().saveUserName("");

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignIn()));

  }
}
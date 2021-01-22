import 'package:chat_app1/Models/user.dart';
import 'package:chat_app1/Screens/home.dart';
import 'package:chat_app1/Screens/sign_in.dart';
import 'package:chat_app1/Services/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat App',
      theme: ThemeData.dark(),
      home:  FutureBuilder(
        future: AuthMethods().getCurrentUser(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot)  {
          if (snapshot.hasData) {
            return  MyHomePage();
          } else {
            return SignIn();
          }
        },
      ),
    );
  }
}



import 'package:chat_app1/Screens/search.dart';
import 'package:chat_app1/Services/auth.dart';
import 'package:flutter/material.dart';


class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("FlutterChat"),
            Text("App",
              style: TextStyle(
                  color: Colors.greenAccent[400]
              ),
            ),
          ],
        ),
        elevation: 0.0,
        actions: [
          GestureDetector(
            onTap: (){
              AuthMethods().signOut(context);
            },

            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Icon(Icons.exit_to_app_rounded),
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.search_rounded),
        onPressed: (){
          Navigator.push(
              context, MaterialPageRoute(builder: (context) =>
              Search())
          );
        },
      ),
    );
  }
}

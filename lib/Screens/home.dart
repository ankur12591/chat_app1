
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
        backgroundColor: Colors.white,
          title: Row(
          children: [
            SizedBox(width: 15,),
            Text("FlutterChat "),
            Text("App",
              style: TextStyle(
                color: Colors.deepOrange
              ),
            ),
          ],
          ),
        ),
    );
          }
}

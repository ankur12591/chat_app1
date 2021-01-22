import 'package:chat_app1/Services/database.dart';
import 'package:chat_app1/Services/shared_pref.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final String chatRoomId ;
  ChatScreen(this.chatRoomId);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  String myName = "";
  Stream chatMessageStream;

  getMyInfoFromSharedPref () async {
    myName = await SharedPreferenceHelper().getUserName();
    setState(() {});
  }

  getChats () async {
    chatMessageStream =
    await DatabaseMethods()
        .getChatMessage(widget.chatRoomId);
    setState(() {});

  }

  Widget messageList(){
    return StreamBuilder(
      stream: chatMessageStream,
        builder: (context,snapshot) {
        return snapshot.hasData
            ? ListView.builder(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
           // reverse: true,
            padding: EdgeInsets.only(top: 18, bottom: 40),
              itemCount: snapshot.data.docs.length,
                itemBuilder: (context,index) {
                  DocumentSnapshot documentSnapshot = snapshot.data.docs[index];


                  print(documentSnapshot["message"]);

                  return
                  //CircularProgressIndicator();
                     messageTile(documentSnapshot["message"]);
                } )
            : Center(
                child: CircularProgressIndicator(),
        );
      }
    );
  }


  Widget messageTile (String message) {
    return Row(
      children: [
        Container(

          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child:
            Text(message)),
      ],
    );
  }


  @override
  void initState() {
    getMyInfoFromSharedPref();
    getChats();
    super.initState();
    setState(() {

    });
  }


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
      ),

      body: Container(
        color: Colors.blue,
        child: messageList(),
      ),
    );
  }
}

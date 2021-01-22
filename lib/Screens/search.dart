import 'package:chat_app1/Screens/chat_screen.dart';
import 'package:chat_app1/Services/database.dart';
import 'package:chat_app1/Services/shared_pref.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {

  TextEditingController userNameTextEditingController = TextEditingController();
  QuerySnapshot querySnapshot;

  onSearchIconClick () async {
    querySnapshot = await DatabaseMethods()
        .searchByUserName(
        userNameTextEditingController.text);
    // print(querySnapshot.docs.toString());

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
        elevation: 0.0,
      ),
      
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 18),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                  controller: userNameTextEditingController,
                  decoration: InputDecoration(
                    hintText: "Username"
                  ),),
                ),
                SizedBox(width: 8.0,),
                GestureDetector(
                  onTap: (){
                    onSearchIconClick();
                  },
                    child: Icon(Icons.search_rounded)),
              ],
            ),

            SizedBox(height: 10.0,),
            querySnapshot != null
                ? ListView.builder(
                itemCount: querySnapshot.docs.length,
                shrinkWrap: true,
                itemBuilder: (context, index){
                  return Row(
                    children: [
                      SearchTile(querySnapshot.docs[index]["email"],
                          querySnapshot.docs[index]["userName"]),
                    ],
                  );
                })
                : Container(),
          ],
        ),
      ),
    );
  }
}


class SearchTile extends StatelessWidget {
  final String email , userName;
  SearchTile(this.email, this.userName);

  Future<String> getChatRoomId(String searchUsername) async {
    String myUsername = await SharedPreferenceHelper().getUserName();
    if (myUsername.substring(0).codeUnitAt(0) >
        searchUsername.substring(0).codeUnitAt(0)) {
      return "${searchUsername}_$myUsername";
    } else {
      return "${myUsername}_$searchUsername";
    }

  }

  
  Future createAChatRoom (String userName,String chatRoomId) async {
    String myUserName = await SharedPreferenceHelper().getUserName();

    List<String> users = [userName,myUserName];

    Map<String ,dynamic> chatRoomData = {
      "users" : users
    };
    await DatabaseMethods().createChatRoom(chatRoomId, chatRoomData);
        sendAMessage (myUserName,chatRoomId);
  }

  sendAMessage (String myUserName,String chatRoomId) async {

    Map<String,dynamic> messageData = {

      "message" : "hey how are you?",
      "sendBy" : myUserName,
      "time" : DateTime.now(),
    };

    await DatabaseMethods().addAMessage(chatRoomId,messageData);


  }


  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width-40,
      padding: EdgeInsets.symmetric( vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(email),
          GestureDetector(
              onTap: () async {

                String chatRoomId = await getChatRoomId(userName);
                DatabaseMethods()
                    .checkIfChatroomExist(chatRoomId)
                    .then((value) async {
                  DocumentSnapshot documentSnapshot = value;
                  if(documentSnapshot != null) {
                    print("Chat room exists");

                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) =>
                            ChatScreen(chatRoomId)));

                  } else {
                    print("Chat room does not exists");

                    await createAChatRoom(userName,chatRoomId);
                    
                    // Send user to chat screen
                    
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) =>
                        ChatScreen(chatRoomId)));
                  }
                });
              },
              child: Icon(Icons.message_rounded)),
        ],
      ),
    );
  }
}

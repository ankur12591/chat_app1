import 'package:chat_app1/Services/shared_pref.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

  class DatabaseMethods {

    Future uploadUserInfo(String email, String userName) {
      return FirebaseFirestore.instance
          .collection("users")
          .add({"email": email, "userName": userName})
          .catchError((error) {
        print(error);
      });
    }

    Future <QuerySnapshot> searchByUserName(String userName) async {
      return await FirebaseFirestore.instance
          .collection("users")
          .where("userName", isEqualTo: userName)
          .get();
    }


    Future <DocumentSnapshot> getUserName(String uid) {
      return FirebaseFirestore.instance
          .collection("users")
          .doc(uid)
          .get();
    }

    checkIfChatroomExist(String chatRoomId) async {

      return FirebaseFirestore.instance
          .collection("users")
          .doc(chatRoomId)
          .get();
    }

    Future createChatRoom(String chatRoomId, Map chatRoomData) {
      return FirebaseFirestore.instance
          .collection("chatrooms")
          .doc(chatRoomId)
          .set(chatRoomData)
          .catchError((error) {
        print(error);
      });
    }


    Future addAMessage(String chatRoomId, Map messageData) {
      return FirebaseFirestore.instance
          .collection("chatrooms")
          .doc(chatRoomId)
          .collection("chats")
          .add(messageData)
          .catchError((error) {
        print(error);
      });
    }


    createChatroom(String userNameSearching) async {
      String myUserName = await SharedPreferenceHelper().getUserName();

      // Create Chatrooms

      FirebaseFirestore.instance.collection("chatrooms")
          .add({
        "last_message_sent": "hey",
        "last_message_time": DateTime.now(),
        "user": [userNameSearching, myUserName]
      });
    }
    
    Future<Stream> getChatMessage (String chatRoomId) async {
      return await FirebaseFirestore.instance
          .collection("chatrooms")
          .doc(chatRoomId)
          .collection("chats")
          .orderBy("time")
          .snapshots();
      
    } 
  }
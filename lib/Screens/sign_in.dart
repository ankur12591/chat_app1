import 'package:chat_app1/Screens/sign_up.dart';
import 'package:chat_app1/Services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  TextEditingController userNameTextEditingController = TextEditingController();

  TextEditingController emailTextEditingController = TextEditingController();

  TextEditingController passwordTextEditingController = TextEditingController();

  bool showPass = true;

  onSignInBtnClick (BuildContext context){
    AuthMethods().signInWithEmailAndPassword(
        userNameTextEditingController.text,
        emailTextEditingController.text,
        passwordTextEditingController.text, context);
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
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height-80,
          color: Colors.black12,
          child: Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [

                  TextField(
                    controller: userNameTextEditingController,
                    decoration: InputDecoration(
                      hintText: "User Name",
                    ),
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),

                  SizedBox(height: 10,),

                  TextField(
                    controller: emailTextEditingController,
                    decoration: InputDecoration(
                        hintText: "Email"

                    ),
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),

                  SizedBox(height: 10,),

                  TextField(
                    obscureText: true,
                    controller: passwordTextEditingController,
                    decoration: InputDecoration(
                        hintText: "Password"


                    ),
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),

                  SizedBox(height: 20,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("forgot password?"),
                    ],
                  ),

                  SizedBox(height: 20,),

                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    child: RaisedButton(

                      onPressed: () {
                        onSignInBtnClick(context);
                      },
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                      color: Colors.greenAccent[700] ,
                      child: Text("Sign In",
                        style: TextStyle(fontSize: 20,color: Colors.white),
                      ),
                    ),
                  ),

                  SizedBox(height: 20,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have account?",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),

                      SizedBox(width: 8,),

                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignUp()));
                        },
                        child: Text("Register now",
                          style: TextStyle(
                              color: Colors.greenAccent[700],
                              fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),

    );
  }
}

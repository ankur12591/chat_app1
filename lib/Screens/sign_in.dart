import 'package:chat_app1/Screens/sign_up.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  TextEditingController userNameTextEditingController = TextEditingController();

  TextEditingController emailTextEditingController = TextEditingController();

  TextEditingController passwordTextEditingController = TextEditingController();

  bool showPass = false;



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
              ),),

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
                    obscureText: showPass,
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

                      onPressed: () {},
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                      color: Colors.deepOrangeAccent ,
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
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
                        },
                        child: Text("Register now",
                          style: TextStyle(
                              color: Colors.deepOrangeAccent,
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

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

import 'package:lottie/lottie.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class login_page extends StatefulWidget {
  login_page({Key? key}) : super(key: key);

  @override
  _login_pageState createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
  String email = "";
  String password = "";
  String name = " ";
  bool changeButton = false;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: FadeInDownBig(
          delay: Duration(milliseconds: 1500),
          child: Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
                SizedBox(
                  height: 30,
                ),
                Container(
                    margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Lottie.asset("assets/images/68312-login.json")),
                SizedBox(
                  height: 30,
                ),

                Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width * 0.1,
                  child: TextFormField(
                    onChanged: (value) {
                      email = value;
                    },
                    style: TextStyle(fontSize: 15, color: Colors.black),
                    decoration: InputDecoration(
                        labelText: "Username",
                        labelStyle: TextStyle(color: Colors.black),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.green, width: 3),
                        ),
                        prefixIcon: Icon(Icons.people),
                        hintText: "Enter Your Username",
                        contentPadding: EdgeInsets.symmetric(horizontal: 20)),
                  ),
                ),

                Container(
                  height: 50,
                  width: 380,
                  child: TextFormField(
                    onChanged: (value) {
                      password = value;
                    },
                    obscureText: false,
                    style: TextStyle(fontSize: 15),
                    decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: TextStyle(color: Colors.black),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                BorderSide(color: Colors.green, width: 3)),
                        prefixIcon: Icon(Icons.lock),
                        hintText: "Enter Your Password",
                        contentPadding: EdgeInsets.symmetric(horizontal: 10)),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                InkWell(
                  child: Text(
                    "Forgot password?",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    textAlign: TextAlign.end,
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/Password');
                  },
                ),

                SizedBox(
                  height: 20,
                ),

                InkWell(
                  child: Container(
                    height: 50,
                    alignment: Alignment.center,
                    child: changeButton
                        ? Icon(
                            Icons.done,
                            color: Colors.white,
                          )
                        : Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(40)),
                  ),
                  onTap: () async {
                    try {
                      UserCredential userCredential = await FirebaseAuth
                          .instance
                          .signInWithEmailAndPassword(
                              email: email, password: password);
                      _firestore
                          .collection('User')
                          .doc(_auth.currentUser!.uid)
                          .get()
                          .then((value) {
                        userCredential.user!.updateDisplayName(value['Name']);
                        print(_auth.currentUser!.displayName);
                      });

                      logincomplete(BuildContext, context);
                      await Future.delayed(Duration(seconds: 5));
                      Navigator.pushNamed(context, '/Home');
                      setState(() {
                        changeButton = true;
                      });
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        NoUser(BuildContext, context);
                        print('No user found for that email.');
                      } else if (e.code == 'wrong-password') {
                        WrongPassword(BuildContext, context);
                        print('Wrong password provided for that user.');
                      }
                    }
                    // Navigator.pushNamed(context, "/Home");
                  },
                ),

                SizedBox(
                  height: 25,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 70.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Don't have account? ",
                        textAlign: TextAlign.right,
                      ),
                      InkWell(
                        child: Text(
                          "Register Now",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, '/register');
                        },
                      )
                    ],
                  ),
                ),
                //
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void logincomplete(BuildContext, Context) {
  var alertDialog = AlertDialog(
      title: Text("Sign in completed"),
      content: Text("Now you can buy a product"));

  showDialog(
      context: Context,
      builder: (context) {
        return alertDialog;
      });
}

void NoUser(BuildContext, Context) {
  var alertDialog = AlertDialog(
    title: Text(
      "Please SignUp",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    ),
    content: Text("No account exicted "),
  );

  showDialog(
      context: Context,
      builder: (context) {
        return alertDialog;
      });
}

void WrongPassword(BuildContext, Context) {
  var alertDialog = Container(
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
    child: AlertDialog(
      title: Text(
        'Entered wrong password',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Text(
        "Please correct it ",
        textAlign: TextAlign.center,
      ),
    ),
  );

  showDialog(
      context: Context,
      builder: (context) {
        return alertDialog;
      });
}

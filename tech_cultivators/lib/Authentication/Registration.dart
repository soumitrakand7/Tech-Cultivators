import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class registration_page extends StatelessWidget {
  @override
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection("User");
  final _formKey = GlobalKey<FormState>();
  final _formKey1 = GlobalKey<FormState>();

  FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _textEditingController1 = TextEditingController();
  final TextEditingController _textEditingController2 = TextEditingController();
  final TextEditingController _textEditingController3 = TextEditingController();
  final TextEditingController _textEditingController4 = TextEditingController();
  final TextEditingController _textEditingController5 = TextEditingController();
  final TextEditingController _textEditingController6 = TextEditingController();
  final TextEditingController _textEditingController7 = TextEditingController();
  Widget build(BuildContext context) {
    String email = "";
    String password = "";
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Registration",
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
            )),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
      ),
      body: FadeInDownBig(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(height: 10),
                  Text('Create Your Account',
                      style: TextStyle(
                        fontSize: 33,
                        fontWeight: FontWeight.bold,
                      )),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text('Create a new account',
                        style: TextStyle(
                          fontSize: 20,
                        )),
                  ),
                  Container(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 10,
                          ),
                          register("Name", "Enter Your Name", false,
                              Icon(Icons.people), "", _textEditingController1),
                          SizedBox(height: 15),
                          register(
                              "Number",
                              "Enter Your Mobile Number",
                              false,
                              Icon(Icons.contact_page),
                              "",
                              _textEditingController2),
                          SizedBox(height: 15),
                          register(
                              " Email ID",
                              "Enter your Email",
                              false,
                              Icon(Icons.email_outlined),
                              email,
                              _textEditingController3),
                          SizedBox(height: 15),
                          register(
                              "Address",
                              "Enter your address",
                              false,
                              Icon(Icons.location_city),
                              "",
                              _textEditingController6),
                          SizedBox(height: 15),
                          register(
                              " Password",
                              "Enter Your Password",
                              true,
                              Icon(Icons.lock),
                              password,
                              _textEditingController4),
                          SizedBox(height: 15),
                          register(
                              "Confirm Password",
                              "Confirmed Your Password",
                              true,
                              Icon(Icons.lock),
                              "confirmedp",
                              _textEditingController5),
                          SizedBox(height: 85),
                          InkWell(
                            onTap: () async {
                              // Validate returns true if the form is valid, or false otherwise.
                              if (_formKey.currentState!.validate()) {
                                // If the form is valid, display a snackbar. In the real world,
                                // you'd often call a server or save the information in a database.
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Processing Data')),
                                );
                              }
                              try {
                                UserCredential userCredential =
                                    await FirebaseAuth.instance
                                        .createUserWithEmailAndPassword(
                                            email: _textEditingController3.text,
                                            password:
                                                _textEditingController4.text);
                                SC(BuildContext, context);
                                await Future.delayed(Duration(seconds: 4));
                                Navigator.pushNamed(context, '/');
                              } on FirebaseAuthException catch (e) {
                                if (e.code == 'weak-password') {
                                  WP(BuildContext, context);
                                  print('The password provided is too weak.');
                                } else if (e.code == 'email-already-in-use') {
                                  EU(BuildContext, context);
                                  print(
                                      'The account already exists for that email.');
                                }
                              } catch (e) {
                                print(e);
                              }
                              await collectionReference
                                  .doc(_auth.currentUser!.uid)
                                  .set({
                                'Name': _textEditingController1.text,
                                'MObile No': _textEditingController2.text,
                                'email': _textEditingController3.text,
                                'Image': _textEditingController7.text,
                                'password': _textEditingController4.text,
                                'Address': _textEditingController6.text,
                                "uid": _auth.currentUser!.uid
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 60,
                                alignment: Alignment.center,
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}

Widget register(String labelText, String hintText, bool x, Icon myicon,
    String y, TextEditingController z) {
  return Container(
    height: 55,
    width: 380,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
    ),
    child: TextFormField(
      onChanged: (value) {
        String y = value;
      },
      obscureText: x,
      controller: z,
      style: const TextStyle(fontSize: 15),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "please Enter some text";
        }
      },
      decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(color: Colors.black),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: const BorderSide(color: Colors.amber, width: 2)),
          prefixIcon: myicon,
          hintText: hintText,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20)),
    ),
  );
}

void WP(BuildContext, Context) {
  var alertDialog = const AlertDialog(
    title: Text("Please Enter Strong Password"),
    // content: Text("Now you can Buy a product")
  );

  showDialog(
      context: Context,
      builder: (context) {
        return alertDialog;
      });
}

void EU(BuildContext, Context) {
  var alertDialog = const AlertDialog(
    title: Text("The account already exists for that email."),
    content: Text("Please enter new Email ID"),
    // content: Text("Now you can Buy a product")
  );

  showDialog(
      context: Context,
      builder: (context) {
        return alertDialog;
      });
}

void SC(BuildContext, Context) {
  var alertDialog = const AlertDialog(
    title: Text("You have successfuly registered on Agventure"),
    content: Text("Please Sign In"),
    // content: Text("Now you can Buy a product")
  );

  showDialog(
      context: Context,
      builder: (context) {
        return alertDialog;
      });
}

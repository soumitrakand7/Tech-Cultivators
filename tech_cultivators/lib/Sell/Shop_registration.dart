import 'package:animate_do/animate_do.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lottie/lottie.dart';

class Shop_Registration extends StatelessWidget {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection("Shpos");
  @override
  final TextEditingController _textEditingController1 = TextEditingController();
  final TextEditingController _textEditingController2 = TextEditingController();
  final TextEditingController _textEditingController3 = TextEditingController();
  final TextEditingController _textEditingController4 = TextEditingController();
  final TextEditingController _textEditingController5 = TextEditingController();
  final TextEditingController _textEditingController6 = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Container(
          padding: EdgeInsets.only(right: 8, left: 3),
          child: Text("Shop Registration",
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              )),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
      ),
      body: FadeInDownBig(
        delay: Duration(milliseconds: 500),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.only(left: 12, right: 12, bottom: 30),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Column(
                      children: [
                        Text('Add Your Shop',
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            )),
                        SizedBox(
                          height: 15,
                        ),
                        Column(
                          children: [
                            Text(
                              "Already Registered Shop",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "Click On plus Icon",
                              style: TextStyle(
                                fontSize: 13,
                              ),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, "/Add_Product");
                          },
                          child: Lottie.network(
                              "https://assets1.lottiefiles.com/packages/lf20_baB1GS.json"),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        register("Shop Owner / Seller", "Enter Your Name",
                            false, Icon(Icons.person), _textEditingController1),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        register("Shop Name", "Enter Your Shop Name", false,
                            Icon(Icons.people), _textEditingController2),
                        SizedBox(
                          height: 10,
                        ),
                        register(
                            "Location",
                            "Enter Address Of Shop",
                            false,
                            Icon(Icons.location_city_outlined),
                            _textEditingController3),
                        SizedBox(
                          height: 10,
                        ),
                        register(
                            "Contact",
                            "Enter Your Contact Information",
                            false,
                            Icon(Icons.contact_page_rounded),
                            _textEditingController4),
                        SizedBox(
                          height: 10,
                        ),
                        register(
                            "Password",
                            "Set password for your shop ",
                            false,
                            Icon(Icons.password_sharp),
                            _textEditingController6),
                        SizedBox(
                          height: 10,
                        ),
                        register(
                            "About",
                            "Enter Detailed Information About Shop",
                            false,
                            Icon(Icons.info_outline),
                            _textEditingController5),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            collectionReference
                                .doc(_textEditingController2.text)
                                .set({
                              "NurseryOwner": _textEditingController1.text,
                              "NurseryName ": _textEditingController2.text,
                              "Location ": _textEditingController3.text,
                              "Contact No":
                                  int.parse(_textEditingController4.text),
                              "About Nursery": _textEditingController5.text,
                              "Password": _textEditingController6.text
                            });
                            SC(BuildContext, context);
                          },
                          child: Container(
                            height: 50,
                            alignment: Alignment.center,
                            child: Text(
                              "REGISTER",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(40)),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget register(String labelText, String hintText, bool x, Icon myicon,
      TextEditingController z) {
    return Container(
      height: 60,
      width: 380,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        // onChanged: (value) {
        //   String y = value;
        // },
        obscureText: x,
        controller: z,
        style: TextStyle(fontSize: 15),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "please Enter some text";
          }
        },
        decoration: InputDecoration(
            border: InputBorder.none,
            labelText: labelText,
            labelStyle: TextStyle(color: Colors.black),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(color: Colors.amber, width: 2)),
            prefixIcon: myicon,
            hintText: hintText,
            contentPadding: EdgeInsets.symmetric(horizontal: 20)),
      ),
    );
  }

  void SC(BuildContext, Context) {
    var alertDialog = AlertDialog(
      title: Text(
        "Your Shop has Added Succesfully",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20,
        ),
      ),
      content: Text("Password Will Send on Your Registered Email ID ",
          style: TextStyle(
            fontSize: 15,
          ),
          textAlign: TextAlign.center),
      // content: Text("Now you can Buy a product")
    );

    showDialog(
        context: Context,
        builder: (context) {
          return alertDialog;
        });
  }
}

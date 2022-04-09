import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Address extends StatelessWidget {
  Address({Key? key}) : super(key: key);
  final TextEditingController _textEditingController = TextEditingController();
  final TextEditingController _textEditingController1 = TextEditingController();
  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection("User");
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.green,
          title: Container(
            padding: EdgeInsets.only(right: 1, left: 24),
            child: Text("Address Page",
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w500,
                )),
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)))),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          register("Locality", "Enter Your Full Address", "",
              _textEditingController, context),
          Container(
            height: 70,
            padding: EdgeInsets.all(8),
            child: FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: Colors.green[500],
              onPressed: () async {
                await collectionReference.doc(_auth.currentUser!.uid).update({
                  'Address': _textEditingController.text,
                }).then(
                  (value) => _textEditingController.clear(),
                );

                Fluttertoast.showToast(
                    msg: " Address Changed Successfully ",
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    fontSize: 16.0);
              },
              child: Container(
                child: Center(
                  child: Text(
                    "Change or Upadate Address",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget register(String labelText, String hintText, String y,
    TextEditingController z, context) {
  return Container(
    margin: EdgeInsets.all(8),
    height: 55,
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
    ),
    child: TextFormField(
      onChanged: (value) {
        String y = value;
      },
      // obscureText: x,
      controller: z,
      style: TextStyle(fontSize: 15),
      // validator: (value) {
      //   if (value == null || value.isEmpty) {
      //     return "please Enter some text";
      //   }
      // },
      decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.black),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide(color: Colors.amber, width: 2)),
          // prefixIcon: myicon,
          hintText: hintText,
          contentPadding: EdgeInsets.symmetric(horizontal: 20)),
    ),
  );
}

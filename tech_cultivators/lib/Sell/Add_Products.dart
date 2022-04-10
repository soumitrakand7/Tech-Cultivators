import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:dropdownfield/dropdownfield.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kisan/Sell/next_add_product.dart';
import 'package:lottie/lottie.dart';

class Add_Product extends StatefulWidget {
  const Add_Product({Key? key}) : super(key: key);

  @override
  State<Add_Product> createState() => _Add_ProductState();
}

class _Add_ProductState extends State<Add_Product> {
  FirebaseFirestore db = FirebaseFirestore.instance;
  var firestoreDB = FirebaseFirestore.instance.collection("Shpos").snapshots();
  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection("Shpos");
  List<String> Nursary = [
    'Blossom Valley',
    'Evergreen',
    'Paradise Nursery',
    "VJTI Cafe"
  ];

  List<String> Category = [
    "Seeds",
    "Fertilizers",
    "Tools",
    "Crop Protection",
    "Plants"
  ];
  var SelectedCategory;
  var SelectedShop = "Evergreen";
  bool issale = false;

  @override
  Widget build(BuildContext context) {
    TextEditingController _NurseryName = TextEditingController();

    TextEditingController _productCategory = TextEditingController();
    TextEditingController _Password = TextEditingController();
    final FirebaseFirestore firestoreDB = FirebaseFirestore.instance;
    final _key = GlobalKey<FormState>();
    // Password = FirebaseFirestore.collection("").get()
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Container(
          padding: EdgeInsets.only(right: 5, left: 0),
          child: Text("Add Products",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w500,
              )),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
      ),
      body: StreamBuilder<DocumentSnapshot>(
          stream: firestoreDB.collection("Shpos").doc(SelectedShop).snapshots(),
          builder: (BuildContext context, snapshot) {
            Map<String, dynamic> map =
                snapshot.data!.data() as Map<String, dynamic>;
            print(map.length);
            return ListView(
              children: [
                LottieBuilder.asset(
                    "assets/images/93270-password-lock-animation.json"),
                SizedBox(
                  height: 20,
                ),
                Form(
                    child: Column(
                  children: [
                    Container(
                      height: 70,
                      width: double.infinity,
                      padding: EdgeInsets.only(left: 20, right: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: DropdownButton(
                        hint: Text("Select your Shop",
                            style: TextStyle(fontSize: 18)),
                        value: SelectedShop,
                        dropdownColor: Color.fromARGB(255, 197, 243, 206),
                        elevation: 20,
                        isExpanded: true,
                        style: TextStyle(fontSize: 17, color: Colors.black),
                        icon: Icon(
                          Icons.arrow_drop_down_circle_sharp,
                          size: 30,
                        ),
                        onChanged: (newValueSelected) {
                          setState(() {
                            SelectedShop = newValueSelected.toString();
                          });
                        },
                        items: Nursary.map((Nursary) {
                          return DropdownMenuItem(
                            value: Nursary,
                            child: Text(
                              Nursary,
                              style: TextStyle(color: Colors.black),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    // ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 70,
                      width: double.infinity,
                      padding: EdgeInsets.only(left: 20, right: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: DropdownButton(
                        hint: Text("Select Product Category ",
                            style: TextStyle(fontSize: 18)),
                        value: SelectedCategory,
                        dropdownColor: Colors.green,
                        elevation: 20,
                        isExpanded: true,
                        style: TextStyle(fontSize: 17, color: Colors.black),
                        icon: Icon(
                          Icons.arrow_drop_down_circle_sharp,
                          size: 30,
                        ),
                        onChanged: (newValueSelected) {
                          setState(() {
                            SelectedCategory = newValueSelected;
                          });
                        },
                        items: Category.map((Category) {
                          return DropdownMenuItem(
                            value: Category,
                            child: Text(
                              Category,
                              style: TextStyle(color: Colors.black),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    data("Password", "Enter password of selected shop", false,
                        _Password),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        if (map['Password'] == _Password.text) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Upload(
                                Category: SelectedCategory,
                                shopName: SelectedShop,
                              ),
                            ),
                          );
                        }
                      },
                      child: Container(
                        height: 60,
                        width: 200,
                        alignment: Alignment.center,
                        child: Text(
                          "Submit",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(40)),
                      ),
                    )
                  ],
                )),
                SizedBox(
                  height: 20,
                ),
              ],
            );
          }),
    );
  }
}

void SAP(BuildContext, Context) {
  var alertDialog = Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
      child: Container(
        child: AlertDialog(
          title: Text(
            'Product Added',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            "Succesfully",
            textAlign: TextAlign.center,
          ),
        ),
      ));

  showDialog(
      context: Context,
      builder: (context) {
        return alertDialog;
      });
}

Widget data(
  String labelText,
  String hintText,
  bool x,
  TextEditingController z,
) {
  return Container(
    height: 60,
    width: double.infinity,
    padding: EdgeInsets.all(5),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
    ),
    child: TextFormField(
      controller: z,
      style: TextStyle(fontSize: 15),
      validator: (value) {
        if (value!.isEmpty) {
          return "please Enter some text";
        }
      },
      decoration: InputDecoration(
          border: InputBorder.none,
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.black, fontSize: 18),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.amber, width: 2)),
          // prefixIcon: myicon,
          hintText: hintText,
          contentPadding: EdgeInsets.symmetric(horizontal: 20)),
    ),
  );
}

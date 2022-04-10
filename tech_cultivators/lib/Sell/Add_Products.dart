import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class Add_Product extends StatefulWidget {
  const Add_Product({Key? key}) : super(key: key);

  @override
  State<Add_Product> createState() => _Add_ProductState();
}

class _Add_ProductState extends State<Add_Product> {
  String uploadCode = DateTime.now().hashCode.toString();
  String imageURL =
      "https://st4.depositphotos.com/14953852/22772/v/600/depositphotos_227725020-stock-illustration-image-available-icon-flat-vector.jpg";
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
  var SelectedShop;
  bool issale = false;
  String Password = "";
  XFile? _image;
  File? imageFile;
  Future<String> downloadURL(String imageURL) async {
    String downloadUrl =
        await FirebaseStorage.instance.ref(imageURL).getDownloadURL();
    return downloadUrl;
  }

  String productName = "";
  int cost = 0;
  String description = "";

  @override
  Widget build(BuildContext context) {
    TextEditingController _productName = TextEditingController();
    TextEditingController _productImage = TextEditingController();
    TextEditingController _NurseryName = TextEditingController();
    TextEditingController _productPrice = TextEditingController();
    TextEditingController _ProductDetail = TextEditingController();
    TextEditingController _productCategory = TextEditingController();
    TextEditingController _Password = TextEditingController();

    final _key = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Container(
          padding: const EdgeInsets.only(right: 1, left: 0),
          child: const Text("Add Products",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w500,
              )),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
      ),
      body: StreamBuilder<Object>(
          stream: firestoreDB,
          builder: (context, snapshot) {
            return ListView(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Form(
                  child: Column(
                    children: [
                      Container(
                        height: 70,
                        width: double.infinity,
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: DropdownButton(
                          hint: const Text("Select your Shop",
                              style: TextStyle(fontSize: 18)),
                          value: SelectedShop,
                          dropdownColor:
                              const Color.fromARGB(255, 197, 243, 206),
                          elevation: 20,
                          isExpanded: true,
                          style: const TextStyle(
                              fontSize: 17, color: Colors.black),
                          icon: const Icon(
                            Icons.arrow_drop_down_circle_sharp,
                            size: 30,
                          ),
                          onChanged: (newValueSelected) {
                            setState(() {
                              SelectedShop = newValueSelected;
                            });
                          },
                          items: Nursary.map((Nursary) {
                            return DropdownMenuItem(
                              value: Nursary,
                              child: Text(
                                Nursary,
                                style: const TextStyle(color: Colors.black),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      // ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 70,
                        width: double.infinity,
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: DropdownButton(
                          hint: const Text("Select Product Category ",
                              style: TextStyle(fontSize: 18)),
                          value: SelectedCategory,
                          dropdownColor: Colors.green,
                          elevation: 20,
                          isExpanded: true,
                          style: const TextStyle(
                              fontSize: 17, color: Colors.black),
                          icon: const Icon(
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
                                style: const TextStyle(color: Colors.black),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      data("Password", "Enter password of selected shop", false,
                          _Password),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: [
                          data(" ProductName", "Enter ProductName", false,
                              _productName),
                          const SizedBox(
                            height: 20,
                          ),
                          data(" ProductPrice", "Enter Product Price", false,
                              _productPrice),
                          const SizedBox(
                            height: 20,
                          ),
                          data(
                              " ProductDetail",
                              "Enter deatail description of product",
                              false,
                              _ProductDetail),
                          const SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              setState(() {
                                productName = _productName.text;
                                cost = int.parse(_productPrice.text);
                                description = _ProductDetail.text;
                              });
                              var imagefile = await ImagePicker()
                                  .pickImage(source: ImageSource.camera);
                              if (imagefile != null) {
                                if (mounted) {
                                  setState(() {
                                    _image = imagefile;
                                  });
                                }
                                await FirebaseStorage.instance
                                    .ref("Images/$uploadCode")
                                    .putFile(
                                      File(imagefile.path),
                                    );
                              }
                            },
                            child: const Text(
                              "Click to upload Image",
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.green,
                              fixedSize: const Size(175, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(
                        height: 20,
                      ),

                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () async {
                          imageURL = await downloadURL("Images/$uploadCode");
                          collectionReference
                              .doc(SelectedShop)
                              .collection(SelectedCategory)
                              .add({
                            "Product Name": productName,
                            "Cost": cost,
                            "discription": productName,
                            "image Url": imageURL
                          });
                          SAP(BuildContext, context);
                          //  Navigator.pushNamed(context, '/O_Nursery_List');
                        },
                        child: Container(
                          height: 60,
                          width: 200,
                          alignment: Alignment.center,
                          child: const Text(
                            "Add Product",
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
      child: const AlertDialog(
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
    ),
  );

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
    padding: const EdgeInsets.all(5),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
    ),
    child: TextFormField(
      controller: z,
      style: const TextStyle(fontSize: 15),
      validator: (value) {
        if (value!.isEmpty) {
          return "please Enter some text";
        }
      },
      decoration: InputDecoration(
          border: InputBorder.none,
          labelText: labelText,
          labelStyle: const TextStyle(color: Colors.black, fontSize: 18),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.amber, width: 2)),
          // prefixIcon: myicon,
          hintText: hintText,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20)),
    ),
  );
}

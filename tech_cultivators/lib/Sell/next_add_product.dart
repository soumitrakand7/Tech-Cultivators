import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Upload extends StatefulWidget {
  String shopName;
  String Category;
  Upload({Key? key, required this.shopName, required this.Category})
      : super(key: key);

  @override
  State<Upload> createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  @override
  //  FirebaseFirestore db = FirebaseFirestore.instance;
  // var firestoreDB = FirebaseFirestore.instance.collection("Shpos").snapshots();
  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection("Shpos");
  Widget build(BuildContext context) {
    TextEditingController _productName = TextEditingController();
    TextEditingController _productImage = TextEditingController();
    TextEditingController _productPrice = TextEditingController();
    TextEditingController _ProductDetail = TextEditingController();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Container(
            padding: EdgeInsets.only(right: 1, left: 0),
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
        body: Column(children: [
          Column(
            children: [
              SizedBox(
                height: 10,
              ),
              data(" ProductName", "Enter ProductName", false, _productName),
              SizedBox(
                height: 20,
              ),
              data(
                  " ProductPrice", "Enter Product Price", false, _productPrice),
              SizedBox(
                height: 20,
              ),
              data(" ProductDetail", "Enter deatail description of product",
                  false, _ProductDetail),
              SizedBox(
                height: 20,
              ),
              data(
                "Image",
                "Upload image of product",
                false,
                _productImage,
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
            onTap: () {
              collectionReference
                  .doc(widget.shopName)
                  .collection(widget.Category)
                  .add({
                "Product Name": _productName.text,
                "Cost": int.parse(_productPrice.text),
                "discription": _ProductDetail.text,
              });
              // Navigator.pushNamed(context, '/O_Nursery_List');

              SAP(BuildContext, context);
            },
            child: Container(
              height: 60,
              width: 200,
              alignment: Alignment.center,
              child: Text(
                "Add Product",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              decoration: BoxDecoration(
                  color: Colors.green, borderRadius: BorderRadius.circular(40)),
            ),
          ),
        ]),
      ),
    );
  }
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

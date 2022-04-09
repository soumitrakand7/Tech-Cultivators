import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'farmer_detail.dart';

class Farmers extends StatefulWidget {
  const Farmers({Key? key}) : super(key: key);

  @override
  State<Farmers> createState() => _FarmersState();
}

class _FarmersState extends State<Farmers> {
  var firestoreDB = FirebaseFirestore.instance.collection("User").snapshots();
  List? labourList;
  final CollectionReference _firestoreDBDoctorList =
      FirebaseFirestore.instance.collection("User");
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: StreamBuilder<QuerySnapshot>(
            stream: _firestoreDBDoctorList.snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshots) {
              if (snapshots.hasData) {
                return ListView.builder(
                    itemCount: snapshots.data!.size,
                    itemBuilder: (BuildContext context, int index) {
                      Map<String, dynamic> map = snapshots.data!.docs[index]
                          .data() as Map<String, dynamic>;
                      // if(map.containsKey('labourList'))
                      //  labourList = map['labourList'];
                      // // Nursary[i
                      return (map.containsKey('money'))
                          ? InkWell(
                              onTap: () {
                                print(labourList);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => FarmerDetail(
                                              map['Name'],
                                              map['count'],
                                              map['money'],
                                              map['MObile No'],
                                              map['Address'],
                                            )));
                              },
                              child: Column(children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      left: 16, right: 16, top: 16),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          color: Colors.white, width: 3),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(16),
                                      )),
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.only(
                                            right: 8,
                                            left: 8,
                                            top: 8,
                                            bottom: 8),
                                        width: 110,
                                        height: 115,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                                color: Colors.white, width: 3),
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/images/equality.png"),
                                                fit: BoxFit.contain)),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Container(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              SizedBox(
                                                height: 6,
                                              ),
                                              Container(
                                                padding: EdgeInsets.only(
                                                    right: 8, top: 4),
                                                child: Text(
                                                  "गट नेता: " + map['Name'],
                                                  // "गट नेता: ",
                                                  maxLines: 2,
                                                  softWrap: true,
                                                  // style: CustomTextStyle
                                                  //     .textFormFieldSemiBold
                                                  //     .copyWith(fontSize: 20),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 6,
                                              ),
                                              Container(
                                                padding: EdgeInsets.only(
                                                    right: 8, top: 4),
                                                child: Text(
                                                  // "स्थान: ",
                                                  "स्थान: " + map['Address'],
                                                  maxLines: 2,
                                                  softWrap: true,
                                                  // style: CustomTextStyle
                                                  //     .textFormFieldSemiBold
                                                  //     .copyWith(fontSize: 20),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 6,
                                              ),
                                              Container(
                                                padding: EdgeInsets.only(
                                                    right: 8, top: 4),
                                                child: Text(
                                                  (map.containsKey('money'))
                                                      ? "एकूण: " + map['count']
                                                      : "एकूण: 0",
                                                  maxLines: 2,
                                                  softWrap: true,
                                                  // style: CustomTextStyle
                                                  //     .textFormFieldSemiBold
                                                  //     .copyWith(fontSize: 20),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 6,
                                              ),
                                              Container(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: <Widget>[
                                                    Text(
                                                      (map.containsKey('money'))
                                                          ? "₹ " +
                                                              map['money'] +
                                                              " प्रति दिवस"
                                                          : "₹ " +
                                                              "0" +
                                                              " प्रति दिवस",
                                                      //   style: CustomTextStyle
                                                      //       .textFormFieldBlack
                                                      //       .copyWith(
                                                      // color: Colors.green),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ]),
                            )
                          : Container();
                    });
              }
              return CircularProgressIndicator();
            }));
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Labours extends StatefulWidget {
  const Labours({Key? key}) : super(key: key);

  @override
  _LaboursState createState() => _LaboursState();
}

class _LaboursState extends State<Labours> {
  final TextEditingController _doctorName = TextEditingController();
  final TextEditingController _doctorPost = TextEditingController();
  final TextEditingController _doctorSpeciality = TextEditingController();
  final TextEditingController _doctorEducation = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference _firestoreDBDoctorList =
      FirebaseFirestore.instance.collection("users");

  @override
  Widget build(BuildContext context) {
    // final argsDL = ModalRoute.of(context)!.settings.arguments as ScreenArgumentsDoctorList;
    final size = MediaQuery.of(context).size;
    FocusNode myFocusNode = new FocusNode();
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 248, 243, 247),
      // appBar: AppBar(
      //   backgroundColor: Colors.green,
      //   elevation: 30,
      //   title: Center(
      //     child: Text("मजूर"),
      //   ),
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.only(
      //       bottomLeft: Radius.circular(20),
      //       bottomRight: Radius.circular(20),
      //     ),
      //   ),
      // ),
      // body: StreamBuilder<QuerySnapshot>(
      //     stream: _firestoreDBDoctorList
      //         .doc(_auth.currentUser!.uid)
      //         .collection("doctorList")
      //         .snapshots(),
      //     builder:
      //         (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshots) {
      //       if (snapshots.hasData) {
      //         return ListView.builder(
      //             itemCount: snapshots.data!.docs.length,
      //             itemBuilder: (BuildContext context, int index) {
      //               Map<String, dynamic> map = snapshots.data!.docs[index]
      //                   .data() as Map<String, dynamic>;
      //               return SingleChildScrollView(
      //                   child: Padding(
      //                     padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
      //                     child: Card(
      //                         elevation: 3,
      //                         shape: RoundedRectangleBorder(
      //                           borderRadius: BorderRadius.circular(8.0),
      //                         ),
      //                         child: Container(
      //                             decoration: BoxDecoration(
      //                               borderRadius: BorderRadius.circular(8),
      //                               border: Border.all(
      //                                 color: Colors.white,
      //                               ),
      //                               color: Colors.white,
      //                             ),
      //                             padding: EdgeInsets.all(12),
      //                             height: size.height / 4.9,
      //                             width: double.infinity,
      //                             child: Column(
      //                                 mainAxisAlignment:
      //                                 MainAxisAlignment.spaceBetween,
      //                                 children: [
      //                                   Row(
      //                                       mainAxisAlignment:
      //                                       MainAxisAlignment.spaceBetween,
      //                                       crossAxisAlignment:
      //                                       CrossAxisAlignment.start,
      //                                       children: [
      //                                         Column(
      //                                             mainAxisAlignment:
      //                                             MainAxisAlignment.start,
      //                                             crossAxisAlignment:
      //                                             CrossAxisAlignment.start,
      //                                             children: [
      //                                               Text(
      //                                                 map['doctorName'],
      //                                                 style: TextStyle(
      //                                                     color: Colors.black,
      //                                                     fontSize: 20,
      //                                                     fontWeight:
      //                                                     FontWeight.bold),
      //                                               ),
      //                                               Text(map['doctorPost'],
      //                                                   style: TextStyle(
      //                                                     color: Color.fromARGB(
      //                                                         255, 155, 155, 155),
      //                                                     fontStyle:
      //                                                     FontStyle.italic,
      //                                                     fontSize: 16,
      //                                                   )),
      //                                               Text(map['doctorSpeciality'],
      //                                                   style: TextStyle(
      //                                                     color: Color.fromARGB(
      //                                                         255, 155, 155, 155),
      //                                                     fontStyle:
      //                                                     FontStyle.italic,
      //                                                     fontSize: 16,
      //                                                   )),
      //                                               Text(map['doctorEducation'],
      //                                                   style: TextStyle(
      //                                                     color: Color.fromARGB(
      //                                                         255, 155, 155, 155),
      //                                                     fontStyle:
      //                                                     FontStyle.italic,
      //                                                     fontSize: 16,
      //                                                   )),
      //                                             ]),
      //                                         IconButton(
      //                                             onPressed: () {
      //                                               String id = snapshots
      //                                                   .data!.docs[index].id;
      //                                               _firestoreDBDoctorList
      //                                                   .doc(_auth.currentUser!.uid)
      //                                                   .collection('doctorList')
      //                                                   .doc(id)
      //                                                   .delete();
      //                                             },
      //                                             icon: Icon(
      //                                               Icons.delete,
      //                                               color: Color.fromARGB(
      //                                                   255, 255, 158, 0),
      //                                             ))
      //                                       ]),
      //                                 ]))),
      //                   ));
      //             });
      //       }
      //       return Center(child: CircularProgressIndicator());
      //     }
      //     ),
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            //   Map<String, dynamic> map = snapshots.data!.docs[index]
            //       .data() as Map<String, dynamic>;
            return SingleChildScrollView(
              child: Column(children: [
                Container(
                  margin: EdgeInsets.only(left: 16, right: 16, top: 16),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.white, width: 3),
                      borderRadius: BorderRadius.all(
                        Radius.circular(16),
                      )),
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(
                            right: 8, left: 8, top: 8, bottom: 8),
                        width: 110,
                        height: 115,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.white, width: 3),
                            borderRadius: BorderRadius.circular(30),
                            image: DecorationImage(
                                image: AssetImage("assets/images/equality.png"),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 6,
                              ),
                              Container(
                                padding: EdgeInsets.only(right: 8, top: 4),
                                child: Text(
                                  "नावः सुनील शेट्टी",
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
                                padding: EdgeInsets.only(right: 8, top: 4),
                                child: Text(
                                  "लिंग: पुरूष",
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
                                padding: EdgeInsets.only(right: 8, top: 4),
                                child: Text(
                                  "वय: 30",
                                  maxLines: 2,
                                  softWrap: true,
                                  // style: CustomTextStyle
                                  //     .textFormFieldSemiBold
                                  //     .copyWith(fontSize: 20),
                                ),
                              ),
                              // SizedBox(
                              //   height: 6,
                              // ),
                              // Container(
                              //   child: Row(
                              //     mainAxisAlignment:
                              //     MainAxisAlignment
                              //         .spaceBetween,
                              //     children: <Widget>[
                              //       Text(
                              //         "₹ " +
                              //             "40000",
                              //         //   style: CustomTextStyle
                              //         //       .textFormFieldBlack
                              //         //       .copyWith(
                              //         // color: Colors.green),
                              //       ),
                              //     ],
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ]),
            );
          }),
      floatingActionButton: Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
        child: FloatingActionButton(
          backgroundColor: Colors.green,
          child: Icon(Icons.add),
          onPressed: () {
            showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                backgroundColor: Color.fromARGB(255, 248, 243, 247),
                title: Center(
                  child: Text(
                    "मजूराचे माहिती भरा",
                    style: TextStyle(
                        color: Colors.green, fontWeight: FontWeight.w500),
                  ),
                ),
                content: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      TextField(
                          controller: _doctorName,
                          cursorColor: Colors.green,
                          // focusNode: myFocusNode,
                          autofocus: false,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.green,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green),
                              borderRadius: BorderRadius.circular(7.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green),
                            ),
                            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                            hintText: "नाव",
                          )),
                      SizedBox(height: 20),
                      TextField(
                          controller: _doctorPost,
                          cursorColor: Colors.green,
                          autofocus: false,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            prefixIcon:
                                Icon(Icons.accessibility, color: Colors.green),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green),
                              borderRadius: BorderRadius.circular(7.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green),
                            ),
                            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                            hintText: "लिंग",
                          )),
                      SizedBox(height: 20),
                      TextField(
                          controller: _doctorSpeciality,
                          cursorColor: Colors.green,
                          autofocus: false,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.all_inclusive_sharp,
                                color: Colors.green),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green),
                              borderRadius: BorderRadius.circular(7.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green),
                            ),
                            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                            hintText: "वय",
                          )),
                    ],
                  ),
                ),
                actions: <Widget>[
                  FlatButton(
                    onPressed: () async {
                      Map<String, dynamic> doctorList = {
                        "doctorName": _doctorName.text,
                        "doctorPost": _doctorPost.text,
                        "doctorSpeciality": _doctorSpeciality.text,
                        "doctorEducation": _doctorEducation.text,
                      };
                      _firestoreDBDoctorList
                          .doc(_auth.currentUser!.uid)
                          .collection('doctorList')
                          .add(doctorList);

                      _doctorName.clear();
                      _doctorPost.clear();
                      _doctorSpeciality.clear();
                      _doctorEducation.clear();

                      Navigator.of(ctx).pop();
                    },
                    child: Text(
                      "पूर्ण",
                      style: TextStyle(
                          color: Colors.green, fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(width: size.width / 5),
                  FlatButton(
                    onPressed: () {
                      _doctorName.clear();
                      _doctorPost.clear();
                      _doctorSpeciality.clear();
                      _doctorEducation.clear();
                      Navigator.of(ctx).pop();
                    },
                    child: Text(
                      "रद्द करा",
                      style: TextStyle(
                          color: Colors.green, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

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
  final TextEditingController _count = TextEditingController();
  final TextEditingController _money = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference _firestoreDBDoctorList =
      FirebaseFirestore.instance.collection("User");
  final FirebaseFirestore firestoreDB = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    FocusNode myFocusNode = new FocusNode();
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 248, 243, 247),
        body: StreamBuilder<DocumentSnapshot>(
            stream: firestoreDB
                .collection("User")
                .doc(_auth.currentUser!.uid)
                .snapshots(),
            builder: (BuildContext context, snapshot) {
              Map<String, dynamic> map =
                  snapshot.data!.data() as Map<String, dynamic>;
              if (!snapshot.hasData) return CircularProgressIndicator();
              return ListView(physics: BouncingScrollPhysics(), children: [
                Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                    child: Column(
                      children: [
                        const SizedBox(height: 24),
                        CircleAvatar(
                            backgroundColor: Colors.green,
                            backgroundImage:
                                AssetImage("assets/images/equality.png"),
                            radius: 50),
                        const SizedBox(height: 10),
                        Text(
                          // 'गट नेता: ',
                          'गट नेता: ${map['Name']}',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          // 'एकूण: ',
                          (map.containsKey('count'))
                              ? 'एकूण: ${map['count']}'
                              : 'एकूण: 0',
                          style: TextStyle(
                            color: Color.fromARGB(255, 155, 155, 155),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                            (map.containsKey('count'))
                                ? "₹ " +
                                    "${snapshot.data!['money']}" +
                                    " प्रति दिवस"
                                : "₹ " + "0" + " प्रति दिवस",
                            style: TextStyle(
                              color: Color.fromARGB(255, 155, 155, 155),
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            )),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                        child: Container(
                          color: Colors.white,
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.call,
                                    color: Colors.black,
                                  ),
                                  Text(
                                    ' मोबाईल क्रमांक:',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Text(
                                '${map['MObile No']}',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 155, 155, 155),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    height: 1.4),
                              )
                            ],
                          ),
                        ),
                      ),
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    CupertinoIcons.building_2_fill,
                                    color: Colors.black,
                                  ),
                                  Text(
                                    ' स्थान:',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Text(
                                '${map['Address']}',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 155, 155, 155),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    height: 1.4),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // const SizedBox(height: 8),
                // Container(
                //   color: Colors.white,
                //   child: Column(
                //     children: [
                //       Padding(
                //         padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                //         child: Container(
                //           color: Colors.white,
                //           padding: EdgeInsets.symmetric(horizontal: 12),
                //           child: Column(
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             children: [
                //               Row(
                //                 children: [
                //                   Icon(
                //                     Icons.accessibility,
                //                     color: Colors.black,
                //                   ),
                //                   Text(
                //                     ' मजूरांची नावे:',
                //                     style: TextStyle(
                //                         color: Colors.black,
                //                         fontSize: 20,
                //                         fontWeight: FontWeight.bold),
                //                   ),
                //                 ],
                //               ),
                //               // SizedBox(
                //               //   height: 280,
                //               //   child: ListView.builder(
                //               //   itemCount: 20,
                //               //   itemBuilder: (BuildContext context, int index) {
                //               //     return Column(
                //               //       mainAxisAlignment: MainAxisAlignment.start,
                //               //       crossAxisAlignment: CrossAxisAlignment.start,
                //               //       children: [
                //               //         Text(
                //               //             '${index+1}. नावः सुनील शेट्टी',
                //               //             style: TextStyle(
                //               //                 color: Color.fromARGB(255, 155, 155, 155),
                //               //                 fontWeight: FontWeight.bold,
                //               //                 fontSize: 16,
                //               //                 height: 1.4),
                //               //           ),Text(
                //               //           "    लिंग: पुरूष",
                //               //             style: TextStyle(
                //               //                 color: Color.fromARGB(255, 155, 155, 155),
                //               //                 fontWeight: FontWeight.bold,
                //               //                 fontSize: 16,
                //               //                 height: 1.4),
                //               //           ),Text(
                //               //           "    वय: 30",
                //               //             style: TextStyle(
                //               //                 color: Color.fromARGB(255, 155, 155, 155),
                //               //                 fontWeight: FontWeight.bold,
                //               //                 fontSize: 16,
                //               //                 height: 1.4),
                //               //           ),
                //               //         Divider()
                //               //       ],
                //               //     );
                //               //   }),
                //               // )
                //             ],
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ]);
            }),
        // body: StreamBuilder<QuerySnapshot>(
        //     stream: _firestoreDBDoctorList
        //         .snapshots(),
        //     builder:
        //         (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshots) {
        //       if (snapshots.hasData) {
        //         return ListView.builder(
        //             itemCount: (snapshots.data! as QuerySnapshot).docs.length,
        //             itemBuilder: (BuildContext context, int index) {
        //               // Map<String, dynamic> map = snapshots.data!.docs(_auth.currentUser!.uid)
        //               //   .data() as Map<String, dynamic>;
        //
        //               return SingleChildScrollView(
        //                 child: Column(
        //                     children: [
        //                       Container(
        //                         margin: EdgeInsets.only(left: 16, right: 16, top: 16),
        //                         decoration: BoxDecoration(
        //                             color: Colors.white,
        //                             border: Border.all(color: Colors.white, width: 3),
        //                             borderRadius: BorderRadius.all(
        //                               Radius.circular(16),
        //                             )),
        //                         child: Row(
        //                           children: <Widget>[
        //                             Container(
        //                               margin: EdgeInsets.only(
        //                                   right: 8, left: 8, top: 8, bottom: 8),
        //                               width: 110,
        //                               height: 115,
        //                               decoration: BoxDecoration(
        //                                   color: Colors.white,
        //                                   border: Border.all(
        //                                       color: Colors.white, width: 3),
        //                                   borderRadius: BorderRadius.circular(30),
        //                                   image: DecorationImage(
        //                                       image: AssetImage("assets/images/equality.png"), fit: BoxFit.contain)
        //                               ),
        //                             ),
        //                             SizedBox(
        //                               width: 10,
        //                             ),
        //                             Expanded(
        //                               child: Container(
        //                                 padding: const EdgeInsets.all(8.0),
        //                                 child: Column(
        //                                   mainAxisSize: MainAxisSize.max,
        //                                   crossAxisAlignment:
        //                                   CrossAxisAlignment.start,
        //                                   children: <Widget>[
        //                                     SizedBox(
        //                                       height: 6,
        //                                     ),
        //                                     Container(
        //                                       padding: EdgeInsets.only(
        //                                           right: 8, top: 4),
        //                                       child: Text(
        //                                         "नाव: ",
        //                                         // "नाव: "+ map['name'],
        //                                         maxLines: 2,
        //                                         softWrap: true,
        //                                         // style: CustomTextStyle
        //                                         //     .textFormFieldSemiBold
        //                                         //     .copyWith(fontSize: 20),
        //                                       ),
        //                                     ),
        //                                     SizedBox(
        //                                       height: 6,
        //                                     ),
        //                                     Container(
        //                                       padding: EdgeInsets.only(
        //                                           right: 8, top: 4),
        //                                       child: Text(
        //                                         "वय: ",
        //                                         // "वय: "+map['gender'],
        //                                         maxLines: 2,
        //                                         softWrap: true,
        //                                         // style: CustomTextStyle
        //                                         //     .textFormFieldSemiBold
        //                                         //     .copyWith(fontSize: 20),
        //                                       ),
        //                                     ),SizedBox(
        //                                       height: 6,
        //                                     ),
        //                                     Container(
        //                                       padding: EdgeInsets.only(
        //                                           right: 8, top: 4),
        //                                       child: Text(
        //                                         "लिंग:",
        //                                         // "लिंग: "+map['age'],
        //                                         maxLines: 2,
        //                                         softWrap: true,
        //                                         // style: CustomTextStyle
        //                                         //     .textFormFieldSemiBold
        //                                         //     .copyWith(fontSize: 20),
        //                                       ),
        //                                     ),
        //
        //                                   ],
        //                                 ),
        //                               ),)
        //                           ],
        //                         ),
        //                       )
        //                     ]
        //                 ),);
        //             });
        //       }
        //       return Center(child: CircularProgressIndicator());
        //     }
        // ),
        // body: ,
        // body: Column(
        //     children: [
        //       Container(
        //         margin: EdgeInsets.only(left: 16, right: 16, top: 16),
        //         decoration: BoxDecoration(
        //             color: Colors.white,
        //             border: Border.all(color: Colors.white, width: 3),
        //             borderRadius: BorderRadius.all(
        //               Radius.circular(16),
        //             )),
        //         child: Row(
        //           children: <Widget>[
        //             Container(
        //               margin: EdgeInsets.only(
        //                   right: 8, left: 8, top: 8, bottom: 8),
        //               width: 110,
        //               height: 115,
        //               decoration: BoxDecoration(
        //                   color: Colors.white,
        //                   border: Border.all(
        //                       color: Colors.white, width: 3),
        //                   borderRadius: BorderRadius.circular(30),
        //                   image: DecorationImage(
        //                       image: AssetImage("assets/images/equality.png"), fit: BoxFit.contain)
        //               ),
        //             ),
        //             SizedBox(
        //               width: 10,
        //             ),
        //             Expanded(
        //               child: Container(
        //                 padding: const EdgeInsets.all(8.0),
        //                 child: Column(
        //                   mainAxisSize: MainAxisSize.max,
        //                   crossAxisAlignment:
        //                   CrossAxisAlignment.start,
        //                   children: <Widget>[
        //                     SizedBox(
        //                       height: 6,
        //                     ),
        //                     Container(
        //                       padding: EdgeInsets.only(
        //                           right: 8, top: 4),
        //                       child: Text(
        //                         "गट नेता: ",
        //                         // "नाव: "+ map['name'],
        //                         maxLines: 2,
        //                         softWrap: true,
        //                         // style: CustomTextStyle
        //                         //     .textFormFieldSemiBold
        //                         //     .copyWith(fontSize: 20),
        //                       ),
        //                     ),
        //                     SizedBox(
        //                       height: 6,
        //                     ),
        //                     Container(
        //                       padding: EdgeInsets.only(
        //                           right: 8, top: 4),
        //                       child: Text(
        //                         "स्थान: ",
        //                         // "वय: "+map['gender'],
        //                         maxLines: 2,
        //                         softWrap: true,
        //                         // style: CustomTextStyle
        //                         //     .textFormFieldSemiBold
        //                         //     .copyWith(fontSize: 20),
        //                       ),
        //                     ),SizedBox(
        //                       height: 6,
        //                     ),
        //                     Container(
        //                       padding: EdgeInsets.only(
        //                           right: 8, top: 4),
        //                       child: Text(
        //                         "एकूण: 20",
        //                         // "लिंग: "+map['age'],
        //                         maxLines: 2,
        //                         softWrap: true,
        //                         // style: CustomTextStyle
        //                         //     .textFormFieldSemiBold
        //                         //     .copyWith(fontSize: 20),
        //                       ),
        //                     ),
        //                     SizedBox(
        //                       height: 6,
        //                     ),
        //                     Container(
        //                       child: Row(
        //                         mainAxisAlignment:
        //                         MainAxisAlignment
        //                             .spaceBetween,
        //                         children: <Widget>[
        //                           Text(
        //                             "₹ " +
        //                                 "500" + " प्रति दिवस",
        //                             //   style: CustomTextStyle
        //                             //       .textFormFieldBlack
        //                             //       .copyWith(
        //                             // color: Colors.green),
        //                           ),
        //                         ],
        //                       ),
        //                     ),
        //                   ],
        //                 ),
        //               ),)
        //           ],
        //         ),
        //       )
        //     ]
        // ),
        floatingActionButton: StreamBuilder<DocumentSnapshot>(
            stream: firestoreDB
                .collection("User")
                .doc(_auth.currentUser!.uid)
                .snapshots(),
            builder: (context, snapshot) {
              Map<String, dynamic> map =
                  snapshot.data!.data() as Map<String, dynamic>;
              if (!snapshot.hasData) return CircularProgressIndicator();
              return Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
                child: FloatingActionButton(
                  backgroundColor: Colors.green,
                  child: Icon(Icons.edit),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        backgroundColor: Color.fromARGB(255, 248, 243, 247),
                        title: Center(
                          child: Text(
                            "मजूरांची माहिती भरा",
                            style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        content: SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(height: 10),
                              TextField(
                                  controller: _count,
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
                                      borderSide:
                                          BorderSide(color: Colors.green),
                                      borderRadius: BorderRadius.circular(7.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.green),
                                    ),
                                    contentPadding:
                                        EdgeInsets.fromLTRB(20, 15, 20, 15),
                                    hintText: "एकूण मजूर",
                                  )),
                              SizedBox(height: 20),
                              TextField(
                                  controller: _money,
                                  cursorColor: Colors.green,
                                  autofocus: false,
                                  keyboardType: TextInputType.text,
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.accessibility,
                                        color: Colors.green),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.green),
                                      borderRadius: BorderRadius.circular(7.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.green),
                                    ),
                                    contentPadding:
                                        EdgeInsets.fromLTRB(20, 15, 20, 15),
                                    hintText: "मजूरी प्रति दिवस",
                                  )),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          FlatButton(
                            onPressed: () async {
                              Map<String, dynamic> list = {
                                "Name": _auth.currentUser!.displayName,
                                "uid": _auth.currentUser!.uid,
                                "email": _auth.currentUser!.email,
                                "MObile No": map['MObile No'].toString(),
                                "Address": map['Address'].toString(),
                                "Image": map['Image'].toString(),
                                "password": map['password'].toString(),
                                "count": _count.text,
                                "money": _money.text
                              };
                              // Map<String, dynamic> doctorList = {
                              //   "labourList": [_name.text],
                              // };
                              _firestoreDBDoctorList
                                  .doc(_auth.currentUser!.uid)
                                  .set(list);
                              // _firestoreDBDoctorList1
                              //     .doc(_auth.currentUser!.uid).set(doctorList);

                              _count.clear();
                              _money.clear();

                              Navigator.of(ctx).pop();
                            },
                            child: Text(
                              "पूर्ण",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          SizedBox(width: size.width / 5),
                          FlatButton(
                            onPressed: () {
                              _count.clear();
                              _money.clear();
                              Navigator.of(ctx).pop();
                            },
                            child: Text(
                              "रद्द करा",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            }));
  }
}

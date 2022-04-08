import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

import '../chat/chatroom.dart';

class FarmerDetail extends StatefulWidget {
  const FarmerDetail({Key? key}) : super(key: key);

  @override
  State<FarmerDetail> createState() => _FarmerDetailState();
}

class _FarmerDetailState extends State<FarmerDetail> {
  // late final Map<String, dynamic> userMap;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestoreDBUserProf = FirebaseFirestore.instance;
  // final Storage storage = Storage();

  Map<String, dynamic>? userMap;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  bool isLoading = false;

  // void onClick() async {
  //   FirebaseFirestore _firestore = FirebaseFirestore.instance;
  //
  //   setState(() {
  //     isLoading = true;
  //   });
  //
  //   await _firestore
  //       .collection("users")
  //       .where("email", isEqualTo: hospitalEmail)
  //       .get()
  //       .then((value) {
  //     setState(() {
  //       userMap = value.docs[0].data();
  //       isLoading = false;
  //     });
  //     print(userMap);
  //     // print(hospitalEmail);
  //   });
  // }

  String chatRoomId(String user1, String user2) {
    if (user1[0].toLowerCase().codeUnits[0] >
        user2.toLowerCase().codeUnits[0]) {
      return "$user1$user2";
    } else {
      return "$user2$user1";
    }
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 248, 243, 247),
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 30,
        title: Center(
          child: Text("मजूर"),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
      ),
      body: ListView(physics: BouncingScrollPhysics(), children: [
        Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
            child: Column(
              children: [
                const SizedBox(height: 24),
                CircleAvatar(
                    backgroundColor: Colors.green,
                    backgroundImage: AssetImage("assets/images/equality.png"),
                    radius: 50),
                const SizedBox(height: 10),
                Text(
                  'गट नेता: राहुल चहर',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'एकूण: 20',
                  style: TextStyle(
                    color: Color.fromARGB(255, 155, 155, 155),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),),
                      Text(
                        "₹ " +
                            "40000"+" प्रति दिवस",
                          style: TextStyle(
                            color: Color.fromARGB(255, 155, 155, 155),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          )
                      ),

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
                        '9876543210',
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
              'वर्धा',
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
        ),const SizedBox(height: 8),
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
                            Icons.accessibility,
                            color: Colors.black,
                          ),
                          Text(
                            ' मजूरांची नावे:',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 280,
                        child: ListView.builder(
                        itemCount: 20,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  '${index+1}. नावः सुनील शेट्टी',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 155, 155, 155),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      height: 1.4),
                                ),Text(
                                "    लिंग: पुरूष",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 155, 155, 155),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      height: 1.4),
                                ),Text(
                                "    वय: 30",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 155, 155, 155),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      height: 1.4),
                                ),
                              Divider()
                            ],
                          );
                        }),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
      floatingActionButton:
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Padding(
          padding: EdgeInsets.fromLTRB(32, 0, 0, 0),
          child: Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              backgroundColor: Colors.green,
              child: Icon(
                Icons.call,
                color: Colors.white,
              ),
              onPressed: () async {
                await FlutterPhoneDirectCaller.callNumber("1234567890");
              },
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: FloatingActionButton(
            backgroundColor: Colors.green,
            child: Icon(
              Icons.messenger_rounded,
              color: Colors.white,
            ),
            onPressed: () {
              // onClick();
              if (userMap != null) {
                String roomId = chatRoomId(
                    _auth.currentUser!.displayName!, userMap!['name']);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) =>
                            ChatRoom(chatRoomId: roomId, userMap: userMap!)));
              }
            },
          ),
        ),
      ]),
    );
  }
}

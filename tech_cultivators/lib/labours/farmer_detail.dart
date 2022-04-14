// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class FarmerDetail extends StatefulWidget {
  String? name;
  String? count;
  String? money;
  String? mobNo;
  String? address;
  FarmerDetail({this.name, this.count, this.money, this.mobNo, this.address});

  @override
  State<FarmerDetail> createState() => _FarmerDetailState();
}

class _FarmerDetailState extends State<FarmerDetail> {
  Map<String, dynamic>? userMap;
  bool isLoading = false;
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
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
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
                    'गट नेता: ${widget.name}',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'एकूण: ${widget.count}',
                    style: TextStyle(
                      color: Color.fromARGB(255, 155, 155, 155),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "₹ " + "${widget.money}" + " प्रति दिवस",
                    style: TextStyle(
                      color: Color.fromARGB(255, 155, 155, 155),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
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
                          '${widget.mobNo}',
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
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          '${widget.address}',
                          style: TextStyle(
                            color: Color.fromARGB(255, 155, 155, 155),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            height: 1.4,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: Icon(
          Icons.call,
          color: Colors.white,
        ),
        onPressed: () async {
          await FlutterPhoneDirectCaller.callNumber(
            "${widget.mobNo}",
          );
        },
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CropDetail extends StatefulWidget {
  final String? name;
  final String? yt;
  final String? id;
  final String? img;
  CropDetail(this.name,this.yt, this.id, this.img);

  @override
  State<CropDetail> createState() => _CropDetailState();
}

class _CropDetailState extends State<CropDetail> {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var firestoreDB = FirebaseFirestore.instance.collection("crop_suggetions").doc(widget!.id!).collection("procedure").orderBy("order").snapshots();
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 30,
        title: Center(
          child: Text("कृषी सल्ला"),
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.play_circle_outline,
                color: Colors.white,
              ),
            onPressed: _launchURL
          )
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
      ),
      body: ListView(
          children: <Widget>[
            Padding(
              padding:  EdgeInsets.fromLTRB(8,16,8,0),
              child: Center(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 10, left: 10, top: 10, bottom: 10),
                      width: MediaQuery.of(context).size.width / 4,
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          // border: Border.all(color: Colors.green, width: 3),
                          // borderRadius: BorderRadius.circular(30),
                          image:
                          DecorationImage(image: AssetImage(widget!.img!), fit: BoxFit.contain)),
                    ),
                    Text(
                      widget!.name!,
                      style: TextStyle(
                          color: Colors.green, fontWeight: FontWeight.w600, fontSize: 17),
                    ),
                  ],
                )
              ),
            ),
      Padding(
      padding:EdgeInsets.fromLTRB(10,10,10,0),
      child: SizedBox(
        height: 500,
        // width: 155,
        child:StreamBuilder(
          stream: firestoreDB,
          builder: (context, snapshot) {
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: (snapshot.data as QuerySnapshot).docs.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                      elevation: 2,
                      child:Container(
                        height: 300,
                        width: 330,
                        child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                      SizedBox(height: 13,),
                      Column(
                      mainAxisAlignment: MainAxisAlignment
                          .center,
                      children: [
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Text(
                              "-------- ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),Center(
                              child: Text(
                              "वर्तमान कार्य",
                                style: TextStyle(
                                  color: Colors.green,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),Center(
                              child: Text(
                              " --------",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 4,),
                      Center(
                        child: Text(
                        (snapshot.data as QuerySnapshot).docs[index]['name'],
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      ),
                        SizedBox(height: 4,),
                      Center(
                        child: Text(
                        "0-0",
                      ),
                      ),
                        SizedBox(height: 4,),
                      Center(
                        child: Text(
                        "(पासून: 06-04-2022 पर्यंत 06-04-2022)",
                      ),
                      ),  SizedBox(height: 20,),
                      SizedBox(
                        height: 308,
                        child: ListView(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0,20,0),
                              child: Text(
                                (snapshot!.data as QuerySnapshot).docs[index]['details'],
                              ),
                            ),
                          ],
                        ),
                      ),
                      ],
                      ),
                      ],
                      ),
                      ));
                }
            );
          }
        ),
      ),
    ),
    ]
      )
    );
  }
  void _launchURL() async {
    if (!await launch("https://www.youtube.com/watch?v="+widget!.yt!)) throw 'Could not launch';
  }

}

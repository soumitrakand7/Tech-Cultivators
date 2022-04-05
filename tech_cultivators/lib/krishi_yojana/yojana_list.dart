import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kisan/krishi_yojana/pdf_view.dart';

class YojanaList extends StatefulWidget {
  const YojanaList({ Key? key }) : super(key: key);

  @override
  State<YojanaList> createState() => _YojanaListState();
}

class _YojanaListState extends State<YojanaList> {
  var firestoreDB = FirebaseFirestore.instance.collection("yojana").snapshots();
  @override
  Widget build(BuildContext context) {
     final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 30,
        title: Center(
          child: Text("कृषी योजना"),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
      ),
      body: StreamBuilder(
          stream: firestoreDB,
          builder: (context, snapshot) {
            if (!snapshot.hasData)
              return Center(child: CircularProgressIndicator());
              return Container(
                child: ListView.builder(
                  itemCount: (snapshot.data! as QuerySnapshot).docs.length,
                  itemBuilder: (BuildContext context, int index){
                    return Card(
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: Colors.white,
                                ),
                                color: Colors.white,
                              ),
                              padding: EdgeInsets.all(10),
                              height: size.height / 6.8,
                              width: double.infinity,
                              child: (snapshot.hasData) ?
                              InkWell(
                                onTap: (){
                                   try {
                                   Navigator.push(
                                       context,
                                      MaterialPageRoute(
                                       builder: (context) =>
                                        PdfView(
                                          (snapshot.data! as QuerySnapshot).docs[index]['url']
                                           )
                                            ));                  
                                         } catch (e) {
                                           print(e);
                                  }
                                },
                                child: Text(
                                  (snapshot.data! as QuerySnapshot).docs[index]['name']
                                ),
                              ) : null
                            )
                    );
                  }
                  ),
    );
          }
    ),
    );
  }
}
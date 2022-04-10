import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kisan/krishi_yojana/pdf_view.dart';

class YojanaList extends StatefulWidget {
  const YojanaList({Key? key}) : super(key: key);

  @override
  State<YojanaList> createState() => _YojanaListState();
}

class _YojanaListState extends State<YojanaList> {
  var firestoreDB = FirebaseFirestore.instance.collection("yojana").snapshots();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 30,
        title: Center(
          child: Text("Agricultural Plans"),
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
                  itemBuilder: (BuildContext context, int index) {
                    return Stack(
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            try {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PdfView(
                                            (snapshot.data! as QuerySnapshot)
                                                .docs[index]['url'],
                                            Name: (snapshot.data!
                                                    as QuerySnapshot)
                                                .docs[index]['name'],
                                          )));
                            } catch (e) {
                              print(e);
                            }
                          },
                          child: Container(
                            margin:
                                EdgeInsets.only(left: 16, right: 16, top: 16),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border:
                                    Border.all(color: Colors.white, width: 3),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(16),
                                )),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(
                                      right: 8, left: 8, top: 8, bottom: 8),
                                  width: 60,
                                  height: 100,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          color: Colors.white, width: 3),
                                      borderRadius: BorderRadius.circular(30),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/pdf.png"),
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
                                          height: 8,
                                        ),
                                        Container(
                                          padding:
                                              EdgeInsets.only(right: 8, top: 4),
                                          child: Text(
                                            (snapshot.data! as QuerySnapshot)
                                                .docs[index]['name'],
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                            maxLines: 2,
                                            softWrap: true,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                      ],
                                    ),
                                  ),
                                  flex: 100,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
            );
          }),
    );
  }
}
// Card(
//                             elevation: 3,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(8.0),
//                             ),
//                             child: Container(
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(8),
//                                 border: Border.all(
//                                   color: Colors.white,
//                                 ),
//                                 color: Colors.white,
//                               ),
//                               padding: EdgeInsets.all(10),
//                               height: size.height / 6.8,
//                               width: double.infinity,
//                               child: (snapshot.hasData) ?
//                               InkWell(
//                                 onTap: (){
//                                    try {
//                                    Navigator.push(
//                                        context,
//                                       MaterialPageRoute(
//                                        builder: (context) =>
//                                         PdfView(
//                                           (snapshot.data! as QuerySnapshot).docs[index]['url']
//                                            )
//                                             ));                  
//                                          } catch (e) {
//                                            print(e);
//                                   }
//                                 },
//                                 child: Text(
//                                   (snapshot.data! as QuerySnapshot).docs[index]['name']
//                                 ),
//                               ) : null
//                             )
//                     );
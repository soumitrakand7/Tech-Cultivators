import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kisan/krishi_salla/crop_detail.dart';
import 'package:kisan/krishi_yojana/pdf_view.dart';

class CropList extends StatefulWidget {
  const CropList({Key? key}) : super(key: key);

  @override
  State<CropList> createState() => _CropListState();
}

class _CropListState extends State<CropList> {
  var firestoreDB =
      FirebaseFirestore.instance.collection("crop_suggetions").snapshots();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    List img = [
      "assets/images/wheat.png",
      "assets/images/rice.png",
      "assets/images/corn.png",
      "assets/images/onion.png",
      "assets/images/bajara.png",
      "assets/images/jower.png",
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 30,
        title: Center(
          child: Text("Agricultural advice"),
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
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://www.antonioflorio.com/site/assets/files/1025/consulenza-fitoiatrica-1.585x494.jpg"),
                          fit: BoxFit.fill),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 300,
                    child: GridView.count(
                      padding: EdgeInsets.all(10),
                      // Create a grid with 2 columns. If you change the scrollDirection to
                      // horizontal, this produces 2 rows.
                      crossAxisCount: 3,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 10,
                      // Generate 100 widgets that display their index in the List.
                      children: List.generate(
                          (snapshot.data! as QuerySnapshot).docs.length,
                          (index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CropDetail(
                                        (snapshot.data! as QuerySnapshot)
                                            .docs[index]['name'],
                                        (snapshot.data! as QuerySnapshot)
                                            .docs[index]['yt'],
                                        (snapshot.data! as QuerySnapshot)
                                            .docs[index]
                                            .id,
                                        img[index])));
                          },
                          child: Card(
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: column(
                                img[index],
                                (snapshot.data! as QuerySnapshot).docs[index]
                                    ['name'],
                                context),
                            // child: Container(
                            //     decoration: BoxDecoration(
                            //       borderRadius: BorderRadius.circular(8),
                            //       border: Border.all(
                            //         color: Colors.white,
                            //       ),
                            //       color: Colors.white,
                            //     ),
                            //     padding: EdgeInsets.all(10),
                            //     height: size.height / 6.8,
                            //     width: double.infinity,
                            //     child: (snapshot.hasData) ?
                            //     InkWell(
                            //       onTap: (){
                            //         try {
                            //           Navigator.push(
                            //               context,
                            //               MaterialPageRoute(
                            //                   builder: (context) =>
                            //                       PdfView(
                            //                           (snapshot.data! as QuerySnapshot).docs[index]['url']
                            //                       )
                            //               ));
                            //         } catch (e) {
                            //           print(e);
                            //         }
                            //       },
                            //       child: Text(
                            //           (snapshot.data! as QuerySnapshot).docs[index]['name']
                            //       ),
                            //     ) : null
                            // )
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }

  Widget column(String image, String text, BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(right: 10, left: 10, top: 10, bottom: 10),
          width: MediaQuery.of(context).size.width / 4,
          height: 60,
          decoration: BoxDecoration(
              color: Colors.transparent,
              // border: Border.all(color: Colors.green, width: 3),
              // borderRadius: BorderRadius.circular(30),
              image: DecorationImage(
                  image: AssetImage(image), fit: BoxFit.contain)),
        ),
        Text(
          text,
          style: TextStyle(
              color: Colors.green, fontWeight: FontWeight.w600, fontSize: 17),
        ),
      ],
    );
  }
}

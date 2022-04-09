import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:kisan/Buy/Products_Shop.dart';
import 'package:kisan/Buy/products_detail.dart';
import '../Theme/Style.dart';

class productpage extends StatelessWidget {
  String Title;
  String Shop;
  productpage({Key? key, required this.Title, required this.Shop})
      : super(key: key);
  FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: db.collection("Shpos").doc(Shop).collection(Title).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          final Value = (snapshot.data! as QuerySnapshot).docs;
          return FadeInDown(
            delay: Duration(milliseconds: 800),
            child: Value.length > 0
                ? ListView.builder(
                    itemCount: Value.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Stack(
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductDetailPage(
                                    Cost: Value[index]["Cost"],
                                    productName: Value[index]["Product Name"],
                                    ShopName: Shop,
                                  ),
                                ),
                              );
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
                                    width: 110,
                                    height: 115,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          color: Colors.white, width: 3),
                                      borderRadius: BorderRadius.circular(30),
                                      // image: DecorationImage(
                                      //     image: NetworkImage(
                                      //         Value[index]["ProductImage"]),
                                      //     fit: BoxFit.fill)
                                    ),
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
                                              Value[index]["Product Name"],
                                              maxLines: 2,
                                              softWrap: true,
                                              style: CustomTextStyle
                                                  .textFormFieldSemiBold
                                                  .copyWith(fontSize: 20),
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
                                                  "₹" +
                                                      "${Value[index]["Cost"]}",
                                                  style: CustomTextStyle
                                                      .textFormFieldBlack
                                                      .copyWith(
                                                          color: Colors.green),
                                                ),
                                              ],
                                            ),
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
                    })
                : Center(
                    child: Text(
                      "Products Not Available",
                      style: TextStyle(fontSize: 25, color: Colors.green),
                    ),
                  ),
          );
        },
      ),
    );
  }
}

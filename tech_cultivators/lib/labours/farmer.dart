import 'package:flutter/material.dart';

import 'farmer_detail.dart';

class Farmers extends StatefulWidget {
  const Farmers({Key? key}) : super(key: key);

  @override
  State<Farmers> createState() => _FarmersState();
}

class _FarmersState extends State<Farmers> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
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
      body: ListView.builder(
        itemCount: 10,
          itemBuilder: (BuildContext context, int index){
            return InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=> FarmerDetail())
                );
              },
              child: Column(
                  children: [
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
                                border: Border.all(
                                    color: Colors.white, width: 3),
                                borderRadius: BorderRadius.circular(30),
                                image: DecorationImage(
                                    image: AssetImage("assets/images/equality.png"), fit: BoxFit.contain)
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
                                      "आयडी: AIP3R5D6G",
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
                                      "स्थान: वर्धा",
                                      maxLines: 2,
                                      softWrap: true,
                                      // style: CustomTextStyle
                                      //     .textFormFieldSemiBold
                                      //     .copyWith(fontSize: 20),
                                    ),
                                  ),SizedBox(
                                    height: 6,
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                        right: 8, top: 4),
                                    child: Text(
                                      "एकूण: 20",
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
                                          "₹ " +
                                              "40000",
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
                            ),)
                        ],
                      ),
                    )
                  ]
              ),
            );
          }
      )
    );
  }
}

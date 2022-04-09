import 'package:flutter/material.dart';
import 'package:kisan/Buy/Products.dart';
import 'package:kisan/Buy/Products_Shop.dart';

class Buy_home extends StatefulWidget {
  const Buy_home({Key? key}) : super(key: key);

  @override
  State<Buy_home> createState() => _Buy_homeState();
}

class _Buy_homeState extends State<Buy_home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 8, left: 8, top: 8, bottom: 8),
                  width: MediaQuery.of(context).size.width,
                  height: 270,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 192, 235, 215),
                    border: Border.all(color: Color(0xFFCDDAE8), width: 3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "View list of agricultural products ",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 22),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                " See list of quality seeds \n fertilizers , pesticides and \n equipment for advanced\n farming ",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 18),
                              ),
                              column("assets/images/harvest.png", "", context),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.only(right: 8, left: 8, top: 8, bottom: 8),
                  width: MediaQuery.of(context).size.width,
                  height: 370,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.white, width: 3),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "What do you want to buy?",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Shops(Category: "Seeds")),
                                );
                              },
                              child: column(
                                  "assets/images/seed.png", "Seeds", context)),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Shops(
                                          Category: "Fertilizers",
                                        )),
                              );
                            },
                            child: column("assets/images/fertilizer.png",
                                "Fertilizers", context),
                          ),
                          InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Shops(
                                            Category: "Tools",
                                          )),
                                );
                              },
                              child: column("assets/images/farming.png",
                                  "Tools", context)),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Shops(
                                            Category: "Crop Protection",
                                          )),
                                );
                              },
                              child: column("assets/images/Crop_protection.jpg",
                                  "Crop Protection", context),
                            ),
                            column("assets/images/plant.png", "Plant", context),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // Container(
                //   margin: EdgeInsets.only(right: 8, left: 8, top: 8, bottom: 8),
                //   width: MediaQuery.of(context).size.width,
                //   height: 300,
                //   decoration: BoxDecoration(
                //     color: Colors.white,
                //     border: Border.all(color: Colors.white, width: 3),
                //     borderRadius: BorderRadius.circular(30),
                //   ),
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Text(
                //         "Which crop do you want to buy ?",
                //         style: TextStyle(
                //             color: Colors.black,
                //             fontWeight: FontWeight.w600,
                //             fontSize: 17),
                //       ),
                //       SizedBox(
                //         height: 10,
                //       ),
                //       Row(
                //         children: [
                //           column("assets/images/wheat.png", "Wheat", context),
                //           column("assets/images/corn.png", "Maize", context),
                //           column("assets/images/sugar-cane.png", "Sugarcane",
                //               context),
                //         ],
                //       ),
                //       SizedBox(
                //         height: 10,
                //       ),
                //       SingleChildScrollView(
                //         scrollDirection: Axis.horizontal,
                //         child: Row(
                //           children: [
                //             // column("assets/images/seed.png", "Seeds", context),
                //             column(
                //                 "assets/images/tomato.png", "Tomato", context),
                //             column("assets/images/green-onion.png", "Onion",
                //                 context),
                //             column(
                //                 "assets/images/potato.png", "Potato", context),
                //           ],
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget column(String image, String text, BuildContext context) {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(right: 10, left: 10, top: 10, bottom: 10),
        width: MediaQuery.of(context).size.width / 4.4,
        height: 110,
        decoration: BoxDecoration(
            color: Colors.transparent,
            image:
                DecorationImage(image: AssetImage(image), fit: BoxFit.contain)),
      ),
      Text(
        text,
        style: TextStyle(
            color: Colors.green, fontWeight: FontWeight.w600, fontSize: 17),
      ),
    ],
  );
}

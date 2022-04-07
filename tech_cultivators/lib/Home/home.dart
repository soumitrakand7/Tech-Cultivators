import 'package:flutter/material.dart';
import 'package:kisan/Home/Slider_Home.dart';
import 'package:kisan/labours/options.dart';

import '../krishi_salla/crop_list.dart';
import '../krishi_yojana/yojana_list.dart';


class Home extends StatelessWidget {
  Home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 30,
        actions: [
          IconButton(
              icon: Icon(
                Icons.play_circle_outline,
                color: Colors.white,
              ),
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context)=> Options()
                        )
                    );
              }
          )
        ],
        title: Center(
          child: Text("Tech Cultivators"),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
      ),
      drawer: Container(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 5,
              ),
              slider(),
              SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  column("assets/images/weather.png", "हवामान"),
                  column("assets/images/news-paper.png", " कृषी वार्ता"),
                  InkWell(
                    onTap: (){
                       Navigator.push(
                                       context,
                                      MaterialPageRoute(
                                       builder: (context) =>
                                        CropList()    
                                        )
                                            );
                    
                    },
                    child: column("assets/images/Krushi_Salla.jpg", "क्रुशी सल्ला"))
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  column("assets/images/investing.png", "बाजारभाव"),
                  InkWell(
                    onTap: (){
                      Navigator.push(
                                       context,
                                      MaterialPageRoute(
                                       builder: (context) =>
                                        YojanaList()    )
                                            );
                    },
                    child: column("assets/images/handshake.png", " कृषी योजना")),
                  column("assets/images/virus.png", "वनस्पती रोग")
                ],
              ),
              SizedBox(
                height: 50,
              ),
              MaterialButton(
                minWidth: double.infinity,
                height: 60,
                onPressed: () {},
                // onPressed: () {
                //   Navigator.pushNamed(context, "/Login_page_User");
                // },
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(50)),
                child: Text(
                  "Buy",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              MaterialButton(
                minWidth: double.infinity,
                height: 60,
                onPressed: () {},
                color: Colors.green,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                child: Text(
                  "Sell",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget column(String image, String text) {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(right: 10, left: 10, top: 10, bottom: 10),
        width: 80,
        height: 80,
        decoration: BoxDecoration(
            color: Colors.white,
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

import 'package:flutter/material.dart';
import 'package:kisan/Disease_detection/detection.dart';
import 'package:kisan/Home/Drawer.dart';
import 'package:kisan/Home/Slider_Home.dart';
import 'package:kisan/Weather/Weather.dart';
import '../krishi_yojana/yojana_list.dart';

class Home extends StatelessWidget {
  const Home({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 30,
        title: const Center(
          child: Text("Tech Cultivators"),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
      ),
      drawer: MainDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 5,
              ),
              slider(),
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Weather()));
                      },
                      child: column(
                          "assets/images/weather.png", "हवामान", context)),
                  column(
                      "assets/images/news-paper.png", " कृषी वार्ता", context),
                  column(
                      "assets/images/Krushi_Salla.jpg", "क्रुशी सल्ला", context)
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  column("assets/images/investing.png", "बाजारभाव", context),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const YojanaList()));
                      },
                      child: column("assets/images/handshake.png",
                          " कृषी योजना", context)),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Detection()));
                      },
                      child: column(
                          "assets/images/virus.png", "वनस्पती रोग", context))
                ],
              ),
              const SizedBox(
                height: 90,
              ),
              MaterialButton(
                minWidth: double.infinity,
                height: 60,
                onPressed: () {
                  Navigator.pushNamed(context, "/Buy_home");
                },
                shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(50)),
                child: const Text(
                  "Buy",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              MaterialButton(
                minWidth: double.infinity,
                height: 60,
                onPressed: () {
                  Navigator.pushNamed(context, "/Shop_Registartion");
                },
                color: Colors.green,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                child: const Text(
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

Widget column(String image, String text, BuildContext context) {
  return Column(
    children: [
      Container(
        margin: const EdgeInsets.only(right: 10, left: 10, top: 10, bottom: 10),
        width: MediaQuery.of(context).size.width / 4,
        height: 80,
        decoration: BoxDecoration(
            color: Colors.white,
            // border: Border.all(color: Colors.green, width: 3),
            // borderRadius: BorderRadius.circular(30),
            image:
                DecorationImage(image: AssetImage(image), fit: BoxFit.contain)),
      ),
      Text(
        text,
        style: const TextStyle(
            color: Colors.green, fontWeight: FontWeight.w600, fontSize: 17),
      ),
    ],
  );
}

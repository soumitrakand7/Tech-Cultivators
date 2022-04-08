import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart' as dom;
import 'package:url_launcher/url_launcher.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  List<String> titleList = [];
  List<String> postList = [];
  List<String> linkList = [];
  List<String> imageList = [];
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    final response =
        await http.get(Uri.parse('https://marathi.krishijagran.com/news/'));
    dom.Document document = parser.parse(response.body);
    final news = document.getElementsByClassName('news-info');

    titleList =
        news.map((e) => e.getElementsByTagName("h2")[0].innerHtml).toList();

    postList =
        news.map((e) => e.getElementsByTagName("p")[0].innerHtml).toList();

    linkList = news
        .map((e) => e.getElementsByTagName("a")[0].attributes['href'])
        .cast<String>()
        .toList();

    final images = document.getElementsByClassName('news-img');
    imageList = images
        .map((e) => e.getElementsByTagName("img")[0].attributes['data-src'])
        .cast<String>()
        .toList();

    setState(() {
      titleList;
      postList;
      linkList;
      imageList;

      for (int i = 0; i < news.length; i++) {
        linkList[i] = 'https://marathi.krishijagran.com' + linkList[i];
        postList[i] = postList[i].trim();
      }

      for (var elem in imageList) {
        print(elem);
      }
      print(imageList.length);
      print(titleList.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "News Page",
        ),
        backgroundColor: Colors.green,
      ),
      body: titleList.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemBuilder: ((context, index) =>
                  AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 375),
                    child: SlideAnimation(
                      child: FadeInAnimation(
                        child: GestureDetector(
                          onTap: () async {
                            dynamic url = linkList[index];
                            if (await canLaunch(url)) {
                              launch(url);
                            } else {
                              print('error');
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Card(
                              elevation: 3,
                              color: const Color.fromARGB(255, 232, 252, 234),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.65,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              16, 14, 16, 0),
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              titleList[index],
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                                fontSize: 15,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              16, 0, 16, 12),
                                          child: Text(
                                            postList[index],
                                            style: const TextStyle(
                                              color: Colors.blueGrey,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            imageList[index],
                                          ),
                                          fit: BoxFit.fill,
                                        )),
                                    margin: EdgeInsets.only(top: 10),
                                    width: MediaQuery.of(context).size.width *
                                        0.25,
                                    height: 110,
                                  )
                                ],
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )),
              itemCount: titleList.length,
            ),
    );
  }
}

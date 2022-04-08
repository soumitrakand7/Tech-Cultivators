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

    setState(() {
      titleList;
      postList;
      linkList;
      for (int i = 0; i < news.length; i++) {
        linkList[i] = 'https://marathi.krishijagran.com' + linkList[i];
        postList[i] = postList[i].trim();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "News Page",
        ),
      ),
      body: ListView.builder(
        itemBuilder: ((context, index) => AnimationConfiguration.staggeredList(
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
                        child: Container(
                          color: Colors.black87,
                          child: Column(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  titleList[index],
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                postList[index],
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )),
      ),
    );
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kisan/Buy/Products.dart';

class Shops extends StatefulWidget {
  String Category;
  Shops({Key? key, required this.Category}) : super(key: key);

  @override
  State<Shops> createState() => _ShopsState();
}

class _ShopsState extends State<Shops> with SingleTickerProviderStateMixin {
  late TabController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this, initialIndex: 0);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 30,
        title: Center(child: Text(widget.Category)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        bottom: TabBar(isScrollable: true, controller: _controller, tabs: [
          Tab(text: "Blossom Valley "),
          Tab(text: "Tanuja High tech"),
          Tab(text: "Evergreen"),
        ]),
      ),
      body: TabBarView(
        controller: _controller,
        children: <Widget>[
          productpage(Title: widget.Category, Shop: "Blossom Valley"),
          productpage(Title: widget.Category, Shop: "Tanuja High tech"),
          productpage(Title: widget.Category, Shop: "Evergreen"),
        ],
      ),
    );
  }
} 

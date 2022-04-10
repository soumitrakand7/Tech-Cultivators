import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kisan/Buy/Products.dart';
import 'package:kisan/labours/farmer.dart';
import 'package:kisan/labours/labours.dart';

class Options extends StatefulWidget {
  Options({
    Key? key,
  }) : super(key: key);

  @override
  State<Options> createState() => _OptionsState();
}

class _OptionsState extends State<Options> with SingleTickerProviderStateMixin {
  late TabController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this, initialIndex: 0);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 30,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        bottom: TabBar(
          isScrollable: true,
          controller: _controller,
          tabs: [
            Tab(
              text: "Labour",
            ),
            Tab(text: "Farmer "),
          ],
          indicatorColor: Colors.white,
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: <Widget>[Labours(), Farmers()],
      ),
    );
  }
}

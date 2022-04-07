import 'package:flutter/material.dart';

class Labours extends StatefulWidget {
  const Labours({Key? key}) : super(key: key);

  @override
  State<Labours> createState() => _LaboursState();
}

class _LaboursState extends State<Labours> {
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
      body: ListView(
        children: [
          Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Colors.white,
                  ),
                  color: Colors.white,
                ),
                padding: EdgeInsets.all(10),
                height: size.height / 6.8,
                width: double.infinity,
                child: Text(
                    "मजूर"
                ),
              )
          ),
          Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Colors.white,
                  ),
                  color: Colors.white,
                ),
                padding: EdgeInsets.all(10),
                height: size.height / 6.8,
                width: double.infinity,
                child: Text(
                    "शेतकरी"
                ),
              )
          )
        ],
      ),
    );
  }
}

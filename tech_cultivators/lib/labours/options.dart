import 'package:flutter/material.dart';
import 'package:kisan/labours/farmer.dart';
import 'package:kisan/labours/labours.dart';

class Options extends StatefulWidget {
  const Options({Key? key}) : super(key: key);

  @override
  State<Options> createState() => _OptionsState();
}

class _OptionsState extends State<Options> {
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
              child:
              InkWell(
                onTap: (){
                  try {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Labours()
                        ));
                  } catch (e) {
                    print(e);
                  }
                },
                child: Text(
                  "मजूर"
                ),
              )
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
              child:
              InkWell(
                onTap: (){
                  try {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Farmers()
                        ));
                  } catch (e) {
                    print(e);
                  }
                },
                child: Text(
                    "शेतकरी"
                ),
              )
          )
      )
        ],
      ),
    );
  }
}

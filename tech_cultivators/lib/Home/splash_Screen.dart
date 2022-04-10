import 'package:flutter/material.dart';
import 'package:kisan/Authentication/Login.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: (100)),
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            // Image(image: AssetImage("assets/images/agventurelogo.png")),
            Container(
              padding: EdgeInsets.only(bottom: 30),
              child: Lottie.network(
                'https://assets9.lottiefiles.com/packages/lf20_jfbnp4d2.json',
                controller: _controller,
                height: MediaQuery.of(context).size.height * 1,
                animate: true,
                onLoaded: (composition) {
                  _controller
                    ..duration = composition.duration
                    ..forward().whenComplete(() => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => login_page()),
                        ));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

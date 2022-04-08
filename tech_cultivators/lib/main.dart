import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kisan/Buy/Buy_home.dart';
import 'package:kisan/Home/home.dart';
import 'package:kisan/Login/LoginPage.dart';
import 'package:kisan/Login/intermediatePage.dart';
import 'package:kisan/News/news.dart';
import 'package:kisan/Sell/Add_Products.dart';
import 'package:kisan/Sell/Shop_registration.dart';

import 'Home/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const IntermediatePage(),
        "/Shop_Registartion": (context) => Shop_Registration(),
        "/Buy_home": (context) => const Buy_home(),
        "/Add_Product": (context) => const Add_Product()
      },
    );
  }
}

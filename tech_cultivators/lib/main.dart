import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kisan/Buy/Buy_home.dart';
import 'package:kisan/Home/home.dart';
import 'package:kisan/Sell/Add_Products.dart';
import 'package:kisan/Sell/Shop_registration.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        "/Shop_Registartion": (context) => Shop_Registration(),
        "/Buy_home": (context) => Buy_home(),
        "/Add_Product": (context) => Add_Product()
      },
    );
  }
}

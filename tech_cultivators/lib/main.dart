import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kisan/Authentication/Forgot_password.dart';
import 'package:kisan/Authentication/Login.dart';
import 'package:kisan/Authentication/Registration.dart';
import 'package:kisan/Buy/Buy_home.dart';
import 'package:kisan/Buy/Confirm_Product.dart';
import 'package:kisan/Buy/Update.dart';
import 'package:kisan/Drawer/MY_order.dart';
import 'package:kisan/Drawer/My_Account.dart';
import 'package:kisan/Home/home.dart';
import 'package:kisan/Home/splash_Screen.dart';
import 'package:kisan/Login/LoginPage.dart';
import 'package:kisan/Login/intermediatePage.dart';
import 'package:kisan/News/news.dart';
import 'package:kisan/Sell/Add_Products.dart';
import 'package:kisan/Sell/Shop_registration.dart';
import 'package:kisan/Sell/next_add_product.dart';

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
          textTheme: GoogleFonts.playfairDisplayTextTheme(
        Theme.of(context).textTheme,
      )),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        "/Adress": (context) => Address(),
        "/Confirm_Order": (context) => Place_Order(),
        "/Password": (context) => ResetP(),
        "/MyAccount": (context) => MyAccount(),
        "/Order": (context) => Order(),
        "/Home": (context) => Home(),
        "/register": (context) => registration_page(),
        "/Shop_Registartion": (context) => Shop_Registration(),
        "/Buy_home": (context) => const Buy_home(),
        "/Add_Product": (context) => const Add_Product()
      },
    );
  }
}

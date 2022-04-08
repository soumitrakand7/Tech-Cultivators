import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Home/home.dart';
import 'LoginPage.dart';

String? finalPhone = '';

class IntermediatePage extends StatefulWidget {
  const IntermediatePage({Key? key}) : super(key: key);

  @override
  State<IntermediatePage> createState() => _IntermediatePageState();
}

class _IntermediatePageState extends State<IntermediatePage> {
  @override
  void initState() {
    super.initState();
    getValidationData().whenComplete(() async {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                finalPhone == null ? const LoginPhone() : const Home(),
          ));
    });
  }

  Future getValidationData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var obtainedPhone = sharedPreferences.getString('phone');
    setState(() {
      finalPhone = obtainedPhone;
    });
    print(finalPhone);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

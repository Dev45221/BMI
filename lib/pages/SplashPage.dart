import 'dart:async';

import 'package:bmi/pages/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SplashPage extends StatefulWidget {

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => MyHomePage(title: "BMI")));
    });

  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("BMI", style: TextStyle( fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 1 ),),
            FaIcon(FontAwesomeIcons.person, color: Colors.white, size: 50,)
          ],
        ),
      ),
    );
  }
}
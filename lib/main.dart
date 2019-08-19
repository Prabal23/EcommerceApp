import 'package:flutter/material.dart';
import 'package:ecommerce_app/splash.dart';
import 'dart:async';

void main() => runApp(MyApp());

Color mainheader = Colors.blue;
Color subheader = Colors.lightBlue;
Color sub_white = Color(0xFFf4f4f4);
Color golden = Color(0xFFCFB53B);

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-commerce',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: subheader,
        fontFamily: 'Nunito',
      ),
      home: SplashScreen(),
      //routes: routes,
    );
  }
}
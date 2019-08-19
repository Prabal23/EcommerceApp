import 'package:ecommerce_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:ecommerce_app/newpage.dart';
import 'dart:async';
//import 'package:login_page/login_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();

    loadData();
    // controller =
    //     AnimationController(duration: const Duration(seconds: 0), vsync: this);
    // animation = Tween<double>(begin: 0, end: 250).animate(controller)
    //   ..addListener(() {
    //     setState(() {
    //       loadData();
    //       // The state that has changed here is the animation object’s value.
    //     });
    //   });
    // controller.forward();
  }

  Future<Timer> loadData() async {
    return new Timer(Duration(seconds: 3), onDoneLoading);
  }

  onDoneLoading() async {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => NewPage()));
  }

  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: Container(
        padding: EdgeInsets.all(0.0),
        child: Column(
          children: <Widget>[
            CircleAvatar(
              backgroundColor: Colors.transparent,
              //backgroundImage: ExactAssetImage('assets/logo.png'),
              minRadius: 70,
              maxRadius: 70,
              //radius: 68.0,
              child: Image.asset('assets/logo.png'),
            ),
          ],
        ),
      ),
    );

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: Colors.white,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                    //height: animation.value,
                    //width: animation.value,
                    child: logo),
                    
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("E-commerce", style: TextStyle(color: subheader, fontSize: 17)),
                    Text(" App", style: TextStyle(fontSize: 17))
                  ],
                ),
                // SizedBox(height: 15),
                // new CircularProgressIndicator(
                //   valueColor:
                //       AlwaysStoppedAnimation<Color>(subheader),
                // ),
                // SizedBox(height: 20),
              ],
            ),
          ),
        ),

        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage('assets/logo.png'),
        //     fit: BoxFit.cover
        //   ) ,
        // ),
        // child: Center(
        //   child: CircularProgressIndicator(
        //     valueColor: AlwaysStoppedAnimation<Color>(Colors.lightBlueAccent),
        //   ),
        // ),
      ),
    );
  }

  // @override
  // void dispose() {
  //   controller.dispose();
  //   super.dispose();
  // }
}

import 'dart:ui' as prefix0;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class NotifyDetPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NotifyDetPageState();
  }
}

class NotifyDetPageState extends State<NotifyDetPage>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;
  bool _isLoggedIn = false;
  String _debugLabelString = "";
  bool _requireConsent = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Container(
            child: Row(
              children: <Widget>[
                Container(
                  child: Row(
                    children: <Widget>[
                     Text("Notification name",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        color: sub_white,
        //height: MediaQuery.of(context).size.height,
        child: Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(top: 5, left: 20, right: 20, bottom: 5),
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              color: Colors.white,
              border: Border.all(width: 0.2, color: Colors.grey)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Row(
              //   children: <Widget>[
              //     Container(
              //         margin: EdgeInsets.only(right: 10, left: 0),
              //         height: 40,
              //         width: 30,
              //         child: Image.asset('assets/logo.png')),
              //     Text(
              //       "Notification Title",
              //       style: TextStyle(fontSize: 17, color: Colors.black),
              //       textAlign: TextAlign.center,
              //     ),
              //   ],
              // ),
              // SizedBox(
              //   height: 10,
              // ),
              Text(
                "aksjhlashggjahgkjdshkgh hfgkj hh hg eeh q lh eroi hl httl ehr ehrt rth krtth ht  e eht qhet kqehrt hqelr lhert ;l   eht l wtth ;lwtjh tyk trl",
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 15, color: Colors.black45),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

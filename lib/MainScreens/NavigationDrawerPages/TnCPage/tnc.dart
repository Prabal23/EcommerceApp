import 'dart:ui' as prefix0;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../main.dart';

class TnCPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TnCPageState();
  }
}

class TnCPageState extends State<TnCPage> with SingleTickerProviderStateMixin {
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
                      Text("Terms & conditions",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                // GestureDetector(
                //   onTap: () {
                //     bottomSheetMenu();
                //   },
                //   child: Container(
                //       padding: EdgeInsets.all(5),
                //       //color: mainheader,
                //       decoration: BoxDecoration(
                //         borderRadius: BorderRadius.all(Radius.circular(5.0)),
                //         color: mainheader,
                //         boxShadow: <BoxShadow>[
                //           BoxShadow(
                //             color: Colors.grey,
                //             //offset: Offset(1.0, 6.0),
                //             blurRadius: 2.0,
                //           ),
                //         ],
                //       ),
                //       child: Container(
                //           child: Icon(
                //         Icons.menu,
                //         color: Colors.white,
                //         size: 20,
                //       ))),
                // ),
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // Row(
              //   children: <Widget>[
              //     Text(
              //       "Terms and Conditions",
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

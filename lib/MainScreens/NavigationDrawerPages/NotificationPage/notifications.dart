import 'dart:ui' as prefix0;

import 'package:ecommerce_app/Cards/NotifyCard/notifyCard.dart';
import 'package:ecommerce_app/MainScreens/NotifyDetailsPage/notifydet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../main.dart';

class NotifyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NotifyPageState();
  }
}

class NotifyPageState extends State<NotifyPage>
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
                      Text("Notification",
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
        child: Container(
          margin: EdgeInsets.only(left: 0, right: 0),
          color: sub_white,
          width: MediaQuery.of(context).size.width,
          ////// <<<<< Notifacation List >>>>> //////
          child: new ListView.builder(
            itemBuilder: (BuildContext context, int index) =>
                ////// <<<<< Notifacation List >>>>> //////
                NotifyCard(),
            itemCount: 20,
          ),
        ),
      ),
    );
  }
}

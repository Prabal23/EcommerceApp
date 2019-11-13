import 'dart:ui' as prefix0;

import 'package:ecommerce_app/MainScreens/NotifyDetailsPage/notifydet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

import '../../main.dart';

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
          margin: EdgeInsets.only(left: 0, right: 0),
          color: sub_white,
          width: MediaQuery.of(context).size.width,
          child: new ListView.builder(
            itemBuilder: (BuildContext context, int index) => GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotifyDetPage()),
                );
              },
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(1.0)),
                    color: Colors.white,
                    border: Border.all(width: 0.2, color: Colors.grey)),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        // color: Colors.red,
                        child: Row(
                          children: <Widget>[
                            Container(
                                margin: EdgeInsets.only(right: 10, left: 0),
                                height: 30,
                                width: 30,
                                child: Image.asset('assets/logo.png')),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  // Text(
                                  //   "Title",
                                  //   overflow: TextOverflow.ellipsis,
                                  //   style: TextStyle(
                                  //       fontSize: 17,
                                  //       color: Colors.black87,
                                  //       fontWeight: FontWeight.bold),
                                  //   textAlign: TextAlign.start,
                                  // ),
                                  Container(
                                    margin: EdgeInsets.only(top: 5),
                                    child: Text(
                                      "Message notify notification body text",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.black),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 5),
                                    child: Text(
                                      "2 days ago",
                                      style: TextStyle(
                                          fontSize: 11, color: Colors.grey),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        child: Icon(
                          Icons.chevron_right,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            itemCount: 20,
          ),
        ),
      ),
    );
  }
}

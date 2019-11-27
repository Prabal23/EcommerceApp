import 'dart:ui' as prefix0;

import 'package:ecommerce_app/Cards/FavCard/favCard.dart';
import 'package:ecommerce_app/MainScreens/ProductDetailsPage/details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../main.dart';

class FavouritePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FavouritePageState();
  }
}

class FavouritePageState extends State<FavouritePage>
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
                      Text("Favourite",
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
          margin: EdgeInsets.only(left: 0, right: 0, top: 0),
          color: sub_white,
          width: MediaQuery.of(context).size.width,
          ////// <<<<< Favorites List >>>>> //////
          child: new ListView.builder(
            itemBuilder: (BuildContext context, int index) =>
                ////// <<<<< Favorites Card >>>>> //////
                FavCard(),
            itemCount: 20,
          ),
        ),
      ),
    );
  }
}

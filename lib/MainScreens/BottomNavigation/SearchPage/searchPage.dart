import 'dart:ui' as prefix0;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import '../../../main.dart';


class SearchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SearchPageState();
  }
}

class SearchPageState extends State<SearchPage>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;
  String result = '';
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: sub_white,
        //height: MediaQuery.of(context).size.height,
        child: Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 1),
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(0.0)),
              color: Colors.white,
              border: Border.all(width: 0, color: Colors.grey)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    color: Colors.white,
                    border: Border.all(width: 0.5, color: Colors.grey)),
                child: TextFormField(
                  autofocus: false,
                  decoration: InputDecoration(
                    icon: const Icon(
                      Icons.search,
                      color: Colors.black38,
                    ),
                    hintText: 'Search here...',
                    //labelText: 'Enter E-mail',
                    contentPadding: EdgeInsets.fromLTRB(0.0, 10.0, 20.0, 10.0),
                    border: InputBorder.none,
                  ),
                  validator: (val) => val.isEmpty ? 'Field is empty' : null,
                  onSaved: (val) => result = val,
                  //validator: _validateEmail,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Search Result",
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

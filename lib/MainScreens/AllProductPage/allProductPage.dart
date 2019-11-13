import 'dart:ui' as prefix0;

import 'package:ecommerce_app/MainScreens/ProductDetailsPage/details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:carousel_pro/carousel_pro.dart';

import '../../main.dart';

class AllProductPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AllProductPageState();
  }
}

class AllProductPageState extends State<AllProductPage>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

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
                      Text("Category name",
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
          margin: EdgeInsets.only(left: 0, right: 0, top: 0),
          color: sub_white,
          width: MediaQuery.of(context).size.width,
          child: new ListView.builder(
            itemBuilder: (BuildContext context, int index) => GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetailsPage()),
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
                                height: 90,
                                child: Image.asset('assets/shoe.png')),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Product Name hghgjhgjgjh",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.black54),
                                    textAlign: TextAlign.start,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 5),
                                    child: Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.star,
                                          color: golden,
                                          size: 17,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: golden,
                                          size: 17,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: golden,
                                          size: 17,
                                        ),
                                        Icon(
                                          Icons.star_half,
                                          color: golden,
                                          size: 17,
                                        ),
                                        Icon(
                                          Icons.star_border,
                                          color: golden,
                                          size: 17,
                                        ),
                                        // Container(
                                        //   margin: EdgeInsets.only(left: 3),
                                        //   child: Text(
                                        //     "4.5",
                                        //     style: TextStyle(
                                        //         color: Colors.grey),
                                        //   ),
                                        // )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Icon(
                                              Icons.attach_money,
                                              color: Colors.black87,
                                              size: 18,
                                            ),
                                            Text(
                                              "20.25",
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.black87,
                                              ),
                                            ),
                                          ],
                                        ),

                                        // Icon(
                                        //   Icons.delete,
                                        //   color: Colors.grey,
                                        //   size: 23,
                                        // ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(right: 5),
                          child: Column(
                            children: <Widget>[
                              Container(
                                color: Colors.white,
                                child: Icon(
                                  Icons.chevron_right,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          )),
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

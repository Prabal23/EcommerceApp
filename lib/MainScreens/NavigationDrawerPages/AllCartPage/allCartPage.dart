import 'dart:ui' as prefix0;

import 'package:ecommerce_app/MainScreens/LoginPage/login.dart';
import 'package:ecommerce_app/MainScreens/ProductDetailsPage/details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:carousel_pro/carousel_pro.dart';

import '../../../main.dart';

class AllCartPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AllCartPageState();
  }
}

class AllCartPageState extends State<AllCartPage>
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
                      Text("Cart",
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
        child: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 0, right: 0, top: 40),
              color: sub_white,
              width: MediaQuery.of(context).size.width,
              child: new ListView.builder(
                itemBuilder: (BuildContext context, int index) =>
                    GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DetailsPage()),
                    );
                  },
                  child: new Container(
                    margin:
                        EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
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
                                    height: 80,
                                    child: Image.asset('assets/shirt.jpg')),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        index % 2 == 0
                                            ? "Product Name from database"
                                            : "Product List from server",
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: Colors.black87),
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
                                              index % 2 == 0
                                                  ? Icons.star
                                                  : Icons.star_half,
                                              color: golden,
                                              size: 17,
                                            ),
                                            Icon(
                                              Icons.star_border,
                                              color: golden,
                                              size: 17,
                                            ),
                                            // Container(
                                            //   margin:
                                            //       EdgeInsets.only(left: 3),
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
                                        margin: EdgeInsets.only(top: 5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Row(
                                              children: <Widget>[
                                                Icon(
                                                  Icons.attach_money,
                                                  color: Colors.black54,
                                                  size: 17,
                                                ),
                                                SizedBox(
                                                  width: 3,
                                                ),
                                                Text(
                                                  index % 2 == 0
                                                      ? "20.25"
                                                      : "150.05",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.black54,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left: 20, right: 5),
                                              child: Row(
                                                children: <Widget>[
                                                  Icon(
                                                    Icons.delete,
                                                    color: Colors.grey[500],
                                                    size: 20,
                                                  ),
                                                  // SizedBox(
                                                  //   width: 3,
                                                  // ),
                                                  // Text(
                                                  //   "XXL",
                                                  //   style: TextStyle(
                                                  //       fontSize: 14,
                                                  //       color: Colors.grey),
                                                  // ),
                                                ],
                                              ),
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
                          // Container(
                          //     color: Colors.grey[200],
                          //     padding: EdgeInsets.all(10),
                          //     child: Column(
                          //       children: <Widget>[
                          //         Container(
                          //           color: Colors.white,
                          //           child: Icon(
                          //             Icons.add,
                          //             color: Colors.grey,
                          //           ),
                          //         ),
                          //         Container(
                          //             margin: EdgeInsets.only(
                          //                 top: 10, bottom: 10),
                          //             child: Text("1")),
                          //         Container(
                          //           color: Colors.white,
                          //           child: Icon(
                          //             Icons.remove,
                          //             color: Colors.grey,
                          //           ),
                          //         )
                          //       ],
                          //     )),
                        ],
                      ),
                    ),
                  ),
                ),
                itemCount: 20,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              height: 40,
              color: mainheader,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.card_travel,
                              size: 17,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Text("4 Items",
                                style: TextStyle(color: Colors.white)),
                          ],
                        ),
                        Container(
                            height: 20,
                            child: VerticalDivider(
                              color: Colors.white,
                            )),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.attach_money,
                              size: 17,
                              color: Colors.white,
                            ),
                            Text("200.45",
                                style: TextStyle(color: Colors.white)),
                          ],
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: Container(
                        margin: EdgeInsets.only(right: 10),
                        child: Row(
                          children: <Widget>[
                            Text(
                              "Check Out",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                                margin: EdgeInsets.only(left: 1),
                                child: Icon(
                                  Icons.keyboard_arrow_right,
                                  color: Colors.white,
                                  size: 17,
                                ))
                          ],
                        )),
                  ),
                ],
              ),
            ),
            Container(margin: EdgeInsets.only(top: 32), child: Divider())
          ],
        ),
      ),
    );
  }
}

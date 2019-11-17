import 'dart:ui' as prefix0;

import 'package:ecommerce_app/MainScreens/AllProductPage/allProductPage.dart';
import 'package:ecommerce_app/MainScreens/NavigationDrawerPages/CategoryPage/category.dart';
import 'package:ecommerce_app/MainScreens/ProductDetailsPage/details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import '../../../main.dart';
import 'package:carousel_pro/carousel_pro.dart';

class ProductPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ProductPageState();
  }
}

class ProductPageState extends State<ProductPage>
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
      body: SingleChildScrollView(
        child: Container(
          color: sub_white,
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Category",
                          style: TextStyle(fontSize: 20),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CategoryPage()));
                          },
                          child: Container(
                            child: Row(
                              children: <Widget>[
                                Text(
                                  "Show All",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black45),
                                ),
                                Icon(Icons.chevron_right, color: Colors.black45)
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.only(left: 0, right: 0),
                  color: sub_white,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(left: 10),
                  height: 55,
                  child: new ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) =>
                        new Container(
                          //color: Colors.white,
                          margin: EdgeInsets.all(5),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              color: Colors.white,
                              border:
                                  Border.all(width: 0.2, color: Colors.grey)),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailsPage()),
                              );
                            },
                            child: Container(
                              child: Column(
                                children: <Widget>[
                                  Stack(
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.only(top: 0),
                                        padding: EdgeInsets.only(top: 5),
                                        color: Colors.white,
                                        alignment: Alignment.center,
                                        child: Row(
                                          children: <Widget>[
                                            Icon(Icons.category,
                                                color: Colors.black54,
                                                size: 16),
                                            Container(
                                              margin: EdgeInsets.only(left: 3),
                                              child: Text(
                                                "Category Name",
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.black54),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                    itemCount: 20,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                    //width: MediaQuery.of(context).size.width,
                    //margin: EdgeInsets.only(left: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "New Arrival",
                          style: TextStyle(fontSize: 20),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AllProductPage()));
                          },
                          child: Container(
                            child: Row(
                              children: <Widget>[
                                Text(
                                  "Show All",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black45),
                                ),
                                Icon(Icons.chevron_right, color: Colors.black45)
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.only(left: 0, right: 0),
                  color: sub_white,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(left: 10),
                  height: 210,
                  child: new ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) =>
                        new Container(
                          margin: EdgeInsets.all(5),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              color: Colors.white,
                              border:
                                  Border.all(width: 0.2, color: Colors.grey)),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailsPage()),
                              );
                            },
                            child: Container(
                              width: 100,
                              child: Column(
                                children: <Widget>[
                                  Container(
                                      height: 100,
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Stack(children: <Widget>[
                                          Center(
                                            child: Image.asset(
                                              'assets/tshirt.png',
                                            ),
                                          ),
                                          Container(
                                              padding: EdgeInsets.all(5),
                                              //color: mainheader,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              10.0)),
                                                  color: mainheader,
                                                  border: Border.all(
                                                      width: 0.2,
                                                      color: Colors.grey)),
                                              child: Text("New",
                                                  style: TextStyle(
                                                      color: sub_white)))
                                        ]),
                                      )),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Product Name",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black38),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(top: 0),
                                          child: Row(
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
                                                    color: Colors.black87),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 9),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Icon(
                                          Icons.star,
                                          color: golden,
                                          size: 15,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: golden,
                                          size: 15,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: golden,
                                          size: 15,
                                        ),
                                        Icon(
                                          Icons.star_half,
                                          color: golden,
                                          size: 15,
                                        ),
                                        Icon(
                                          Icons.star_border,
                                          color: golden,
                                          size: 15,
                                        ),
                                      ],
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
                SizedBox(
                  height: 10,
                ),
                Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                    //width: MediaQuery.of(context).size.width,
                    //margin: EdgeInsets.only(left: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Trending",
                          style: TextStyle(fontSize: 20),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AllProductPage()));
                          },
                          child: Container(
                            child: Row(
                              children: <Widget>[
                                Text(
                                  "Show All",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black45),
                                ),
                                Icon(Icons.chevron_right, color: Colors.black45)
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.only(left: 0, right: 0),
                  color: sub_white,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(left: 10),
                  height: 210,
                  child: new ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) =>
                        new Container(
                          //color: Colors.white,
                          margin: EdgeInsets.all(5),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              color: Colors.white,
                              border:
                                  Border.all(width: 0.2, color: Colors.grey)),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailsPage()),
                              );
                            },
                            child: Container(
                              //padding: EdgeInsets.only(left: 20),
                              width: 100,
                              child: Column(
                                children: <Widget>[
                                  Container(
                                      height: 100,
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Stack(children: <Widget>[
                                          Center(
                                            child: Image.asset(
                                              'assets/shirt.jpg',
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(5),
                                            //color: mainheader,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10.0)),
                                                color: mainheader,
                                                border: Border.all(
                                                    width: 0.2,
                                                    color: Colors.grey)),
                                            child: Icon(
                                              Icons.trending_up,
                                              color: Colors.white,
                                              size: 16,
                                            ),
                                          )
                                        ]),
                                      )),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Product Name",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black38),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(top: 0),
                                          child: Row(
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
                                                    color: Colors.black87),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 9),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Icon(
                                          Icons.star,
                                          color: golden,
                                          size: 15,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: golden,
                                          size: 15,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: golden,
                                          size: 15,
                                        ),
                                        Icon(
                                          Icons.star_half,
                                          color: golden,
                                          size: 15,
                                        ),
                                        Icon(
                                          Icons.star_border,
                                          color: golden,
                                          size: 15,
                                        ),
                                      ],
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
                SizedBox(
                  height: 10,
                ),
                Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                    //width: MediaQuery.of(context).size.width,
                    //margin: EdgeInsets.only(left: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Discount",
                          style: TextStyle(fontSize: 20),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AllProductPage()));
                          },
                          child: Container(
                            child: Row(
                              children: <Widget>[
                                Text(
                                  "Show All",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black45),
                                ),
                                Icon(Icons.chevron_right, color: Colors.black45)
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.only(left: 0, right: 0),
                  color: sub_white,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(left: 10),
                  height: 210,
                  child: new ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) =>
                        new Container(
                          //color: Colors.white,
                          margin: EdgeInsets.all(5),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              color: Colors.white,
                              border:
                                  Border.all(width: 0.2, color: Colors.grey)),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailsPage()),
                              );
                            },
                            child: Container(
                              //padding: EdgeInsets.only(left: 20),
                              width: 100,
                              child: Column(
                                children: <Widget>[
                                  Container(
                                      height: 100,
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Stack(children: <Widget>[
                                          Center(
                                            child: Image.asset(
                                              'assets/shoe.png',
                                            ),
                                          ),
                                          Container(
                                              padding: EdgeInsets.all(5),
                                              //color: mainheader,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              10.0)),
                                                  color: mainheader,
                                                  border: Border.all(
                                                      width: 0.2,
                                                      color: Colors.grey)),
                                              child: Text("25%",
                                                  style: TextStyle(
                                                      color: sub_white)))
                                        ]),
                                      )),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Product Name",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black38),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(top: 0),
                                          child: Row(
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
                                                    color: Colors.black87),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 9),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Icon(
                                          Icons.star,
                                          color: golden,
                                          size: 15,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: golden,
                                          size: 15,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: golden,
                                          size: 15,
                                        ),
                                        Icon(
                                          Icons.star_half,
                                          color: golden,
                                          size: 15,
                                        ),
                                        Icon(
                                          Icons.star_border,
                                          color: golden,
                                          size: 15,
                                        ),
                                      ],
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
                SizedBox(
                  height: 10,
                ),
                Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                    //width: MediaQuery.of(context).size.width,
                    //margin: EdgeInsets.only(left: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Recommended",
                          style: TextStyle(fontSize: 20),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AllProductPage()));
                          },
                          child: Container(
                            child: Row(
                              children: <Widget>[
                                Text(
                                  "Show All",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black45),
                                ),
                                Icon(Icons.chevron_right, color: Colors.black45)
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.only(left: 0, right: 0, bottom: 10),
                  color: sub_white,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(left: 10,),
                  height: 210,
                  child: new ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) =>
                        new Container(
                          //color: Colors.white,
                          margin: EdgeInsets.all(5),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              color: Colors.white,
                              border:
                                  Border.all(width: 0.2, color: Colors.grey)),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailsPage()),
                              );
                            },
                            child: Container(
                              //padding: EdgeInsets.only(left: 20),
                              width: 100,
                              child: Column(
                                children: <Widget>[
                                  Container(
                                      height: 100,
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Stack(children: <Widget>[
                                          Center(
                                            child: Image.asset(
                                              'assets/tshirt.png',
                                            ),
                                          ),
                                          // Container(
                                          //     padding: EdgeInsets.all(5),
                                          //     //color: mainheader,
                                          //     decoration: BoxDecoration(
                                          //         borderRadius:
                                          //             BorderRadius.all(
                                          //                 Radius.circular(
                                          //                     10.0)),
                                          //         color: mainheader,
                                          //         border: Border.all(
                                          //             width: 0.2,
                                          //             color: Colors.grey)),
                                          //     child: Text("25%",
                                          //         style: TextStyle(
                                          //             color: sub_white)))
                                        ]),
                                      )),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Product Name",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black38),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(top: 0),
                                          child: Row(
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
                                                    color: Colors.black87),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 9),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Icon(
                                          Icons.star,
                                          color: golden,
                                          size: 15,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: golden,
                                          size: 15,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: golden,
                                          size: 15,
                                        ),
                                        Icon(
                                          Icons.star_half,
                                          color: golden,
                                          size: 15,
                                        ),
                                        Icon(
                                          Icons.star_border,
                                          color: golden,
                                          size: 15,
                                        ),
                                      ],
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

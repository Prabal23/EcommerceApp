import 'dart:ui' as prefix0;

import 'package:ecommerce_app/login.dart';
import 'package:ecommerce_app/profile.dart';
import 'package:ecommerce_app/search.dart';
import 'package:ecommerce_app/tnc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import './main.dart';
import 'package:carousel_pro/carousel_pro.dart';

import 'category.dart';
import 'checkout.dart';
import 'details.dart';
import 'favourite.dart';
import 'newpage.dart';
import 'notifications.dart';
import 'orders.dart';

class CartPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CartPageState();
  }
}

class CartPageState extends State<CartPage>
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
    Drawer drawer = new Drawer(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: new Wrap(
              children: <Widget>[
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              //transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                              padding: EdgeInsets.all(1.0),
                              child: CircleAvatar(
                                radius: 30.0,
                                backgroundColor: Colors.transparent,
                                backgroundImage: AssetImage('assets/logo.png'),
                              ),
                              decoration: new BoxDecoration(
                                color: Colors.grey, // border color
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Hello,",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black38),
                                ),
                                Text(
                                  "John Smith",
                                  style: TextStyle(fontSize: 17),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(right: 30),
                          child: Icon(Icons.chevron_right)),
                    ],
                  ),
                ),
                Container(
                  color: Colors.grey[200],
                  padding: EdgeInsets.all(15),
                  margin: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfilePage()),
                          );
                        },
                        child: Container(
                          //width: MediaQuery.of(context).size.width / 4.4,
                          child: Column(
                            children: <Widget>[
                              Icon(
                                Icons.account_box,
                                color: Colors.black38,
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                "Profile",
                                style: TextStyle(color: Colors.black38),
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OrderPage()),
                          );
                        },
                        child: Container(
                          //width: MediaQuery.of(context).size.width / 4.4,
                          child: Column(
                            children: <Widget>[
                              Icon(
                                Icons.list,
                                color: Colors.black38,
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                "Orders",
                                style: TextStyle(color: Colors.black38),
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CartPage()),
                          );
                        },
                        child: Container(
                          //width: MediaQuery.of(context).size.width / 4.5,
                          child: Column(
                            children: <Widget>[
                              Icon(
                                Icons.shopping_cart,
                                color: Colors.black38,
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                "Cart",
                                style: TextStyle(color: Colors.black38),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                new ListTile(
                    leading: new Icon(Icons.home),
                    title: new Text('Home'),
                    onTap: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => NewPage()),
                          )
                        }),
                new ListTile(
                    leading: new Icon(Icons.category),
                    title: new Text('Category'),
                    onTap: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CategoryPage()),
                          )
                        }),
                new ListTile(
                    leading: new Icon(Icons.favorite),
                    title: new Text('Favourites'),
                    onTap: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FavouritePage()),
                          )
                        }),
                new ListTile(
                    leading: new Icon(Icons.notifications),
                    title: new Text('Notifications'),
                    onTap: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NotifyPage()),
                          )
                        }),
                Divider(color: Colors.grey),
                new ListTile(
                  leading: new Icon(Icons.security),
                  title: new Text('Terms and Condition'),
                  onTap: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TnCPage()),
                        )
                      },
                ),
                new ListTile(
                  leading: new Icon(Icons.settings_power),
                  title: new Text('Logout'),
                  onTap: () => {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
    return Scaffold(
      drawer: drawer,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Container(
            child: Row(
              children: <Widget>[
                Container(
                  child: Row(
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.only(right: 5),
                          width: 30,
                          child: Image.asset('assets/logo.png')),
                      Text("E-commerce",
                          style: TextStyle(
                              color: subheader,
                              fontSize: 17,
                              fontWeight: FontWeight.bold)),
                      Text(" App",
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
        child: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 0, right: 0, top: 40),
              color: sub_white,
              width: MediaQuery.of(context).size.width,
              child: new ListView.builder(
                itemBuilder: (BuildContext context, int index) => new Container(
                      margin: EdgeInsets.only(
                          left: 20, right: 20, top: 5, bottom: 5),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(1.0)),
                          color: Colors.white,
                          border: Border.all(width: 0.2, color: Colors.grey)),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailsPage()),
                          );
                        },
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                // color: Colors.red,
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                        margin:
                                            EdgeInsets.only(right: 10, left: 0),
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
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
                                                      left: 20, right: 20),
                                                  child: Row(
                                                    children: <Widget>[
                                                      Icon(
                                                        Icons.remove_circle,
                                                        color: Colors.grey[350],
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
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 60,
          child: Column(
            children: <Widget>[
              Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => NewPage()),
                        );
                      },
                      child: Container(
                          width: MediaQuery.of(context).size.width / 4.5,
                          //color: Colors.black,
                          padding: EdgeInsets.all(15),
                          child: Column(
                            children: <Widget>[
                              Icon(
                                Icons.home,
                                color: Colors.grey,
                                size: 30,
                              )
                            ],
                          )),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SearchPage()),
                        );
                      },
                      child: Container(
                          width: MediaQuery.of(context).size.width / 4.5,
                          //color: Colors.black,
                          padding: EdgeInsets.all(15),
                          child: Column(
                            children: <Widget>[
                              Icon(
                                Icons.search,
                                color: Colors.grey,
                                size: 30,
                              )
                            ],
                          )),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfilePage()),
                        );
                      },
                      child: Container(
                          width: MediaQuery.of(context).size.width / 4.5,
                          //color: Colors.black,
                          padding: EdgeInsets.all(15),
                          child: Column(
                            children: <Widget>[
                              Icon(
                                Icons.account_circle,
                                color: Colors.grey,
                                size: 30,
                              )
                            ],
                          )),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CartPage()),
                        );
                      },
                      child: Container(
                          width: MediaQuery.of(context).size.width / 4.5,
                          //color: Colors.black,
                          padding: EdgeInsets.all(15),
                          child: Column(
                            children: <Widget>[
                              Stack(children: <Widget>[
                                Icon(
                                  Icons.shopping_cart,
                                  color: mainheader,
                                  size: 30,
                                ),
                                Container(
                                    //color: mainheader,
                                    padding: EdgeInsets.all(3),
                                    margin: EdgeInsets.only(left: 18),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0)),
                                        color: mainheader,
                                        border: Border.all(
                                            width: 0.2, color: Colors.grey)),
                                    child: Text(
                                      "20",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 11),
                                    ))
                              ])
                            ],
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void bottomSheetMenu() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            child: new Wrap(
              children: <Widget>[
                new ListTile(
                    leading: new Icon(Icons.music_note),
                    title: new Text('Music'),
                    onTap: () => {}),
                new ListTile(
                  leading: new Icon(Icons.videocam),
                  title: new Text('Video'),
                  onTap: () => {},
                ),
              ],
            ),
          );
        });
  }
}
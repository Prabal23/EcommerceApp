import 'dart:ui' as prefix0;

import 'package:ecommerce_app/favourite.dart';
import 'package:ecommerce_app/notifications.dart';
import 'package:ecommerce_app/orders.dart';
import 'package:ecommerce_app/productpage.dart';
import 'package:ecommerce_app/profile.dart';
import 'package:ecommerce_app/search.dart';
import 'package:ecommerce_app/tnc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import './main.dart';
import 'package:carousel_pro/carousel_pro.dart';

import 'cart.dart';
import 'category.dart';
import 'details.dart';

class NewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NewPageState();
  }
}

class NewPageState extends State<NewPage> with SingleTickerProviderStateMixin {
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
        //backgroundColor: Theme.of(context).secondaryHeaderColor,
        backgroundColor: Colors.white,
        // title:
        //     Container(padding: EdgeInsets.all(10), color: mainheader, child: Icon(Icons.menu)),
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
      body: SingleChildScrollView(
        child: Container(
          color: sub_white,
          //height: MediaQuery.of(context).size.height,
          child: Container(
            child: Column(
              children: <Widget>[
                // new SizedBox(
                //   height: 200.0,
                //   width: MediaQuery.of(context).size.width,
                //   child: new Carousel(
                //     images: [
                //       //new NetworkImage('https://cdn-images-1.medium.com/max/2000/1*GqdzzfB_BHorv7V2NV7Jgg.jpeg'),
                //       new ExactAssetImage("assets/s1.jpg"),
                //       new ExactAssetImage("assets/s2.jpg"),
                //       new ExactAssetImage("assets/s3.png"),
                //       new ExactAssetImage("assets/s4.jpeg"),
                //       new ExactAssetImage("assets/s5.jpg")
                //     ],
                //     dotSize: 4.0,
                //     dotSpacing: 15.0,
                //     dotColor: Colors.white,
                //     indicatorBgPadding: 5.0,
                //     dotBgColor: mainheader.withOpacity(0.5),
                //     borderRadius: true,
                //   ),
                // ),
                // SizedBox(
                //   height: 30,
                // ),
                Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                    //width: MediaQuery.of(context).size.width,
                    //margin: EdgeInsets.only(left: 20),
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
                              //padding: EdgeInsets.only(left: 20),
                              //width: 100,
                              child: Column(
                                children: <Widget>[
                                  Stack(
                                    children: <Widget>[
                                      // Container(
                                      //   height: 100,
                                      //   width: 100,
                                      //   decoration: new BoxDecoration(
                                      //     //color: const Color(0xff000),
                                      //     image: new DecorationImage(
                                      //       //fit: BoxFit.cover,
                                      //       colorFilter: new ColorFilter.mode(
                                      //           Colors.black.withOpacity(0.3),
                                      //           BlendMode.xor),
                                      //       image: new AssetImage(
                                      //           'assets/shirt.jpg'),
                                      //     ),
                                      //   ),
                                      // ),
                                      // child:
                                      //     Image.asset('assets/shirt.jpg')),
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
                                  // SizedBox(
                                  //   height: 10,
                                  // ),
                                  // Text(
                                  //   "Product Name",
                                  //   style: TextStyle(
                                  //       fontSize: 14, color: Colors.black38),
                                  //   textAlign: TextAlign.center,
                                  // ),
                                  // Container(
                                  //     width: 100,
                                  //     margin: EdgeInsets.only(top: 5),
                                  //     child: Divider(
                                  //       color: Colors.grey,
                                  //     )),
                                  // Container(
                                  //   child: Row(
                                  //     mainAxisAlignment:
                                  //         MainAxisAlignment.spaceBetween,
                                  //     children: <Widget>[
                                  //       Row(
                                  //         children: <Widget>[
                                  //           Text(
                                  //             "20+",
                                  //             style: TextStyle(
                                  //                 fontSize: 13,
                                  //                 color: Colors.grey),
                                  //           ),
                                  //           Text(
                                  //             " Items",
                                  //             style: TextStyle(
                                  //                 fontSize: 13,
                                  //                 color: Colors.grey),
                                  //           ),
                                  //         ],
                                  //       ),
                                  //       Icon(
                                  //         Icons.chevron_right,
                                  //         color: Colors.grey,
                                  //         size: 18,
                                  //       ),
                                  //     ],
                                  //   ),
                                  // )
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
                                    builder: (context) => ProductPage()));
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
                                    builder: (context) => ProductPage()));
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
                                    builder: (context) => ProductPage()));
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
                                    builder: (context) => ProductPage()));
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
      bottomNavigationBar: BottomAppBar(
        child: Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              GestureDetector(
                onTap: (){
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
                          color: mainheader,
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
                    MaterialPageRoute(builder: (context) => ProfilePage()),
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
                            color: Colors.grey,
                            size: 30,
                          ),
                          Container(
                              //color: mainheader,
                              padding: EdgeInsets.all(3),
                              margin: EdgeInsets.only(left: 18),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
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
      ),
    );
  }

  void bottomSheetMenu() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SingleChildScrollView(
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
                                  backgroundImage:
                                      AssetImage('assets/logo.png'),
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
                    color: mainheader,
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(20),
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width / 3.75,
                          child: Column(
                            children: <Widget>[
                              Icon(
                                Icons.account_box,
                                color: Colors.white,
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                "Profile",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 3.75,
                          child: Column(
                            children: <Widget>[
                              Icon(
                                Icons.list,
                                color: Colors.white,
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                "Orders",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 3.75,
                          child: Column(
                            children: <Widget>[
                              Icon(
                                Icons.shopping_cart,
                                color: Colors.white,
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                "Cart",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  new ListTile(
                      leading: new Icon(Icons.category),
                      title: new Text('Category'),
                      onTap: () => {}),
                  new ListTile(
                      leading: new Icon(Icons.notifications),
                      title: new Text('Notifications'),
                      onTap: () => {}),
                  new ListTile(
                      leading: new Icon(Icons.settings),
                      title: new Text('Settings'),
                      onTap: () => {}),
                  new ListTile(
                    leading: new Icon(Icons.flash_off),
                    title: new Text('Logout'),
                    onTap: () => {},
                  ),
                ],
              ),
            ),
          );
        });
  }
}

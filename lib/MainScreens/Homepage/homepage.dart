import 'dart:ui' as prefix0;

import 'package:ecommerce_app/MainScreens/AllCartPage/allCartPage.dart';
import 'package:ecommerce_app/MainScreens/BottomNavigation/CartPage/cartPage.dart';
import 'package:ecommerce_app/MainScreens/BottomNavigation/ProductPage/productPage.dart';
import 'package:ecommerce_app/MainScreens/BottomNavigation/ProfilePage/profilePage.dart';
import 'package:ecommerce_app/MainScreens/BottomNavigation/SearchPage/searchPage.dart';
import 'package:ecommerce_app/MainScreens/CategoryPage/category.dart';
import 'package:ecommerce_app/MainScreens/FavouritePage/favourite.dart';
import 'package:ecommerce_app/MainScreens/MyProfilePage/myProfilePage.dart';
import 'package:ecommerce_app/MainScreens/NotificationPage/notifications.dart';
import 'package:ecommerce_app/MainScreens/OrderPage/orders.dart';
import 'package:ecommerce_app/MainScreens/TnCPage/tnc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import '../../main.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Animation<double> animation;
  AnimationController controller;
  int currentIndex = selectedPage;

  @override
  void initState() {
    super.initState();
  }

  final pageOptions = [
    ProductPage(),
    SearchPage(),
    ProfilePage(),
    CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    Drawer drawer = new Drawer(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: new Wrap(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyProfilePage()),
                    );
                  },
                  child: Container(
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
                        // Container(
                        //     margin: EdgeInsets.only(right: 30),
                        //     child: Icon(Icons.chevron_right)),
                      ],
                    ),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(top: 10, left: 20, right: 20),
                    child: Divider()),
                // Container(
                //   color: Colors.grey[200],
                //   padding: EdgeInsets.all(15),
                //   margin: EdgeInsets.all(20),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: <Widget>[
                //       GestureDetector(
                //         onTap: () {
                //           Navigator.push(
                //             context,
                //             MaterialPageRoute(
                //                 builder: (context) => ProfilePage()),
                //           );
                //         },
                //         child: Container(
                //           //width: MediaQuery.of(context).size.width / 4.4,
                //           child: Column(
                //             children: <Widget>[
                //               Icon(
                //                 Icons.account_box,
                //                 color: Colors.black38,
                //               ),
                //               SizedBox(
                //                 height: 3,
                //               ),
                //               Text(
                //                 "Profile",
                //                 style: TextStyle(color: Colors.black38),
                //               )
                //             ],
                //           ),
                //         ),
                //       ),
                //       GestureDetector(
                //         onTap: () {
                //           Navigator.push(
                //             context,
                //             MaterialPageRoute(
                //                 builder: (context) => OrderPage()),
                //           );
                //         },
                //         child: Container(
                //           //width: MediaQuery.of(context).size.width / 4.4,
                //           child: Column(
                //             children: <Widget>[
                //               Icon(
                //                 Icons.list,
                //                 color: Colors.black38,
                //               ),
                //               SizedBox(
                //                 height: 3,
                //               ),
                //               Text(
                //                 "Orders",
                //                 style: TextStyle(color: Colors.black38),
                //               )
                //             ],
                //           ),
                //         ),
                //       ),
                //       GestureDetector(
                //         onTap: () {
                //           Navigator.push(
                //             context,
                //             MaterialPageRoute(
                //                 builder: (context) => AllCartPage()),
                //           );
                //         },
                //         child: Container(
                //           //width: MediaQuery.of(context).size.width / 4.5,
                //           child: Column(
                //             children: <Widget>[
                //               Icon(
                //                 Icons.shopping_cart,
                //                 color: Colors.black38,
                //               ),
                //               SizedBox(
                //                 height: 3,
                //               ),
                //               Text(
                //                 "Cart",
                //                 style: TextStyle(color: Colors.black38),
                //               )
                //             ],
                //           ),
                //         ),
                //       )
                //     ],
                //   ),
                // ),
                new ListTile(
                    leading: new Icon(Icons.list),
                    title: new Text('Orders'),
                    onTap: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OrderPage()),
                          )
                        }),
                new ListTile(
                    leading: new Icon(Icons.shopping_cart),
                    title: new Text('Cart'),
                    onTap: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AllCartPage()),
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
                Container(
                    margin: EdgeInsets.only(top: 0, left: 20, right: 20),
                    child: Divider()),
                //Divider(color: Colors.grey),
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
      key: _scaffoldKey,
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
              ],
            ),
          ),
        ),
      ),
      body: pageOptions[currentIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
            canvasColor: Colors.white,
            primaryColor: mainheader,
            textTheme: Theme.of(context)
                .textTheme
                .copyWith(caption: new TextStyle(color: Colors.grey[500]))),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home, size: 20), title: SizedBox.shrink()),
            BottomNavigationBarItem(
                icon: new Stack(children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    child: new Icon(
                      Icons.search,
                      size: 20,
                    ),
                  ),
                ]),
                title: SizedBox.shrink()),
            BottomNavigationBarItem(
                icon: Container(
                    margin: EdgeInsets.only(top: 5),
                    child: Icon(Icons.account_circle, size: 20)),
                title: SizedBox.shrink()),
            BottomNavigationBarItem(
                icon: new Stack(children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    child: new Icon(
                      Icons.shopping_cart,
                      size: 20,
                    ),
                  ),
                  // currentIndex == 3
                  //     ? Container()
                  //     : pageDirect == ""
                  //         ? Positioned(
                  //             right: 0,
                  //             child: Container(
                  //               padding: EdgeInsets.only(
                  //                   top: 1, bottom: 1, right: 5, left: 5),
                  //               margin: EdgeInsets.only(
                  //                   right: 0, left: 0, bottom: 10),
                  //               decoration: BoxDecoration(
                  //                   color: Colors.transparent,
                  //                   borderRadius: BorderRadius.circular(15)),

                  //             ),
                  //           )
                  //         : Positioned(
                  //             right: 0,
                  //             child: Container(
                  //               padding: EdgeInsets.only(
                  //                   top: 1, bottom: 1, right: 5, left: 5),
                  //               margin: EdgeInsets.only(
                  //                   right: 0, left: 0, bottom: 10),
                  //               decoration: BoxDecoration(
                  //                   color: mainheader,
                  //                   borderRadius: BorderRadius.circular(15)),
                  //               child: Text(
                  //                 pageDirect,
                  //                 textAlign: TextAlign.start,
                  //                 style: TextStyle(
                  //                     color: Colors.white,
                  //                     fontSize: 10,
                  //                     //fontFamily: 'Oswald',
                  //                     fontWeight: FontWeight.w400),
                  //               ),
                  //             ),
                  //           )
                ]),
                title: SizedBox.shrink()),
          ],
          onTap: (int _selectedPage) {
            setState(() {
              currentIndex = _selectedPage;
              selectedPage = _selectedPage;
            });
            //print(selectedPage);
          },
        ),
      ),
    );
  }
}

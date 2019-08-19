import 'dart:ui' as prefix0;

import 'package:ecommerce_app/cart.dart';
import 'package:ecommerce_app/login.dart';
import 'package:ecommerce_app/orders.dart';
import 'package:ecommerce_app/profile.dart';
import 'package:ecommerce_app/search.dart';
import 'package:ecommerce_app/tnc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import './main.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:intl/intl.dart';
import 'category.dart';
import 'favourite.dart';
import 'newpage.dart';
import 'notifications.dart';

class AccountPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AccountPageState();
  }
}

class AccountPageState extends State<AccountPage>
    with SingleTickerProviderStateMixin {
  TextEditingController _reviewController = TextEditingController();
  TextEditingController _dayController = TextEditingController();
  TextEditingController _monthController = TextEditingController();
  Animation<double> animation;
  AnimationController controller;
  bool _isLoggedIn = false;
  String _debugLabelString = "", review = '', runningdate = '';
  bool _requireConsent = false;
  var dd, finalDate;
  DateTime _date = DateTime.now();
  bool _cardInfo = false;
  int cardStatus = 0;

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
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfilePage()),
                    );
                  },
                  child: Container(
                    color: Colors.grey[200],
                    padding: EdgeInsets.all(15),
                    margin: EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
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
                              MaterialPageRoute(
                                  builder: (context) => CartPage()),
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    width: MediaQuery.of(context).size.width,
                    margin:
                        EdgeInsets.only(top: 5, left: 20, right: 20, bottom: 5),
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        color: Colors.white,
                        border: Border.all(width: 0.2, color: Colors.grey)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Register",
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 5, right: 5, bottom: 5),
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(top: 5, bottom: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Container(
                                        //color: Colors.grey[200],
                                        //padding: EdgeInsets.all(20),
                                        child: Text(
                                      "Choose Profile",
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontWeight: FontWeight.bold),
                                    )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Center(
                          child: Stack(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(1.0),
                                child: CircleAvatar(
                                  radius: 50.0,
                                  backgroundColor: Colors.transparent,
                                  backgroundImage:
                                      AssetImage('assets/logo.png'),
                                ),
                                decoration: new BoxDecoration(
                                  color: Colors.grey, // border color
                                  shape: BoxShape.circle,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 80),
                                child: Icon(Icons.add_a_photo,
                                    color: Colors.grey, size: 30),
                                decoration: new BoxDecoration(
                                  color: Colors.white, // border color
                                  shape: BoxShape.circle,
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 15, right: 5, bottom: 5),
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(top: 5, bottom: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Container(
                                        //color: Colors.grey[200],
                                        //padding: EdgeInsets.all(20),
                                        child: Text(
                                      "Full Name",
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontWeight: FontWeight.bold),
                                    )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 0, right: 5, bottom: 5),
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0)),
                                      color: Colors.white,
                                      border: Border.all(
                                          width: 0.5, color: Colors.grey)),
                                  child: TextFormField(
                                    autofocus: false,
                                    decoration: InputDecoration(
                                      icon: const Icon(
                                        Icons.account_circle,
                                        color: Colors.black38,
                                      ),
                                      hintText: 'Type your full name...',
                                      //labelText: 'Enter E-mail',
                                      contentPadding: EdgeInsets.fromLTRB(
                                          0.0, 10.0, 20.0, 10.0),
                                      border: InputBorder.none,
                                      //border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                                      //border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                                      //border: OutlineInputBorder(borderRadius: BorderRadius.vertical()),
                                    ),
                                    validator: (val) =>
                                        val.isEmpty ? 'Field is empty' : null,
                                    //onSaved: (val) => result = val,
                                    //validator: _validateEmail,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 5, right: 5, bottom: 5),
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(top: 5, bottom: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Container(
                                        //color: Colors.grey[200],
                                        //padding: EdgeInsets.all(20),
                                        child: Text(
                                      "Username",
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontWeight: FontWeight.bold),
                                    )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 0, right: 5, bottom: 5),
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0)),
                                      color: Colors.white,
                                      border: Border.all(
                                          width: 0.5, color: Colors.grey)),
                                  child: TextFormField(
                                    autofocus: false,
                                    decoration: InputDecoration(
                                      icon: const Icon(
                                        Icons.account_box,
                                        color: Colors.black38,
                                      ),
                                      hintText: 'Type your username...',
                                      //labelText: 'Enter E-mail',
                                      contentPadding: EdgeInsets.fromLTRB(
                                          0.0, 10.0, 20.0, 10.0),
                                      border: InputBorder.none,
                                      //border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                                      //border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                                      //border: OutlineInputBorder(borderRadius: BorderRadius.vertical()),
                                    ),
                                    validator: (val) =>
                                        val.isEmpty ? 'Field is empty' : null,
                                    //onSaved: (val) => result = val,
                                    //validator: _validateEmail,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 5, right: 5, bottom: 5),
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(top: 5, bottom: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Container(
                                        //color: Colors.grey[200],
                                        //padding: EdgeInsets.all(20),
                                        child: Text(
                                      "Country",
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontWeight: FontWeight.bold),
                                    )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 0, right: 5, bottom: 5),
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0)),
                                      color: Colors.white,
                                      border: Border.all(
                                          width: 0.5, color: Colors.grey)),
                                  child: TextFormField(
                                    autofocus: false,
                                    decoration: InputDecoration(
                                      icon: const Icon(
                                        Icons.location_searching,
                                        color: Colors.black38,
                                      ),
                                      hintText: 'Type your country...',
                                      //labelText: 'Enter E-mail',
                                      contentPadding: EdgeInsets.fromLTRB(
                                          0.0, 10.0, 20.0, 10.0),
                                      border: InputBorder.none,
                                      //border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                                      //border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                                      //border: OutlineInputBorder(borderRadius: BorderRadius.vertical()),
                                    ),
                                    validator: (val) =>
                                        val.isEmpty ? 'Field is empty' : null,
                                    //onSaved: (val) => result = val,
                                    //validator: _validateEmail,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 5, right: 5, bottom: 5),
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(top: 5, bottom: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Container(
                                        //color: Colors.grey[200],
                                        //padding: EdgeInsets.all(20),
                                        child: Text(
                                      "Address",
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontWeight: FontWeight.bold),
                                    )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 0, right: 5, bottom: 5),
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0)),
                                      color: Colors.white,
                                      border: Border.all(
                                          width: 0.5, color: Colors.grey)),
                                  child: TextFormField(
                                    autofocus: false,
                                    decoration: InputDecoration(
                                      icon: const Icon(
                                        Icons.location_city,
                                        color: Colors.black38,
                                      ),
                                      hintText: 'Type your address...',
                                      //labelText: 'Enter E-mail',
                                      contentPadding: EdgeInsets.fromLTRB(
                                          0.0, 10.0, 20.0, 10.0),
                                      border: InputBorder.none,
                                      //border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                                      //border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                                      //border: OutlineInputBorder(borderRadius: BorderRadius.vertical()),
                                    ),
                                    validator: (val) =>
                                        val.isEmpty ? 'Field is empty' : null,
                                    //onSaved: (val) => result = val,
                                    //validator: _validateEmail,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 5, right: 5, bottom: 5),
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(top: 5, bottom: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Container(
                                        //color: Colors.grey[200],
                                        //padding: EdgeInsets.all(20),
                                        child: Text(
                                      "Email",
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontWeight: FontWeight.bold),
                                    )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 0, right: 5, bottom: 5),
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0)),
                                      color: Colors.white,
                                      border: Border.all(
                                          width: 0.5, color: Colors.grey)),
                                  child: TextFormField(
                                    autofocus: false,
                                    decoration: InputDecoration(
                                      icon: const Icon(
                                        Icons.email,
                                        color: Colors.black38,
                                      ),
                                      hintText: 'Type your email...',
                                      //labelText: 'Enter E-mail',
                                      contentPadding: EdgeInsets.fromLTRB(
                                          0.0, 10.0, 20.0, 10.0),
                                      border: InputBorder.none,
                                      //border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                                      //border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                                      //border: OutlineInputBorder(borderRadius: BorderRadius.vertical()),
                                    ),
                                    validator: (val) =>
                                        val.isEmpty ? 'Field is empty' : null,
                                    //onSaved: (val) => result = val,
                                    //validator: _validateEmail,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 5, right: 5, bottom: 5),
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(top: 5, bottom: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Container(
                                        //color: Colors.grey[200],
                                        //padding: EdgeInsets.all(20),
                                        child: Text(
                                      "Phone number",
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontWeight: FontWeight.bold),
                                    )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 0, right: 5, bottom: 5),
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0)),
                                      color: Colors.white,
                                      border: Border.all(
                                          width: 0.5, color: Colors.grey)),
                                  child: TextFormField(
                                    autofocus: false,
                                    decoration: InputDecoration(
                                      icon: const Icon(
                                        Icons.phone,
                                        color: Colors.black38,
                                      ),
                                      hintText: 'Type your phone number...',
                                      //labelText: 'Enter E-mail',
                                      contentPadding: EdgeInsets.fromLTRB(
                                          0.0, 10.0, 20.0, 10.0),
                                      border: InputBorder.none,
                                      //border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                                      //border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                                      //border: OutlineInputBorder(borderRadius: BorderRadius.vertical()),
                                    ),
                                    validator: (val) =>
                                        val.isEmpty ? 'Field is empty' : null,
                                    //onSaved: (val) => result = val,
                                    //validator: _validateEmail,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 5, right: 5, bottom: 5),
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(top: 5, bottom: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Container(
                                        //color: Colors.grey[200],
                                        //padding: EdgeInsets.all(20),
                                        child: Text(
                                      "Password",
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontWeight: FontWeight.bold),
                                    )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 0, right: 5, bottom: 5),
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0)),
                                      color: Colors.white,
                                      border: Border.all(
                                          width: 0.5, color: Colors.grey)),
                                  child: TextFormField(
                                    autofocus: false,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      icon: const Icon(
                                        Icons.lock,
                                        color: Colors.black38,
                                      ),
                                      hintText: 'Type your password...',
                                      //labelText: 'Enter E-mail',
                                      contentPadding: EdgeInsets.fromLTRB(
                                          0.0, 10.0, 20.0, 10.0),
                                      border: InputBorder.none,
                                      //border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                                      //border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                                      //border: OutlineInputBorder(borderRadius: BorderRadius.vertical()),
                                    ),
                                    validator: (val) =>
                                        val.isEmpty ? 'Field is empty' : null,
                                    //onSaved: (val) => result = val,
                                    //validator: _validateEmail,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 5, right: 5, bottom: 5),
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(top: 5, bottom: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Container(
                                        //color: Colors.grey[200],
                                        //padding: EdgeInsets.all(20),
                                        child: Text(
                                      "Confirm Password",
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontWeight: FontWeight.bold),
                                    )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 0, right: 5, bottom: 5),
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0)),
                                      color: Colors.white,
                                      border: Border.all(
                                          width: 0.5, color: Colors.grey)),
                                  child: TextFormField(
                                    autofocus: false,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      icon: const Icon(
                                        Icons.lock_open,
                                        color: Colors.black38,
                                      ),
                                      hintText: 'Retype password...',
                                      //labelText: 'Enter E-mail',
                                      contentPadding: EdgeInsets.fromLTRB(
                                          0.0, 10.0, 20.0, 10.0),
                                      border: InputBorder.none,
                                      //border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                                      //border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                                      //border: OutlineInputBorder(borderRadius: BorderRadius.vertical()),
                                    ),
                                    validator: (val) =>
                                        val.isEmpty ? 'Field is empty' : null,
                                    //onSaved: (val) => result = val,
                                    //validator: _validateEmail,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),
                Container(
                    width: MediaQuery.of(context).size.width,
                    margin:
                        EdgeInsets.only(top: 5, left: 20, right: 20, bottom: 5),
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        color: Colors.white,
                        border: Border.all(width: 0.2, color: Colors.grey)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Card Information",
                          style: TextStyle(fontSize: 17, color: Colors.black),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: <Widget>[
                            // Checkbox(
                            //   checkColor: mainheader,
                            //   activeColor: Colors.white,
                            //   onChanged: (bool value) {
                            //     setState(() {
                            //       _cardInfo = value;
                            //     });
                            //   },
                            //   value: _cardInfo,
                            // ),
                            cardStatus % 2 != 0
                                ? Container(
                                    margin: EdgeInsets.all(5),
                                    child: Icon(
                                      Icons.done,
                                      color: mainheader,
                                      size: 17,
                                    ))
                                : Container(),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  cardStatus++;
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.only(
                                    right: 5, top: 5, bottom: 5),
                                child: Text(
                                  cardStatus % 2 != 0
                                      ? "I don't have any card"
                                      : "Don't have any card?",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                        cardStatus % 2 != 0
                            ? Container()
                            : Container(
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.only(
                                          top: 15, right: 5, bottom: 5),
                                      width: MediaQuery.of(context).size.width,
                                      child: Column(
                                        children: <Widget>[
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: 5, bottom: 5),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Container(
                                                    //color: Colors.grey[200],
                                                    //padding: EdgeInsets.all(20),
                                                    child: Text(
                                                  "Card Number",
                                                  style: TextStyle(
                                                      color: Colors.black54,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                          top: 0, right: 5, bottom: 5),
                                      width: MediaQuery.of(context).size.width,
                                      child: Center(
                                        child: Column(
                                          children: <Widget>[
                                            Container(
                                              padding: EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(5.0)),
                                                  color: Colors.white,
                                                  border: Border.all(
                                                      width: 0.5,
                                                      color: Colors.grey)),
                                              child: TextFormField(
                                                autofocus: false,
                                                decoration: InputDecoration(
                                                  icon: const Icon(
                                                    Icons.credit_card,
                                                    color: Colors.black38,
                                                  ),
                                                  hintText:
                                                      'Type card number...',
                                                  //labelText: 'Enter E-mail',
                                                  contentPadding:
                                                      EdgeInsets.fromLTRB(0.0,
                                                          10.0, 20.0, 10.0),
                                                  border: InputBorder.none,
                                                  //border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                                                  //border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                                                  //border: OutlineInputBorder(borderRadius: BorderRadius.vertical()),
                                                ),
                                                validator: (val) => val.isEmpty
                                                    ? 'Field is empty'
                                                    : null,
                                                //onSaved: (val) => result = val,
                                                //validator: _validateEmail,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                          top: 5, right: 5, bottom: 5),
                                      width: MediaQuery.of(context).size.width,
                                      child: Column(
                                        children: <Widget>[
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: 5, bottom: 5),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Container(
                                                    //color: Colors.grey[200],
                                                    //padding: EdgeInsets.all(20),
                                                    child: Text(
                                                  "Card Owner",
                                                  style: TextStyle(
                                                      color: Colors.black54,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                          top: 0, right: 5, bottom: 5),
                                      width: MediaQuery.of(context).size.width,
                                      child: Center(
                                        child: Column(
                                          children: <Widget>[
                                            Container(
                                              padding: EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(5.0)),
                                                  color: Colors.white,
                                                  border: Border.all(
                                                      width: 0.5,
                                                      color: Colors.grey)),
                                              child: TextFormField(
                                                autofocus: false,
                                                decoration: InputDecoration(
                                                  icon: const Icon(
                                                    Icons.account_circle,
                                                    color: Colors.black38,
                                                  ),
                                                  hintText: 'Type your name...',
                                                  //labelText: 'Enter E-mail',
                                                  contentPadding:
                                                      EdgeInsets.fromLTRB(0.0,
                                                          10.0, 20.0, 10.0),
                                                  border: InputBorder.none,
                                                  //border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                                                  //border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                                                  //border: OutlineInputBorder(borderRadius: BorderRadius.vertical()),
                                                ),
                                                validator: (val) => val.isEmpty
                                                    ? 'Field is empty'
                                                    : null,
                                                //onSaved: (val) => result = val,
                                                //validator: _validateEmail,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                          top: 5, right: 5, bottom: 5),
                                      width: MediaQuery.of(context).size.width,
                                      child: Column(
                                        children: <Widget>[
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: 5, bottom: 5),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Container(
                                                    //color: Colors.grey[200],
                                                    //padding: EdgeInsets.all(20),
                                                    child: Text(
                                                  "Expiry Date",
                                                  style: TextStyle(
                                                      color: Colors.black54,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                          top: 0, right: 5, bottom: 5),
                                      //width: MediaQuery.of(context).size.width,
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: Container(
                                              //width: MediaQuery.of(context).size.width,
                                              padding: EdgeInsets.only(
                                                  top: 5, bottom: 5),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(5.0)),
                                                  color: Colors.white,
                                                  border: Border.all(
                                                      width: 0.5,
                                                      color: Colors.grey)),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  Row(
                                                    children: <Widget>[
                                                      Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 5),
                                                        child: Icon(
                                                          Icons.calendar_today,
                                                          color: Colors.black38,
                                                        ),
                                                      ),
                                                      Container(
                                                        width: 50,
                                                        margin: EdgeInsets.only(
                                                            left: 17),
                                                        child: TextField(
                                                          autofocus: false,
                                                          controller:
                                                              _dayController,
                                                          decoration:
                                                              InputDecoration(
                                                            hintText: "dd",
                                                            border: InputBorder
                                                                .none,
                                                          ),
                                                        ),
                                                      ),
                                                      Text("/"),
                                                      Container(
                                                        width: 50,
                                                        margin: EdgeInsets.only(
                                                            left: 17),
                                                        child: TextField(
                                                          autofocus: false,
                                                          controller:
                                                              _monthController,
                                                          decoration:
                                                              InputDecoration(
                                                            hintText: "mm",
                                                            border: InputBorder
                                                                .none,
                                                          ),
                                                        ),
                                                      ),
                                                      // Container(
                                                      //   child: Text(
                                                      //     "Date",
                                                      //     style: TextStyle(
                                                      //         color: Colors.black54,
                                                      //         fontSize: 16),
                                                      //   ),
                                                      //   margin: EdgeInsets.only(left: 17),
                                                      // ),
                                                    ],
                                                  ),
                                                  // Container(
                                                  //   child: Text(
                                                  //     "Choose",
                                                  //     style: TextStyle(
                                                  //         color: mainheader,
                                                  //         fontSize: 13),
                                                  //   ),
                                                  //   margin: EdgeInsets.only(left: 17, right: 10),
                                                  // )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                          top: 5, right: 5, bottom: 5),
                                      width: MediaQuery.of(context).size.width,
                                      child: Column(
                                        children: <Widget>[
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: 5, bottom: 5),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Container(
                                                    //color: Colors.grey[200],
                                                    //padding: EdgeInsets.all(20),
                                                    child: Text(
                                                  "CVV",
                                                  style: TextStyle(
                                                      color: Colors.black54,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                          top: 0, right: 5, bottom: 5),
                                      width: MediaQuery.of(context).size.width,
                                      child: Center(
                                        child: Column(
                                          children: <Widget>[
                                            Container(
                                              padding: EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(5.0)),
                                                  color: Colors.white,
                                                  border: Border.all(
                                                      width: 0.5,
                                                      color: Colors.grey)),
                                              child: TextFormField(
                                                autofocus: false,
                                                obscureText: true,
                                                decoration: InputDecoration(
                                                  icon: const Icon(
                                                    Icons.supervisor_account,
                                                    color: Colors.black38,
                                                  ),
                                                  hintText: 'Type cvv...',
                                                  //labelText: 'Enter E-mail',
                                                  contentPadding:
                                                      EdgeInsets.fromLTRB(0.0,
                                                          10.0, 20.0, 10.0),
                                                  border: InputBorder.none,
                                                  //border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                                                  //border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                                                  //border: OutlineInputBorder(borderRadius: BorderRadius.vertical()),
                                                ),
                                                validator: (val) => val.isEmpty
                                                    ? 'Field is empty'
                                                    : null,
                                                //onSaved: (val) => result = val,
                                                //validator: _validateEmail,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                      ],
                    )),
                Container(
                  padding: EdgeInsets.only(top: 5, right: 5, bottom: 5),
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    margin: EdgeInsets.only(top: 5, bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            //color: Colors.grey[200],
                            //padding: EdgeInsets.all(20),
                            child: Text(
                          "Already have an account?",
                          style: TextStyle(color: Colors.grey),
                        )),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()),
                            );
                          },
                          child: Container(
                              margin: EdgeInsets.only(left: 5),
                              //color: Colors.grey[200],
                              //padding: EdgeInsets.all(20),
                              child: Text(
                                "Sign In",
                                style: TextStyle(color: mainheader),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(
                        left: 20, right: 20, bottom: 20, top: 10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        color: mainheader,
                        border: Border.all(width: 0.2, color: Colors.grey)),
                    child: Text(
                      "Register",
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    )),
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

import 'dart:ui' as prefix0;

import 'package:ecommerce_app/MainScreens/CheckoutPage/checkout.dart';
import 'package:ecommerce_app/MainScreens/CreateAccountPage/account.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import '../../main.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  TextEditingController _reviewController = TextEditingController();
  Animation<double> animation;
  AnimationController controller;
  bool _isLoggedIn = false;
  String _debugLabelString = "", review = '', runningdate = '';
  bool _requireConsent = false;
  var dd, finalDate;
  DateTime _date = DateTime.now();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                     Text("Login",
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
                        // Text(
                        //   "Login",
                        //   style: TextStyle(fontSize: 17, color: Colors.black),
                        //   textAlign: TextAlign.center,
                        // ),
                        // SizedBox(
                        //   height: 10,
                        // ),
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
                                      style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
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
                          padding:
                              EdgeInsets.only(top: 15, right: 5, bottom: 5),
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
                                      style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
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
                          padding:
                              EdgeInsets.only(top: 15, right: 5, bottom: 5),
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
                                  "Don't have an account?",
                                  style: TextStyle(color: Colors.grey),
                                )),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => AccountPage()),
                                    );
                                  },
                                  child: Container(
                                      margin: EdgeInsets.only(left: 5),
                                      //color: Colors.grey[200],
                                      //padding: EdgeInsets.all(20),
                                      child: Text(
                                        "Sign Up",
                                        style: TextStyle(color: mainheader),
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CheckoutPage()),
                    );
                  },
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(
                          left: 20, right: 20, bottom: 20, top: 10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          color: mainheader,
                          border: Border.all(width: 0.2, color: Colors.grey)),
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

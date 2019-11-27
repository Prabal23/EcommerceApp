import 'dart:ui' as prefix0;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/intl.dart';

import '../../main.dart';

class CheckoutPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CheckoutPageState();
  }
}

class CheckoutPageState extends State<CheckoutPage>
    with SingleTickerProviderStateMixin {
  TextEditingController _reviewController = TextEditingController();
  TextEditingController placeController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  Animation<double> animation;
  AnimationController controller;
  String _debugLabelString = "",
      review = '',
      runningdate = '',
      place = "",
      phone = "",
      payment = "";
  var dd, finalDate;
  int val = 0;
  DateTime _date = DateTime.now();
  bool placeEdit = false, phoneEdit = false, paymentChoose = false;

  @override
  void initState() {
    var now = new DateTime.now();
    runningdate = new DateFormat("dd-MM-yyyy").format(now);
    setState(() {
      placeController.text = "Modina Market";
      phoneController.text = "017XXXXXXXX";
    });
    super.initState();
  }

  // void _getDate() {
  //   final DateTime now = DateTime.now();
  //   final String formattedDateTime1 = _formatDateTime1(now);
  //   setState(() {
  //     runningdate = formattedDateTime1;
  //   });
  // }

  // String _formatDateTime1(DateTime dateTime) {
  //   return DateFormat('dd-MM-yyyy').format(dateTime);
  // }

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(1915),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _date) {
      dd = DateTime.parse(_date.toString());
      finalDate = "${dd.day}-${dd.month}-${dd.year}";
      runningdate = finalDate.toString();
      setState(() {
        _date = picked;
        var dd1 = DateTime.parse(_date.toString());
        var finalDate1 = "${dd1.day}-${dd1.month}-${dd1.year}";
        runningdate = finalDate1.toString();
      });
    }
  }

  int _rating = 0;

  void rate(int rating) {
    //Other actions based on rating such as api calls.
    setState(() {
      _rating = rating;
    });
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
                      Text("Checkout",
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
                          "Deliver To",
                          style: TextStyle(fontSize: 17, color: Colors.black),
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
                                      "Appifylab",
                                      style: TextStyle(color: Colors.black54),
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
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Flexible(
                                      child: Container(
                                        margin:
                                            EdgeInsets.only(top: 5, bottom: 5),
                                        child: Row(
                                          children: <Widget>[
                                            Icon(Icons.location_on,
                                                color: Colors.grey, size: 16),
                                            Flexible(
                                              child: placeEdit == true
                                                  ? Container(
                                                      //height: 100,
                                                      child: new TextField(
                                                        maxLines: null,
                                                        autofocus: true,
                                                        style: TextStyle(
                                                          color: Colors.black45,
                                                          fontSize: 14,
                                                          fontFamily: 'Oswald',
                                                        ),
                                                        controller:
                                                            placeController,
                                                        decoration:
                                                            InputDecoration(
                                                          alignLabelWithHint:
                                                              true,
                                                          hintText:
                                                              "Place name",
                                                          hintStyle: TextStyle(
                                                              color: Colors
                                                                  .black54,
                                                              fontSize: 14,
                                                              fontFamily:
                                                                  'Oswald',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300),
                                                          contentPadding:
                                                              EdgeInsets
                                                                  .fromLTRB(
                                                                      5.0,
                                                                      10.0,
                                                                      20.0,
                                                                      10.0),
                                                          border:
                                                              InputBorder.none,
                                                        ),
                                                        onChanged: (value) {
                                                          setState(() {
                                                            place = value;
                                                          });
                                                        },
                                                      ),
                                                    )
                                                  : Container(
                                                      margin: EdgeInsets.only(
                                                          left: 5),
                                                      child: Text(
                                                        "Modina Market",
                                                        style: TextStyle(
                                                            color: Colors.grey),
                                                      )),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if (placeEdit == true) {
                                            placeEdit = false;
                                          } else {
                                            placeEdit = true;
                                          }
                                        });
                                      },
                                      child: Container(
                                          margin: EdgeInsets.only(left: 5),
                                          child: Text(
                                            placeEdit == true ? "Done" : "Edit",
                                            style: TextStyle(color: mainheader),
                                          )),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 0, right: 5, bottom: 5),
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                            child: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Flexible(
                                      child: Container(
                                        margin:
                                            EdgeInsets.only(top: 5, bottom: 5),
                                        child: Row(
                                          children: <Widget>[
                                            Icon(Icons.phone,
                                                color: Colors.grey, size: 16),
                                            Flexible(
                                              child: phoneEdit == true
                                                  ? Container(
                                                      //height: 100,
                                                      child: new TextField(
                                                        maxLines: null,
                                                        autofocus: true,
                                                        style: TextStyle(
                                                          color: Colors.black45,
                                                          fontSize: 14,
                                                          fontFamily: 'Oswald',
                                                        ),
                                                        controller:
                                                            phoneController,
                                                        decoration:
                                                            InputDecoration(
                                                          alignLabelWithHint:
                                                              true,
                                                          hintText:
                                                              "Phone number",
                                                          hintStyle: TextStyle(
                                                              color: Colors
                                                                  .black54,
                                                              fontSize: 14,
                                                              fontFamily:
                                                                  'Oswald',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300),
                                                          contentPadding:
                                                              EdgeInsets
                                                                  .fromLTRB(
                                                                      5.0,
                                                                      10.0,
                                                                      20.0,
                                                                      10.0),
                                                          border:
                                                              InputBorder.none,
                                                        ),
                                                        onChanged: (value) {
                                                          setState(() {
                                                            phone = value;
                                                          });
                                                        },
                                                      ),
                                                    )
                                                  : Container(
                                                      margin: EdgeInsets.only(
                                                          left: 5),
                                                      child: Text(
                                                        "017XXXXXXXX",
                                                        style: TextStyle(
                                                            color: Colors.grey),
                                                      )),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if (phoneEdit == true) {
                                            phoneEdit = false;
                                          } else {
                                            phoneEdit = true;
                                          }
                                        });
                                      },
                                      child: Container(
                                          margin: EdgeInsets.only(left: 5),
                                          child: Text(
                                            phoneEdit == true ? "Done" : "Edit",
                                            style: TextStyle(color: mainheader),
                                          )),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          padding:
                              EdgeInsets.only(top: 20, right: 5, bottom: 3),
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
                                      "Delivery Date",
                                      style: TextStyle(color: Colors.black54),
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
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Container(
                                      margin:
                                          EdgeInsets.only(top: 5, bottom: 5),
                                      child: Row(
                                        children: <Widget>[
                                          Icon(Icons.calendar_today,
                                              color: Colors.grey, size: 16),
                                          Container(
                                              margin: EdgeInsets.only(left: 5),
                                              child: Text(
                                                runningdate,
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              )),
                                        ],
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        _selectDate(context);
                                      },
                                      child: Container(
                                          margin: EdgeInsets.only(left: 5),
                                          child: Text(
                                            "Choose",
                                            style: TextStyle(color: mainheader),
                                          )),
                                    ),
                                  ],
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
                        "Product List",
                        style: TextStyle(fontSize: 17, color: Colors.black),
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
                              margin: EdgeInsets.only(top: 15, bottom: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                      //color: Colors.grey[200],
                                      //padding: EdgeInsets.all(20),
                                      child: Text(
                                    "Product 1",
                                    style: TextStyle(color: Colors.grey),
                                  )),
                                  Container(
                                      child: Row(
                                    children: <Widget>[
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            val--;
                                            if (val <= 0) {
                                              val = 0;
                                            }
                                          });
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.grey[500]),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          padding: EdgeInsets.all(2),
                                          margin: EdgeInsets.only(
                                              left: 3, right: 10),
                                          child: Icon(Icons.remove,
                                              size: 15, color: Colors.black54),
                                        ),
                                      ),
                                      Text(
                                        "$val",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(color: Colors.black54),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            val++;
                                          });
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.grey[500]),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          padding: EdgeInsets.all(2),
                                          margin: EdgeInsets.only(
                                              left: 10, right: 3),
                                          child: Icon(Icons.add,
                                              size: 15, color: Colors.black54),
                                        ),
                                      ),
                                    ],
                                  ))
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 15, bottom: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                      //color: Colors.grey[200],
                                      //padding: EdgeInsets.all(20),
                                      child: Text(
                                    "Product 2",
                                    style: TextStyle(color: Colors.grey),
                                  )),
                                  Container(
                                      child: Row(
                                    children: <Widget>[
                                      Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey[500]),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        padding: EdgeInsets.all(2),
                                        margin:
                                            EdgeInsets.only(left: 3, right: 10),
                                        child: Icon(Icons.remove,
                                            size: 15, color: Colors.black54),
                                      ),
                                      Text(
                                        "2",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(color: Colors.black54),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey[500]),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        padding: EdgeInsets.all(2),
                                        margin:
                                            EdgeInsets.only(left: 10, right: 3),
                                        child: Icon(Icons.add,
                                            size: 15, color: Colors.black54),
                                      ),
                                    ],
                                  ))
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 15, bottom: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                      //color: Colors.grey[200],
                                      //padding: EdgeInsets.all(20),
                                      child: Text(
                                    "Product 3",
                                    style: TextStyle(color: Colors.grey),
                                  )),
                                  Container(
                                      child: Row(
                                    children: <Widget>[
                                      Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey[500]),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        padding: EdgeInsets.all(2),
                                        margin:
                                            EdgeInsets.only(left: 3, right: 10),
                                        child: Icon(Icons.remove,
                                            size: 15, color: Colors.black54),
                                      ),
                                      Text(
                                        "3",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(color: Colors.black54),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey[500]),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        padding: EdgeInsets.all(2),
                                        margin:
                                            EdgeInsets.only(left: 10, right: 3),
                                        child: Icon(Icons.add,
                                            size: 15, color: Colors.black54),
                                      ),
                                    ],
                                  ))
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 15, bottom: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                      //color: Colors.grey[200],
                                      //padding: EdgeInsets.all(20),
                                      child: Text(
                                    "Product 4",
                                    style: TextStyle(color: Colors.grey),
                                  )),
                                  Container(
                                      child: Row(
                                    children: <Widget>[
                                      Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey[500]),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        padding: EdgeInsets.all(2),
                                        margin:
                                            EdgeInsets.only(left: 3, right: 10),
                                        child: Icon(Icons.remove,
                                            size: 15, color: Colors.black54),
                                      ),
                                      Text(
                                        "4",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(color: Colors.black54),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey[500]),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        padding: EdgeInsets.all(2),
                                        margin:
                                            EdgeInsets.only(left: 10, right: 3),
                                        child: Icon(Icons.add,
                                            size: 15, color: Colors.black54),
                                      ),
                                    ],
                                  ))
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
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
                        "Apply Coupon",
                        style: TextStyle(fontSize: 17, color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 0,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Flexible(
                              child: Container(
                                child: TextField(
                                  autofocus: false,
                                  controller: _reviewController,
                                  decoration: InputDecoration(
                                      hintText: "Type coupon number..."),
                                  onChanged: (value) {
                                    review = value;
                                  },
                                ),
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.only(left: 10),
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.0)),
                                    color: mainheader,
                                    border: Border.all(
                                        width: 0.2, color: Colors.grey)),
                                child: Text(
                                  "Apply",
                                  style: TextStyle(color: Colors.white),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
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
                        "Shopping Details",
                        style: TextStyle(fontSize: 17, color: Colors.black),
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
                                    "Total Products",
                                    style: TextStyle(color: Colors.grey),
                                  )),
                                  Container(
                                      child: Text(
                                    "4",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(color: Colors.black54),
                                  ))
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 15, bottom: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                      //color: Colors.grey[200],
                                      //padding: EdgeInsets.all(20),
                                      child: Text(
                                    "Total Price",
                                    style: TextStyle(color: Colors.grey),
                                  )),
                                  Container(
                                      child: Row(
                                    children: <Widget>[
                                      Icon(Icons.attach_money,
                                          size: 15, color: Colors.black54),
                                      Text(
                                        "250.25",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(color: Colors.black54),
                                      ),
                                    ],
                                  ))
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 15, bottom: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                      //color: Colors.grey[200],
                                      //padding: EdgeInsets.all(20),
                                      child: Text(
                                    "Discount",
                                    style: TextStyle(color: Colors.grey),
                                  )),
                                  Container(
                                      child: Row(
                                    children: <Widget>[
                                      Icon(Icons.remove,
                                          size: 15, color: mainheader),
                                      Icon(Icons.attach_money,
                                          size: 15, color: mainheader),
                                      Text(
                                        "50.05",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(color: mainheader),
                                      ),
                                    ],
                                  ))
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 15, bottom: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                      //color: Colors.grey[200],
                                      //padding: EdgeInsets.all(20),
                                      child: Text(
                                    "Sub Total",
                                    style: TextStyle(color: Colors.grey),
                                  )),
                                  Container(
                                      child: Row(
                                    children: <Widget>[
                                      Icon(Icons.attach_money,
                                          size: 15, color: Colors.black54),
                                      Text(
                                        "200.20",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(color: Colors.black54),
                                      ),
                                    ],
                                  ))
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 15, bottom: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                      //color: Colors.grey[200],
                                      //padding: EdgeInsets.all(20),
                                      child: Text(
                                    "Coupon Discount",
                                    style: TextStyle(color: Colors.grey),
                                  )),
                                  Container(
                                      child: Row(
                                    children: <Widget>[
                                      Icon(Icons.remove,
                                          size: 15, color: mainheader),
                                      Icon(Icons.attach_money,
                                          size: 15, color: mainheader),
                                      Text(
                                        "0.00",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(color: mainheader),
                                      ),
                                    ],
                                  ))
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 15, bottom: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                      //color: Colors.grey[200],
                                      //padding: EdgeInsets.all(20),
                                      child: Text(
                                    "Shipping Cost",
                                    style: TextStyle(color: Colors.grey),
                                  )),
                                  Container(
                                      child: Row(
                                    children: <Widget>[
                                      Icon(Icons.attach_money,
                                          size: 15, color: Colors.black54),
                                      Text(
                                        "100.00",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(color: Colors.black54),
                                      ),
                                    ],
                                  ))
                                ],
                              ),
                            ),
                            Divider(
                              color: Colors.grey,
                            ),
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
                                    "Total Payable",
                                    style: TextStyle(color: Colors.grey),
                                  )),
                                  Container(
                                      child: Row(
                                    children: <Widget>[
                                      Icon(Icons.attach_money,
                                          size: 15, color: Colors.black),
                                      Text(
                                        "300.20",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ))
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
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
                        "Payment Details",
                        style: TextStyle(fontSize: 17, color: Colors.black),
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
                              padding:
                                  EdgeInsets.only(top: 5, right: 5, bottom: 5),
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
                                          "Card Payment",
                                          style: TextStyle(color: Colors.grey),
                                        )),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding:
                                  EdgeInsets.only(top: 0, right: 5, bottom: 5),
                              width: MediaQuery.of(context).size.width,
                              child: Center(
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: 5, bottom: 5),
                                          child: Row(
                                            children: <Widget>[
                                              Icon(Icons.credit_card,
                                                  color: Colors.grey, size: 16),
                                              Container(
                                                  margin:
                                                      EdgeInsets.only(left: 5),
                                                  child: Text(
                                                    "XXX xxxx XXX xxxx",
                                                    style: TextStyle(
                                                        color: Colors.grey),
                                                  )),
                                            ],
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            //paymentSelect();
                                            setState(() {
                                              paymentChoose = false;
                                            });
                                          },
                                          child: Container(
                                              decoration: BoxDecoration(
                                                color: paymentChoose == false
                                                    ? mainheader
                                                    : Colors.grey[200],
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5)),
                                              ),
                                              padding: EdgeInsets.all(2),
                                              margin: EdgeInsets.only(left: 5),
                                              child: Icon(Icons.done,
                                                  color: paymentChoose == false
                                                      ? Colors.white
                                                      : Colors.grey,
                                                  size: 15)),
                                        ),
                                      ],
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
                                          "Cash on delivery",
                                          style: TextStyle(color: Colors.grey),
                                        )),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding:
                                  EdgeInsets.only(top: 0, right: 5, bottom: 5),
                              width: MediaQuery.of(context).size.width,
                              child: Center(
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: 5, bottom: 5),
                                          child: Row(
                                            children: <Widget>[
                                              Icon(Icons.location_on,
                                                  color: Colors.grey, size: 16),
                                              Container(
                                                  margin:
                                                      EdgeInsets.only(left: 5),
                                                  child: Text(
                                                    "Modina Market",
                                                    style: TextStyle(
                                                        color: Colors.grey),
                                                  )),
                                            ],
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            //paymentSelect();
                                            setState(() {
                                              paymentChoose = true;
                                            });
                                          },
                                          child: Container(
                                              decoration: BoxDecoration(
                                                color: paymentChoose == true
                                                    ? mainheader
                                                    : Colors.grey[200],
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5)),
                                              ),
                                              padding: EdgeInsets.all(2),
                                              margin: EdgeInsets.only(left: 5),
                                              child: Icon(Icons.done,
                                                  color: paymentChoose == true
                                                      ? Colors.white
                                                      : Colors.grey,
                                                  size: 15)),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
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
                      "Submit Order",
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void paymentSelect() {
    if (paymentChoose == false) {
      setState(() {
        paymentChoose = true;
      });
    } else {
      setState(() {
        paymentChoose = false;
      });
    }
  }
}

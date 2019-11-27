import 'dart:ui' as prefix0;

import 'package:ecommerce_app/MainScreens/ProductDetailsPage/details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/intl.dart';

import '../../main.dart';

class OrderListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return OrderListPageState();
  }
}

class OrderListPageState extends State<OrderListPage>
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
    // runningdate = _formatDateTime1(DateTime.now());
    // Timer.periodic(Duration(seconds: 1), (Timer t) => _getDate());
    var now = new DateTime.now();
    runningdate = new DateFormat("dd-MM-yyyy").format(now);
    super.initState();
  }

  void _getDate() {
    final DateTime now = DateTime.now();
    final String formattedDateTime1 = _formatDateTime1(now);
    setState(() {
      runningdate = formattedDateTime1;
    });
  }

  String _formatDateTime1(DateTime dateTime) {
    return DateFormat('dd-MM-yyyy').format(dateTime);
  }

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
      //print('Birth Date : $finalDate');
      //print('Birth Date : $date');
      setState(() {
        _date = picked;
        var dd1 = DateTime.parse(_date.toString());
        var finalDate1 = "${dd1.day}-${dd1.month}-${dd1.year}";
        runningdate = finalDate1.toString();
        // DateTime dateTime = DateTime.parse(date);
        // Fluttertoast.showToast(msg: dateTime.toString(),toastLength: Toast.LENGTH_SHORT);
        // _date = dateTime;
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
                      Text("Order details",
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
      body: SingleChildScrollView(
        child: Container(
          color: sub_white,
          //height: MediaQuery.of(context).size.height,
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // GestureDetector(
                //   onTap: () {
                //     viewProducts();
                //   },
                //   child: Container(
                //       width: MediaQuery.of(context).size.width,
                //       margin: EdgeInsets.only(
                //           top: 5, left: 20, right: 20, bottom: 5),
                //       padding: EdgeInsets.all(15),
                //       decoration: BoxDecoration(
                //           borderRadius: BorderRadius.all(Radius.circular(5.0)),
                //           color: Colors.white,
                //           border: Border.all(width: 0.2, color: Colors.grey)),
                //       child: Column(
                //         children: <Widget>[
                //           Text(
                //             "View Products",
                //             style: TextStyle(
                //                 fontSize: 17,
                //                 color: mainheader,
                //                 fontWeight: FontWeight.bold),
                //             textAlign: TextAlign.center,
                //           ),
                //         ],
                //       )),
                // ),
                Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(
                        top: 10, left: 20, right: 20, bottom: 5),
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        color: Colors.white,
                        border: Border.all(width: 0.2, color: Colors.grey)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Delivered To",
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
                                    Container(
                                      margin:
                                          EdgeInsets.only(top: 5, bottom: 5),
                                      child: Row(
                                        children: <Widget>[
                                          Icon(Icons.location_on,
                                              color: Colors.grey, size: 16),
                                          Container(
                                              margin: EdgeInsets.only(left: 5),
                                              child: Text(
                                                "Modina Market",
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              )),
                                        ],
                                      ),
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
                                    Container(
                                      margin:
                                          EdgeInsets.only(top: 5, bottom: 5),
                                      child: Row(
                                        children: <Widget>[
                                          Icon(Icons.phone,
                                              color: Colors.grey, size: 16),
                                          Container(
                                              margin: EdgeInsets.only(left: 5),
                                              child: Text(
                                                "017XXXXXXXX",
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              )),
                                        ],
                                      ),
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
                                      Text(
                                        "1",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(color: Colors.black54),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.only(left: 3, right: 3),
                                        child: Icon(Icons.close,
                                            size: 15, color: Colors.black54),
                                      ),
                                      Icon(Icons.attach_money,
                                          size: 15, color: Colors.black54),
                                      Text(
                                        "50.10",
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
                                    "Product 2",
                                    style: TextStyle(color: Colors.grey),
                                  )),
                                  Container(
                                      child: Row(
                                    children: <Widget>[
                                      Text(
                                        "2",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(color: Colors.black54),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.only(left: 3, right: 3),
                                        child: Icon(Icons.close,
                                            size: 15, color: Colors.black54),
                                      ),
                                      Icon(Icons.attach_money,
                                          size: 15, color: Colors.black54),
                                      Text(
                                        "12.50",
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
                                    "Product 3",
                                    style: TextStyle(color: Colors.grey),
                                  )),
                                  Container(
                                      child: Row(
                                    children: <Widget>[
                                      Text(
                                        "1",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(color: Colors.black54),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.only(left: 3, right: 3),
                                        child: Icon(Icons.close,
                                            size: 15, color: Colors.black54),
                                      ),
                                      Icon(Icons.attach_money,
                                          size: 15, color: Colors.black54),
                                      Text(
                                        "75.15",
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
                                    "Product 4",
                                    style: TextStyle(color: Colors.grey),
                                  )),
                                  Container(
                                      child: Row(
                                    children: <Widget>[
                                      Text(
                                        "4",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(color: Colors.black54),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.only(left: 3, right: 3),
                                        child: Icon(Icons.close,
                                            size: 15, color: Colors.black54),
                                      ),
                                      Icon(Icons.attach_money,
                                          size: 15, color: Colors.black54),
                                      Text(
                                        "25.00",
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
                                    "Total Price",
                                    style: TextStyle(color: Colors.grey),
                                  )),
                                  Container(
                                      child: Row(
                                    children: <Widget>[
                                      Icon(Icons.attach_money,
                                          size: 15, color: Colors.black),
                                      Text(
                                        "250.25",
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
                                  EdgeInsets.only(top: 0, right: 5, bottom: 5),
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  void viewProducts() {
    showDialog<String>(
      context: context,
      barrierDismissible:
          true, // dialog is dismissible with a tap on the barrier
      builder: (BuildContext context) {
        return Theme(
          data: Theme.of(context).copyWith(dialogBackgroundColor: sub_white),
          child: AlertDialog(
            // title: new Text(
            //   proImage + '$photo',
            //   style: TextStyle(color: Colors.white),
            // ),
            content: Container(
              margin: EdgeInsets.only(left: 0, right: 0, top: 0),
              color: sub_white,
              width: MediaQuery.of(context).size.width,
              child: new ListView.builder(
                itemBuilder: (BuildContext context, int index) => new Container(
                  margin: EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(1.0)),
                      color: Colors.white,
                      border: Border.all(width: 0.2, color: Colors.grey)),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DetailsPage()),
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
                                    margin: EdgeInsets.only(right: 10, left: 0),
                                    height: 90,
                                    child: Image.asset('assets/shoe.png')),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "Product Name hghgjhgjgjh",
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: Colors.black54),
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
                                            Container(
                                              margin: EdgeInsets.only(left: 3),
                                              child: Text(
                                                "4.5",
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              ),
                                            )
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
                                                  color: Colors.grey,
                                                  size: 17,
                                                ),
                                                SizedBox(
                                                  width: 3,
                                                ),
                                                Text(
                                                  "20.25",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.grey,
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
                          // Container(
                          //     margin: EdgeInsets.only(right: 5),
                          //     child: Column(
                          //       children: <Widget>[
                          //         Container(
                          //           color: Colors.white,
                          //           child: Icon(
                          //             Icons.chevron_right,
                          //             color: Colors.grey,
                          //           ),
                          //         ),
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
            actions: <Widget>[
              new FlatButton(
                child: new Text(
                  "OK",
                  style: TextStyle(color: mainheader),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          ),
        );
      },
    );
  }
}

import 'dart:ui' as prefix0;

import 'package:ecommerce_app/MainScreens/CheckoutPage/checkout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';

import '../../main.dart';

class DetailsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DetailsPageState();
  }
}

class DetailsPageState extends State<DetailsPage>
    with SingleTickerProviderStateMixin {
  TextEditingController _reviewController = TextEditingController();
  Animation<double> animation;
  AnimationController controller;
  bool _isLoggedIn = false;
  String _debugLabelString = "", review = '', _ratingStatus = '';
  bool _requireConsent = false;
  CarouselSlider carouselSlider;
  int _current = 0, num = 0;
  double tk = 0.0;
  List imgList = [
    "assets/tshirt.png",
    "assets/shirt.jpg",
    "assets/pant.jpg",
    "assets/shoe.png"
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  void initState() {
    super.initState();
  }

  int _rating = 0;

  void rate(int rating) {
    if (rating == 1) {
      _ratingStatus = "Poor";
    }
    if (rating == 2) {
      _ratingStatus = "Average";
    }
    if (rating == 3) {
      _ratingStatus = "Good";
    }
    if (rating == 4) {
      _ratingStatus = "Very Good";
    }
    if (rating == 5) {
      _ratingStatus = "Excellent";
    }
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
                      Text("Product details",
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
                Stack(
                  children: <Widget>[
                    Container(
                        height: 300,
                        child: Container(
                          margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              color: Colors.white,
                              border:
                                  Border.all(width: 0.2, color: Colors.grey)),
                          // child: Image.asset(
                          //   'assets/shoe.png',
                          // ),
                          // child: new Container(
                          //   //height: 200.0,
                          //   width: MediaQuery.of(context).size.width,
                          //   child: new Carousel(
                          //     images: [
                          //       //new NetworkImage('https://cdn-images-1.medium.com/max/2000/1*GqdzzfB_BHorv7V2NV7Jgg.jpeg'),
                          //       new AssetImage("assets/tshirt.png"),
                          //       new AssetImage("assets/shirt.jpg"),
                          //       new AssetImage("assets/pant.jpg"),
                          //       new AssetImage("assets/shoe.png")
                          //     ],
                          //     dotSize: 4.0,
                          //     dotSpacing: 15.0,
                          //     dotColor: Colors.white,
                          //     indicatorBgPadding: 5.0,
                          //     dotBgColor: mainheader.withOpacity(0.5),
                          //     borderRadius: true,
                          //     autoplay: false,
                          //     boxFit: BoxFit.contain,
                          //   ),
                          // ),
                          child: CarouselSlider(
                            //height: 400.0,
                            initialPage: 0,
                            enlargeCenterPage: true,
                            autoPlay: false,
                            reverse: false,
                            enableInfiniteScroll: true,
                            autoPlayInterval: Duration(seconds: 2),
                            autoPlayAnimationDuration:
                                Duration(milliseconds: 2000),
                            pauseAutoPlayOnTouch: Duration(seconds: 10),
                            scrollDirection: Axis.horizontal,
                            onPageChanged: (index) {
                              setState(() {
                                _current = index;
                              });
                            },
                            items: imgList.map((imgUrl) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return Container(
                                    width: MediaQuery.of(context).size.width,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10.0),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: GestureDetector(
                                      onTap: () {
                                        //viewImage(_current);
                                      },
                                      child: Image.asset(
                                        imgUrl,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  );
                                },
                              );
                            }).toList(),
                          ),
                        )),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: map<Widget>(imgList, (index, url) {
                    return Container(
                      width: _current == index ? 10.0 : 7.0,
                      height: _current == index ? 10.0 : 7.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                            _current == index ? mainheader : Colors.grey[300],
                      ),
                    );
                  }),
                ),
                SizedBox(
                  height: 0,
                ),
                // Container(
                //     width: 50,
                //     child: Divider(
                //       color: mainheader,
                //     )),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin:
                      EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 5),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      color: Colors.white,
                      border: Border.all(width: 0.2, color: Colors.grey)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Product Name",
                        style: TextStyle(fontSize: 17, color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            "Product Code : ",
                            style:
                                TextStyle(fontSize: 14, color: Colors.black45),
                          ),
                          Text("AZ-0Bsd-723",
                              style: TextStyle(
                                fontSize: 14,
                                color: mainheader,
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            "Size : ",
                            style:
                                TextStyle(fontSize: 14, color: Colors.black45),
                          ),
                          Text("9",
                              style: TextStyle(
                                  fontSize: 14, color: Colors.black54))
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(left: 20, right: 20),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      color: Colors.white,
                      border: Border.all(width: 0.2, color: Colors.grey)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.attach_money,
                            color: Colors.black,
                            size: 20,
                          ),
                          SizedBox(
                            width: 0,
                          ),
                          Text(
                            "20.25",
                            style: TextStyle(color: Colors.black, fontSize: 17),
                          )
                        ],
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.star,
                                  color: golden,
                                  size: 20,
                                ),
                                Icon(
                                  Icons.star,
                                  color: golden,
                                  size: 20,
                                ),
                                Icon(
                                  Icons.star,
                                  color: golden,
                                  size: 20,
                                ),
                                Icon(
                                  Icons.star,
                                  color: golden,
                                  size: 20,
                                ),
                                Icon(
                                  Icons.star_half,
                                  color: golden,
                                  size: 20,
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(left: 20, right: 20, top: 5),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      color: Colors.white,
                      border: Border.all(width: 0.2, color: Colors.grey)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          // Icon(Icons.confirmation_number, color: Colors.black),
                          // SizedBox(
                          //   width: 5,
                          // ),
                          Text(
                            "Qty : ",
                            style: TextStyle(fontSize: 14),
                          ),
                          Container(
                              color: Colors.grey[200],
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    color: Colors.white,
                                    child: Icon(
                                      Icons.remove,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    "1",
                                    style: TextStyle(fontSize: 17),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Container(
                                    color: Colors.white,
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              )),
                        ],
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            GestureDetector(
                              onTap: (){
                                setState(() {
                                  num++;
                                  tk += 150.0;
                                });
                              },
                              child: Container(
                                  margin: EdgeInsets.all(5),
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5.0)),
                                      color: mainheader,
                                      border: Border.all(
                                          width: 0.2, color: Colors.grey)),
                                  child: Text(
                                    "Add to cart",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  )),
                            ),
                            Container(
                              //padding: EdgeInsets.all(5),
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.favorite_border,
                                    color: Colors.grey,
                                  ),
                                  Text(
                                    " (10)",
                                    style: TextStyle(
                                        color: Colors.black45, fontSize: 12),
                                  )
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
                        "Product Description",
                        style: TextStyle(fontSize: 17, color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Terms and Conditions agreements act as a legal contract between you (the company) who has the website or mobile app and the user who access your website and mobile app.",
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: 15, color: Colors.black45),
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
                        "Product Features",
                        style: TextStyle(fontSize: 17, color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "1. Durable with 2 years of guarantee.\n2. Safe, versatile and easy to use\n3. Easy storage and portable.\n4. 100% satisfaction guaranteed.",
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: 15, color: Colors.black45),
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
                        "Product Information",
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
                                    "Product dimension",
                                    style: TextStyle(color: Colors.grey),
                                  )),
                                  Container(
                                      child: Text(
                                    "9 inches",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(color: Colors.black54),
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
                                    "Product weight",
                                    style: TextStyle(color: Colors.grey),
                                  )),
                                  Container(
                                      child: Text(
                                    "1 kg",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(color: Colors.black54),
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
                                    "Shipping Weight",
                                    style: TextStyle(color: Colors.grey),
                                  )),
                                  Container(
                                      child: Text(
                                    "1 kg",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(color: Colors.black54),
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
                                    "Manufacturer",
                                    style: TextStyle(color: Colors.grey),
                                  )),
                                  Container(
                                      child: Text(
                                    "Appify Lab",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(color: Colors.black54),
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
                                    "SIN",
                                    style: TextStyle(color: Colors.grey),
                                  )),
                                  Container(
                                      child: Text(
                                    "AZ-0sdf-kdfjg-345",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(color: Colors.black54),
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
                                    "Reference ID",
                                    style: TextStyle(color: Colors.grey),
                                  )),
                                  Container(
                                      child: Text(
                                    "kfull-0906-ks-2",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(color: Colors.black54),
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
                                    "Reviews",
                                    style: TextStyle(color: Colors.grey),
                                  )),
                                  Container(
                                      child: Text(
                                    "4.5 (200+ users)",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(color: Colors.black54),
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
                                    "Best Seller Rank",
                                    style: TextStyle(color: Colors.grey),
                                  )),
                                  Container(
                                      child: Text(
                                    "165",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(color: Colors.black54),
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
                                    "Release date",
                                    style: TextStyle(color: Colors.grey),
                                  )),
                                  Container(
                                      child: Text(
                                    "10/7/2019",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(color: Colors.black54),
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
                  padding:
                      EdgeInsets.only(left: 15, top: 15, bottom: 15, right: 1),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      color: Colors.white,
                      border: Border.all(width: 0.2, color: Colors.grey)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Product Comparison",
                        style: TextStyle(fontSize: 17, color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width / 6,
                            child: Container(
                              //padding: EdgeInsets.only(left: 20),
                              width: 100,
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    height: 100,
                                  ),
                                  Text(
                                    "Name",
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.black38),
                                    textAlign: TextAlign.center,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: Text(
                                      "Rating",
                                      style: TextStyle(
                                          fontSize: 13, color: Colors.black38),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: Text(
                                      "Price",
                                      style: TextStyle(
                                          fontSize: 13, color: Colors.black38),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: Text(
                                      "Shipping",
                                      style: TextStyle(
                                          fontSize: 13, color: Colors.black38),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(left: 0, right: 0),
                              //color: sub_white,
                              width: MediaQuery.of(context).size.width / 1,
                              padding: EdgeInsets.only(left: 10),
                              height: 240,
                              child: new ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemBuilder:
                                    (BuildContext context, int index) =>
                                        new Container(
                                  //color: Colors.white,
                                  margin: EdgeInsets.all(5),
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(1.0)),
                                      color: Colors.white,
                                      border: Border.all(
                                          width: 0.2, color: Colors.grey)),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DetailsPage()),
                                      );
                                    },
                                    child: Container(
                                      //padding: EdgeInsets.only(left: 20),
                                      width: 100,
                                      child: Column(
                                        children: <Widget>[
                                          Container(
                                              height: 100,
                                              child: Image.asset(
                                                  'assets/shirt.jpg')),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "Product Name",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.black38),
                                            textAlign: TextAlign.center,
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                left: 5, top: 5),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
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
                                                  Icons.star,
                                                  color: golden,
                                                  size: 17,
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  color: golden,
                                                  size: 17,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(top: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                Row(
                                                  children: <Widget>[
                                                    Icon(
                                                      Icons.attach_money,
                                                      color: Colors.black54,
                                                      size: 16,
                                                    ),
                                                    Text(
                                                      "20.25",
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          color:
                                                              Colors.black54),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(top: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                Row(
                                                  children: <Widget>[
                                                    Icon(
                                                      Icons.attach_money,
                                                      color: Colors.black54,
                                                      size: 16,
                                                    ),
                                                    Text(
                                                      "20.25",
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          color:
                                                              Colors.black54),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                itemCount: 20,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin:
                      EdgeInsets.only(top: 5, left: 20, right: 20, bottom: 5),
                  padding:
                      EdgeInsets.only(left: 0, top: 15, bottom: 15, right: 1),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      color: Colors.white,
                      border: Border.all(width: 0.2, color: Colors.grey)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 15),
                        child: Text(
                          "Product Reviews",
                          style: TextStyle(fontSize: 17, color: Colors.black),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          // Container(
                          //   width: MediaQuery.of(context).size.width / 6,
                          //   child: Container(
                          //     //padding: EdgeInsets.only(left: 20),
                          //     width: 100,
                          //     child: Column(
                          //       children: <Widget>[
                          //         Container(
                          //           height: 55,
                          //         ),
                          //         Text(
                          //           "Name",
                          //           style: TextStyle(
                          //               fontSize: 13, color: Colors.black38),
                          //           textAlign: TextAlign.center,
                          //         ),
                          //         Container(
                          //           margin: EdgeInsets.only(top: 10),
                          //           child: Text(
                          //             "Rating",
                          //             style: TextStyle(
                          //                 fontSize: 13, color: Colors.black38),
                          //             textAlign: TextAlign.center,
                          //           ),
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(left: 0, right: 0),
                              //color: sub_white,
                              width: MediaQuery.of(context).size.width / 1,
                              padding: EdgeInsets.only(left: 2),
                              height: 250,
                              child: new ListView.builder(
                                //scrollDirection: Axis.horizontal,
                                itemBuilder:
                                    (BuildContext context, int index) =>
                                        new Container(
                                  //color: Colors.white,
                                  margin: EdgeInsets.all(5),
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(1.0)),
                                      color: Colors.white,
                                      border: Border.all(
                                          width: 0.2, color: Colors.grey)),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DetailsPage()),
                                      );
                                    },
                                    child: Container(
                                      //padding: EdgeInsets.only(left: 20),
                                      width: 100,
                                      child: Center(
                                        child: Row(
                                          children: <Widget>[
                                            Container(
                                              //transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                                              padding: EdgeInsets.all(1.0),
                                              child: CircleAvatar(
                                                radius: 25.0,
                                                backgroundColor:
                                                    Colors.transparent,
                                                backgroundImage: AssetImage(
                                                    'assets/logo.png'),
                                              ),
                                              decoration: new BoxDecoration(
                                                color:
                                                    Colors.grey, // border color
                                                shape: BoxShape.circle,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: <Widget>[
                                                      Expanded(
                                                        child: Text(
                                                          "John Smith",
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: TextStyle(
                                                              fontSize: 13,
                                                              color: Colors
                                                                  .black38,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                      Text(
                                                        "July 14, 2019",
                                                        style: TextStyle(
                                                          fontSize: 11,
                                                          color: Colors.grey,
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ],
                                                  ),
                                                  Container(
                                                    margin:
                                                        EdgeInsets.only(top: 5),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: <Widget>[
                                                        Icon(
                                                          Icons.star,
                                                          color: golden,
                                                          size: 14,
                                                        ),
                                                        Icon(
                                                          Icons.star,
                                                          color: golden,
                                                          size: 14,
                                                        ),
                                                        Icon(
                                                          Icons.star,
                                                          color: golden,
                                                          size: 14,
                                                        ),
                                                        Icon(
                                                          Icons.star_half,
                                                          color: golden,
                                                          size: 14,
                                                        ),
                                                        Icon(
                                                          Icons.star_border,
                                                          color: golden,
                                                          size: 14,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    margin:
                                                        EdgeInsets.only(top: 5),
                                                    child: Text(
                                                      "this is a very good product. very useful in reasonable price.",
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          color:
                                                              Colors.black38),
                                                      textAlign:
                                                          TextAlign.justify,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                itemCount: 20,
                              ),
                            ),
                          ),
                        ],
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
                        "Write a review",
                        style: TextStyle(fontSize: 17, color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  new GestureDetector(
                                    child: new Icon(
                                      Icons.star,
                                      color:
                                          _rating >= 1 ? golden : Colors.grey,
                                    ),
                                    onTap: () => rate(1),
                                  ),
                                  new GestureDetector(
                                    child: new Icon(
                                      Icons.star,
                                      color:
                                          _rating >= 2 ? golden : Colors.grey,
                                    ),
                                    onTap: () => rate(2),
                                  ),
                                  new GestureDetector(
                                    child: new Icon(
                                      Icons.star,
                                      color:
                                          _rating >= 3 ? golden : Colors.grey,
                                    ),
                                    onTap: () => rate(3),
                                  ),
                                  new GestureDetector(
                                    child: new Icon(
                                      Icons.star,
                                      color:
                                          _rating >= 4 ? golden : Colors.grey,
                                    ),
                                    onTap: () => rate(4),
                                  ),
                                  new GestureDetector(
                                    child: new Icon(
                                      Icons.star,
                                      color:
                                          _rating >= 5 ? golden : Colors.grey,
                                    ),
                                    onTap: () => rate(5),
                                  )
                                ],
                              ),
                            ],
                          ),
                          Text(
                            _ratingStatus,
                            style: TextStyle(color: mainheader),
                          )
                        ],
                      ),
                      // Container(
                      //   height: 100,
                      //   margin: EdgeInsets.only(top: 15),
                      //   decoration: BoxDecoration(
                      //       borderRadius:
                      //           BorderRadius.all(Radius.circular(5.0)),
                      //       color: Colors.white,
                      //       border: Border.all(width: 0.5, color: Colors.grey)),
                      //   child: TextField(
                      //     autofocus: false,
                      //     controller: _reviewController,
                      //     decoration: InputDecoration(
                      //       hintText: "Type your review...",
                      //       contentPadding:
                      //           EdgeInsets.fromLTRB(0.0, 10.0, 20.0, 10.0),
                      //       border: InputBorder.none,
                      //     ),
                      //     onChanged: (value) {
                      //       review = value;
                      //     },
                      //   ),
                      // ),
                      Container(
                        //height: 100,
                        padding: EdgeInsets.all(5),
                        margin: EdgeInsets.only(top: 15),
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            color: Colors.white,
                            border: Border.all(width: 0.5, color: Colors.grey)),
                        child: new ConstrainedBox(
                          constraints: BoxConstraints(
                            maxHeight: 100.0,
                          ),
                          child: new Scrollbar(
                            child: new SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              reverse: true,
                              child: new TextField(
                                maxLines: null,
                                autofocus: false,
                                controller: _reviewController,
                                decoration: InputDecoration(
                                  hintText: "Type your review...",
                                  contentPadding: EdgeInsets.fromLTRB(
                                      0.0, 10.0, 20.0, 10.0),
                                  border: InputBorder.none,
                                ),
                                onChanged: (value) {
                                  review = value;
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              margin: EdgeInsets.only(top: 10),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                  color: mainheader,
                                  border: Border.all(
                                      width: 0.2, color: Colors.grey)),
                              child: Text(
                                "Submit",
                                style: TextStyle(color: Colors.white),
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: num == 0 && tk == 0.0 ? 0 : 50,
        width: MediaQuery.of(context).size.width,
        color: mainheader,
        child: Container(
          margin: EdgeInsets.only(right: 20, left: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: Text("$num",
                      style: TextStyle(color: Colors.black, fontSize: 13))),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CheckoutPage()));
                  },
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Checkout",
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center),
                        Icon(Icons.keyboard_arrow_right,
                            size: 15, color: Colors.white),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                  child: Row(
                children: <Widget>[
                  Icon(Icons.attach_money, size: 15, color: Colors.white),
                  Text(
                    "$tk",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}

class SomeDialog extends StatefulWidget {
  final int id;

  SomeDialog({Key key, @required this.id}) : super(key: key);
  @override
  _SomeDialogPageState createState() => new _SomeDialogPageState();
}

class _SomeDialogPageState extends State<SomeDialog> {
  int _current = 0;
  int _isBack = 0;
  List imgList = [
    "assets/tshirt.png",
    "assets/shirt.jpg",
    "assets/pant.jpg",
    "assets/shoe.png"
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black,
      // appBar: new AppBar(
      //     //title: const Text('Dialog Magic'),
      //     ),
      //body: new Text("It's a Dialog!"),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                setState(() {
                  _isBack++;
                });
              },
              child: Center(
                child: new Container(
                  padding: EdgeInsets.all(0.0),
                  // height: 600,
                  // width: MediaQuery.of(context).size.width,
                  color: Colors.black,
                  // child: PhotoView(
                  //   imageProvider: AssetImage('assets/shoe.png'),
                  //   backgroundDecoration: BoxDecoration(
                  //       gradient: LinearGradient(
                  //     colors: <Color>[Colors.transparent, Colors.transparent],
                  //     stops: [0.1, 1.0],
                  //   )),
                  //   minScale: PhotoViewComputedScale.contained * 1.2,
                  //   maxScale: 4.0,
                  // ),
                  child: CarouselSlider(
                    height: 450.0,
                    initialPage: widget.id,
                    enlargeCenterPage: true,
                    autoPlay: false,
                    reverse: false,
                    enableInfiniteScroll: true,
                    autoPlayInterval: Duration(seconds: 2),
                    autoPlayAnimationDuration: Duration(milliseconds: 2000),
                    pauseAutoPlayOnTouch: Duration(seconds: 10),
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (index) {
                      setState(() {
                        _current = index;
                      });
                    },
                    items: imgList.map((imgUrl) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 10.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Image.asset(
                              imgUrl,
                              fit: BoxFit.contain,
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: _isBack % 2 == 0
                  ? Row(
                      children: <Widget>[
                        BackButton(
                          color: Colors.white,
                        ),
                        Container(
                            margin: EdgeInsets.only(left: 5),
                            child: Text("Product name",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17))),
                      ],
                    )
                  : Container(),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:ecommerce_app/MainScreens/ProductDetailsPage/details.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class FavCard extends StatefulWidget {
  @override
  _FavCardState createState() => _FavCardState();
}

class _FavCardState extends State<FavCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
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
                child: Row(
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(right: 10, left: 0),
                        height: 100,
                        child: Image.asset('assets/pant.jpg')),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Product Name 1234",
                            overflow: TextOverflow.ellipsis,
                            style:
                                TextStyle(fontSize: 17, color: Colors.black54),
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
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.only(right: 5),
                  child: Column(
                    children: <Widget>[
                      Container(
                        color: Colors.white,
                        child: Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

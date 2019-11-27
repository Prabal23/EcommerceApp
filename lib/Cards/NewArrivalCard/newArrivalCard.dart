import 'package:ecommerce_app/MainScreens/ProductDetailsPage/details.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class NewArrivalCard extends StatefulWidget {
  @override
  _NewArrivalCardState createState() => _NewArrivalCardState();
}

class _NewArrivalCardState extends State<NewArrivalCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
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
          width: 100,
          child: Column(
            children: <Widget>[
              Container(
                  height: 100,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
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
                                  BorderRadius.all(Radius.circular(10.0)),
                              color: mainheader,
                              border:
                                  Border.all(width: 0.2, color: Colors.grey)),
                          child:
                              Text("New", style: TextStyle(color: sub_white)))
                    ]),
                  )),
              SizedBox(
                height: 10,
              ),
              Text(
                "Product Name",
                style: TextStyle(fontSize: 14, color: Colors.black38),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                            style:
                                TextStyle(fontSize: 16, color: Colors.black87),
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
                  mainAxisAlignment: MainAxisAlignment.center,
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
    );
  }
}

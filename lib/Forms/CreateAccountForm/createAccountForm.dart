import 'dart:io';

import 'package:ecommerce_app/MainScreens/LoginPage/login.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../main.dart';

class CreateAccountForm extends StatefulWidget {
  @override
  _CreateAccountFormState createState() => _CreateAccountFormState();
}

class _CreateAccountFormState extends State<CreateAccountForm> {
  TextEditingController _dayController = TextEditingController();
  TextEditingController _monthController = TextEditingController();
  int cardStatus = 0;
  Future<File> fileImage;

  @override
  void initState() {
    super.initState();
  }

  pickImagefromGallery(ImageSource src) {
    setState(() {
      fileImage = ImagePicker.pickImage(source: src);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(top: 5, left: 20, right: 20, bottom: 5),
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    color: Colors.white,
                    border: Border.all(width: 0.2, color: Colors.grey)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top: 5, right: 5, bottom: 5),
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 5, bottom: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    GestureDetector(
                      onTap: () {
                        pickImagefromGallery(ImageSource.gallery);
                      },
                      child: Container(
                        child: Center(
                          child: Stack(
                            children: <Widget>[
                              FutureBuilder<File>(
                                future: fileImage,
                                builder: (BuildContext context,
                                    AsyncSnapshot<File> snapshot) {
                                  if (snapshot.connectionState ==
                                          ConnectionState.done &&
                                      snapshot.data != null) {
                                    return Container(
                                      padding: EdgeInsets.all(1.0),
                                      child: CircleAvatar(
                                        radius: 50.0,
                                        backgroundColor: Colors.transparent,
                                        backgroundImage:
                                            FileImage(snapshot.data),
                                      ),
                                      decoration: new BoxDecoration(
                                        color: Colors.grey, // border color
                                        shape: BoxShape.circle,
                                      ),
                                    );
                                  } else if (snapshot.error != null) {
                                    return const Text(
                                      'Error Picking Image',
                                      textAlign: TextAlign.center,
                                    );
                                  } else {
                                    return Container(
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
                                    );
                                  }
                                },
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
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
                margin: EdgeInsets.only(top: 5, left: 20, right: 20, bottom: 5),
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
                            margin:
                                EdgeInsets.only(right: 5, top: 5, bottom: 5),
                            child: Text(
                              cardStatus % 2 != 0
                                  ? "I don't have any card"
                                  : "Don't have any card?",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey),
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
                                        margin:
                                            EdgeInsets.only(top: 5, bottom: 5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Container(
                                                //color: Colors.grey[200],
                                                //padding: EdgeInsets.all(20),
                                                child: Text(
                                              "Card Number",
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
                                  padding: EdgeInsets.only(
                                      top: 0, right: 5, bottom: 5),
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
                                                  width: 0.5,
                                                  color: Colors.grey)),
                                          child: TextFormField(
                                            autofocus: false,
                                            decoration: InputDecoration(
                                              icon: const Icon(
                                                Icons.credit_card,
                                                color: Colors.black38,
                                              ),
                                              hintText: 'Type card number...',
                                              //labelText: 'Enter E-mail',
                                              contentPadding:
                                                  EdgeInsets.fromLTRB(
                                                      0.0, 10.0, 20.0, 10.0),
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
                                        margin:
                                            EdgeInsets.only(top: 5, bottom: 5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Container(
                                                //color: Colors.grey[200],
                                                //padding: EdgeInsets.all(20),
                                                child: Text(
                                              "Card Owner",
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
                                  padding: EdgeInsets.only(
                                      top: 0, right: 5, bottom: 5),
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
                                                  EdgeInsets.fromLTRB(
                                                      0.0, 10.0, 20.0, 10.0),
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
                                        margin:
                                            EdgeInsets.only(top: 5, bottom: 5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Container(
                                                //color: Colors.grey[200],
                                                //padding: EdgeInsets.all(20),
                                                child: Text(
                                              "Expiry Date",
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
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5.0)),
                                              color: Colors.white,
                                              border: Border.all(
                                                  width: 0.5,
                                                  color: Colors.grey)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Row(
                                                children: <Widget>[
                                                  Container(
                                                    padding: EdgeInsets.only(
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
                                                        border:
                                                            InputBorder.none,
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
                                                        border:
                                                            InputBorder.none,
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
                                        margin:
                                            EdgeInsets.only(top: 5, bottom: 5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Container(
                                                //color: Colors.grey[200],
                                                //padding: EdgeInsets.all(20),
                                                child: Text(
                                              "CVV",
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
                                  padding: EdgeInsets.only(
                                      top: 0, right: 5, bottom: 5),
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
                                                  EdgeInsets.fromLTRB(
                                                      0.0, 10.0, 20.0, 10.0),
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
                          MaterialPageRoute(builder: (context) => LoginPage()),
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
                margin:
                    EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 10),
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
    );
  }
}

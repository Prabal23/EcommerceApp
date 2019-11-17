import 'dart:ui' as prefix0;
import 'dart:io';
import 'package:ecommerce_app/Forms/EditProfileForm/editProfileForm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import '../../../main.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ProfilePageState();
  }
}

class ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  TextEditingController _reviewController = TextEditingController();
  TextEditingController _dayController = TextEditingController();
  TextEditingController _monthController = TextEditingController();
  Animation<double> animation;
  AnimationController controller;
  String _debugLabelString = "", review = '', runningdate = '';
  var dd, finalDate;
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
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: sub_white,
          //height: MediaQuery.of(context).size.height,
          child: EditProfileForm(),
        ),
      ),
    );
  }
}

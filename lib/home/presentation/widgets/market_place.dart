// ignore_for_file: prefer_const_constructors, camel_case_types, sized_box_for_whitespace

import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:customer_assist/core/app_colors.dart';
import 'package:customer_assist/home/presentation/controllers/language_controller.dart';
import 'package:customer_assist/home/presentation/controllers/view_controller.dart';
import 'package:customer_assist/home/presentation/widgets/stackwidgets/information_widget.dart';
import 'package:customer_assist/home/presentation/widgets/stackwidgets/sub_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class marketPlace extends StatefulWidget {
  final double actualHeight;
  const marketPlace({Key? key, required this.actualHeight}) : super(key: key);

  @override
  State<marketPlace> createState() => _marketPlaceState();
}

class _marketPlaceState extends State<marketPlace> {
  double actualHeight = 0;
  var viewController = Get.put(ViewController());
  @override
  void initState() {
    super.initState();
  }

  var languageController = Get.put(LanguageController());
  @override
  Widget build(BuildContext context) {
    return  
    
    Column(
      children: [
        Container(
          color: const Color.fromARGB(255, 210, 207, 207),
          height: 55,
          //width: double.infinity,
          child: Center(
              child: Text(
            "Marketplace",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          )),
        ),
        Container(
          // color: Colors.amberAccent,
          height: 50,
          width: double.infinity,
        ),
        Column(
          children: [
            SizedBox(
              height: Platform.isAndroid
                  ? (widget.actualHeight - 60) / 17.9
                  : widget.actualHeight / 19,
            ),
            DisplayArea(
                content: viewController.infoMess.value,
                heading: 
                // languageController.languageResponse.value.info 
                // ?? 
                'You can virtually order anything and our AI Engine will locate this for you and quote immediately. On receipt of payment the material will be delivered from 4 to 48 hours unless it involves importation and customs clearance'),
          ],
        ),
        /* Container(
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(15),
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(border: Border.all()),
          child: Center(
            child: Text(
              "You can virtually order anything and our AI Engine will locate this for you and quote immediately. On receipt of payment the material will be delivered from 4 to 48 hours unless it involves importation and customs clearance",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  color: Colors.black),
            ),
          ),
        ),
        */
        Container(
          padding: EdgeInsets.only(top: 75),
          // color: Colors.blueGrey,
          height: 300,
          width: double.infinity,
          child: Center(
              child: Text(
            " Coming Soon! ",
            // languageController.languageResponse.value.users ?? '',
            style: TextStyle(
                fontSize: 50, fontWeight: FontWeight.bold, color: Colors.black),
          )),
        ),
      ],
    );
   }
}

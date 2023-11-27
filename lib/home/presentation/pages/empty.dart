//MPNEWVERSION
// ignore_for_file: camel_case_types, must_be_immutable, prefer_const_constructors

import 'package:customer_assist/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:mobile_pos/core/app_colors.dart';

class empty extends StatefulWidget {
  double actualHeight;
  empty({Key? key, required this.actualHeight}) : super(key: key);

  @override
  State<empty> createState() => _emptyState();
}

class _emptyState extends State<empty> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Stack(
        children: [
        Column(
          children: [
            Container(
             height: MediaQuery.of(context).size.height * 0.043,
                width: MediaQuery.of(context).size.width * 0.99,
                color:AppColors.subHeaderContainer,
              child: Center(
                child: Text(
                  "CUSTOMER",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Container(
              height: GetPlatform.isAndroid
                  ? (widget.actualHeight -
                          MediaQuery.of(context).padding.bottom) /
                      17.9 *
                      14.75
                  : (widget.actualHeight -
                          MediaQuery.of(context).padding.bottom) /
                      17.9 *
                      15.25,
            ),
          ],
        ),
      ]),
    );
  }
}

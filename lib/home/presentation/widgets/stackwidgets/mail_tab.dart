// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'dart:io';

import 'package:customer_assist/core/app_colors.dart';
import 'package:customer_assist/home/presentation/controllers/header_controller.dart';
import 'package:customer_assist/home/presentation/controllers/language_controller.dart';
import 'package:customer_assist/home/presentation/controllers/options_controller.dart';
import 'package:customer_assist/home/presentation/controllers/view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/app_constants.dart';
import '../../../../core/app_style.dart';
import '../../controllers/keyboard_controller.dart';

class MailTab extends StatefulWidget {
  final TextEditingController mainController;
  const MailTab({
    Key? key,
    required this.mainController,
    // double actualHeight,
  }) : super(key: key);

  @override
  _MailTabState createState() => _MailTabState();
}

class _MailTabState extends State<MailTab> {
  final FocusNode _focus = FocusNode();
  bool _isFocused = false;
  KeyboardController keyboardController = Get.find();
  var languageController = Get.put(LanguageController());
  var viewController = Get.put(ViewController());
  OptionsController optionsController = Get.find();
    HeaderController headerController = Get.find();
  double actualHeight = 0;
  @override
  void didChangeDependencies() {
    actualHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    _focus.addListener(() {
      keyboardController.setKeypad(SMALLKEYBOARD);
      keyboardController.controllerSetup(widget.mainController);
      keyboardController.setMaximiumLength('50');
      if (_focus.hasFocus) {
        setState(() {
          _isFocused = true;
        });
      }
    });

    return Padding(
       padding: GetPlatform.isAndroid
         ?const EdgeInsets.only(top: 5)
         :const EdgeInsets.only(),
      child: Column(
        children: [
          Container(
           height: MediaQuery.of(context).size.height * 0.043,
              width: MediaQuery.of(context).size.width * 0.99,
              color: AppColors.subHeaderContainer,
            child: Row(
              children: [
                InkWell(
                    onTap: () {
                     viewController.setView(MOBILEOTP);
                     headerController.setSubHeaderLabel('Verify Mobile Number');
                     
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      child: RotatedBox(
                      
                          quarterTurns: DateTime.june,
                      child: optionsController.backNew),
                      ),
                  ),
                  SizedBox(width: 110,),
                Text(
                  "Provide Mail ID",
                  // languageController.languageResponse.value.users ?? '',
                  style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: [
                SizedBox(
                  height:
                      Platform.isAndroid ? actualHeight / 5.6 : actualHeight / 7,
                ),
                SizedBox(
                  height: 53,
                  width: 350,
                  child: TextFormField(
                    readOnly: true,
                    showCursor: true,
                    focusNode: _focus,
                    onTap: () {
                      keyboardController.setKeypad(SMALLKEYBOARD);
                      keyboardController.controllerSetup(widget.mainController);
                      keyboardController
                          .setcreateUserController(widget.mainController);
                      keyboardController.setMaximiumLength('100');
                      keyboardController.symbolTrue(true);
    
                      keyboardController.focusSetup(
                          _focus, widget.mainController);
                    },
                    controller: widget.mainController,
                    decoration: InputDecoration(
                      hintText: languageController.languageResponse.value.mailId,
                      filled: _isFocused,
                      fillColor: textFieldColor,
                    ),
                    style: normalTextStyle,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

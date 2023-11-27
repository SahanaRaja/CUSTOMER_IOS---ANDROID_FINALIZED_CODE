// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:customer_assist/core/app_colors.dart';
import 'package:customer_assist/core/app_constants.dart';
import 'package:customer_assist/core/app_style.dart';
import 'package:customer_assist/home/presentation/controllers/header_controller.dart';
import 'package:customer_assist/home/presentation/controllers/language_controller.dart';
import 'package:customer_assist/home/presentation/controllers/options_controller.dart';
import 'package:customer_assist/home/presentation/controllers/view_controller.dart';
import 'package:customer_assist/home/presentation/widgets/stackwidgets/information_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/keyboard_controller.dart';

class MobileOtpScreen extends StatefulWidget {
  final double actualHeight;
  final List<TextEditingController> otpController;
  final List<FocusNode> focusNode;

  const MobileOtpScreen({
    Key? key,
    required this.actualHeight,
    required this.otpController,
    required this.focusNode,
  }) : super(key: key);

  @override
  _MobileOtpScreenState createState() => _MobileOtpScreenState();
}

class _MobileOtpScreenState extends State<MobileOtpScreen> {
  final List<bool> _isFocused = List.generate(6, (index) => false);
  double actualHeight = 0;
  var keyboardController = Get.put(KeyboardController());
  var languageController = Get.put(LanguageController());
  var viewController = Get.put(ViewController());
  OptionsController optionsController = Get.find();
  HeaderController headerController = Get.find();
  @override
  void initState() {
    super.initState();
    keyboardController.setOtpControllers(widget.otpController);
  }

  @override
  void didChangeDependencies() {
    actualHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < widget.focusNode.length; i++) {
      widget.focusNode[i].addListener(() {
        setState(() {
          if (widget.focusNode[i].hasFocus) {
            _isFocused[i] = true;
          } else {
            _isFocused[i] = false;
          }
        });
      });
    }

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
                     viewController.setView(MOBILENUMBER);
                      headerController.setSubHeaderLabel('Provide Mobile Number');
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      child: RotatedBox(
                      
                          quarterTurns: DateTime.june,
                      child: optionsController.backNew),
                      ),
                  ),
                  SizedBox(width: 90,),
                Text(
                  "Verify Mobile Number",
                  // languageController.languageResponse.value.users ?? '',
                  style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ],
            ),
          ),
          SizedBox(
            height: Platform.isAndroid
                ? (actualHeight - 60) / 17.9
                : actualHeight / 15,
            // 27,
          ),
          DisplayArea(
              content: languageController.languageResponse.value.otpInfo ?? '',
              heading: languageController.languageResponse.value.info ?? ''),
          //added by saha
          const SizedBox(
            height: 5,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(6, (index) {
                return Row(
                  children: [
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.grey,
                                spreadRadius: 2,
                                blurRadius: 2,
                                offset: Offset(5, 5))
                          ]),
                      child: TextFormField(
                        showCursor: true,
                        controller: widget.otpController[index],
                        readOnly: true,
                        maxLength: 1,
                        focusNode: widget.focusNode[index],
                        style: normalTextStyle,
                        decoration: InputDecoration(
                          fillColor: textFieldColor,
                          filled: _isFocused[index],
                          counterText: "",
                          contentPadding: const EdgeInsets.fromLTRB(12, 2, 5, 15),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                        ),
                        maxLines: 1,
                        onChanged: (value) {},
                        onTap: () {
                          keyboardController
                              .controllerSetup(widget.otpController[index]);
                          keyboardController.focusSetup(widget.focusNode[index],
                              widget.otpController[index]);
                          keyboardController.setKeypad(SYMBOLSKEYBOARD);
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                  ],
                );
              })),
          //added by saha
          const SizedBox(
            height: 12,
          ),
          SizedBox(
            width: 400,
            child: Text(
              languageController.languageResponse.value.resentOtpInfo ?? '',
              style: const TextStyle(fontSize: 14),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 13,
          ),
          GestureDetector(
            onTap: () {},
            child: const Text(
              "Resend OTP",
              style: TextStyle(
                color: Color.fromRGBO(14, 68, 230, 1),
                fontSize: 16,
                fontStyle: FontStyle.italic,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

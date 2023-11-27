// ignore_for_file: prefer_const_constructors

import 'package:customer_assist/core/app_colors.dart';
import 'package:customer_assist/home/presentation/controllers/language_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/app_constants.dart';
import '../../../../core/app_style.dart';
import '../../controllers/header_controller.dart';
import '../../controllers/icon_controller.dart';
import '../../controllers/keyboard_controller.dart';
import '../../controllers/reset_controller.dart';
import '../../controllers/view_controller.dart';

class LoginTab extends StatefulWidget {
  final double actualHeight;
  final TextEditingController mainController;
  final TextEditingController passController;
  final ViewController viewcontroller;
  final KeyboardController keyboardController;

  const LoginTab(
      {Key? key,
      required this.mainController,
      required this.passController,
      required this.actualHeight,
      required this.viewcontroller,
      required this.keyboardController})
      : super(key: key);

  @override
  _LoginTabState createState() => _LoginTabState();
}

class _LoginTabState extends State<LoginTab> {
  bool _obscureText = true;
  final FocusNode _focus = FocusNode();
  bool _isFocused = false;
  final FocusNode _focus1 = FocusNode();
  bool _isFocused1 = false;
  ViewController viewcontroller = Get.find();
  EyeController eyeController = Get.find();
  HeaderController headerController = Get.find();
  KeyboardController keyboardController = Get.find();
  ResetController forggetController = Get.find();
  var languageController = Get.put(LanguageController());

  @override
  Widget build(BuildContext context) {
    _focus.addListener(() {
      keyboardController.setKeypad(SMALLKEYBOARD);
      keyboardController.controllerSetup(widget.mainController);
      keyboardController.setMaximiumLength('50');
      if (_focus.hasFocus) {
        setState(() {
          _isFocused = true;
          _isFocused1 = false;
        });
      }
    });
    _focus1.addListener(() {
      keyboardController.setKeypad(SMALLKEYBOARD);
      keyboardController.controllerSetup(widget.passController);
      keyboardController.setMaximiumLength('50');

      keyboardController.setLoginController(
          widget.mainController, widget.passController);
      if (_focus1.hasFocus) {
        setState(() {
          _isFocused = false;
          _isFocused1 = true;
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
            child: Center(
                child: Text(
              "Log In",
              // languageController.languageResponse.value.users ?? '',
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
            )),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Column(
                children: [
                  SizedBox(
                    height: GetPlatform.isAndroid
                        ? ((widget.actualHeight - 40) / 17.9) * 2.1
                        : ((widget.actualHeight -
                                    MediaQuery.of(context).padding.bottom) /
                                17.9) *
                            2,
                    // 2.35,
                  ),
                  Container(
                    //added by saha
                    padding: const EdgeInsets.only(top: 10),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.black,
                          // width: 0.5,
                        ),
                      ),
                    ),
                    height: GetPlatform.isAndroid
                        //added by saha
                        ? (widget.actualHeight - 40) / 14.9
                        //  18.1
                        : (widget.actualHeight -
                                MediaQuery.of(context).padding.bottom) /
                            17.9,
                    child: TextField(
                      readOnly: true,
                      focusNode: _focus,
                      onTap: () async {
                        keyboardController.setKeypad(SMALLKEYBOARD);
                        keyboardController.controllerSetup(widget.mainController);
                        keyboardController.setMaximiumLength('50');
                        keyboardController.symbolTrue(true);
    
                        keyboardController.focusSetup(
                            _focus, widget.mainController);
    
                       
                      },
                      controller: widget.mainController,
                      showCursor: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText:
                            languageController.languageResponse.value.mailId,
                        filled: _isFocused,
                        fillColor: textFieldColor,
                      ),
                      style: normalTextStyle,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 10),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.black,
                          // width: 0.5,
                        ),
                      ),
                    ),
                    height: GetPlatform.isAndroid
                        ? (widget.actualHeight - 40) / 16
                        : (widget.actualHeight -
                                MediaQuery.of(context).padding.bottom) /
                            16,
                    child: TextFormField(
                      readOnly: true,
                      focusNode: _focus1,
                      obscureText: _obscureText,
                      onTap: () {
                        keyboardController.setKeypad(CAPITALKEYBOARD);
                        keyboardController.controllerSetup(widget.passController);
                        keyboardController.symbolTrue(true);
    
                        keyboardController.setLoginController(
                          widget.mainController,
                          widget.passController,
                        );
                        keyboardController.setMaximiumLength('50');
                        keyboardController.focusSetup(
                            _focus1, widget.passController);
                      },
                      controller: widget.passController,
                      showCursor: true,
                      decoration: InputDecoration(
                        hintText:
                            languageController.languageResponse.value.password,
                        border: InputBorder.none,
                        filled: _isFocused1,
                        fillColor: textFieldColor,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                          child: _obscureText
                              ? eyeController.eyeclose
                              : eyeController.eyeopen,
                        ),
                      ),
                      style: normalTextStyle,
                    ),
                  ),
                  SizedBox(
                    height: GetPlatform.isAndroid
                        ? (widget.actualHeight -
                                MediaQuery.of(context).padding.bottom) /
                            13
                        : (widget.actualHeight -
                                MediaQuery.of(context).padding.bottom) /
                            12,
                  ),
                  InkWell(
                    onTap: () {
                      if (widget.mainController.text != '' &&
                          GetUtils.isEmail(widget.mainController.text)) {
                        widget.viewcontroller.viewKey(FORGETPASSWORD);
                        headerController.setSubHeaderLabel('Verify User');
                        forggetController.sentOTP(widget.mainController.text,
                            'fp', languageController.languagenum.toString());
                        widget.keyboardController.setKeypad("");
                        widget.keyboardController
                            .setcreateUserController(widget.mainController);
                      } else {
                        widget.viewcontroller.viewKey(ERROR);
                        widget.viewcontroller.setErrorMessage(languageController
                                .languageResponse.value.mandatoryMailId ??
                            '');
                      }
                    },
                    child: SizedBox(
                      height: (widget.actualHeight -
                              MediaQuery.of(context).padding.bottom) /
                          17.9,
                      child: Center(
                        child: Text(
                          languageController
                                  .languageResponse.value.forgotPassword ??
                              '',
                          style: const TextStyle(
                              color: Color.fromRGBO(14, 68, 230, 1),
                              decoration: TextDecoration.underline,
                              fontStyle: FontStyle.italic,
                              fontSize: 21),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      viewcontroller.viewKey(FIRSTTIME);
                      keyboardController.setKeypad("");
                      headerController.headerLabel(FIRSTTIMEUSER);
                      headerController.subHeaderLabel(PROVIDEMAILID);
                    },
                    child: SizedBox(
                      height: (widget.actualHeight -
                              MediaQuery.of(context).padding.bottom) /
                          17.9,
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors

import 'package:customer_assist/core/app_colors.dart';
import 'package:customer_assist/home/presentation/controllers/language_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/app_constants.dart';
import '../../../../core/app_style.dart';
import '../../controllers/icon_controller.dart';
import '../../controllers/keyboard_controller.dart';
import '../../controllers/view_controller.dart';

class ChangePasswordTab extends StatefulWidget {
  final double actualHeight;
  final TextEditingController oldpass;
  final TextEditingController newPass;
  final TextEditingController resetPass;
  const ChangePasswordTab(
      {Key? key,
      required this.actualHeight,
      required this.oldpass,
      required this.newPass,
      required this.resetPass})
      : super(key: key);

  @override
  _ChangePasswordTabState createState() => _ChangePasswordTabState();
}

class _ChangePasswordTabState extends State<ChangePasswordTab> {
  ViewController viewController = Get.find();
  KeyboardController keyboardController = Get.find();
  var languageController = Get.put(LanguageController());
  bool _obscureText = true;
  bool _obscureText1 = true;
  bool _obscureText2 = true;

  final FocusNode _focus = FocusNode();
  bool _isFocused = false;
  final FocusNode _focus1 = FocusNode();
  bool _isFocused1 = false;
  final FocusNode _focus2 = FocusNode();
  bool _isFocused2 = false;

  double actualHeight = 0;
  EyeController eyeController = Get.find();

  @override
  void initState() {
    super.initState();
    // viewController.setView(MANAGEROTPSENT);
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
    _focus.addListener(() {
      keyboardController.setKeypad(CAPITALKEYBOARD);
      keyboardController.controllerSetup(widget.oldpass);
      keyboardController.symbolTrue(true);

      if (_focus.hasFocus) {
        setState(() {
          _isFocused = true;
          _isFocused1 = false;
          _isFocused2 = false;
        });
      }
    });
    _focus1.addListener(() {
      keyboardController.setKeypad(CAPITALKEYBOARD);
      keyboardController.controllerSetup(widget.resetPass);
      keyboardController.symbolTrue(true);
      if (_focus1.hasFocus) {
        setState(() {
          _isFocused = false;
          _isFocused1 = true;
          _isFocused2 = false;
        });
      }
    });
    _focus2.addListener(() {
      keyboardController.setKeypad(CAPITALKEYBOARD);
      keyboardController.controllerSetup(widget.newPass);
      keyboardController.symbolTrue(true);
      if (_focus2.hasFocus) {
        setState(() {
          _isFocused = false;
          _isFocused1 = false;
          _isFocused2 = true;
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
              "Change PIN",
              // languageController.languageResponse.value.users ?? '',
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
            )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              children: [
                SizedBox(
                  height: GetPlatform.isAndroid
                  ?  widget.actualHeight / 15.8
                 : widget.actualHeight / 15.5,
                ),
                Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.black,
                        // width: 0.5,
                      ),
                    ),
                  ),
                  height: GetPlatform.isAndroid
                    ? (widget.actualHeight -
                            MediaQuery.of(context).padding.bottom) /
                        17.9 * 1
                    :(widget.actualHeight -
                            MediaQuery.of(context).padding.bottom) /
                        17.9,
                  child: TextFormField(
                    maxLength: 10,
                    readOnly: true,
                    showCursor: true,
                    focusNode: _focus,
                    obscureText: _obscureText,
                    controller: widget.oldpass,
                    style: normalTextStyle,
                    
                    onTap: () {
                    
                      keyboardController.setKeypad(CAPITALKEYBOARD);
                      keyboardController.controllerSetup(widget.oldpass);
                      keyboardController.focusSetup(_focus, widget.oldpass);
                      keyboardController.setMaximiumLength('50');
                      keyboardController.symbolTrue(true);
                      
                      keyboardController.setpasschangeController(widget.oldpass);
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      filled: _isFocused,
                      fillColor: textFieldColor,
                      hintText: languageController.languageResponse.value.oldPassword,
                      counterText: "",
                      suffixIcon: GestureDetector(
                        onTap: () {
                          // keyboardController.controllerSetup(widget.newPass);
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        child: _obscureText
                            ? eyeController.eyeclose
                            : eyeController.eyeopen,
                      ),
                    ),
                  ),
                ),
                
                Padding(
                  padding: const EdgeInsets.only(top: 7.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.black,
                          // width: 0.5,
                        ),
                      ),
                    ),
                    height: GetPlatform.isAndroid
                    ? (widget.actualHeight -
                            MediaQuery.of(context).padding.bottom) /
                        17.9 * 0.9
                    :(widget.actualHeight -
                            MediaQuery.of(context).padding.bottom) /
                        17.9,
                    child: TextFormField(
                      maxLength: 10,
                      focusNode: _focus1,
                      readOnly: true,
                      showCursor: true,
                      controller: widget.resetPass,
                      obscureText: _obscureText1,
                      //  onChanged: (value) {
                      //   validateStructure(widget.newPass.text);
                      // },
                      onChanged: (value) => validateStructure(value),
                      onTap: () {
                       //validateStructure(widget.newPass.text);
                       // validateStructure(widget.resetPass.text);
                        
                        keyboardController.setKeypad(CAPITALKEYBOARD);
                        keyboardController.controllerSetup(widget.resetPass);
                        keyboardController.setMaximiumLength('50');
                        keyboardController.focusSetup(_focus, widget.resetPass);
                        keyboardController.symbolTrue(true);
                        keyboardController.setcreatePassController(widget.resetPass);
    
                        
                      },
                      style: normalTextStyle,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        filled: _isFocused1,
                        fillColor: textFieldColor,
                        hintText:
                            languageController.languageResponse.value.newPassword,
                        counterText: "",
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _obscureText1 = !_obscureText1;
                            });
                          },
                          child: _obscureText1
                              ? eyeController.eyeclose
                              : eyeController.eyeopen,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 12,
                        width: 350,
                        color: validPassword ? Colors.green : Colors.red,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          viewController.setView(CHECKPASSWORD);
                        },
                        child: Container(
                          height: widget.actualHeight / 35,
                          width: 25,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/info.png'),
                                fit: BoxFit.fill),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                 Padding(
                  padding: const EdgeInsets.only(top: 13),
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.black,
                          // width: 0.5,
                        ),
                      ),
                    ),
                    height: (widget.actualHeight -
                            MediaQuery.of(context).padding.bottom) /
                        17.9,
                    child: TextFormField(
                      maxLength: 10,
                      focusNode: _focus2,
                      readOnly: true,
                      showCursor: true,
                      controller: widget.newPass,
                      obscureText: _obscureText2,
                       onChanged: (value) {
                        validateStructure(widget.resetPass.text);
                      },
                      onTap: () {
                       validateStructure(widget.resetPass.text);
                       // validateStructure(widget.resetPass.text);
                        
                        keyboardController.setKeypad(CAPITALKEYBOARD);
                        keyboardController.controllerSetup(widget.newPass);
                        keyboardController.setMaximiumLength('50');
                        keyboardController.focusSetup(_focus, widget.newPass);
                        keyboardController.symbolTrue(true);
                        keyboardController.setcreatePassController(widget.newPass);
    
                       keyboardController.setPassController(
                            widget.newPass, widget.resetPass,);
                      },
                      style: normalTextStyle,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        filled: _isFocused2,
                        fillColor: textFieldColor,
                        hintText:
                            languageController.languageResponse.value.repeatPassword,
                        counterText: "",
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _obscureText2 = !_obscureText2;
                            });
                          },
                          child: _obscureText2
                              ? eyeController.eyeclose
                              : eyeController.eyeopen,
                        ),
                      ),
                    ),
                  ),
                ),
                // SizedBox(
                //   height: widget.actualHeight / 30,
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  bool validPassword = false;
  bool validateStructure(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    validPassword = regExp.hasMatch(value);
    setState(() {});
    return regExp.hasMatch(value);
  }
}

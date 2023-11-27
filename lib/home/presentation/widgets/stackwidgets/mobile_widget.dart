// ignore_for_file: unnecessary_null_comparison, prefer_const_constructors

import 'package:customer_assist/core/app_colors.dart';
import 'package:customer_assist/home/presentation/controllers/language_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/app_constants.dart';
import '../../controllers/fetch_country_controller.dart';
import '../../controllers/keyboard_controller.dart';

class MobileTab extends StatefulWidget {
  final TextEditingController mainController;
  final TextEditingController mobileController;
  const MobileTab({
    Key? key,
    required this.mainController,
    required this.mobileController,
    // double actualHeight,
  }) : super(key: key);

  @override
  _MobileTabState createState() => _MobileTabState();
}

class _MobileTabState extends State<MobileTab> {
  final FocusNode _focus = FocusNode();
  bool _isFocused = false;
  var keyboardController = Get.put(KeyboardController());
  FetchCountryController fetchCountryController = Get.find();
  var languageController = Get.put(LanguageController());
  double actualHeight = 0;

  @override
  void initState() {
    super.initState();
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
      keyboardController.setKeypad(SYMBOLSKEYBOARD);
      keyboardController.controllerSetup(widget.mobileController);
      keyboardController.setMaximiumLength('50');
      if (_focus.hasFocus) {
        setState(() {
          _isFocused = true;
        });
      }
    });
    return GetX<FetchCountryController>(
      init: FetchCountryController(),
      initState: (_) {},
      builder: (controller) {
        //print("???????????????" + controller.fetchcountryResponse.value.phone_code!);
        if (controller.fetchcountryResponse.value.phone_code != null) {
          widget.mainController.text =
              controller.fetchcountryResponse.value.phone_code ?? '';
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
                child: Center(
                    child: Text(
                  "Provide Mobile Number",
                  // languageController.languageResponse.value.users ?? '',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60),
                child: Column(
                  children: [
                    SizedBox(
                      height: GetPlatform.isAndroid
                          ? actualHeight / 5.6
                          : actualHeight / 8,
                    ),
                    Row(
                      children: [
                        /* Container(
                          height: 45,
                          width: 70,
                          decoration:const BoxDecoration(
                            border:  Border(
                                   bottom: BorderSide(
                                     color: Color.fromARGB(255, 1, 1, 1),
                                    width: 0.3,
                                   ),)
                          ),
                          child: const Text(
                            '+91',
                            
                            // readOnly: true,
                            // showCursor: true,
                            // // focusNode: _focus,
                            // onTap: () {},
                            // controller: widget.mainController,
                            // decoration: InputDecoration(
                            //   filled: _isFocused,
                            //   fillColor: textFieldColor,
                            // ),
                            style:  TextStyle(fontSize: 21),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        */
                        SizedBox(
                          height: 53,
                          width: 300,
                          child: TextFormField(
                            showCursor: true,
                            readOnly: true,
                            focusNode: _focus,
                            onTap: () {
                              keyboardController.setKeypad(SYMBOLSKEYBOARD);
                              keyboardController
                                  .controllerSetup(widget.mobileController);
                              keyboardController.setMaximiumLength('15');
                              keyboardController.symbolTrue(false);
                              // keyboardController
                              //     .mobileControllerSetup(widget.mobileController);
                            },
                            controller: widget.mobileController,
                            decoration: InputDecoration(
                              hintText: "Enter Your Mobile Number ",
                              // languageController
                              //     .languageResponse.value.mobileNumber,
                              filled: _isFocused,
                              fillColor: textFieldColor,
                            ),
                            style: const TextStyle(fontSize: 21),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

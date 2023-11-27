import 'dart:io';

import 'package:customer_assist/home/presentation/controllers/options_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/app_constants.dart';
import '../../../../core/utils/size_config.dart';
import '../../../data/configure/datasources/configure_data_remote_data_source.dart';
import '../../controllers/done_controller.dart';
import '../../controllers/keyboard_controller.dart';
import '../../controllers/profile_controller.dart';
import '../default_buttons.dart';

class NumeralSpecialChar extends StatefulWidget {
  final Function(String) onValueChanged;
  final Size size;
  final BuildContext context;
  final double actualHeight;
  const NumeralSpecialChar({
    Key? key,
    required this.onValueChanged,
    required this.size,
    required this.context,
    required this.actualHeight,
  }) : super(key: key);

  @override
  _NumeralSpecialCharState createState() => _NumeralSpecialCharState();
}

class _NumeralSpecialCharState extends State<NumeralSpecialChar> {
  List<String> firstRow = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0'];
  List<String> secondRow = ['!', '#', '\$', '%', '&', '*', '(', ')', '-', '_'];
  List<String> thridRow = ['+', '=', ':', ';', '"', "'", ',', '?', '/'];

  KeyboardController keyboardController = Get.find();
  DoneController doneController = Get.find();
  ProfileController profileController = Get.find();
  OptionsController optionsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Platform.isAndroid
          ? (widget.actualHeight - 40) / 17.9 * 6
          : getProportionateScreenHeight(247),
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3.0),
            child: Container(
              height: Platform.isAndroid ? 40 : 50,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                          'assets/images/keypad_patchs/keypad_header.png'))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (viewController.viewKey.value == CHATTY) {
                        keyboardController.setKeypad(CAPITALKEYBOARD);
                        keyboardController.setHeight(true);
                      } else {
                        keyboardController.setKeypad('');
                        optionsController.customscroll.value = 'true';
                        keyboardController.setHeight(true);
                        profileController.setProfileHeight(true);
                      }
                    },
                    child: const Text(
                      'CANCEL',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (viewController.viewKey.value == CHATTY) {
                        keyboardController.setKeypad(CAPITALKEYBOARD);
                        keyboardController.setHeight(false);
                        print("ontap");

                        doneController.onDone();
                      } else {
                        keyboardController.setKeypad('');
                        keyboardController.setHeight(false);
                        print("ontap");

                        doneController.onDone();
                      }
                    },
                    child: const Text(
                      'DONE',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ...firstRow.map((number) {
                return DefaultButtons().getGridChild(
                    number, widget.onValueChanged, widget.size,
                    isCapital: true);
              }),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // const Size
              ...secondRow.map((number) {
                return DefaultButtons().getGridChild(
                    number, widget.onValueChanged, widget.size,
                    isCapital: true);
              }),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ...thridRow.map((number) {
                return DefaultButtons().getGridChild(
                    number, widget.onValueChanged, widget.size,
                    isCapital: true);
              }),
              GestureDetector(
                onTap: () {
                  keyboardController.keyboardOperation('delete');
                },
                child: Image.asset(
                   'assets/images/keypad_patchs/backspace.png',
                  height: 50,
                  width: 13.w,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              DefaultButtons().getMediumButton(
                content: "ABC",
                onValueChanged: widget.onValueChanged,
                size: widget.size,
                context: context,
              ),
              DefaultButtons().getGridChild(
                  '.', widget.onValueChanged, widget.size,
                  isCapital: true),
              DefaultButtons().getLargeButton(
                  content: "SPACE",
                  onValueChanged: widget.onValueChanged,
                  size: widget.size),
              DefaultButtons().getGridChild(
                  '@', widget.onValueChanged, widget.size,
                  isCapital: true),
              DefaultButtons().getMediumButton(
                content: "NEXT",
                size: widget.size,
                onValueChanged: widget.onValueChanged,
                context: context,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

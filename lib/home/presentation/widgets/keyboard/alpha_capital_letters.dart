import 'dart:io';

import 'package:customer_assist/home/data/configure/datasources/configure_data_remote_data_source.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/app_constants.dart';
import '../../../../core/utils/size_config.dart';
import '../../controllers/done_controller.dart';
import '../../controllers/keyboard_controller.dart';
import '../../controllers/profile_controller.dart';
import '../default_buttons.dart';

class AlphaCapitalLetters extends StatefulWidget {
  final Function(String) onValueChanged;
  final Size size;
  final BuildContext context;
  final double actualHeight;

  const AlphaCapitalLetters({
    Key? key,
    required this.onValueChanged,
    required this.size,
    required this.context,
    required this.actualHeight,
  }) : super(key: key);

  @override
  _AlphaCapitalLettersState createState() => _AlphaCapitalLettersState();
}

class _AlphaCapitalLettersState extends State<AlphaCapitalLetters> {
  List<String> firstRow = ['Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P'];
  List<String> secondRow = ['A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L'];
  List<String> thridRow = ['Z', 'X', 'C', 'V', 'B', 'N', 'M'];
  var keyboardController = Get.put(KeyboardController());
  var doneController = Get.put(DoneController());
  ProfileController profileController = Get.find();
  final ScrollController _scrollController = ScrollController();

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
                        keyboardController.setHeight(true);
                        doneController.onDone();
                      } else {
                        keyboardController.setKeypad('');
                        keyboardController.setHeight(true);
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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(
                width: 20,
              ),
              ...secondRow.map((number) {
                return DefaultButtons().getGridChild(
                    number, widget.onValueChanged, widget.size,
                    isCapital: true);
              }),
              const SizedBox(
                width: 20,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  keyboardController.setKeypad(SMALLKEYBOARD);
                },
                child: Image.asset(
                  keyboardController.capslock.value
                      ? 'assets/images/keypad_patchs/key_caplock.png'
                      : 'assets/images/keypad_patchs/key_capitalletter.png',
                  height: 50,
                  width: 11.w,
                  fit: BoxFit.fill,
                ),
              ),
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
                  width: 12.w,
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                height: 50,
                width: 45,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  image: DecorationImage(
                      image: AssetImage(
                          'assets/images/keypad_patchs/key_aplha.png'),
                      fit: BoxFit.fill),
                ),
              ),
              // const SizedBox(
              //   width: 20,
              // ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              DefaultButtons().getMediumButton(
                content: "123",
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

  AssetImage getCapslockImage(String? content) {
    if (keyboardController.capslock.value == true) {
      return const AssetImage('assets/images/keyboardicons/keyboardon.png');
    } else {
      return const AssetImage('assets/images/keyboardicons/keyboardoff.png');
    }
  }
}

// ignore_for_file: prefer_const_constructors

import 'package:customer_assist/core/app_colors.dart';
import 'package:customer_assist/core/app_constants.dart';
import 'package:customer_assist/core/helpers/SharedPreference/prefs.dart';
import 'package:customer_assist/home/presentation/controllers/keyboard_controller.dart';
import 'package:customer_assist/home/presentation/controllers/language_controller.dart';
import 'package:customer_assist/home/presentation/controllers/order_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../keyboard/alpha_capital_letters.dart';
import '../keyboard/alpha_small_letters.dart';
import '../keyboard/numeral_special_char.dart';

class SharePage extends StatefulWidget {
  final double actualHeight;
  final TextEditingController mobile;
  final TextEditingController friendmobile;
  final TextEditingController friendname;

  const SharePage(
      {Key? key,
      required this.mobile,
      required this.friendmobile,
      required this.friendname,
      required this.actualHeight})
      : super(key: key);

  @override
  State<SharePage> createState() => _SharePageState();
}

class _SharePageState extends State<SharePage> {
  var mobileNum;
  //TextEditingController mobile = TextEditingController();
  //TextEditingController friendName = TextEditingController();
  //TextEditingController friendMobile = TextEditingController();
  KeyboardController keyboardController = Get.find();
  OrderController orderController = Get.find();

  ScrollController scrollController = ScrollController();

  var languageController = Get.put(LanguageController());
  bool showinfo = false;
  final FocusNode _focus = FocusNode();
  bool _isFocused = false;
  final FocusNode _focus1 = FocusNode();
  bool _isFocused1 = false;
  final FocusNode _focus2 = FocusNode();
  bool _isFocused2 = false;

  double get cellHeight {
    return widget.actualHeight * (1 / 18);
  }

  @override
  void initState() {
    print(mobileNum);
    setState(() {
      //mobileNum = Prefs.mobile;
      Prefs.mobile.then((value) {
        mobileNum = value;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _focus.addListener(() {
      keyboardController.setKeypad(SYMBOLSKEYBOARD);
      keyboardController.controllerSetup(widget.mobile);
      keyboardController.setMaximiumLength('50');
      if (_focus.hasFocus) {
        setState(() {
          _isFocused = true;
          _isFocused1 = false;
          _isFocused2 = false;
        });
      }
    });
    _focus1.addListener(() {
      keyboardController.setKeypad(SYMBOLSKEYBOARD);
      keyboardController.controllerSetup(widget.friendmobile);
      keyboardController.setMaximiumLength('50');

      keyboardController.setLoginController(widget.mobile, widget.friendmobile);
      if (_focus1.hasFocus) {
        setState(() {
          _isFocused = false;
          _isFocused1 = true;
          _isFocused2 = false;
        });
      }
    });
    _focus2.addListener(() {
      keyboardController.setKeypad(SMALLKEYBOARD);
      keyboardController.controllerSetup(widget.friendname);
      keyboardController.setMaximiumLength('50');

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
      child: Container(
        // color: Colors.amber,
        height: GetPlatform.isAndroid
            ? (widget.actualHeight - 40) - (widget.actualHeight / 16.5) * 2 - 88
            : (widget.actualHeight - MediaQuery.of(context).padding.bottom) -
                (widget.actualHeight / 16.5) * 1.3,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.043,
              width: MediaQuery.of(context).size.width * 0.99,
              color: AppColors.subHeaderContainer,
              child: Center(
                  child: Text(
                "SHARE",
                // languageController.languageResponse.value.users ?? '',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              )),
            ),
            Stack(
              children: [
                ListView(
                  shrinkWrap: true,
                  controller: scrollController,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        space(),
                        buildYourMobileNumber(),
                        space(),
                        buildYourFriendName(),
                        space(),
                        buildYourFriendMobileNumber(),
                        space(),
                        showinfo ? Container() : buildShowInfo(),
                        space(),
                      ],
                    ),
                  ],
                ),
                addKeyboard(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildYourMobileNumber() {
    return SizedBox(
      height: cellHeight,
      width: MediaQuery.of(context).size.width * 0.75,
      child: Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 5),
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
            width: 2,
          ), //Border.all
          borderRadius: BorderRadius.circular(2),
        ),
        child: Text(orderController.fetchShareResponse.value.status!.deviceId!),
        // TextField(
        //   readOnly: true,
        //   showCursor: true,
        //   focusNode: _focus,
        //   onTap: () {
        //     keyboardController.setKeypad(SYMBOLSKEYBOARD);
        //     keyboardController.controllerSetup(widget.mobile);
        //     keyboardController.symbolTrue(true);
        //     keyboardController.focusSetup(_focus, widget.mobile);
        //     setState(() => showinfo =!showinfo);
        //   },
        //   controller: widget.mobile,
        //   //maxLines: 1,
        //   decoration: InputDecoration(
        //       border: InputBorder.none,
        //       filled: _isFocused,
        //       hintStyle: TextStyle(color: Colors.grey[500]),
        //       hintText:
        //           languageController.languageResponse.value.yourMobileNumber ??
        //               ''),
        // ),
      ),
    );
  }

  Widget buildYourFriendName() {
    return SizedBox(
      height: cellHeight,
      width: MediaQuery.of(context).size.width * 0.75,
      child: Container(
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
            width: 2,
          ), //Border.all
          borderRadius: BorderRadius.circular(2),
        ),
        child: TextField(
          readOnly: true,
          showCursor: true,
          focusNode: _focus2,
          onTap: () {
            keyboardController.setKeypad(CAPITALKEYBOARD);
            keyboardController.controllerSetup(widget.friendname);
            keyboardController.focusSetup(_focus2, widget.friendname);
          },
          controller: widget.friendname,
          //maxLines: 1,
          decoration: InputDecoration(
              border: InputBorder.none,
              filled: _isFocused2,
              hintStyle: TextStyle(color: Colors.grey[500]),
              hintText:
                  languageController.languageResponse.value.yourFriendName ??
                      ''),
        ),
      ),
    );
  }

  Widget buildYourFriendMobileNumber() {
    return SizedBox(
      height: cellHeight,
      width: MediaQuery.of(context).size.width * 0.75,
      child: Container(
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
            width: 2,
          ), //Border.all
          borderRadius: BorderRadius.circular(2),
        ),
        child: TextField(
          readOnly: true,
          showCursor: true,
          focusNode: _focus1,
          onTap: () {
            keyboardController.setKeypad(SYMBOLSKEYBOARD);
            keyboardController.controllerSetup(widget.friendmobile);
            keyboardController.symbolTrue(true);
            keyboardController.focusSetup(_focus1, widget.friendmobile);
            keyboardController.setShareController(
                widget.mobile, widget.friendmobile, widget.friendname);
          },
          controller: widget.friendmobile,
          // maxLines: 1,
          decoration: InputDecoration(
              border: InputBorder.none,
              filled: _isFocused1,
              hintStyle: TextStyle(color: Colors.grey[500]),
              hintText: languageController
                      .languageResponse.value.yourFriendMobileNumber ??
                  ''),
        ),
      ),
    );
  }

  Widget buildShowInfo() {
    return SizedBox(
      height: cellHeight * 3,
      width: MediaQuery.of(context).size.width * 0.75,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                  color: Colors.grey,
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: Offset(4, 4))
            ],
            color: Colors.white,
            border: Border.all(
              color: Colors.grey,
              width: 2,
            ), //Border.all
            borderRadius: BorderRadius.circular(2),
          ),
          //BoxDecoratio
          child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(7),
              child: Text(
                orderController.fetchShareResponse.value.status!.description!,
                // languageController
                //         .languageResponse.value.shareMobileNumberToInvite ??

                //'',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[500],
                ),
              )),
        ),
      ),
    );
  }

  Widget space() {
    return SizedBox(height: widget.actualHeight * (1 / 16));
  }

  Widget addKeyboard() {
    return GetX<KeyboardController>(
      builder: (controller) {
        return Positioned(
          bottom: 0,
          //top: 450,
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image:
                      AssetImage('assets/images/keypad_patchs/keypad_base.png'),
                  fit: BoxFit.fill),
            ),
            child: keyboardWidget(context, controller),
          ),
        );
      },
    );
  }

  keyboardWidget(BuildContext context, KeyboardController controller) {
    if (controller.changekeypad.value == SYMBOLSKEYBOARD) {
      return NumeralSpecialChar(
        actualHeight: widget.actualHeight,
        context: context,
        onValueChanged: (String) {
          //  keyOperation(context);
        },
        size: const Size(100, 200),
      );
    } else if (controller.changekeypad.value == CAPITALKEYBOARD) {
      return AlphaCapitalLetters(
        actualHeight: widget.actualHeight,
        context: context,
        onValueChanged: (String) {
          //  keyOperation(context);
        },
        size: const Size(100, 200),
      );
    } else if (controller.changekeypad.value == SMALLKEYBOARD) {
      return AlphaSmallLetters(
        actualHeight: widget.actualHeight,
        context: context,
        onValueChanged: (String) {
          // keyOperation(context);
        },
        size: const Size(100, 200),
      );
    } else {
      Container();
    }
  }
}

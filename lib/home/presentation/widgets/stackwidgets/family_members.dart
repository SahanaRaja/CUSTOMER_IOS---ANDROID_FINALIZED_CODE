// ignore_for_file: prefer_const_constructors

import 'package:customer_assist/core/app_colors.dart';
import 'package:customer_assist/home/presentation/controllers/language_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/app_constants.dart';
import '../../../../core/utils/size_config.dart';
import '../../controllers/keyboard_controller.dart';
import '../keyboard/alpha_capital_letters.dart';
import '../keyboard/alpha_small_letters.dart';
import '../keyboard/numeral_special_char.dart';

class FamilyMembers extends StatefulWidget {
  final double actualHeight;
  const FamilyMembers({Key? key, required this.actualHeight}) : super(key: key);

  @override
  State<FamilyMembers> createState() => _FamilyMembersState();
}

class _FamilyMembersState extends State<FamilyMembers> {
  bool value1 = true;
  bool value2 = false;
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController relationShip = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController firstName1 = TextEditingController();
  TextEditingController lastName1 = TextEditingController();
  TextEditingController relationShip1 = TextEditingController();
  TextEditingController email1 = TextEditingController();
  TextEditingController mobileNumber1 = TextEditingController();
  TextEditingController address1 = TextEditingController();
  TextEditingController address2 = TextEditingController();
  TextEditingController city1 = TextEditingController();
  TextEditingController state1 = TextEditingController();
  TextEditingController province1 = TextEditingController();
  TextEditingController postalCode1 = TextEditingController();
  KeyboardController keyboardController = Get.find();
  var languageController = Get.put(LanguageController());
  @override
  Widget build(BuildContext context) {
    return Padding(
       padding: GetPlatform.isAndroid
         ?const EdgeInsets.only(top: 5)
         :const EdgeInsets.only(),
      child: SizedBox(
        height: GetPlatform.isAndroid
            ? (widget.actualHeight - 40) / 17.9 *
                16.4
            : (widget.actualHeight - MediaQuery.of(context).padding.bottom) /
                17.9 *
                16.4,
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                 height: MediaQuery.of(context).size.height * 0.043,
              width: MediaQuery.of(context).size.width * 0.99,
              color: AppColors.subHeaderContainer,
                  child: Center(
                      child: Text(
                    'Add Family',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  height: getHeight(context),
                  width: getHeight(context) * 6,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    decoration: BoxDecoration(
                      color: Colors.grey[600],
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: FractionallySizedBox(
                            heightFactor: 1,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  value1 = true;
                                  value2 = false;
                                });
                              },
                              //Monthly
                              child: Container(
                                decoration: BoxDecoration(
                                  color: value1 ? Colors.white : Colors.grey[800],
                                  borderRadius:
                                      const BorderRadius.all(Radius.circular(30)),
                                ),
                                child: Center(
                                    child: FittedBox(
                                  child: Text(
                                    languageController
                                            .languageResponse.value.sameAddress ??
                                        '',
                                    style: TextStyle(
                                        fontSize: 21,
                                        color: value1
                                            ? Colors.grey[600]
                                            : Colors.white),
                                  ),
                                )),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: FractionallySizedBox(
                            heightFactor: 1,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  value2 = true;
                                  value1 = false;
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: value2 ? Colors.white : Colors.grey[800],
                                  borderRadius:
                                      const BorderRadius.all(Radius.circular(30)),
                                ),
                                child: Center(
                                    child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: FittedBox(
                                    child: Text(
                                      languageController
                                              .languageResponse.value.different ??
                                          '',
                                      style: TextStyle(
                                          fontSize: 21,
                                          color: value2
                                              ? Colors.grey[600]
                                              : Colors.white),
                                    ),
                                  ),
                                )),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                value1
                    ? Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              getSizedBox(
                                  context,
                                  languageController
                                          .languageResponse.value.firstName ??
                                      ''),
                              getSixedController(context, 2,
                                  controller: firstName),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              getSizedBox(
                                  context,
                                  languageController
                                          .languageResponse.value.lastName ??
                                      ''),
                              getSixedController(context, 2,
                                  controller: lastName),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              getSizedBox(
                                  context,
                                  languageController
                                          .languageResponse.value.relationship ??
                                      ''),
                              getSixedController(context, 2,
                                  controller: relationShip),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              getSizedBox(
                                  context,
                                  languageController
                                          .languageResponse.value.email ??
                                      ''),
                              getSixedController(context, 2, controller: email),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              getSizedBox(
                                  context,
                                  languageController
                                          .languageResponse.value.mobileNumber ??
                                      ''),
                              getSixedController(context, 2,
                                  controller: mobileNumber),
                            ],
                          ),
                        ],
                      )
                    : ListView(
                        shrinkWrap: true,
                        children: [
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  getSizedBox(
                                      context,
                                      languageController
                                              .languageResponse.value.firstName ??
                                          ''),
                                  getSixedController(context, 2,
                                      controller: firstName1),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  getSizedBox(
                                      context,
                                      languageController
                                              .languageResponse.value.lastName ??
                                          ''),
                                  getSixedController(context, 2,
                                      controller: lastName1),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  getSizedBox(
                                      context,
                                      languageController.languageResponse.value
                                              .relationship ??
                                          ''),
                                  getSixedController(context, 2,
                                      controller: relationShip1),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  getSizedBox(
                                      context,
                                      languageController
                                              .languageResponse.value.email ??
                                          ''),
                                  getSixedController(context, 2,
                                      controller: email1),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  getSizedBox(
                                      context,
                                      languageController.languageResponse.value
                                              .mobileNumber ??
                                          ''),
                                  getSixedController(context, 2,
                                      controller: mobileNumber1),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  getSizedBox(
                                      context,
                                      languageController.languageResponse.value
                                              .addressFirst ??
                                          ''),
                                  getSixedController(context, 2,
                                      controller: address1),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  getSizedBox(
                                      context,
                                      languageController.languageResponse.value
                                              .addressSecond ??
                                          ''),
                                  getSixedController(context, 2,
                                      controller: address2),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  getSizedBox(
                                      context,
                                      languageController
                                              .languageResponse.value.city ??
                                          ''),
                                  getSixedController(context, 2,
                                      controller: city1),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  getSizedBox(
                                      context,
                                      languageController
                                              .languageResponse.value.state ??
                                          ''),
                                  getSixedController(context, 2,
                                      controller: state1),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  getSizedBox(
                                      context,
                                      languageController
                                              .languageResponse.value.province ??
                                          ''),
                                  getSixedController(context, 2,
                                      controller: province1),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  getSizedBox(
                                      context,
                                      languageController.languageResponse.value
                                              .postalCode ??
                                          ''),
                                  getSixedController(context, 2,
                                      controller: postalCode1),
                                ],
                              ),
                            ],
                          ),
                        ],
                      )
              ],
            ),
            GetX<KeyboardController>(
              init: KeyboardController(),
              initState: (_) {},
              builder: (controller) {
                return Positioned(
                    bottom: 0,
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                'assets/images/keypad_patchs/keypad_base.png'),
                            fit: BoxFit.fill),
                      ),
                      child: keyboardWidget(context, controller),
                    ));
              },
            ),
          ],
        ),
      ),
    );
  }

  keyboardWidget(BuildContext context, KeyboardController controller) {
    if (controller.changekeypad.value == SYMBOLSKEYBOARD) {
      return NumeralSpecialChar(
        actualHeight: widget.actualHeight,
        context: context,
        onValueChanged: (String) {
          // keyOperation(context);
        },
        size: const Size(100, 200),
      );
    } else if (controller.changekeypad.value == CAPITALKEYBOARD) {
      return AlphaCapitalLetters(
        actualHeight: widget.actualHeight,
        context: context,
        onValueChanged: (String) {
          // keyOperation(context);
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

  SizedBox getSizedBox(BuildContext context, String value) {
    return SizedBox(
      width: getProportionateScreenWidth(150),
      // decoration: const BoxDecoration(
      //     border: Border(right: BorderSide(color: Colors.grey))),
      height: GetPlatform.isAndroid
          ? (widget.actualHeight - 40) / 18.1
          : (widget.actualHeight - MediaQuery.of(context).padding.bottom) /
              17.9,
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Align(
          alignment: Alignment.centerRight,
          child: Text(
            value,
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),
          ),
        ),
      ),
    );
  }

  getSixedController(BuildContext context, int index,
      {TextEditingController? controller}) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: SizedBox(
        height: GetPlatform.isAndroid
            ? (widget.actualHeight - 40) / 18.2
            : (widget.actualHeight - MediaQuery.of(context).padding.bottom) /
                17.9,
        width: getProportionateScreenWidth(125),
        child: TextFormField(
          readOnly: true,
          showCursor: true,
          // focusNode: _focuss[index],
          onChanged: (value) {
            print("value $value");
          },
          onTap: () {
            keyboardController.setKeypad(CAPITALKEYBOARD);
            keyboardController.controllerSetup(controller!);
            // keyboardController.focusSetup(_focuss[index], controller);
          },
          controller: controller,
          decoration: InputDecoration(
            border: InputBorder.none,
            // hintText: "Mail ID",
            // filled: _isFocus[index],
            fillColor: textFieldColor,
          ),
          style: const TextStyle(fontSize: 21),
        ),
      ),
    );
  }
}
